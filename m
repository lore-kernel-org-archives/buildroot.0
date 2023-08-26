Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DDAC83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7356408D4;
	Sat, 26 Aug 2023 18:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7356408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWl9thv3XWZ9; Sat, 26 Aug 2023 18:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB25E408BC;
	Sat, 26 Aug 2023 18:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB25E408BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5461BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6574D60D9D
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6574D60D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4bKoYu5HXVb for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCBFB60B9D
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCBFB60B9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC7A6863F4; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:34:38 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5e3e9b91ea15578050d8de5a620cfcfef5427cde
X-Git-Newrev: d4c4fa9dfc3dae13d47faaba657544b1763414f7
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.BC7A6863F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/heimdal: bump
 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4c4fa9dfc3dae13d47faaba657544b1763414f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Samba-4.16 bumped its internal heimdal code[1] which made it
incompatible with asn1_compile built with heimdal-7.7.1:

/home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: Ignoring char(_)
/home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: syntax error

Bump this package to the same version LibreELEC is using

https://github.com/LibreELEC/LibreELEC.tv/commit/1dc0b5bf3e50500658c8a61e89f57a98dfc0468d
https://github.com/LibreELEC/LibreELEC.tv/commit/1112a1879523fdff7f6dec5a083d4f2bc82e7017
https://github.com/LibreELEC/LibreELEC.tv/commit/763eddbab10f89da42a380624192cc4039eed086

to fix the build error.

Removed HOST_HEIMDAL_MAKE_SYMLINK as asn1_compile is now installed in
$(HOST_DIR)/bin/.

[1] https://www.samba.org/samba/history/samba-4.16.0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8e33cc012e53a3964ff7144df1492b3c61c14948)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.hash |  4 +---
 package/heimdal/heimdal.mk   | 14 ++++----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index cf822340da..250ddbbd4d 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,5 +1,3 @@
-# From https://github.com/heimdal/heimdal/releases
-sha1  a33fdc957f84ab13f39f164b04fe1deeaab3179e  heimdal-7.7.1.tar.gz
-sha256  117cb1ede7848db24cf27311c46f7f735a99f9c836c22e80aec92b91efe56644  heimdal-7.7.1.tar.gz
 # Locally computed
+sha256  2576c5e2d793db53c86e108fd117b278437bb02d6c6db2bec4d1b86958f1980a  heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17.tar.gz
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 21b6c0ccb3..59b64c358b 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.7.1
-HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
+HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
+HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
+HOST_HEIMDAL_AUTORECONF = YES
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
@@ -39,14 +40,7 @@ define HOST_HEIMDAL_INSTALL_COMPILE_ET
 		$(HOST_DIR)/bin/compile_et
 endef
 
-# We need asn1_compile in the PATH for samba4
-define HOST_HEIMDAL_MAKE_SYMLINK
-	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
-		$(HOST_DIR)/bin/asn1_compile
-endef
-
 HOST_HEIMDAL_POST_INSTALL_HOOKS += \
-	HOST_HEIMDAL_INSTALL_COMPILE_ET \
-	HOST_HEIMDAL_MAKE_SYMLINK
+	HOST_HEIMDAL_INSTALL_COMPILE_ET
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
