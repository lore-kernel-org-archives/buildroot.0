Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C06606D810
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KTmcl8Rw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Fy/bK4Ua
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F1681187;
	Wed,  4 Nov 2026 22:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO-HvSRQb6Ds; Wed,  4 Nov 2026 22:28:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0731581137
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831320;
	b=U5yB8ZKOItaQEcqA3L3duBmqgLiGy9I5/lNiwCyt0GGfe1+j61fBBo+ltrLyYlbGTFYV
	 29udVa5ef9g6dcXlJURYbCitICta2CzEGkjkeA25c0z2YNs3qjkCIJVlmqjDzBY0nMz+X
	 ZzBBacC7EPCmYHRpLDMplLm5OIq375NJ8nq55vTbMa4ohItRncAp73m3jYVNQXcXnpfPL
	 FrdOUFlx7bmYmE7w2T7tJkWiD4tkCUxYSUxQ1A+EUPgcyeboMJGALhI5qjEJHpDB1lTo9
	 GgNokiq+/QCK+RvpteTUNDa4lQM7Of54B4WcBjeiiQ59/U/qu6d2ycAVBWCXMHkMYKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fffHOysArv6W4FCxwu6DP2eB//SSc/16TNqzAfS0Nec=;
	b=n/MSrwo4X8du7olnr22JuH9f2FGSRUDFk5S43IqFBtNuzGBMUmqn/aiWLDI2r6cWV7lR
	 yLKZ5FVPcedpJVu+mbuflerzzcZ5+Uvo99cPODCpQbtYgS+h1XtfzqxdI42OP13bFlDWA
	 jMG4EGm/GI6plYkCfVdFw2bV71GfSLBOp9+rP2OjTBk8FTerMBYoBz2tnHz8wEC44dgmZ
	 iR5KUrq2dkxdRZTdVqEXXvMfpekM3l2oPkXiLGbg5Ux76L6FXcMBeC5ElJ3g7aGANJ6rp
	 4q8ySSlY0OQ6z4lB2TER3/jTS2kBQXBma9kmbqyH3VwSF3aXBsQSp0uc7FWNj+B0QxQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831320;
	bh=fffHOysArv6W4FCxwu6DP2eB//SSc/16TNqzAfS0Nec=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KTmcl8RwV5D/hVlJhQh87bf2XuuV0BfTl/88o6uYF6Vpsjf7E8y170QNyQw5+J0WD
	 Za1M5daajKaGMMU5NnEUZdli1CHrQ/iGbayz8IqvGcdIvyadUCH406CihIvrwuUMdh
	 cLLWqerxSf62j27KglJ4KD9sZJW/UFwWFpoRqKAHSXt2m2GCJ55YCduBKK5lrY9mNB
	 qEaKjk+maKV31JNL6BscU1tWKAn4oA8/WfxAIBhRbtTD89IxwXEqEhgDK1lK6sgpEO
	 MkY3qsCI+uw1aHJBsRRjLsxUUnz7vTsT5ypCN5U7F7P+Yj2E7X/8OU4jgoJvVMH1X/
	 UF3adRVI6r+Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0731581137;
	Wed,  4 Nov 2026 22:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DC6D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E681F4085C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIOA9ILAwSZI for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:28:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E888340855
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Fy/bK4Ua
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E888340855
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793831313;
 bh=Z18grAu4bFO6V18tPW74Qd/POwUo0OAA3WVbWBdV0Dg=;
 h=From:To:Cc:Subject:Date:From;
 b=Fy/bK4UaR/4Jz9v/TNlFgkam+oWB69Gplv6UzeBqxNo7bDEdJaEkJ+PtPKCmw1duS
 IJf8xZ4zsSwC4wpv6QDEy81qO+bvMrjUjAm2GEBJdf/uO6mK+hISMS52jmZ2XkuqEm
 ys6EGYRtI07S04mlQhVzjE4ab0sj/Yl7BKvifwg+oXYurN2JCjpqn+3v7rLesOKJlU
 2IARjIcYxaYYmE0l8MFeb1Sv1ZrfEir/DtG693u6PiXClTkzRAM3xYlgsI+6IKK8QV
 Fa70VkI4ok7D5Ni+J/fVbZIAyRLojxV8YtVHpeIFuc3QCTM0Qls8qpLbu1nX8qSQJM
 P6kxbkIxm556g==
