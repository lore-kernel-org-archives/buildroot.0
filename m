Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E66606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qIvvYDYT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426CD610BD;
	Wed, 21 Oct 2026 19:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMlYoccZ1A-S; Wed, 21 Oct 2026 19:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5AD5B6117B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610668;
	b=S+GCLFL5zBFRNQ6n1kVxkDNaXPTTgkEyRh5bdW+GcDQ9d2yW22XVVDt2EgMLzKTQaNY+
	 23/aLWA3XLVtHgglkZeKcJX/3yGoIU4oAhoGS2F2qPwAcQZ2lObVHFNGkvpvKqRHYgbBb
	 js9ZMXgTsXQbPqaOEnkm3/SrYtiQeA27LzQBvm3U/S0r1B9wdn/ZnJLnIYsnLUsrZnAGO
	 /GKha2d7qIA139cPArJJT5jMBTkKof+zb+VQew0JkIWF8YV57Wae+8neo5+azTKXXwZW6
	 jwMDubkr8W2leuuO1YxA77CfeBsD0UKB6xDETW1xxuIIuIC7YNrTSrzJFPrBgZWCSBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nJAgBhsAppetVj0lzS+2m5TVFJ4HBvdDP/Gi1RWR6ZQ=;
	b=TdYRv7lh+dppd5QYMfbBcrFhqJRfied8SHCiUL4hzfTHIzcoy48iKnMRWh2JwhRHDkWg
	 R2+9/OV/dC7UoRYwk/WjybE4t4quDjWeQioWM+jzNyYaEWS7SB+PjqBHWU7wFvycO2mqi
	 zc2mgw8in1XN5H9RpyELSUZrRr7xUlQILmpB8fzsLQHFfzVLQtA3zFDi2goZeXAux1AmC
	 WZd4rWVn6a3hHwU4UWik/rBkXPfHjv6do0qDnIZX0MUcLdfgN3ATYqhPXfOq+8xrINGK2
	 e1GBtybvX357gomubT3WnSy7Hz87Cb1aS56Hpu9gU642goHKfjBJNtUl5Zb9xLv7Ucw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610668;
	bh=nJAgBhsAppetVj0lzS+2m5TVFJ4HBvdDP/Gi1RWR6ZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qIvvYDYTmhgbHh5PeFtcvCDiUGsxNIwXIF3nPpwepidr81qKuPCwODF0CJytm21CC
	 mJpCznjWVzS2ORMjESCak9pQEdGbGGxvxLO5J8Kp4CufJW96ijC42dKKnEFTUzvUdP
	 gfEolgmNJ5gh+ihjvTgklBBYTEwlrBqR59r2pXRwrU7PpvjFLexe92HUusv555H5u8
	 q1v45bMEq9X/8EkSUc/Asjz1qRCe7WzEmSP8MpRdAehcAJnhZOydgpYI3KKU6vHV0I
	 AUT/lmUdrEmBu7At7OUE11F4lvWGh1wS32Q1yrZIeAGscG1A5pKypaR37P5OcZkxvK
	 SuQmNQzm3i8Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD5B6117B;
	Wed, 21 Oct 2026 19:24:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBD895C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D54240952
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW7d10EdOZkl for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E2994093B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610664;
 b=K28/+up2fNZwrcGEIC1PP3T8SAz1h+vvmyWIMDFi3O3+ZTllrjObLLb18KuRR07nzewu
 gCCgAevoJd9nDv5hNBYgGqW4fBgRemqDlWcwWrz2xHCzUdXKiCTPchpbS7KL2ifL22AHi
 nOePyYUU2ZfXP53aU4TbgBSmp5+yuFmEL3gjB6im3F97VMiqeoFU79j4fc53dinkYl+/J
 OLOLxZgcW9AArZcuuskDZJFszlNuBDw/iFD3+DXLbCvptrxMzz8V5mnxj9kanw2fNKeII
 SidoEjbHk2bz37nQGrEIC/wABzt+PZ0qcWHJiZi2b86IW69vq3XCATXIACKcJZqIMVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610664;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7j3g28Sekqjjko25Vkcddf/2NkyKfwTAkg2iGCMM9UQ=;
 b=LYxlLhchOvC8XLgnfgaZE13Clqa78PUs4jEyvwe6zi2T9iTTmVtOmHnpej9+dgUmD1Rc
 dzuhDEPlMWKh+zN+6Xgs0+2wvri9N8bzhVTdXhAx4rTC71Uy4HgovjhXe8D44b4FoP9mG
 jrUYzasCCN8ideDESTERsNcx7MYhuXb6NC6+Yx9jDZ7ODjT0xcMcWG3X5LmUoIrt3sr8V
 S9B2N/OW2QU3o0Ku1rkkoZMrY2bA1XbveMAi1rHQ4fUzme7xUrKTs7v/E8NB9a25u66Wq
 jzvibYtYf6VO1ScFSLqWT+JBpoROok/Cxz577SPrFA4bCMKeNp40NQf2dDYkOP8L4aQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E2994093B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CD7D99AC2; Wed, 21 Oct 2026 19:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:23:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75a1aea9b420ac97b9dd3058db172e6d0c46a812
X-Git-Newrev: af68a0883213ac465d3ba6718097f4e0e3166af8
X-Patchwork-Hint: ignore
Message-Id: <20261021192300.6CD7D99AC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: add optional
 dependencies to lcms & xxhash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af68a0883213ac465d3ba6718097f4e0e3166af8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 006aab8d64d2179d77df9a696b3fd8636f541640 added the
package at version v7.351.0.

This version includes optional upstream support for

lcms, added in v0.5.0:
https://code.videolan.org/videolan/libplacebo/-/commit/eb14d3bdf22605263a9b6025ed6280eb1515a89a

xxhash, added in v6.338.0:
https://code.videolan.org/videolan/libplacebo/-/commit/cb1009d1455e64787e52c5c3b6f7042aa37e5c14

This patch adds handling of these optional dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libplacebo/libplacebo.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index e03f224971..c3a2822fb5 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -12,4 +12,18 @@ LIBPLACEBO_LICENSE = LGPL-2.1+
 LIBPLACEBO_LICENSE_FILES = LICENSE
 LIBPLACEBO_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBPLACEBO_DEPENDENCIES += lcms2
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+LIBPLACEBO_DEPENDENCIES += xxhash
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
