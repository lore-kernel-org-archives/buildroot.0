Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB29606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T+PRUZFP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=EqnmyWKf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291C380E63;
	Tue, 24 Nov 2026 17:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVBxB18XzGTP; Tue, 24 Nov 2026 17:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFCE980E6D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795541058;
	b=NIEMJKIXk2Ac2QHdOhNIuOz2UQyG82rmJr7gUMID67b1RIa9t6TNLynhzjB+KtHqXjRb
	 UFfO63NTb2FzDT84MD1bjPyLnd0PYROto/Ijq6XHF73cjKElVHa9sncQjTgs20sskRkOb
	 7H1UVLizqMonsH7HD+CkKkD5piVr6HJkrLRRSzkeRUAveWW5tGPRZfCLZA7V7ymLZnun7
	 4Yy7kANNTnWRd153vk7j6F4LQ2bneYIgnmDz8aA2mLsDikAYXZdH1FqXVmzrzi/P+uQBP
	 qg01SkxTch/PxW+3xYmpheZl0G17KaI0ExnTnH5Rv1HTNnCYz5EtUq1yqZAZG7k28ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795541058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=po7LpqzWt/kHsYD4PQ/LzrkeTqJyYF25G3B4ARkOqkQ=;
	b=pyM5aPTuOv1T6nixW7mMX79bOYMKCPNJ9E9aBb5scmXWWogKenOF3yG0X+/uDBrPSr3z
	 zZ21gEYiJbk+HTTDBfe9F2dwKiWtD/4T5GxGGR9yiGIzMQ3Eobo+XaAMwofsPTEc39VwD
	 Etej9HVOS+C3b09ucIss5MG7MHLqtZYDcSiMBgiXuFEiomDIojlTRs1dX8RRDuYWW/6SU
	 jTjqMhB4a5UvggQCuySvjfAZ180As5+QgixMy2nDNFfF1YvVwunWAAHRlZPT8llhy9E93
	 c0OTd97mhIYsdeaI+1BbOli+w1F17B8i93G1MvauRf+CTa3UlUYZL3uBdwoghHyRczQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795541058;
	bh=po7LpqzWt/kHsYD4PQ/LzrkeTqJyYF25G3B4ARkOqkQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T+PRUZFPcpBoaYk42q2j+hTc+/jSxxi8GOwwdkDI/yI5w4Xllw+UabAmnZh3gmaXU
	 VEdMd2LGn9/68s85k4kJAhf6MzG1hbbdaNYgYMwbroi1iIXZcBlCXDUTb6APLo5aHQ
	 UcXUPzE5xuLa9vhA6Jv4B4B4PFYWYb8Z4ANrF98zKgtASLH4Rgg/H/WHIP/NmlFTYq
	 Aumm/OdU+TFgeT4Kk7l9Xn7ZJfPlx25Cwfl1UuvUuasFXPt2zBcizchgSjL0M8GAQR
	 cd4Uv8+NJ0Lt74ycxZUfdOzrWHaPCaHeL1fZ1q5LPnP7FCnxH+zbTn3Zp1ElPvIPGw
	 be5EBkTazkA8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFCE980E6D;
	Tue, 24 Nov 2026 17:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 515201C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8B9405A1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3B_0rhxv1U90 for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF84D40597
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EqnmyWKf
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF84D40597
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:12 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VuFWxJwxPV5J9VuFWx2gKN; Tue, 24 Nov 2026 18:24:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795541050; bh=20+3g3edDfjbX9X8ePg4TRreqa3Rj2o6PT7Fb1DULdw=;
 h=From:To:Subject:Date:MIME-Version;
 b=EqnmyWKfq8X1GyC53i/cR/hUU2KSu8DEAltYGQxMRqKO7JpVXsaeXIxv94IqpzF07
 DspcEkThPeGmkd2WuC98T+suEgQKlF7liQEhnfOxqLCXnjM3LxtOmWw817MUdl17ap
 MVQX8yyO9nUjNuJhUK+gtLP9SC5/ibHZsGsUplpNZ7z792rBVxe9tGeXU96qYEshB3
 eBVldOoOH43fFfVFR+8Fb9x5KhldEkITX+tjE0A3gbxWFSmM28l4xMQvvJrRdJN9Vz
 7HoBr92wIu2nuerphaInS0JvVaL0CuQpsCTnd+3WlWxFJzIPXVAk+rTkEXldYRgAEe
 t65PcOY886lQg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 18:24:08 +0100
Message-ID: <20261124172409.1613791-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKenaRu2Vm/LYGYe7i8PN24ce3oFHe4yplp+hw6eqk2S1xx/noWnDOV3zxEWKy/4GVQKt7nvnRaTHaGxG9AiXyRm7gmNKSN6rpkU+DGjdFy3ZdJIu3nY
 5MaCwYJhfdol8GBP6+0QKCKVdwjvcxqM4PAllyyor78pKyxh9J8lGXgV/Z27o8R3q8Y5Tk/7c7sW/2AZKF105RIitn6SSvhdEHJPReGzlPfxG4FaZIjdnC7o
 d03qcqXxJuVjsUW1mgQdAhppkO1FcPPSPkYPys9ZnZlbfcooeE6KZpiRvgGDQc2K
Subject: [Buildroot] [PATCH 1/2] package/kvmtool: drop 32-bit arm support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream kvmtool dropped support for 32-bit arm with commit:
https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=329fe56
"Drop support for 32-bit arm"
that was pulled in with the bump to 1117dbc8ceb2 (commit
b393bff8c44be37f0b56bee61fdd1fef29f16e43), so building for arm now fails
with:

Makefile:224: *** This architecture (arm) is not supported in kvmtool.  Stop.

So let's drop BR2_arm and BR2_armeb from the supported architectures.

Fixes:
https://autobuild.buildroot.org/results/c6c/c6c10d55e603831c520e7e21f4c404b095158e41/

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/kvmtool/Config.in | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/kvmtool/Config.in b/package/kvmtool/Config.in
index 35225e0150..e978cce559 100644
--- a/package/kvmtool/Config.in
+++ b/package/kvmtool/Config.in
@@ -5,13 +5,12 @@ config BR2_PACKAGE_KVMTOOL
 	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	# Only mips big-endian seems to be supported (build breaks)
 	# Should work on powerpc64 but the build breaks with missing types
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_mips || BR2_x86_64 || BR2_riscv
+	depends on BR2_aarch64 || BR2_i386 || BR2_mips || BR2_x86_64 || \
+		BR2_riscv
 	# libfdt is only required for DT architectures...
 	# ...but it's not able to build for static targets
-	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_arm || \
-		BR2_armeb || BR2_riscv))
-	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_riscv
+	depends on !(BR2_STATIC_LIBS && (BR2_aarch64 || BR2_riscv))
+	select BR2_PACKAGE_DTC if BR2_aarch64 || BR2_riscv
 	help
 	  kvmtool is a lightweight tool for hosting KVM guests.
 	  As a pure virtualization tool it only supports guests using
@@ -27,6 +26,6 @@ comment "kvmtool needs a glibc or musl toolchain"
 
 comment "kvmtool needs a glibc or musl toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb
+	depends on BR2_aarch64
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		BR2_STATIC_LIBS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
