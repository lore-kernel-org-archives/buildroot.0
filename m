Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11049C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 11:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E96981095;
	Tue, 11 Mar 2025 11:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMsv3PCOn2OS; Tue, 11 Mar 2025 11:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E6E80E3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E6E80E3D;
	Tue, 11 Mar 2025 11:22:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7371C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F247680CCD
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9H89BDi1Er2 for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 11:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 738B580CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738B580CBA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738B580CBA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 11:22:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1tYCog3UOe-00SqC5; Tue, 11
 Mar 2025 12:22:22 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	"Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 11 Mar 2025 12:22:05 +0100
Message-ID: <20250311112206.2200101-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:A40+miI4vRI2kkKE5AApkRoX1I+UQuJ69xeOHhfpfYZT3AylkIN
 aOB1ssRo8T2iRpro03S5GVufRm2/aXsdQ1qpJvN7n7oMt+p/Iu89AY50YvS6dxnzCS+ISRw
 5HsXDYoaAmLGW1k0kfBiwsz0zKhlafzVTSFK3M4zKNeAd2nAFzFAbP6Hkp4Uu90PlN4C1Vx
 lBmOSZPb/SWtSHgsfP5VQ==
UI-OutboundReport: notjunk:1;M01:P0:C7LTM8BACes=;FdWZ4Znp2tkqQKM1m4FhPFbNZ0V
 La48/0HFYVnuXDWmRFzN0dtXZin4bYQom+9BGEfhT8Me7Zzp6vzkGu2eaQ75UWvmf0HSJKQGv
 57t+eduMmNvn/eAOn0F53jI9sUi0eumvSUyac2opUx3z1RvyyPtPfRsliHGEK1fc9WXmMzLpX
 Vbc29KZMSF7gAr+q2Y7+D8GAPInP3qDv7wfSNFw01WvcQEKK0G7UMo+OYwr33ZKbnkVdsHi6F
 S7LquxEQko07G5g84gfX6VRnpKa6Ng7mNkSp+/5YjAu0pPbNjvih8kiDnl7Wu4jFZGCaqIv9P
 EuX0ZoZxdvpMB7uLI1BR/2qfIIXvquFED8CxuqCA2fLSAWkvxe5hCgIYYvlZHFV8PimmLiWEL
 sL8wW/vGDHes+wBGacoMVzDcle6vp7jV7+SZRO4D5wnY5w0PNrrBMbXTB3PlwNfIiQ4tAO0WE
 GZ9NcFzN7wzPYA3+xIISmOtXDYe719YFa1gwkMQHtx88NxnD93fc+mSkeeYYGFvZbqBb8MsaL
 +Yom15ivYKinSWFHcpZlxINPFgxcz0xh1AI5VvUzK/7/6vUgPE5dg3lIDRHLWHENVDxifeaN3
 zdQVKJyfxQVI29UM4UxyBo6d+yjR5pGZ4H5MgdoJYvU4F4W5e4Sa70BovhVKGpvv11fcdeCLC
 +jdq1CQa44q2fUJoDX18UKBQCVuJzW/QfIxD5H9GHWvH1D6P4hyHU7KPh98Fc1Bd3oEFgvU7e
 6qtNcnzvLgysZoh0b1B6QgCk1NirpQmz95EOsklkWGNKxCN8G4VHRZa+53DUa1R1fcHQiITFQ
 kCc8W9XiKgmCQx9/ThdsvE+39JCdaNYJRPHWvqrgXuAsfE/A7qzp5hP93mriOJLb7CylB2oqw
 P+geNAy2pCZ5WA9OvvqRPdaGTyrnwB/D4HDzBTWN95IrbATrcHIFd2k0ttmWlDp5yhk6vszNk
 NplxtFQZ+gWyqS87IkPgfcT++RjJ2S4NpfrUCL1nQ7B5UKM8Lkrp9velujrJmsO/pA8TXlcCc
 Z130VvzrRUbzXYI65MMUJqfg27saCgG371SU1urJPfR+OUzIvXWQsoOllszQ+VNH7n8jfcKLP
 CnS6vEQgeSU7/BLUH3PIUk2KIPL/KeYVFhpzHPCr8eAvJhMTlD2QwZzLRwywLrHPljPfL44wz
 M49EKpLHX18j2leB4fbIGPQekQDZ8ZQpy0a114Lvdg4RkJNbWjxxE9LMsDn9ELAy9avbiWcx0
 /PgOtRqhaClcWIs6F2WrSvVMaYC0i0NxBFOeF2Q4fgUJmU9HO5gzL5SOh69rdD2J/RUdjeOsu
 c9RfONravV2YnJNPxEeydiEgz+cj8xyRaMKdo/1H0t3WdFj6qUEg4bL/p+cwKEBWbBycYZtaF
 oAr+P9bihbwoioYLFnoA3BYF8+nLBo2FUoexbLWbeRmd8gsk4uTYFo25s+wF3iOrcwN07imph
 ZlBUUZpKmJ3ofDsgNUv7Qs6vV5lkdXxLXoyZIdcM4ZddLmsSo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741692143; x=1742296943; i=fiona.klute@gmx.de;
 bh=X+alIHiS7BmhFOxLotf06t4P8Jm8jJ7p0kWBGqGN/ws=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SORJOZzyEsCv6lDtkTD6WU51EJolM2zAfJNIVDrQyH04JOeWEErCk97uwZO9IHwI
 vOeW/cK+z+NngfGEYwX7R3eLCzOXEkEECVtNClRd4XFSg+2LibswMdwftq9JtuelQ
 BQ9o5I3XV+dbn5TMHEO8Eu2HFW5RboCIFwyuTayKAaL5+IFozTWesRKb+at5bw2rQ
 +45ewyqqKZEAhsstsf6zJJ8OGILF2009ZLHfnscoczo7MZb9AXQR+Uq4+IVGH/TGu
 MsGRgsqWybp0Lv3lgqnODWpL3oHxrCW+XD4aX9p5gv9kEI+f3l6KiI/PwiqBJVblN
 P9Dofk8jyq7e6KoL1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=SORJOZzy
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: bump version to
 1.52.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog with a mix of new features and bugfixes:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.0/NEWS?ref_type=tags

