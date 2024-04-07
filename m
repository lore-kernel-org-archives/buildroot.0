Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE6CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7547860887;
	Sun,  7 Apr 2024 12:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDLTdtz2d1LY; Sun,  7 Apr 2024 12:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244E7608A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244E7608A5;
	Sun,  7 Apr 2024 12:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 780661BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61CAE81EB9
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5otxobghrHAH for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D8B81EB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D8B81EB8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 921C784C92; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 14:17:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38209fb5d3a40735ec304622ee31f10f6176cfce
X-Git-Newrev: d0653e3b2c4a6f6183ba5bf2c22542bc81b80467
X-Patchwork-Hint: ignore
Message-Id: <20240407121837.921C784C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0653e3b2c4a6f6183ba5bf2c22542bc81b80467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/12.3.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/b0aaffaf951725186ae078ce101edb24c963c6a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/whois/Config.in | 1 +
 package/whois/whois.mk  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index d2a030282b..19c22b5583 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Improved whois client.
 
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 5a85bea358..e98add4e6a 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -10,6 +10,7 @@ WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBIDN2),libidn2) \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
