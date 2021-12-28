Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95CBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 12:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DAED4024B;
	Tue, 28 Dec 2021 12:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqeUpTbfpaWm; Tue, 28 Dec 2021 12:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04116404F4;
	Tue, 28 Dec 2021 12:58:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1E81BF9AF
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF044024B
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 12:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muC77zqm9k3Q for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 12:58:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0EE2404EF
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 12:58:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C05C82518; Tue, 28 Dec 2021 12:52:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 13:56:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dddb65efbdf2c7952f22a1e51009f17f1676db4a
X-Git-Newrev: e53a6799ecb921ad7d13302b9c67a843aeed6c30
X-Patchwork-Hint: ignore
Message-Id: <20211228125231.9C05C82518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pangomm: bump to version 2.48.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e53a6799ecb921ad7d13302b9c67a843aeed6c30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package as configure is not shipped anymore

This bump will fix the following build failure raised since bump of
pango to version 1.50.3 in commit
6b2b1d26cc34553c651e32e8fa37111930e53b9e:

attrlist.cc: In constructor 'Pango::AttrList::AttrList(const Glib::ustring&, gunichar)':
attrlist.cc:38:20: error: 'pango_parse_markup' was not declared in this scope
   38 |   gboolean bTest = pango_parse_markup(markup_text.c_str(), -1 /* means null-terminated */, accel_marker,
      |                    ^~~~~~~~~~~~~~~~~~

https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.48.2/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/efe5015ddb4bede6669ad5b1e4f027a2e076d16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index bde53e4fbd..3fba695831 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.1.sha256sum
-sha256  9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af  pangomm-2.40.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
+sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index 9edcb16474..af90d69c4e 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGOMM_VERSION_MAJOR = 2.40
-PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
+PANGOMM_VERSION_MAJOR = 2.48
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,4 @@ PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
 PANGOMM_DEPENDENCIES = glibmm cairomm libsigc pango host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