Support for the "dhcpcanon" DHCP client has been removed.

Systemd code imported into NetworkManager [1] now requires kernel
headers 5.4 [2], update "depends on" accordingly.

Also update the homepage, wiki.gnome.org has been retired.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2115
[2] https://github.com/systemd/systemd/commit/6e14c46bac760d01868b0bf48461f6ac44c86be3

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Depend on kernel headers >= 5.4
* Update homepage URL

If this is applied to "next" instead of "master", the next release
should probably get 1.50.3 instead (with a few bugfixes), see:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.3/NEWS?ref_type=tags

 package/network-manager/Config.in            | 8 ++++----
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index de7989a9c5..b388c573fe 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	# We need NETLINK_GET_STRICT_CHK
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -23,7 +23,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	  configured and joined once, it can be detected and re-joined
 	  automatically the next time it's available.
 
-	  http://projects.gnome.org/NetworkManager/
+	  https://networkmanager.dev/
 
 if BR2_PACKAGE_NETWORK_MANAGER
 
@@ -60,10 +60,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	  This option enables support for OpenVSwitch
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 4.20, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 5.4, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 64ec5acbea..a0963e010f 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.2/downloads/NetworkManager-1.50.2.tar.xz.sha256sum
-sha256  10473be9d3ab89f8a27a68b7bf5bc9557851a5183b74b6241e5e0fa5c6921fef  NetworkManager-1.50.2.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.0/downloads/NetworkManager-1.52.0.tar.xz.sha256sum
+sha256  356f21a15da51e4218fd4d0fd78cea61e067b1116a25cddee4af9df05062e92d  NetworkManager-1.52.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1a0adacfa0..ab3a437838 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.50
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.52
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