X-KAS-Sym: v3:f51bdf72230551df:NsgrzN4pnQATX6U2GdDHNf5KDGiTm1OCWmRfDUQHGubi2
 D/D5aDH9DRew9y8fCAQdCQaNj/OgUa/E9yPw3evzzW4JVmSQrMF6eZzkir9+bEMfeh3/j6wntBS
 KnzkeJYUUn4OByWjNXzK0lZlbAKg0ZZ5JX4f86rk3yHCoX3FzJcxfzW8mg+hZoMhoHGb432V9Xi
 JWoy11XVbOCFoZ7aoc7Rxx43na3VOS8UzPiNtZemHxMirXpHioxXKqd1gDSr+7e4MkrFPuJ1JJ9
 AgKH7BALFK8p1fADMjQwvDFk1jWoP2qkCoWmaQpbn6uQw6A9A9PffW8k7M4tX3ATr3ab3gRA==:
 /V/In+RKt074aRYJCcLCk1HBJdrDh1IBlD0CSN6oCPGUeC3OoXTE5LgRry/80urmU2u63j1SkAM
 3SS3mmp7kKj/O749QBPStM0E9YUJ+ocNd7QKUB6dt/bjjTPVIXtmxxnmblODusxcqcf8IOnqISG
 bsLsHlWzc/8bQySq+4U1JqtW9mE8pk4Apg5pB59kEn7I3rZzVKSEh52yG+WeQWKRaPx9YQmncGz
 y4FXc9UztZOaai+A0hJFA2LX+exImq77AXdoykvTRfH6L1XK1N7gTbzsQtSJQwHeoNcsDuYtVfJ
 5qJGnFAINHRcSfbHsz5pthrtVbdDFYE2eQidHuuzqyC54Va+CCZqFZ3GQ4dGw5ZgmYdSvRLJBGK
 bBSHiouEUHMnPC8sg33za0uwGPM23sc7BDtsHW6jdUdQF7PBNX5EVY/y+Ji5acbRqAoObHAKrbt
 /bLMMpgB76D+KthVadMSlqLcAIO9sKWnAroTlCiGCjR1cjHGMJHoX41YYGZJ2wvHwZ4WIe/8gjL
 66GdkbFl5P10imOk9xGBfpNcT5y8krrbJIl3hHC9AzrqiYwNYgwLZSCztiGlI+XSXKUr+1hAj+q
 81G8fxld3eyFJaiNjluMpQeCxK7I+i2dhiahHy1JdjzgcTGeQIUv9NSiGfhwoJi/roThJbCJqLO
 puw/m7DKL
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3986FA4C2B25;
 Wed,  4 Nov 2026 23:28:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43144)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xOjT7-000000008V7-0Ini;
 Wed, 04 Nov 2026 22:28:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed,  4 Nov 2026 23:28:32 +0100
Message-ID: <20261104222832.3296481-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.5
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

https://discourse.llvm.org/t/llvm-23-1-5-released/92716

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/04fd942c7fe9d7400c0a1cfda597d5ad6072674c

test_clang:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3029134533

test_mesa3d:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3029132822

 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 2327c20408..15d2885a2a 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.4
-sha256  819ecf7351f1a66f76b2d701d8942faaf5faeb324cb90c9d5b090de142434bb2  llvm-project-23.1.4.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.5
+sha256  fb50b1eac93ddeb3aa8dab4cfe324dff74f4a9c2bdee6160c9e36188f8d06a6e  llvm-project-23.1.5.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index f0020b4804..9f99c9077b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
