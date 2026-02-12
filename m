Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31687EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02FBE8470C;
	Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXqao_tfKDQw; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F77984702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011456;
	bh=9WQ5EszjrDJGFCyG+kmUUzVswHE9WY4tpRoez9Xkx6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tDwCV1p7uUnAUVZgH14idbYFJwPJlFKv/Pd7yB28u7V335+1IfZg258K9luZ47G+N
	 PE6uHIshXUyLxqVuMgII12eO5ZQpul9yVq1A0eoSiot9GocGzoYJNLIREVbrR0J+Bj
	 a21MlrOS8tSmD+YXQE9PC7mgB1ito2YNka1wZ5eFf40S17ihcKQIJXWOlk9jG+keki
	 d8suOYhys5cP+D/RqQsaNhQ5b0lo1QV3riA3RDFx8R9Z4EtZCnkuv52iFiQI1yaXu0
	 hiUPJxv1z5tOpWg7jM1PkqR7u6BCZuLlBMyXJjHSA74q5L5oCoGLSsrbE4aSuam7I+
	 8V5ls6SXQt8TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F77984702;
	Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 108F4EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E875A412D0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L7K7WBclZgv for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DEF40407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49DEF40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EC2286D69; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:16:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c84505230c90e3d9d4d22f65a46d8a0cc31cc0ea
X-Git-Newrev: 40bd55e736b50a78e4eccadbc259e69fc45e563a
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.3EC2286D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libgpiod2: enable
 gpioset interactive when libedit is available
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40bd55e736b50a78e4eccadbc259e69fc45e563a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3df8b35285cff60e96b4ca5c852c2a07a551197f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpiod2/libgpiod2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index c5b53f631b..ae3bcfa207 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
