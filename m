Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264EBC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05DB60608;
	Mon, 24 Aug 2026 19:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0oP9UGxpDDE; Mon, 24 Aug 2026 19:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787600577;
	bh=ychcETTZA/MZAuVLHM+tgTIQigsQgZsH22h9BAKhL2o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jlxGFKU1RLhakhNmDVej/khwvqFDhMYpNFZQJy9b79ZeluWIWoHbjKpiQlYThT9Xs
	 1ZB7vhE53mIvAH9BCwSCJLZxweXwuvFj8z0CTPfnLctAHjSrQaQjzR9sJKLLGZTIYW
	 EDRvLKLywWulWs6f7bliaL13RWqQAx7yZbXutBuRr2w3GEhFxmXkHKq5DFmDyTxZkk
	 l87zBHezf2aliXhPM8BTKx7ZXj9FdVPfGuvaAWBI0mnrfPTDUtSpvgYTyrwJiFihpk
	 UQUP7IDP5uUMuFgTiEM58ZCZi633ni/6bRqwdcsjOIfQJXAsR0nnzHcMPy7/Q0yfOf
	 pyjLcA5A6OgiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECB4F60624;
	Mon, 24 Aug 2026 19:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8DE74B8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9C0340577
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wtmJhBVKeT3 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADA040569
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:42:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE68990004; Mon, 24 Aug 2026 19:41:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 21:40:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e036c739ff82bf3a5aaf5dc79b7c560e5040787
X-Git-Newrev: 1a0a2134e6e632852e23ca8cc583af7ea347ec6d
X-Patchwork-Hint: ignore
Message-Id: <20260824194158.EE68990004@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: mp4 support needs threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5883283723865331926=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5883283723865331926==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a0a2134e6e632852e23ca8cc583af7ea347ec6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 1c5730ebb5e8b9a67433aa9997e5cfd6cae18cfe bumped the
package from version 2.2.1 to version 2.3 which includes upstream commit
https://github.com/taglib/taglib/commit/5d63187a8b8d291cbf4f77d1bb973bc5ee91cf03
that uses std::call_once and is only available with threads support.

Inspired by buildroot commit f9a2d65cae88ca7c641af2f69161ab0d21bac91c
which fixed a similar error.

This patch fixes a build error

/builds/bkuhls/buildroot/br-test-pkg/br-arm-full-nothread/build/taglib-2.3/taglib/mp4/mp4itemfactory.cpp:51:16:
 error: ‘once_flag’ in namespace ‘std’ does not name a type

caught by the Gitlab pipelines. To reproduce use this defconfig:

  BR2_arm=y
  BR2_arm1176jzf_s=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
  BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
  BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
  BR2_TOOLCHAIN_EXTERNAL_CXX=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_PACKAGE_TAGLIB=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/taglib/taglib.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 924d3f339d..9a111a86c6 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -12,6 +12,12 @@ TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 TAGLIB_CPE_ID_VENDOR = taglib
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+TAGLIB_CONF_OPTS += -DWITH_MP4=ON
+else
+TAGLIB_CONF_OPTS += -DWITH_MP4=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
 TAGLIB_CONF_OPTS += -DWITH_ZLIB=ON

--===============5883283723865331926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5883283723865331926==--
