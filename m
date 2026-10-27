Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BD606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NWvbri56
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1B6606EC;
	Tue, 27 Oct 2026 22:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHgPUzFJQ9xK; Tue, 27 Oct 2026 22:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5308B606DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793138946;
	b=Hkq01TGfZ+iU5xupOw5pkMMnBMqZsc3tZkSdiYPR8Na8BzBrFwYwmn/xnc6N/MYPLlNJ
	 fB0sBICDEz7jiwC+Tkqzf2V0zmOp5mdbzbc5vN3WkWSrhqKO/w6Dkxi0uUt0Wrb+LxHHD
	 FDUq6aSRTIrl2zYBB96xpvE9ptmvWiWD+UqWJ1Kym8reP5yhGdol4UawXnbptrZQZGExp
	 YeAqX9eLSTegjp4kM07oAEqxohFKV1rTtj6g+rG5iVowwzoLLyc5GvOoZ0XMBjv9ZGU46
	 wKmf0ppUUUrLo7GY5zoZ4lL3VYpsjqsKULB5+gZmy5ff0CZcQ9tyxDPe21ztoXeWeRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793138946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MPj6+VKHRGgSQgx0aiSGVVb2XDIu9sfwHz2TYDNT8kE=;
	b=V4azU31TzQknYh022tHOPvpasW5cdsPcFhmHzOFjTswZTR1LmimYejiZHYOloXdTVntZ
	 Gpk1cH32BPexcCxC9nFlCZDZ0vflJpVYTjqP746rF1QWXBzGPWxZvr/+xcDn7OSal0g9d
	 yZHJfECMLQZtV4NClOHzFQNOsjkwJCOBfAr1p0KK5f7lj6TFBQ9GoD3fKW64DHum8DOrs
	 B3uNes4VPi1XRL6nz12/Wj980WqEHRMi4Bo2MluyOOH6BRjB+7TBoXn7GSPtRwIW0yeGq
	 01u11d3EjTs+2T7DXiVhInNnzTuBWhInayWW8vUGLUy0fJeiA1GJENCTx6BKWWcwkSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793138946;
	bh=MPj6+VKHRGgSQgx0aiSGVVb2XDIu9sfwHz2TYDNT8kE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NWvbri56aUEOl0QO92ceJCynPbtLn3+gotGuUqMzRsRA4Sr6HZVdGpYQ6GQWVxML9
	 4EtYQ0W8m1hXeSw5b8mAreFCyMyqNxXfy7m5tnFG3GXrv1B7496FJt3DjO6CIxaeVm
	 GtJE0lVGaSbSASdwC2EyrCXkAzehW2uiFMfGsjUQAwaK02DawM/93lgYvMJVIA6sPz
	 zWJvBMG40IfgaqYIU6TSv4nfhWB7Mak3K2gbTTa6k+Alx+jCdiy7qRVP1pu0JRZJ89
	 wI1KeiVHb0C/wNfpQ4zl5fn1tF0Kayte6F+A49NszX+zxghaCVIahUIi+MlCKl5V2/
	 nlppMXYOe6wwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5308B606DE;
	Tue, 27 Oct 2026 22:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC61A529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEBE680937
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSMIfIl2WD04 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 22:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C1B64808D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793138945;
 b=BkcoszwxAZJoUH92OmLbdo0CzxrWfak7r2Jyprx9JLxNTM2aPdgUHQjVIS5M2VGKb2SQ
 KVdnu1Lr+ICxtTSRqK2A1iYnrnwil2PwiFlJO6eZCAYzCZKTvokgcBW5lDOs1L6B/kX43
 LHS8YOu8iNw7lQUstOItt/Z3fq5nxJB6bbUNPcI2a1jris8JvZUQLSVmqW4dtwW4uDYUq
 YUHSvxGlW5bPjZuW2TtIsnES+iqPdAVE57lgEors+VU+q4BCTPEE6Zv/CIUbLLPtiS2jA
 3WX2x211Z/+Iq6UxoA02pGHs8ZnvMIQuQsTlBqKBTMkpw0MQ0xMmcL0BkZzCAWrzXjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793138945;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1vFZddckCZdhirav7Qymsa4rOUnDwH6l8qrFEc6Adow=;
 b=Hk2PLSY3KaVYogtUGn7SLM/bDfv0N3ZVAlRiDsrYqxODXN2lg4a2/nxU1pTQiXlldE/G
 8H963MMmkZ5gy+nHGmhrw0fAcmTieBhW5KdP0357OgLk/EePw4+lB2qUGOwchjVtd0wsu
 8kAgFPddxOkhZlv3BZZmCkPf5sMl8YbWyl3eGmMzC6AM9kgaDMQXEJYDCHwYVjHXAQ6cd
 K/KxyJow8MUXgHm8ESIhoagJlY4SIxTBszDALUA19rSCaH1BF40iHylh7r9OkM0UziF4N
 MZ4ijKyc0/xg/6/JVxRop1VuLGtMyzT1/VvdPLMY5kbuvweuS9ok8q9CDMl+H0bk3Ug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="P/ikNc8B"; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1B64808D9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:09:04 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A243A5FFAF;
 Tue, 27 Oct 2026 23:08:56 +0100 (CET)
To: buildroot@buildroot.org
Cc: Lubomir Rintel <lkundrak@v3.sk>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 27 Oct 2026 23:08:41 +0100
Message-ID: <20261027220841.1349170-2-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027220841.1349170-1-ju.o@free.fr>
References: <20261027220841.1349170-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/olpc_xo1: explicitly select i386
 architecture
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are kept in their minimal
form as generated by "make savedefconfig", the defconfigs using the
i386 architecture now needs to explicitly select it.

This commit adds BR2_i386=y to olpc_xo1_defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/olpc_xo1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 41226d892c..ea7f3df0ef 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -1,3 +1,4 @@
+BR2_i386=y
 BR2_x86_geode=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
