Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3892D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A4B660BB3;
	Tue, 13 Jan 2026 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_DfbGEaaMQL; Tue, 13 Jan 2026 21:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1FE60DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338025;
	bh=jrDB7yYULpd/5gQGGIAn1UaOkwNAz64npSw+92A2PxQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VrdT8JjgOqIWk1wXMpJBSe4gxEQloNWC6HCFgNiO6UymksX9GslxdFkBln0o7rUJ+
	 JPwCiJdIx/sTZuSHeL/lT9ekklniczaMVRFHrjqEtJK2S/fBAkke8VgoW8MQ6dDF59
	 XQKJv3SiS3EHFsIfjejQhRYFSKfkAEHphwvojPSeKIWJLsv42NuvuaL1nMctv6H9wX
	 1Uo82YDL9/0dsrpJW6EOKmkA2n7zCBvJaXy6cVObJGG/cb6awrDkBKqdxf8oO7+eEw
	 DqPyLHhxluYuYSWwKYm4nvuH2bQlGzcZu4Ftzltc6+xLeaJuEOh5YpvtG01aP5xJnp
	 OM6aHg/8UBKEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F1FE60DBC;
	Tue, 13 Jan 2026 21:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AF21CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B716C407CA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrcmNbA6ge8C for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F4240785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F4240785
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF6980F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbe10c784a02d6ce10fb5a336b05ef30064c59a0
X-Git-Newrev: e4dbca7a9ce6da2ad953194f14bd557f23b386e9
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.9EF6980F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfontsel: bump version
 to 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4dbca7a9ce6da2ad953194f14bd557f23b386e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003474.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xfontsel/-/commit/f286ef347dc9e87c6d5b5b8bce22afdeb82af4ed

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash | 8 ++++----
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
index 8d7e546bba..098f5dc2b8 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003174.html
-sha256  17052c3357bbfe44b8468675ae3d099c2427ba9fcac10540aef524ae4d77d1b4  xfontsel-1.1.0.tar.xz
-sha512  be67d223668431c9b5dd2ef74032d2f087be5f8f0ccc427bc7ee43e7ce42214edddb07d8c3d6d6de93ea35314392d384f1ab1ae5c48b2cfbce418610e3945a52  xfontsel-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003474.html
+sha256  7a4b86658a7701253ed0fe8a66471e54e4cacbba66d7278f1759d3b3a33a02c9  xfontsel-1.1.1.tar.xz
+sha512  fdb1f20dc86e2e74da77ef5e62d9465ea24d1af965f1ff3a6334ffefb239130fcf28f7cde9b4e7d7e6c9cf12fcb637784e7af209cffcee3dbe304025d33abcdd  xfontsel-1.1.1.tar.xz
 # Locally computed
-sha256  a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09  COPYING
+sha256  2c49229e7e4770a8265ef7e7705d92173e983015d3c7aeccee8155a97109c0b7  COPYING
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index ac12f9c509..d9d8c7c3aa 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.1.0
+XAPP_XFONTSEL_VERSION = 1.1.1
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.xz
-XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
