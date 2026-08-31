Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386EC61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7398C80D05;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzti2oGPfbsS; Mon, 31 Aug 2026 17:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788198852;
	bh=xG+4Hgve19lIvWNSyOePQIKzYEoKakO/TaSfB+tT4u0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LRHfCgTVVNs5CwPSuHpFNz3FS9WmpsH+DyZZDpEjuZ6kq3CYjHcUUL7+tq3OhaaBg
	 lEwPJE22GlXBNzP7nRngbuIFTolpC8kzw5u2ZqnbGd+DMxWOQBLYdVC5dxl3/uoHPA
	 flY/N/yXJDvUMRKtxxXXrORMqKZknMAIUa1Ez9ZmEwIEv3IeCyoiWnOl636A8qksdk
	 Rez38mJXziH2JqWRExrdM+d2sAzT+8S9ECNSIH6rURJqLB3zJgRYUph3Mcs6xoEkVV
	 ZK2K9ZzHNB7hDUlr9a7wZE0MBGHu4J6cwT/vxp8KAaOnRi6kC1XaR22S1SKR5sOIO3
	 iTAlhmgD6Jd8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8DA80AAF;
	Mon, 31 Aug 2026 17:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E23A823E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC52A6064B
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMRtdInK6Xyz for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 17:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD6A3605F4
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 17:54:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw7V-1wanfC4AAl-00ovPb; Mon, 31
 Aug 2026 19:54:06 +0200
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 31 Aug 2026 19:53:58 +0200
Message-ID: <20260831175358.1092247-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:bYm1wXAM6cuHp6pP/Va5PVzyvvCT7/e303PQ9UWHaQ7pJEcWIXI
 MrYEHdBaIG+v4NYUjaFyg/kNYEqebHDqs2iUhGCtoQX+n/mSwUaSuZPMFPM08oTOOXQhoKF
 jJPrOVrA5cRWKZrD7PBPJKa/s3QndNktajhT1sK2AfErJMVtUTgUwpIT+nqkezc97Wp3LII
 LmI5dV5Wl+zgqDM6Ej6uQ==
UI-OutboundReport: notjunk:1;M01:P0:z628FU91qKU=;Dslh+GTpZbIhnFPQ+h8CLEPlCxa
 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
Subject: [Buildroot] [PATCH 1/1] package/dracut: pass HOST_CONFIGURE_OPTS to
 make
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

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Dracut-internal executables were linked against system libraries,
instead of Buildroot host packages. For example:

$ ldd host/lib/dracut/dracut-install
	linux-vdso.so.1 (0x00007f578cf06000)
	libc.so.6 => /usr/lib/x86_64-linux-gnu/libc.so.6 (0x00007f578cccd000)
	libkmod.so.2 => /usr/lib/x86_64-linux-gnu/libkmod.so.2 (0x00007f578ccb1000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f578cf08000)
	libcrypto.so.3 => /usr/lib/x86_64-linux-gnu/libcrypto.so.3 (0x00007f578c600000)
	libz.so.1 => /usr/lib/x86_64-linux-gnu/libz.so.1 (0x00007f578cc92000)
	libzstd.so.1 => /usr/lib/x86_64-linux-gnu/libzstd.so.1 (0x00007f578c536000)

The reason is that Dracut is not a "real" autoconf package, and the
hand-written ./configure script does not preserve LDFLAGS for
make. Pass the environment variables directly to fix this.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/dracut/dracut.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 1b356a5092..5425e7eeb5 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -11,6 +11,7 @@ DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
+HOST_DRACUT_MAKE_ENV = $(HOST_CONFIGURE_OPTS)
 HOST_DRACUT_INSTALL_OPTS = systemdsystemunitdir="" install
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
