Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F42E606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gmbmv30j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EDCC409E9;
	Thu, 26 Nov 2026 19:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UK5tN8IVVYl; Thu, 26 Nov 2026 19:25:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B82B140A0D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721114;
	b=NIFWMzyJ3cHDxnVUSA/LjecjqCkvOZk0Ph4XJaFCDO0e+ceBrdXsZoqUNSNP+cZz1VK8
	 7kTulH96XurIM9RwunlpbsJLJHKaga656oTGmtPVzqnXmSe1nWV41K6woYD7pjsxDrwFV
	 18qy5quwgzRO/qbnGMa42PiS6ln8NU05joscyokNiUdv1zoe5Ca4vH1a9GHla45X/J42u
	 2d2iGFwKHbbrKksBjskqN3HN//RfMkPXjRQbD6SBNkCc2+O9rKF3gXq7Wq2qBJQz9yDzw
	 lD2kgtWeMv9FPLo+SWAHmuCMM7fkWkBlciHr2YlR4vZKFqZ8pe7aAlkPvHwS7auAvZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=jBtlSUz37+FfH0peKi9GWDtincJ2xu82uc41/kI4Dp0=;
	b=m9BykTNX895slXV9OYG3YrFm+JxrZ/yemTCvF7n+4p59cICi2sfVwqDiX3FNefMtN5Fu
	 sIClvoLwq1glK1I5xHjdu3Iw5GY/4sz7hnvrHnI2WTIzq5VJMVL3eLcnd2yTGYog9eSiG
	 WnWmuJBF2MIQY28CzeIMiyfuXHD0DhM1m/zadN2uuXHGmCcHzByj5oL77t8+OwB0TIJen
	 fwLFO2+vLzZGMiKtwgeI0jKGWVu3sQy9SiBDI++5B5DAERsgUJkWzK5ctYQpUV4w77HzV
	 L4xFJ4PgB6MtlqcCH3ycbn5BOQ1KTh1KEc6ZcvOcS9VAkE71mMt0m/foOc5/KxsGmHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721114;
	bh=jBtlSUz37+FfH0peKi9GWDtincJ2xu82uc41/kI4Dp0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gmbmv30jYkmdqzL5YTQTKkxagIfVB3hzSyFcEqMIHtBrZ16ef3ogPvnpggnmhvkRC
	 JBhKUVnhUtIveZYr+ixx/1WkeJv8ww6FTl2FqCQAFu6cJ4R5yfro5GbDMYq+72a0A/
	 Ihg0PQBBZ8MHbJh0vbGdq+LaTj2TYDn4/11U0Gg9nMWfsYPsajVx538KGF264BSGi5
	 zYg+RWJk9KAQhno5Cc3+c13ARkjnPd91dNPaN4QZThWsmYK3tEtcS6n5yXZ5M6O/8W
	 GUqigrRFeUlSgqysoLl1QAM+IeyAGq8xDhQWXAlpMETC5oruTKTKbCXrK2RkSPvNxk
	 mNm5vX2J0g9TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82B140A0D;
	Thu, 26 Nov 2026 19:25:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A09260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236C340543
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcoMZn9XjGLA for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7FDF540542
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FDF540542
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721105; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:gvszR+9KN1xnQQsXHc8J9ZksXb4u
 qWi4v9xEf9Y1X8dWJkYgTES9gNfXfA4x1G2P2D/It4TOb8BSpW0FzIuXosVWuatdMftAVZABbRD
 sGQCNQkeq1LAOxMKw7Oe35y20ds/n4YNtCeGILXduiz8o6zs2uy8CUinJt/Y+H9BjVAL3dNogO/
 GPD2uu9gDr4RynWBKBkZgWYmr5BswgmrynsCO5sLm/xcLVL45AtrOwsvwFAE5MwL50mXOTNreLU
 6fE/uTH/wB41SPnjX4qlEkYlzCjI+EqhE77LhN8U9ZOqT0rUcIiIUSGUSp0w6Zzdtgjq0iXhRIY
 e4JBg5kYxhhK+Q==;
Message-Instance: m=1; h=sha256: tIbTAmhnuSKwmsBf6shi7JKZgua4RGFjHT5DWIRUgIY=:
 10xckxAVR25vIlTgl87Bhp2Ed/YNv99cGFTYmcxUoNE=, sha512:
 7kYpBylUbRkWJ4xcgwnUSTeNlJA144CAP55yZKEwK29JR5vgW9KXE6mzLYvajOURGeMII6qLKboXlb8p1Pjg5g==:
 6LQEymG4zXZKfCp0cAOmRTgHf5SiQMbmhTiieaWwCGRhG164n8FcrwHE4H42i4WpLHpTPYR88MteT5Efnw2i3g==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1yBVYV1qJp-00iYSL; Thu, 26
 Nov 2026 20:24:58 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:31 +0100
