Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A051ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 22:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C82826FAFA;
	Fri, 16 Sep 2022 22:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C82826FAFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTuIlUo1YjPj; Fri, 16 Sep 2022 22:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2B6D6FAE8;
	Fri, 16 Sep 2022 22:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B6D6FAE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68C3E1BF3DA
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 941CE6FAD0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 941CE6FAD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwjD8nee7R1r for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 674FF6FAE8
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674FF6FAE8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5716483E70; Fri, 16 Sep 2022 21:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 23:53:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f7d5533cc6487d3c6a62a36161b544c250f7e836
X-Git-Newrev: b2fb18e6d058675bb17aa8b9c841b14470d93ba9
X-Patchwork-Hint: ignore
Message-Id: <20220916215809.5716483E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/imagemagick:
 security bump to version 7.1.0-45
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2fb18e6d058675bb17aa8b9c841b14470d93ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix CVE-2022-1114: A heap-use-after-free flaw was found in
  ImageMagick's RelinquishDCMInfo() function of dcm.c file. This
  vulnerability is triggered when an attacker passes a specially crafted
  DICOM image file to ImageMagick for conversion, potentially leading to
  information disclosure and a denial of service.
- Fix CVE-2022-32545: A vulnerability was found in ImageMagick, causing
  an outside the range of representable values of type 'unsigned char'
  at coders/psd.c, when crafted or untrusted input is processed. This
  leads to a negative impact to application availability or other
  problems related to undefined behavior.
- Fix CVE-2022-32546: A vulnerability was found in ImageMagick, causing
  an outside the range of representable values of type 'unsigned long'
  at coders/pcl.c, when crafted or untrusted input is processed. This
  leads to a negative impact to application availability or other
  problems related to undefined behavior.
- Fix CVE-2022-32547: In ImageMagick, there is load of misaligned
  address for type 'double', which requires 8 byte alignment and for
  type 'float', which requires 4 byte alignment at
  MagickCore/property.c. Whenever crafted or untrusted input is
  processed by ImageMagick, this causes a negative impact to application
  availability or other problems related to undefined behavior.
- Update hash of LICENSE (year updated with
  https://github.com/ImageMagick/ImageMagick/commit/80629dfb3fea55eefa2dd8bdd9ca1be341502e16)

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 685100fe85f5ee0849adae7c68dfabf9c844f77e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 278becd2ab..ff0f3e26c6 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  385ca5bd8ce9b37e685779c46868171af949265c9db40067c1c4d7442dbc723e  imagemagick-7.1.0-19.tar.gz
-sha256  040badb77b659e751ea16113490a937e1e01f3f5d32181e966b8982413533fb2  LICENSE
+sha256  3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec  imagemagick-7.1.0-45.tar.gz
+sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 64a530c6d2..893606ff01 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-19
+IMAGEMAGICK_VERSION = 7.1.0-45
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
