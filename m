Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625EEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314E2604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 314E2604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D87483D6B;
	Tue,  3 Aug 2021 22:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c14Rx40E87nw; Tue,  3 Aug 2021 22:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325BB83D60;
	Tue,  3 Aug 2021 22:57:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 120931BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 943A54060F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKIae2uTL6Qr for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B97D4060A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 91844843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 22:42:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e2f12ae1cf68c4b8edb736f7d68ba159f34f1dd
X-Git-Newrev: f87c377a53e31e2638d0193acab5a40b4aa49b59
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.91844843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3-cffi: add
 python3 host variant
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f87c377a53e31e2638d0193acab5a40b4aa49b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a python3 host variant since we are adding a python3 host variant of
python-cryptography and it is dependent on this.

Signed-off-by: Donald Chan <hoiho@lab126.com>
[yann.morin.1998@free.fr:
  - drop target _DEPENDENCIES since this is a host-only package
  - also add sync comment to python-cffi
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cffi/python-cffi.mk     |  1 +
 package/python3-cffi/python3-cffi.hash |  1 +
 package/python3-cffi/python3-cffi.mk   | 29 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index f882349fd7..f0b5b4560f 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Please keep in sync with package/python3-cffi/python3-cffi.mk
 PYTHON_CFFI_VERSION = 1.14.2
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
 PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
diff --git a/package/python3-cffi/python3-cffi.hash b/package/python3-cffi/python3-cffi.hash
new file mode 120000
index 0000000000..1f98d8df9c
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.hash
@@ -0,0 +1 @@
+../python-cffi/python-cffi.hash
\ No newline at end of file
diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
new file mode 100644
index 0000000000..7541e71b73
--- /dev/null
+++ b/package/python3-cffi/python3-cffi.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# python3-cffi
+#
+################################################################################
+
+# Please keep in sync with package/python-cffi/python-cffi.mk
+PYTHON3_CFFI_VERSION = 1.14.2
+PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
+PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON3_CFFI_SETUP_TYPE = setuptools
+PYTHON3_CFFI_LICENSE = MIT
+PYTHON3_CFFI_LICENSE_FILES = LICENSE
+
+# This host package uses pkg-config to find libffi, so we have to
+# provide the proper hints for pkg-config to behave properly for host
+# packages.
+HOST_PYTHON3_CFFI_ENV = \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
+HOST_PYTHON3_CFFI_DEPENDENCIES = host-pkgconf host-python3-pycparser host-libffi
+
+HOST_PYTHON3_CFFI_DL_SUBDIR = python-cffi
+HOST_PYTHON3_CFFI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