Message-ID: <20261126192435.1826415-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:td9FkDw8x4LdyBOUNqr3X0SOfQrodyQBzLmXLJ4mNESIrjmwwSG
 uuCgqPN1tukddLBjHzCGepoDmDvl+vGbk2vdPhYMUIVO/sn0lMdv1LN7ORX5hJbuAuuG/BN
 NnlxPCaYvFiuhKixlzBSWgew9USPzb1XHbQJV2PmSDbE4An2pQNzPjO9b7UtecALRiGDnLm
 599Ae9JFbHCC8rluU2G3g==
UI-OutboundReport: notjunk:1;M01:P0:iYPyS5Bn6Qo=;w8igUVLJClifuJyEPcZduQ58h0f
 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
Subject: [Buildroot] [PATCH 06/10] package/dracut: add target package that
 builds dracut-util only
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

dracut-util is a small executable that provides dracut-getarg{,s}
commands for scripts in the initramfs. As such it must be built and
installed for the target so it is available when building the
initramfs.

Note that the target package does not run ./configure. If a full
Dracut target install is desired at some point, running ./configure
must be gated behind an option, so dracut-util can still be built for
target configurations that do not fulfill all the dependencies of a
full install.

Dracut v113 assumes dracut-util is part of the same install as the
main dracut script, which does not work for a cross-build. Add patches
that allow overriding the location using DRACUT_RUNTIMEDIR.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/Config.in                             |  1 +
 ...004-feat-introduce-DRACUT_RUNTIMEDIR.patch | 69 +++++++++++++++++++
 ...l-dracut-util-from-DRACUT_RUNTIMEDIR.patch | 30 ++++++++
 package/dracut/Config.in                      | 14 ++++
 package/dracut/Config.in.host                 |  1 +
 package/dracut/dracut.mk                      | 15 ++++
 6 files changed, 130 insertions(+)
 create mode 100644 package/dracut/0004-feat-introduce-DRACUT_RUNTIMEDIR.patch
 create mode 100644 package/dracut/0005-fix-base-install-dracut-util-from-DRACUT_RUNTIMEDIR.patch
 create mode 100644 package/dracut/Config.in

diff --git a/package/Config.in b/package/Config.in
index 49659b007e..2ed4531928 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2844,6 +2844,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dracut/Config.in"
 	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/dracut/0004-feat-introduce-DRACUT_RUNTIMEDIR.patch b/package/dracut/0004-feat-introduce-DRACUT_RUNTIMEDIR.patch
