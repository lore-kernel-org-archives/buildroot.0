Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B1BCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFF4402D0;
	Sun, 15 Oct 2023 19:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFF4402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzmVWE6jqQ8z; Sun, 15 Oct 2023 19:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43166414A4;
	Sun, 15 Oct 2023 19:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43166414A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31E4F1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08958414A4
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08958414A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oixhn3_iMeJN for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:48:07 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A50E4402D0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50E4402D0
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id s75mqzs9cilo5s75nqjYZQ; Sun, 15 Oct 2023 21:48:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 21:48:00 +0200
Message-Id: <20231015194800.1894656-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNFt9kd092fk1naxdpvqAEFdBUh/kW+Gm4cmtJqPW1CQpM3/vFEXYKF9pX3i36vvGmz6geJgo3EFWkkaH2Hqzj9fMPg94wANXIr67E8BO/GyxxkAMjim
 BsMGRyLIpKLSykJZkxfIngQedIJtd9A4ke+NtKAeakrxbChRu89Ddwp3UGBOQp+r5zUDk3nz9IHXi3eHRREswlaTzdC2/IazbVblFJkWKWq3ksqBB+DDcdfq
 pSU5+TMestm0lfpmzIxbUXb2DWQOZpfcq1oJ9larbHGJC+voRdVuhVRfOCKFG4wM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697399283; bh=ySHs248MudyHZV1XVqSOEZ6HfrIQAwLHC4l0USBeBY4=;
 h=From:To:Subject:Date:MIME-Version;
 b=bQMSJXEP1Wh65zjJuVWS4x7E6L+dt0I8KNhENYmoRZigbePAJNJXN+nJukuxNgo9s
 /TyqA2sHDfBnKwf424hzKe/8tLyF7TO7n3TuOKnG0K4w43vJQmaChgIAScltf6ksIW
 YWTwaqpUPw5J1mN5eqixwdxMazd150x0wfjGTmaa11F60WxCFah1GlDxHd/+QXBU+Z
 0SyxDuI41V5CWb2GtjmRsTj9U2GZqWIFTRzsHeBfFETfHqEqPtpJAoDWtg/C/uLrbO
 VXlP03Iog6K+N8j4kxeNIYQq2xOzWIe0IJZ8CJPzlq1cODdwc2jFlXjY+THzDAOPqQ
 R/mp+uS8aMjRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bQMSJXEP
Subject: [Buildroot] [PATCH v2] package/libnvme: bump to version 1.6
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 2 local patches, one to avoid build failure due to different libc
ioctl() prototype and one to avoid link conflict due to test unit enabled
by default.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix build failure due to ioctl() and test unit
---
 ...01-test-handle-POSIX-ioctl-prototype.patch | 70 +++++++++++++++++++
 ...eson-make-building-tests-conditional.patch | 46 ++++++++++++
 package/libnvme/libnvme.hash                  |  2 +-
 package/libnvme/libnvme.mk                    |  5 +-
 4 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
 create mode 100644 package/libnvme/0002-meson-make-building-tests-conditional.patch

