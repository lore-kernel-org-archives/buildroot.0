Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72665CD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 18:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 407C960FC2;
	Tue, 26 May 2026 18:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LO9R29zMGH7C; Tue, 26 May 2026 18:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A0B60B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779819558;
	bh=NnxQ3Ci56NWo4Miz2sCG+Cx2t9kb50W0ckSWlM7mD8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LHiyYuvU6z+7WqkliDHY/BS4Y2d+H6t2W80qSTQic/gya+ssXMQo2QwDNFv14pBmR
	 tKttEp3s4toSh4T8wx9fPUnC7nxjErU727Y+AzQ//cb7JqoYQ7cE77SSWP2dABEwHs
	 FScDKwsyz6rklbElhdqsgs7XYnawdzCqHjsTfaljgiwx1gGu/VYm84vluaFu2QF+AQ
	 XQROahjWs+pdjSHSB+cLhyGSMF4xe0hQ1zUhjQI7Gg/Vhv8+EO4hmgdut9cpuWImzQ
	 CzV1o9yMF2Qhz/F5+wrowWtkXhmTb1LDy5oJAd2s0xp/46HphG+NAyEx32rqEq8yco
	 t1NbkuKWS6GLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A0B60B4F;
	Tue, 26 May 2026 18:19:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC178265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9147440F4A
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6slNSlWy6TY for <buildroot@buildroot.org>;
 Tue, 26 May 2026 18:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88D440A60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D88D440A60
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B62E586F54; Tue, 26 May 2026 18:19:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 19:53:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b606d9074fff980fd1e73786531503b30fb14da
X-Git-Newrev: 46a4dcd0e1bfcb1be3c8ee5580476c3aa5dbd2e6
X-Patchwork-Hint: ignore
Message-Id: <20260526181905.B62E586F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.24.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46a4dcd0e1bfcb1be3c8ee5580476c3aa5dbd2e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.3.html

Fixes CVE-2026-4408, CVE-2026-4480, CVE-2026-2340, CVE-2026-3012,
CVE-2026-3238 and CVE-2026-1933.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 765ccdad55..83e77f039b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.2.tar.asc
-sha256  ac24583f271a82ac324f7c6fad7327f65b591ad3492e1dccfee988e2c1c81dd1  samba-4.24.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.3.tar.asc
+sha256  4a5e0ed1ea192b798c873d9957c50a5767c10c2767cccb00d56ecc427e94f8e9  samba-4.24.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2a151f4f61..2d6bc80b9e 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.2
+SAMBA4_VERSION = 4.24.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
