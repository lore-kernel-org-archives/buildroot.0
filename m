Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C6BC61DD9
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14780405A7;
	Sun, 30 Aug 2026 17:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3ol_KbUTaL3; Sun, 30 Aug 2026 17:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788110517;
	bh=e2KjB9AIAimdJ1sjMB0u1LZklhIHDIp+GoQq6aOy9fw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=noNTNs7DdK1cGn0V9kcJbLwMKmh1ipqU5Q7dSjFFGlYdM9iV3EVVemLzXbOm1i30M
	 MUpNLDKFshygXJ33jc+uhzKkXk/0mrw9HkNUCKUUmWNMkXqnQ7wdIQKslP5zRIM/Dn
	 2X71GKxjMeA5bZFq6tI8kyWaADLkY2iQaaaPuKB5bzrsJUjdqVmBQDxiPhW/ZAFu/6
	 1oqNdsdJo9wNnIN3uXr7BzRZEbSWr/UF7hKUMch2aHy8ep4xt5wo+viDjax+05P1/7
	 eNCRalJ2rI4lMwXHvMzXsKZsN/1Kx0mR6Vs7xmPIaAsYxhGS1Qdc0NV6SowulajOvi
	 PTEz348YuoZ3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C5F9405B9;
	Sun, 30 Aug 2026 17:21:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ABADF2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 092C6400C5
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynwXjMWnzPBX for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 17:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F8E64005B
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27E9692404; Sun, 30 Aug 2026 17:20:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Aug 2026 18:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be382f6061216ca82a735d0992894c4e6fe5173a
X-Git-Newrev: 6bd5918183ee656448252e0a3eec978c184ee36b
X-Patchwork-Hint: ignore
Message-Id: <20260830172057.27E9692404@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: security bump version
 to 1.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bd5918183ee656448252e0a3eec978c184ee36b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/signalwire/freeswitch/releases/tag/v1.11.3
"This is an important release containing critical security fixes and
 stability improvements. [...] We strongly encourage all users to
 upgrade to v1.11.3 as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 1ae30ebc3a..eb7cfc32de 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.2.-release.tar.xz.sha256
-sha256  1a460e28a0309bf2e29397f0dc7cebecaa579c9f19efa9a301dfc6bf5015d17e  freeswitch-1.11.2.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.3.-release.tar.xz.sha256
+sha256  4c93cbce869cf928bc9e8b3a48fe40337199b348ab668def77e3f739796a3852  freeswitch-1.11.3.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 39af6214bf..e27c53650f 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.11.2
+FREESWITCH_VERSION = 1.11.3
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
