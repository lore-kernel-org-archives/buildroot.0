Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93158C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 15:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B44814B3;
	Sun, 11 Dec 2022 15:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B44814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3GVD64PpzEw; Sun, 11 Dec 2022 15:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54C808149D;
	Sun, 11 Dec 2022 15:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54C808149D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 890111BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F71840135
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 15:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F71840135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyb-Gkj_nDtk for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 15:38:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A159400A6
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 15:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A159400A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24A5886425; Sun, 11 Dec 2022 15:38:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 16:38:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 071fdbf963228590b453e5111eadc8a74b579aa2
X-Git-Newrev: d23d6fde81b3a8bf701d0382d55fe60e2334c934
X-Patchwork-Hint: ignore
Message-Id: <20221211153851.24A5886425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson.mk: add 'setup' as meson
 command in config step
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
