Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F88C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B22761245
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B22761245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A4840790;
	Fri,  5 Nov 2021 15:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUWFNl8B1cYL; Fri,  5 Nov 2021 15:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716534078F;
	Fri,  5 Nov 2021 15:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71301BF5DA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C9B60643
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiO-vKGlt80p for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:07:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A03536166A
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E75B88A642; Fri,  5 Nov 2021 15:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 16:01:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a610bf996798949f047c1f84f5617be26c3682c6
X-Git-Newrev: 5afa2320ec2e46c1bce86a1c51b96be758b3e9e2
X-Patchwork-Hint: ignore
Message-Id: <20211105150323.E75B88A642@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: security bump to version
 2.9.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5afa2320ec2e46c1bce86a1c51b96be758b3e9e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-40114: Multiple Cisco products are affected by a
vulnerability in the way the Snort detection engine processes ICMP
traffic that could allow an unauthenticated, remote attacker to cause a
denial of service (DoS) condition on an affected device. The
vulnerability is due to improper memory resource management while the
Snort detection engine is processing ICMP packets. An attacker could
exploit this vulnerability by sending a series of ICMP packets through
an affected device. A successful exploit could allow the attacker to
exhaust resources on the affected device, causing the device to reload.

https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-snort-dos-s2R7W9UU
https://www.snort.org/downloads/snort/changelog_2.9.18.1.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...or-when-building-on-a-Fedora-host-machine.patch | 28 +++++++++++++++++++++-
 package/snort/snort.hash                           |  4 ++--
 package/snort/snort.mk                             |  2 +-
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
index afe9672a3c..66d4fa2839 100644
--- a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
+++ b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
@@ -7,6 +7,8 @@ Remove the code that adds unsafe header/library path when
 cross-compiling on a Fedora host machine.
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+[Fabrice: Update for 2.9.18.1 (also fix build on Centos host machine)]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.in | 24 ------------------------
  1 file changed, 24 deletions(-)
@@ -15,7 +17,7 @@ diff --git a/configure.in b/configure.in
 index e6586f399898..fb35d4d7e3e3 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -957,30 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
+@@ -957,54 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
      AC_DEFINE([DISABLE_DLCLOSE_FOR_VALGRIND_TESTING],[1],[Don't close opened shared objects for valgrind leak testing of dynamic libraries])
  fi
  
@@ -42,6 +44,30 @@ index e6586f399898..fb35d4d7e3e3 100644
 -        extra_incl="-I/usr/include/tirpc"
 -    fi
 -fi
+-
+-##################################################
+-# Centos 8+ does not have inbuilt SunRPC support  #
+-# in glibc and is separately availble in tirpc   #
+-# package. Make sure we've got the library and   #
+-# link it                                        #
+-##################################################
+-if test -f /etc/centos-release ; then
+-    LINUX_FLAVOUR=$(awk '{ print $1 }' /etc/centos-release)
+-    DISTRO_VERSION=`cut -d ' ' -f 4 /etc/centos-release | cut -d '.' -f 1`
+-    if [[ "$LINUX_FLAVOUR" == "CentOS" ]] && [[ $DISTRO_VERSION -ge 8 ]]; then
+-        TIRPC=""
+-        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
+-        echo "$TIRPC"
+-        if test "x$TIRPC" = "xno"; then
+-            echo
+-            echo " ERROR! tirpc not found, get it by running "
+-            echo " yum install libtirpc-devel or dnf install libtirpc-devel"
+-            exit
+-        fi
+-        LIBS="${LIBS} -ltirpc"
+-        extra_incl="-I/usr/include/tirpc"
+-    fi
+-fi
 -
  Z_LIB=""
  AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 115a8398dd..6df7ae5229 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  006d6b0d71c6c7bd23eac74670f5b4e6  snort-2.9.17.1.tar.gz
+md5  2b4e30300ef6feca1f60c267e727c6c0  snort-2.9.18.1.tar.gz
 
 # Locally computed:
-sha256  303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82  snort-2.9.17.1.tar.gz
+sha256  da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa  snort-2.9.18.1.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index e073a59a70..54017d3460 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.17.1
+SNORT_VERSION = 2.9.18.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
