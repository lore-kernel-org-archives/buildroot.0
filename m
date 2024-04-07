Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B5CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290B96089F;
	Sun,  7 Apr 2024 12:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_IEtgA-OPU3; Sun,  7 Apr 2024 12:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 934A8608E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934A8608E8;
	Sun,  7 Apr 2024 12:18:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE181BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF51402FE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEV-2hIKVvvm for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 719B24030B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719B24030B
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6823784C96; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 14:17:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f708344c7108ad8b10e7525a13649a252b39330
X-Git-Newrev: 38209fb5d3a40735ec304622ee31f10f6176cfce
X-Patchwork-Hint: ignore
Message-Id: <20240407121837.6823784C96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quagga: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=38209fb5d3a40735ec304622ee31f10f6176cfce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ../lib/.libs/libzebra.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/984572031cedd124f48b5a5bc5abe6096d22eaf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/quagga/Config.in | 1 +
 package/quagga/quagga.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 9427475d03..9361b6a212 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Routing software suite, providing implementations of OSPFv2,
 	  OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 97297baff8..5d8d52263a 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -33,6 +33,10 @@ else
 QUAGGA_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+QUAGGA_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
 QUAGGA_CONF_OPTS += --enable-protobuf
 QUAGGA_DEPENDENCIES += protobuf-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
