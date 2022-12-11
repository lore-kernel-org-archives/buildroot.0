Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D78C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896134DD08;
	Mon, 20 Feb 2023 22:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896134DD08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emCqAm9Jqkd3; Mon, 20 Feb 2023 22:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A9A4F263;
	Mon, 20 Feb 2023 22:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A9A4F263
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C63F91BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85DC61247
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85DC61247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhyqrelXxOnR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8A7611DF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B8A7611DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07413828C8; Mon, 20 Feb 2023 20:52:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 16:38:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 071fdbf963228590b453e5111eadc8a74b579aa2
X-Git-Newrev: d23d6fde81b3a8bf701d0382d55fe60e2334c934
X-Patchwork-Hint: ignore
Message-Id: <20230220205207.07413828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-meson.mk: add
 'setup' as meson command in config step
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

commit: https://git.buildroot.net/buildroot/commit/?id=d23d6fde81b3a8bf701d0382d55fe60e2334c934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When building/configure meson packages the following warning is
displayed:
    WARNING: Running the setup command as meson [options] instead
    of meson setup [options] is ambiguous and deprecated.

This warning was introduced in meson release 0.64.0 [0], which we are
using since commit 9afa3e3c7d07 (package/meson: bump to version 0.64.0),
and is dpcumented in the manual [1].

Follow the advise and the manual, and add the 'setup' argument as the
meson command.

[0] https://github.com/mesonbuild/meson/commit/3c7ab542c0c4770241eae149b0d4cd8de329aee0
[1] https://mesonbuild.com/Commands.html#setup

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index d675f7f733..4aa6e44afa 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -149,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
-	$$(MESON) \
+	$$(MESON) setup \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
@@ -169,7 +169,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
-	$$($$(PKG)_CONF_ENV) $$(MESON) \
+	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 		--prefix=$$(HOST_DIR) \
 		--libdir=lib \
 		--sysconfdir=$$(HOST_DIR)/etc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
