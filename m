Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F7AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:25:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D3A610A3
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D3A610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A299440305;
	Sun, 17 Oct 2021 15:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGuyQ1kChtaV; Sun, 17 Oct 2021 15:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 185BC402E2;
	Sun, 17 Oct 2021 15:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBC4C1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB313402E2
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBFkmTlS9vrq for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 15:25:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C574E4028A
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 15:25:31 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.58.44]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mati7-1nA6L80Wvz-00cNXJ; Sun, 17 Oct 2021 17:25:17 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mc82D-000270-VI; Sun, 17 Oct 2021 17:25:15 +0200
Received: (nullmailer pid 32183 invoked by uid 2001);
 Sun, 17 Oct 2021 15:25:13 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 17:25:11 +0200
Message-Id: <20211017152511.32136-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: 57fe0bff746948a1c00c1c012c955907
X-Provags-ID: V03:K1:1BE3hGAMdxmJ6tqiRlsGl/Hl5MM19VunTty+DYFwpOQlXXa6d8i
 ScN4GpitQJUN59WQvMTQLY0ESa0zfkiOkgpVEeUXYW3W4asE3gvA7wYPMXXjud7W52IYooS
 TgQZ5tc7gJzCg1y3pj8qeen0cNYuHiaWU1q8XL9XcwYrrfN818Udz9lP6i+7litHoH5anwo
 9KzeckQ/iOIFHesCf/7eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2imUf94Wvmc=:W7LM41dsAU/WSCBQc12YOc
 tVuqibp/y34zUhj5QmMz7SqM8iTeDTR3T8+F6WWRt18cGeGPXAwc8qfsvBgSsA844GRk7SFbE
 hCzqZJXUlQOeo7mdYZlQBdcOCFOhCK2ydmCIrSqMFT+wKjMhYuei2t08h15YeTI8ZVPEPwIfk
 BEH2bCrsEA42raJ2+3AKz6h8G3mefUhS3MIx+8XbfoWVH40APSmoDVjcHlJwW4kAR35n5toYM
 +HMLxtS7KMvIDXBrTKfdefUR5H9m+R3XZKLv/c/UWTYMihEroaXaPv9o+Fw0x+YogNxSL7SxW
 JV3f3bx8giHkRrpuYIVDdrIEOLaLUoUFkuzUvxeWWBEnIoBGdFmuggZmWRUOSXyf4t8OxQEsk
 2lOnN+aV1s6dZZNS01kfE5pMGYp3549oZViTu0ip/9uX3AubSxfQBwx/IRZ0M0N+bw/ez1oTd
 VnrV8AIYP09CDigPrVWho4pfEQyBVBLBe5EpbVJTWl1BtdHgJyeV2xp8XeeyCQc3yEtOLg7/y
 LtHFgHXONUpjuQhbE6oIstU7LApJA6IpVQxWzN1Cgk1aKY0IDw1ibFTHGjXMTTYR0SrPZaf2b
 0ie3MALMq+dJOlM6zrO0pVtduKzpnEI6cQeIrDHemuyPgJyZN9dYoKAEuWZGLXhFAsxrvjBYz
 VZYQyjb0AMTvlVEVziYBzen4kl7eGaSG7DsgyfWGhHpozPcs+4EaRcEOKx9yfb9dtE9Xi/Ok4
 cSYEbE+xKxyjOIklODXQL3lsIztxoZ8P0/bcjQ==
Subject: [Buildroot] [PATCH] package/fastd: bump version to 22
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There's a new feature to offload L2TP to the Linux kernel, which depends
on libmnl.  A new menu option was introduced for that.

It's possible to link an internal version of libmnl
statically for smaller binary size on constraint targets, but this was
not added to the buildroot package for complexity reasons (both build
and licensing).

The COPYING file gained an additional paragraph for internal libmnl
which does not apply, because internal libmnl is not used in the
package.

Link: https://fastd.readthedocs.io/en/latest/releases/v22.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/fastd/Config.in  | 8 ++++++++
 package/fastd/fastd.hash | 4 ++--
 package/fastd/fastd.mk   | 9 ++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 5319d68503..0214786470 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -21,6 +21,14 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 	help
 	  Enable support for a socket to get fastd's status.
 
+config BR2_PACKAGE_FASTD_OFFLOAD_L2TP
+	bool "l2tp offload support"
+	default y
+	select BR2_PACKAGE_LIBMNL
+	help
+	  L2TP can be offloaded to the Linux kernel, significantly
+	  increasing throughput.
+
 endif
 
 comment "fastd needs a toolchain w/ threads, dynamic library"
diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index b59085e0ee..5f7f966533 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  942f33bcd794bcb8e19da4c30c875bdfd4d0f1c24ec4dcdf51237791bbfb0d4c  fastd-21.tar.xz
-sha256  1f5acece57466eac89108f934a196be09b7676fa2d637e78d6657ee1a7d644ac  COPYRIGHT
+sha256  19750b88705d66811b7c21b672537909c19ae6b21350688cbd1a3a54d08a8951  fastd-22.tar.xz
+sha256  adf08b42f1b890b89e998360a864cb4f8441a0a57c9e95e2ce1bfdfc24c49976  COPYRIGHT
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index c1db1cc472..5cd6a909c3 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FASTD_VERSION = 21
+FASTD_VERSION = 22
 FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
@@ -33,6 +33,13 @@ else
 FASTD_CONF_OPTS += -Dstatus_socket=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_FASTD_OFFLOAD_L2TP),y)
+FASTD_CONF_OPTS += -Doffload_l2tp=enabled -Dlibmnl_builtin=false
+FASTD_DEPENDENCIES += libmnl
+else
+FASTD_CONF_OPTS += -Doffload_l2tp=disabled
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 FASTD_CONF_OPTS += -Dsystemd=enabled
 else

base-commit: 55ae6b59d48dd75f4e432b63e5b8a4655b76305c
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
