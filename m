Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB0606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fFHBVo87
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A350380F27;
	Sun, 15 Nov 2026 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCWg7zsjVM9H; Sun, 15 Nov 2026 12:04:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E20DD80EEF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794744276;
	b=oYcWRT1z3i2UP2H3gU5L55adqXXnXvtQpd3uG0866e/b1RNNzBmN6rDJ7rmejRDc7qUd
	 GCubvuEj3rfsr7dqxvczYYV1HC/I4jGyQlTdxo/a2ZG3VPnGY2FNRiNI03XNYMbOCLvE4
	 iSHYuhL0O2WwPw/vkrPKOvTOABa2y9jdEssgLuCZ/l1vTmCkZJMWI4wl1DCBVbZ0w7a+p
	 a0VZNfhWxndOLw31E2ltm8+wluMwYJtBDcT0m5tTIZ8qEFpBG6OeOjIk0IggxDuZatGY0
	 YobIrMjP0F1OdwBxrPhrCrqgyDYaWd8V9VbAxZwc5faOtXkcp+nupjfaR9QZ5VfU2BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794744276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FdWTiLKuxfA7RPT2+MLrMEYGDbafTO75bI0GJi3NmeU=;
	b=CItN8ip4FsWFoPU2rjbb1wSv8/QxHNkSfC4CgvYpnD4qBDZGNoqgpceM/tMDj2X0vPIg
	 9eyvE5m/ky5TB6+FSysqlHwp5xsc2mSivJY6mPb6OljmAcpdpw31CjhhW9Ospvt8S458n
	 chds/gysczRl2ginoN6u54gP1hG7a5aEMM7z1baKuzAVvc/c9EU03LqAmAFjpoVDX5cR0
	 aaMdm4wVtiG/zAwaUh6J5dDNV3QBGXQA5kwHlRAwBC5jlIxU+dRw9ymePy+aiWoDHZJF6
	 IMwwxu71ESg97/5HbaUfVPetmvP22zbxVIZzdXj/jzlxvgUZ/bKDAxNDZHANKCwg3Yg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794744276;
	bh=FdWTiLKuxfA7RPT2+MLrMEYGDbafTO75bI0GJi3NmeU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fFHBVo87SSxFx6jH2Y8X5S4nVKSLuYHRH8ewlDXpEzyWFUdA+7Xwmt4x3MwZPfmiq
	 jeVhffum5rlPR9Po2nA1S/YF94NbPhI0Nllfam7RArrbL9Fo+8RJTGYFnudtehAsP0
	 dveOYT9hpv7Z34FVjUQkn+sKXqzNcCA2y5y34AbNMAjek0S96EXYh2VeIqo0GPKaw8
	 ZgjbPmuwurlwJ9PbZujM/xd0gHPeUhfIIF8PvrWfuPo9sIivu9D/YR1q2qmhlF+VvU
	 lWHEqZ6dqCNtjrbJ9sq79SYx1qYiC2+3NvL/jWK2noYwXq0eiNRuuLxs5GDWY7oaNc
	 5/ENHpmMgx6Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20DD80EEF;
	Sun, 15 Nov 2026 12:04:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E82F2109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C85E980EEF
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtbVwMosctvg for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 12:04:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9323980EE7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9323980EE7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:04:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B45515FFBA;
 Sun, 15 Nov 2026 13:04:28 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 15 Nov 2026 13:04:23 +0100
Message-ID: <20261115120424.1235918-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: test_grub: fix test by
 selecting BR2_i386=y
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
to Arm AArch64. The test configurations which were relying on the
default i386 architecture are now failing.

This commit fixes the issue by adding BR2_i386=y to the test
configuration.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158060

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_grub.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 8f081f927b..92350d60f9 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -6,6 +6,7 @@ import infra.basetest
 class TestGrubi386BIOS(infra.basetest.BRTest):
     config = \
         """
+        BR2_i386=y
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE=y
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
