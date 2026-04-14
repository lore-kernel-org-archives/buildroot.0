Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F9F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA4584DD8;
	Tue, 14 Apr 2026 17:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSC38uXIwMGp; Tue, 14 Apr 2026 17:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2CC8484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188945;
	bh=TFyNbAIwIlzowKI9CFeSQkI7VdPWr7fPKIb2koOAO7o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m6lmWLj++5hCgFVNxANoSZj3lZxwIElheOOfHWJkchnGI7WfUMXLOrAWgHSTq8kIt
	 dA1ax8bgZGiST32JMrCmzgrZXo4j/iAYI8VfyVpQ54pGbCaym3gHAxZR2POCBEE+u+
	 Rrwwz9TFWNY8W0Pt149FI6KLX7ApklLnOUlRoXBu0iGf4j4Nh4zf5HoTCPln7n3rEk
	 HEi52AmpQBBE1ygi5luBn82Fc5dLs3HMEbh67VkjdqLMk/aqESFg3PtWwg8hXE72Zf
	 kwPN0jvm+UxZoWBvHug+/lInvf+llxNvefyvD3kq641FjoC5bMMLpds4LNgCmIeGQ7
	 biSd6gNsxhoJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2CC8484C;
	Tue, 14 Apr 2026 17:49:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF65394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA20D427A3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrIPcYCXWahA for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D606442741
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D606442741
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BA1C7FB2D; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eae9a4b1a83945540bc1d0c215cd5c2a1c65911
X-Git-Newrev: ef396fb9a05b43d5a80da6bf237987ec4df6b804
X-Patchwork-Hint: ignore
Message-Id: <20260414174850.6BA1C7FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: switch to pcre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef396fb9a05b43d5a80da6bf237987ec4df6b804
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream added support for pcre2 with commit
https://github.com/FreeRADIUS/freeradius-server/commit/430ed115ca58b0b99f6ea372d4e32b573aa5d0fd
with version 3.2.8 which was added to buildroot with commit
747fed73f985b8972052cc8111707279079e4aaa.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeradius-server/freeradius-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 9b5b3d13ea..80ace1c130 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -158,9 +158,9 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre2
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
