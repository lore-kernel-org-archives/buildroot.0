Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CE2C47073
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A430840540;
	Fri, 29 Dec 2023 20:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A430840540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCRKC-pjZqNK; Fri, 29 Dec 2023 20:53:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD30435FA;
	Fri, 29 Dec 2023 20:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD30435FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0D21BF30C
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6467361136
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6467361136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXiHTbeGtzjm for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 20:53:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9855A60E5F
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 20:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9855A60E5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8467083910; Fri, 29 Dec 2023 20:53:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:52:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d21ec5021f6ec9ba40a9f71a9028b7b55bc6aea
X-Git-Newrev: 9a94e85fff629b73cc3b02605793806fb9ce97dd
X-Patchwork-Hint: ignore
Message-Id: <20231229205333.8467083910@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap-ng: bump to version 0.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a94e85fff629b73cc3b02605793806fb9ce97dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python2 support has been dropped with
https://github.com/stevegrubb/libcap-ng/commit/868a82672a398aec96eba60e73b9a8e8892c4d4a

https://github.com/stevegrubb/libcap-ng/blob/v0.8.4/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d4590dd739..bb4280368d 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d  libcap-ng-0.8.3.tar.gz
+sha256  68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a  libcap-ng-0.8.4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index c33460d951..5e3ca20029 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.3
+LIBCAP_NG_VERSION = 0.8.4
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
@@ -12,10 +12,10 @@ LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-LIBCAP_NG_CONF_OPTS = --without-python --without-python3
+LIBCAP_NG_CONF_OPTS = --without-python3
 
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-HOST_LIBCAP_NG_CONF_OPTS = --without-python --without-python3
+HOST_LIBCAP_NG_CONF_OPTS = --without-python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
