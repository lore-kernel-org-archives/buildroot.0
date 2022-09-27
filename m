Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C004C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 12:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0B2404B9;
	Tue, 27 Sep 2022 12:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF0B2404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvELBrTKT7eq; Tue, 27 Sep 2022 12:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92AD404A3;
	Tue, 27 Sep 2022 12:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92AD404A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3F5B1BF352
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 12:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC0782EF1
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 12:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC0782EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PpPxL7sAuLHF for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 12:12:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E7682F37
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60E7682F37
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 12:12:10 +0000 (UTC)
Received: from smtpclient.apple ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPA
 id d9RYo2s1zIAT1d9RYofk4R; Tue, 27 Sep 2022 14:12:08 +0200
Content-Type: multipart/mixed;
 boundary=Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074
Content-Transfer-Encoding: 7bit
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 27 Sep 2022 14:12:08 +0200
Message-Id: <94563288-00A1-4ED7-B5FF-64E90E2B8D4D@benettiengineering.com>
References: <ff6b01776879d74878e8e1733e2a8e07@aibs.ru>
In-Reply-To: <ff6b01776879d74878e8e1733e2a8e07@aibs.ru>
To: kk <kk@aibs.ru>
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfBfo18vGGTSi1V0FhAvQv8UCoqpc85rHrF7Kp8J3agRb7P0ankNBkwX2TW56Tez46uhTUa97LY+OqZ7Ob01rT18gpv+H6JYVxhrD5/c0o0sKhTrNS5EZ
 lrX/af19yU70mmyGAeExzCfzfA16rV3K2kfG+fS4ChPXIJBGgLQkC2Kh/YwFFL6QC9nGwESjNzG7uFwG1BzwX6DyHPj6v1Czl9IWXnUQ5a/aI6Wd6rg+igtu
 QQJIk520IrsrihvzYZN4GA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664280728; bh=BoI2CMCGr8bWxjo1WB4Y+rpq7O1gDGaYEo9glUpsB70=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=T82SPHF/ifUfe/3aZD/VZRABDWpat87Cby20/DuoTUbs2oPKimz1mB2G582wNcXuL
 M8VUmRsDoqjNYnUfNxlCcwMdUrVbi6zHoCP5anTHOLH3zUHXy4wW23e9sxC2RYmQqL
 5ECOGIGHMPapuWBd6eXfl0G5YE237IEIqutQqk+cd6DRxc9sLfC0kD8jXHxWNVLDU2
 L7HA57Oymstx+oiHuBruvoEVw9pE1B0NkNt2COLHFOgwKs9RHjQz9vl/AfwhWBSq5m
 45LzhRD/FYai2x3A4DRHjrHQnltKYkqBlHSVA1QHcHrohbTnLAhegBC+nzqLr/HaS5
 /XnhqO/3mw01g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=T82SPHF/
Subject: Re: [Buildroot] [1/1] package/sleef: add new package
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Kirill,

please use following command to send the patch:
$ git send-email =E2=80=A6

You can obtain the entire command by using a helper script in Buildroot:
$ cd buildroot
$ git format-patch -s -M -o . -1
$ ./utils/get-developers 0001-your-patch.patch

Then copy and paste the output of this ^^^ script and append the patch name.=


Best regards
Giulio Benetti

> Il giorno 27 set 2022, alle ore 13:17, kk <kk@aibs.ru> ha scritto:
>=20
> =EF=BB=BF=

--Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074
Content-Type: application/octet-stream;
	name=0001-Add-sleef-library.patch;
	x-apple-part-url=94460108-A788-4950-9CCD-DC8C340A9FE9
Content-Disposition: attachment;
	filename=0001-Add-sleef-library.patch
Content-Transfer-Encoding: 7bit

package/sleef: add new package

SLEEF is a library that implements vectorized versions
of C standard math functions. This library also
includes DFT subroutines.

https://sleef.org/

Signed-off-by: Kirill Kranke <kk@aibs.ru>