diff --git a/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch b/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
new file mode 100644
index 0000000000..175cdcd7dd
--- /dev/null
+++ b/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
@@ -0,0 +1,70 @@
+From ca47ba3119365eafac0ab25a86cab9d9a1b29bd4 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 30 Sep 2023 06:38:53 +0100
+Subject: [PATCH] test: handle POSIX ioctl prototype
+
+glibc has the following prototype for ioctl: int ioctl(int fd, unsigned long request, ...)
+POSIX (inc. musl) has the following for ioctl: int ioctl(int fd, int request, ...)
+
+Check which prototype is used in <sys/ioctl.h> to avoid a conflict and conditionally
+define the right one for the system.
+
+Upstream: https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4
+
+Bug: https://bugs.gentoo.org/914921
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 10 ++++++++++
+ test/ioctl/mock.c |  6 +++++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6fcf1da..2c979cc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -230,6 +230,16 @@ conf.set(
+     ),
+     description: 'Is network address and service translation available'
+ )
++conf.set(
++    'HAVE_GLIBC_IOCTL',
++    cc.compiles(
++        '''#include <sys/ioctl.h>
++        int ioctl(int fd, unsigned long request, ...);
++        ''',
++        name: 'ioctl has glibc-style prototype'
++    ),
++    description: 'Is ioctl the glibc interface (rather than POSIX)'
++)
+ 
+ if cc.has_function_attribute('fallthrough')
+   conf.set('fallthrough', '__attribute__((__fallthrough__))')
+diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
+index e917244..5d2ac94 100644
+--- a/test/ioctl/mock.c
++++ b/test/ioctl/mock.c
+@@ -114,7 +114,11 @@ void end_mock_cmds(void)
+ 	} \
+ })
+ 
++#ifdef HAVE_GLIBC_IOCTL
+ int ioctl(int fd, unsigned long request, ...)
++#else
++int ioctl(int fd, int request, ...)
++#endif
+ {
+ 	struct mock_cmds *mock_cmds;
+ 	bool result64;
+@@ -141,7 +145,7 @@ int ioctl(int fd, unsigned long request, ...)
+ 		result64 = true;
+ 		break;
+ 	default:
+-		fail("unexpected %s %lu", __func__, request);
++		fail("unexpected %s %lu", __func__, (unsigned long) request);
+ 	}
+ 	check(mock_cmds->remaining_cmds,
+ 	      "unexpected %s command", mock_cmds->name);
+-- 
+2.34.1
+
diff --git a/package/libnvme/0002-meson-make-building-tests-conditional.patch b/package/libnvme/0002-meson-make-building-tests-conditional.patch
new file mode 100644
index 0000000000..0b6d3681ca
--- /dev/null
+++ b/package/libnvme/0002-meson-make-building-tests-conditional.patch
@@ -0,0 +1,46 @@
+From ff742e792725c316ba6de0800188bf36751bd1d1 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 30 Sep 2023 06:43:39 +0100
+Subject: [PATCH] meson: make building tests conditional
+
+Just like we do for docs.
+
+Upstream: https://github.com/linux-nvme/libnvme/commit/ff742e792725c316ba6de0800188bf36751bd1d1
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 2c979cc..a9263b5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -273,7 +273,9 @@ subdir('internal')
+ subdir('ccan')
+ subdir('src')
+ subdir('libnvme')
+-subdir('test')
++if get_option('tests')
++    subdir('test')
++endif
+ subdir('examples')
+ subdir('doc')
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+index a1ed79f..251ae11 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -6,6 +6,7 @@ option('rstdir', type : 'string', value : '', description : 'directory for ReST
+ 
+ option('docs', type : 'combo', choices : ['false', 'html', 'man', 'rst', 'all'], description : 'install documentation')
+ option('docs-build', type : 'boolean', value : false,  description : 'build documentation')
++option('tests', type : 'boolean', value : true, description : 'build tests')
+ 
+ option('python', type : 'feature', value: 'auto', description : 'Generate libnvme python bindings')
+ option('openssl', type : 'feature', value: 'auto', description : 'OpenSSL support')
+-- 
+2.34.1
+
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index b869ae295a..b9e0281189 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  f73ba1edde059b2d5e7c1048ad4f895e6047bff241c94b34a7aff5894779d086  libnvme-1.5.tar.gz
+sha256  0dd8ba8b655abe78c09833edb66632aa6bee82aebf117dd252ded968deaaeec7  libnvme-1.6.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 71885e198c..38394b9931 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.5
+LIBNVME_VERSION = 1.6
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
 LIBNVME_INSTALL_STAGING = YES
 
+LIBNVME_CONF_OPTS += \
+	-Dtests=false
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBNVME_DEPENDENCIES += python3
 LIBNVME_CONF_OPTS += -Dpython=enabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