new file mode 100644
index 0000000000..b407756fde
--- /dev/null
+++ b/package/dracut/0004-feat-introduce-DRACUT_RUNTIMEDIR.patch
@@ -0,0 +1,69 @@
+From 6acf280b63e019ff6dce8962e1b749034a75ad70 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Mon, 17 Aug 2026 18:03:02 +0200
+Subject: [PATCH] feat: introduce DRACUT_RUNTIMEDIR
+
+DRACUT_RUNTIMEDIR is to be the location of Dracut executables used at runtime
+(in the initramfs), like dracut-util. In most cases this is the same as
+dracutbasedir, except when using --sysroot, where initramfs executables must
+match the sysroot (which may be cross-compiled). With --sysroot the default is
+the equivalent location inside the sysroot.
+
+Allow inst_binary to install from DRACUT_RUNTIMEDIR, whether in the sysroot or
+not.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/dracut-ng/dracut/pull/2588
+---
+ dracut-functions.sh | 4 ++--
+ dracut.sh           | 9 ++++++++-
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/dracut-functions.sh b/dracut-functions.sh
+index 41338288..0e02a373 100755
+--- a/dracut-functions.sh
++++ b/dracut-functions.sh
+@@ -1127,11 +1127,11 @@ inst() {
+ inst_binary() {
+     local _ret _resolve_deps
+     [[ ${DRACUT_RESOLVE_LAZY-} ]] || _resolve_deps=1
+-    if $DRACUT_INSTALL ${dracutsysrootdir:+-r "$dracutsysrootdir"} ${initdir:+-D "$initdir"} ${loginstall:+-L "$loginstall"} ${_resolve_deps:+-l} ${DRACUT_FIPS_MODE:+-f} "$@"; then
++    if $DRACUT_INSTALL ${dracutsysrootdir:+-r "$dracutsysrootdir" ${DRACUT_RUNTIMEDIR:+-B "$DRACUT_RUNTIMEDIR"}} ${initdir:+-D "$initdir"} ${loginstall:+-L "$loginstall"} ${_resolve_deps:+-l} ${DRACUT_FIPS_MODE:+-f} "$@"; then
+         return 0
+     else
+         _ret=$?
+-        derror FAILED: "$DRACUT_INSTALL" ${dracutsysrootdir:+-r "$dracutsysrootdir"} ${initdir:+-D "$initdir"} ${loginstall:+-L "$loginstall"} ${_resolve_deps:+-l} ${DRACUT_FIPS_MODE:+-f} "$@"
++        derror FAILED: "$DRACUT_INSTALL" ${dracutsysrootdir:+-r "$dracutsysrootdir" ${DRACUT_RUNTIMEDIR:+-B "$DRACUT_RUNTIMEDIR"}} ${initdir:+-D "$initdir"} ${loginstall:+-L "$loginstall"} ${_resolve_deps:+-l} ${DRACUT_FIPS_MODE:+-f} "$@"
+         return "$_ret"
+     fi
+ }
+diff --git a/dracut.sh b/dracut.sh
+index ab4b1954..72bd0dda 100755
+--- a/dracut.sh
++++ b/dracut.sh
+@@ -1002,6 +1002,13 @@ if [[ ! -d $dracutbasedir ]]; then
+     printf "dracut[F]: base directory '%s' does not exist.\n" "$dracutbasedir" >&2
+     exit 1
+ fi
++if ! [[ ${DRACUT_RUNTIMEDIR:-} ]]; then
++    if ! [[ ${dracutsysrootdir-} ]]; then
++        DRACUT_RUNTIMEDIR="${dracutbasedir}"
++    else
++        DRACUT_RUNTIMEDIR="${dracutsysrootdir-}"/usr/lib/dracut
++    fi
++fi
+ 
+ export DRACUT_ARCH=${DRACUT_ARCH:-$(uname -m)}
+ 
+@@ -2580,7 +2587,7 @@ for dev in "${!host_fs_types[@]}"; do
+     fi
+ done
+ 
+-export initdir dracutbasedir \
++export initdir dracutbasedir DRACUT_RUNTIMEDIR \
+     dracutmodules force_add_dracutmodules add_dracutmodules omit_dracutmodules \
+     prefer_dracutmodules mods_to_load \
+     fw_dir drivers_dir debug no_kernel kernel_only \
+-- 
+2.55.0
+
diff --git a/package/dracut/0005-fix-base-install-dracut-util-from-DRACUT_RUNTIMEDIR.patch b/package/dracut/0005-fix-base-install-dracut-util-from-DRACUT_RUNTIMEDIR.patch
new file mode 100644
index 0000000000..582b5ea90c
--- /dev/null
+++ b/package/dracut/0005-fix-base-install-dracut-util-from-DRACUT_RUNTIMEDIR.patch
@@ -0,0 +1,30 @@
+From eee0e05dfddcfe6b9e7ce3e12d920454889d858d Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Thu, 13 Aug 2026 18:08:46 +0200
+Subject: [PATCH] fix(base): install dracut-util from DRACUT_RUNTIMEDIR
+
+dracut-util is used inside the initramfs, so it must match the sysroot, if
+any. DRACUT_RUNTIMEDIR is the location for such executables.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/dracut-ng/dracut/pull/2588
+---
+ modules.d/80base/module-setup.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules.d/80base/module-setup.sh b/modules.d/80base/module-setup.sh
+index 836eb6b4..19528ff9 100755
+--- a/modules.d/80base/module-setup.sh
++++ b/modules.d/80base/module-setup.sh
+@@ -51,7 +51,7 @@ install() {
+         reboot \
+         sysctl
+ 
+-    inst_binary "${dracutbasedir}/dracut-util" "/usr/bin/dracut-util"
++    inst_binary "${DRACUT_RUNTIMEDIR}/dracut-util" "/usr/bin/dracut-util"
+ 
+     ln -s dracut-util "${initdir}/usr/bin/dracut-getarg"
+     ln -s dracut-util "${initdir}/usr/bin/dracut-getargs"
+-- 
+2.55.0
+
diff --git a/package/dracut/Config.in b/package/dracut/Config.in
new file mode 100644
index 0000000000..59f75949b6
--- /dev/null
+++ b/package/dracut/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DRACUT
+	bool
+	help
+	  dracut-ng is used to create an initramfs image by
+	  copying tools and files from an installed system
+	  and combining it with the dracut framework.
+	  dracut-ng is a drop-in replacement for the legacy
+	  dracut project.
+
+	  The target package installs only the dracut-util executable,
+	  which is needed by many of the Dracut scripts installed into
+	  the initramfs.
+
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index af68728457..477578583c 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DRACUT
 	bool
 	select BR2_PACKAGE_HOST_KMOD
+	select BR2_PACKAGE_DRACUT # dracut-util must be included in initramfs
 	help
 	  dracut-ng is used to create an initramfs image by
 	  copying tools and files from an installed system
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index fac29dead0..7f69b62c53 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -10,6 +10,20 @@ DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
+DRACUT_INSTALL_TARGET = NO
+DRACUT_INSTALL_STAGING = YES
+
+# dracut-util has no dependencies beyond the toolchain, and does not
+# require running ./configure first.
+define DRACUT_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) dracut-util
+endef
+
+# dracut-util is only needed in initramfs
+define DRACUT_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dracut-util $(STAGING_DIR)/lib/dracut/dracut-util
+endef
+
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 # Dracut is not a real autotools package, and the hand-written
 # ./configure script does not preserve LDFLAGS for make.
@@ -58,4 +72,5 @@ endef
 HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_INIT_MODULE
 endif
 
+$(eval $(generic-package))
 $(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