---
 package/Config.in        |  1 +
 package/sleef/Config.in  | 50 ++++++++++++++++++++++++++++++++++++++++
 package/sleef/sleef.hash |  3 +++
 package/sleef/sleef.mk   | 49 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 package/sleef/Config.in
 create mode 100644 package/sleef/sleef.hash
 create mode 100644 package/sleef/sleef.mk

diff --git a/package/Config.in b/package/Config.in
index b911c59a92..af9b0b7398 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2041,6 +2041,7 @@ endif
 	source "package/riemann-c-client/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
+	source "package/sleef/Config.in"
 	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tinycbor/Config.in"
diff --git a/package/sleef/Config.in b/package/sleef/Config.in
new file mode 100644
index 0000000000..85f93d384e
--- /dev/null
+++ b/package/sleef/Config.in
@@ -0,0 +1,50 @@
+config BR2_PACKAGE_SLEEF_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_powerpc64
+
+config BR2_PACKAGE_SLEEF
+	bool "sleef"
+	help
+          SLEEF is a library that implements vectorized versions
+          of C standard math functions. This library also
+          includes DFT subroutines.
+
+          https://sleef.org/
+
+if BR2_PACKAGE_SLEEF
+
+config BR2_PACKAGE_SLEEF_DFT
+        bool "compile dft"
+        default n
+        help
+          libsleefdft will be built
+
+config BR2_PACKAGE_SLEEF_QUAD
+        bool "compile quad"
+        default n
+        help
+          libsleefquad will be built
+
+config BR2_PACKAGE_SLEEF_GNUABI_LIBS
+        bool "compile gnuabi"
+        default y
+        help
+          libsleefgnuabi will be built
+
+config BR2_PACKAGE_SLEEF_SCALAR_LIB
+        bool "compile scalar"
+        default n
+        help
+          libsleefscalar will be built
+
+config BR2_PACKAGE_SLEEF_TESTS
+        bool "compile tests"
+        default n
+        help
+          Tests will be built
+
+endif
diff --git a/package/sleef/sleef.hash b/package/sleef/sleef.hash
new file mode 100644
index 0000000000..51570a5176
--- /dev/null
+++ b/package/sleef/sleef.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
+sha256  415ee9b1bcc5816989d3d4d92afd0cd3f9ee89cbd5a33eb008e69751e40438ab  sleef-3.5.1.tar.gz
diff --git a/package/sleef/sleef.mk b/package/sleef/sleef.mk
new file mode 100644
index 0000000000..46bef69f5f
--- /dev/null
+++ b/package/sleef/sleef.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sleef
+#
+################################################################################
+
+SLEEF_VERSION = 3.5.1
+SLEEF_SITE = $(call github,shibatch,sleef,$(SLEEF_VERSION))
+SLEEF_LICENSE = BSL-1.0
+SLEEF_LICENSE_FILES = LICENSE.txt
+SLEEF_SUPPORTS_IN_SOURCE_BUILD = NO
+SLEEF_INSTALL_STAGING = YES
+
+# N.B. Need to use host sleef during cross compilation.
+SLEEF_DEPENDENCIES = host-sleef
+SLEEF_CONF_OPTS += -DNATIVE_BUILD_DIR=$(BUILD_DIR)/host-sleef-$(SLEEF_VERSION)/buildroot-build
+
+ifeq ($(BR2_PACKAGE_SLEEF_DFT),y)
+SLEEF_CONF_OPTS += -DBUILD_DFT=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_DFT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_QUAD),y)
+SLEEF_CONF_OPTS += -DBUILD_QUAD=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_QUAD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_GNUABI_LIBS),y)
+SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_GNUABI_LIBS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_SCALAR_LIB),y)
+SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_SCALAR_LIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_SLEEF_TESTS),y)
+SLEEF_CONF_OPTS += -DBUILD_TESTS=ON
+else
+SLEEF_CONF_OPTS += -DBUILD_TESTS=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1


--Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-8EAE8805-A6FB-4B67-9440-DF4A36D12074--
