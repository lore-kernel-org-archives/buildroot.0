Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B761EE57DF
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184D560BE8;
	Sun, 10 Sep 2023 16:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 184D560BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15cmvZ2EgewS; Sun, 10 Sep 2023 16:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4402D606EB;
	Sun, 10 Sep 2023 16:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4402D606EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5B31BF2A3
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2743C402A6
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2743C402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Isfne6rH57_C for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:28:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07A940162
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07A940162
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAE6386A1F; Sun, 10 Sep 2023 16:28:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 18:27:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1dff18f6645d321dd3d678b6c1f204ad4aa2071
X-Git-Newrev: b86542085df87da91057017b17f261a213bfd918
X-Patchwork-Hint: ignore
Message-Id: <20230910162810.CAE6386A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2023.05
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b86542085df87da91057017b17f261a213bfd918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ISC license hash changed due to text update:
https://github.com/sbabic/swupdate/commit/d217a9b10e7b25296db4899beabc2de2b379c921

Set new HAVE_LIBEBGENV and HAVE_LIBUBOOTENV env variables.

Apply latest updates to swupdate-usb@.service from:
https://github.com/sbabic/meta-swupdate/commit/d5f84e74aada1212ed877509bdc546dca468451b
https://github.com/sbabic/meta-swupdate/commit/dac7b2d10ec84b2b6de9afadc12419398ea73615

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate-usb@.service | 10 ++++++----
 package/swupdate/swupdate.hash         |  4 ++--
 package/swupdate/swupdate.mk           |  8 +++++++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
index df1a408421..28d805f8ec 100644
--- a/package/swupdate/swupdate-usb@.service
+++ b/package/swupdate/swupdate-usb@.service
@@ -1,9 +1,11 @@
 [Unit]
 Description=usb media swupdate service
 Requires=swupdate.service
-Requires=swupdate-progress.service
+Wants=swupdate-progress.service
 
 [Service]
-ExecStartPre=/bin/mount /dev/%I /mnt
-ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
-ExecStopPost=/bin/umount /mnt
+ExecStartPre=/bin/mkdir -p /tmp/%I
+ExecStartPre=/bin/mount /dev/%I /tmp/%I
+ExecStart=/bin/sh -c "swupdate-client -v /tmp/%I/*.swu"
+ExecStopPost=/bin/umount /tmp/%I
+ExecStopPost=/bin/rmdir /tmp/%I
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 1b26f9e5e2..72b71ce12d 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,12 +1,12 @@
 # Locally calculated
-sha256  e6335e87812a98a87f1c55df03c9f4e4ef042789570002c5db120b09f64b0d86  swupdate-2022.12.tar.gz
+sha256  888df5050035e4fbe14e3a964885646fa3163e727f78c423c3d24c28f7a50b66  swupdate-2023.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  cde7883b9050a1104f4ac19a1572aafd6e5d7323b68351aaf51fbf4beba54966  LICENSES/CC-BY-SA-4.0.txt
 sha256  5d51b52a40391a26cbb2accf5dc5d1c165de49a022d9d5efb50b22204d2682ec  LICENSES/GPL-2.0-only.txt
 sha256  43fd695e9b198a9a4997cc2d02e10d26cae937e2c4930b9eff9c6d349c85cd32  LICENSES/GPL-2.0-or-later.txt
-sha256  492e801f1b0632185431472f148885a4fe8e990b10da57b4986a8bcf140a5374  LICENSES/ISC.txt
+sha256  f8f41f38133176a6db6c1bd8d7bd1a9c910e3563f1cb7bbe32b05e8b8d3a9c61  LICENSES/ISC.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
 sha256  8f2368a292194be10b1223a8875815240a9208bb30785cb13d8849eb6a750fe9  LICENSES/OFL-1.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 84905d2e0a..ea4a5a62e5 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2022.12
+SWUPDATE_VERSION = 2023.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -24,6 +24,9 @@ SWUPDATE_INSTALL_STAGING = YES
 # TARGET_CC is used for both.
 SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 
+# we don't package EFI Boot Guard/libebgenv
+SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
+
 # swupdate bundles its own version of mongoose (version 6.16)
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
@@ -84,6 +87,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
 SWUPDATE_DEPENDENCIES += libubootenv
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
 endif
 
 ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
