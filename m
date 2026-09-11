Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A9DC88E50
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 22:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4072960644;
	Fri, 11 Sep 2026 22:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFCWC-3BsJtS; Fri, 11 Sep 2026 22:27:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 42A536061A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789165628;
	b=Wnw/1dRZ+1NwDq+gs7l6UMVHbGa7bvlUiwDo1mS6/GzDoBcydebcjBAIN6eqH4GHEdjq
	 VviEJWc8iZmQXe75yqv+GkYJzb8pCDsMxPHeJdkgdSQgkYoL7ZIyyZIjsBWQ9nYVqHOX1
	 KacK/MNAYJ3HfaOHc6cjVkdHvkLeyHqusHwd7/3ca29FvUzJLUOp2CRmLGA1527V0tYrZ
	 qK6o3DFbOiLej4hWFO44yueJzpmoBe06TIXdlXlywRcP2Sw75bvgXBtLTpcGNkPY7Bru+
	 HbR+YqR3HgGbXSvXBjicpPgIAc+zZlSj9VJt9ouVRwX3keieBY4nz/kK4QgNvyMRcCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789165628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=e7w9FUAsLdjwYXkJepqjyze+0JzcEJGifM3GxWTUfOE=;
	b=MI39nyFc15Ht29WCLAmagh1xI4n2SyeguoJ+e26e4tctxFyBF3G6J0HXNQ1yVcq/hHhH
	 8nycEu5RBNBPeS2KO9pJbBAETEFh7TP8yNycLIBF2iZZyd07PZgKVrEt157nrFO+lshpQ
	 eY9p8wV1J77hgMPx00zw44M4E07QvrIb5F/mGfaI6JywD7Pfc05rF27V6e24NwafJCqvO
	 Vl5dHZ9tkeOPXT94eaRXLlO3nelnad0701frNeecqySFchVP5YNZ30GmDzYKLF9wKvYoT
	 GY6S4X+k3EhoVZcAhCDG+FhjeXR4wSvIIVLtxdMUEFG8L8ZkKLYtAHd2e0gT09tORuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789165628;
	bh=e7w9FUAsLdjwYXkJepqjyze+0JzcEJGifM3GxWTUfOE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UL7EnaWsL3IizvDG4IgVgmCfSGeGmrYwHDMWTJEWalOsw31aUyc3K+TpuC36IBcP4
	 GHL8L2QDf0XWLKa6M1+WSIVIscYmxN6v3ifSf8NWYpkVAgj1jT1AJNRaxsfliKcZZW
	 AOAU1OC7jqlFXE6QrCtusf3drwyYWFANXG+tMhTs0AHM07dicEXg1VLcvKQc+uxWS8
	 mCEzLEwvOHTFMmDDFYhouvxTE3IKAGo9sde98naHlq4pwXn9DwYF7E4lDNVCkSL+nP
	 HnlYZ4NbgQeU6pqUxjTS3NwNFmMuhE1uveI2q7QF1V5GpByHxJ03SXWUXJ+lee4faQ
	 aacEPbK9fQdPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A536061A;
	Fri, 11 Sep 2026 22:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC594255
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADE08400A8
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_z_nVRXmQMP for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 22:27:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AB9D840061
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789165626;
 b=Y+SUgtPcBfZ7XUor/M2+vnWDPhLWo5e0HuIEPG3QRsqsXg4PCx2SdFgbk+/TQF4gheLV
 j54k+bu7EVj3VvFOlUwo0fNTcnxOQu4u58IhB6LUj1o411JJLgwmbLPjXzn81DdLjtUod
 Cz7Tt3V/1M+2Gi1SESkoYxr6w369CNLfIKmMPawFpHAuNdaYpcPd8XTrkN5I7blvj4aPy
 Y466ds+IxnCZIV99wHkQx67Cqj1UeYSuD/8Gu7/ZVpbfSiZiL3TmpWzDzP8l8GvH4Ywx/
 xqi/ZVbpDfVxNqmFInwJwVr0WBIjXBkqI8ZrByLoO9aJZiU5HSvSvx132SEP3Ei0A1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789165626;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=oSo1eVCtB2aVR5lL7SK3itnJ68gEISEcCmK0ydkvxDI=;
 b=aAplZIStL898MPd8v10WrKFtSRnzGrgDb14pUMZcVUwRSYYenhZ9vgTNymc0G4tfoITj
 SMo2TZj5wJZgdUTbArTXDMWqAqf47kQvcc2y+7Rh840zgfKD7uOSZrb0EUEkpgVbzjWIu
 Vy2xdZNMneBcyXSRMoGcoTSQ2YZZ6/IIXI9UfFWRt2It3yekDuosCqOUgXjUPm04kburp
 CQo3wWTJEjSkM42q5pF5SuYeyxX6dZFxAWj8yocyhMQPXtFu6lj4lsqjdQpoLdZIWZV6k
 KssTCv9Eb+VfSRBiCTIaFc1CPRO9pAR2qlfrLwIALOHOkYFZBjBSBdyOw7P909a30Xg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bkZE+G4B; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bkZE+G4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB9D840061
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 22:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789165622;
 bh=oSo1eVCtB2aVR5lL7SK3itnJ68gEISEcCmK0ydkvxDI=;
 h=From:To:Cc:Subject:Date:From;
 b=bkZE+G4BxHSKqIVrBUPuJKDY9SYAQgTig0XlhvllpgMklNgNaLdPBsbMqZL84Q6z8
 Ae7AUObulIybDCMDjoHzggpfBpEqjGzO/KHJp/o9irXyIy8VoCbuM79I0CRj8RGuq5
 xH1jE5s8SPOTy+fuKR5F5XRWdMIRbEq/8qnZzZGWpkmZ6adHGQtaI+1UZqDOJrqrmr
 TudAXNTt+ernxjWlIyxWNf9ytLrReYYua5YSd3hVcuk6+GExb0M8P37leCu+tzfzk6
 zRGKWXOuVtfvsUfMqX19SQKHCaWbpP2gLQwN08Jr8zvoY1tfoJXOdx1ijf4eA+aoh4
 zYbzmPxDH1ScA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E12CA4C3C19;
 Sat, 12 Sep 2026 00:27:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40838)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x59i1-000000001lJ-3NTY;
 Fri, 11 Sep 2026 22:27:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sat, 12 Sep 2026 00:27:01 +0200
Message-ID: <20260911222701.1047300-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/luaossl: bump version to 20260910
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/wahern/luaossl/releases/tag/rel-20260910

Updated license hash due to copyright year bump:
https://github.com/wahern/luaossl/commit/efaf49dc352c221f518305348bdbf89db873d6e3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5e83ac0461c070e9f5f85a51867c0962aa826a74

 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 734c916f5a..36f1046f07 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30  luaossl-20250929-0.src.rock
-sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756  luaossl-rel-20250929/LICENSE
+sha256  22ad2d0e3d12a9376c3d06a000a1af70c45ed181ae581556759e55f637ff371d  luaossl-20260910-0.src.rock
+sha256  277af5901eb8ae8b0e39fec050e858abd23ebf698147e3567df7518928c5cc2d  luaossl-rel-20260910/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index 079d1e0ca4..e1a2806c80 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20250929
+LUAOSSL_VERSION_UPSTREAM = 20260910
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
