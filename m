Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AF606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 05:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X5Lh4miX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VlvCMD7Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06EC040820;
	Thu, 22 Oct 2026 05:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsJaT1YLqZby; Thu, 22 Oct 2026 05:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 941274057B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792645842;
	b=XGv58UODkPuDWWUWJz9URETwcDozTqzGml64YJFr2BqGUwPtF3g12vGnsFGoih4cXYPx
	 WjYMgasBEHhV8gxuzeLlD8pIPVIfHiAQ5IMEeT6fh7zbSbsIObMmOuor0sdMlVmCjRVvF
	 rpGfyYdmVStoGozFbwkZMzfPq5m3S+puiHINXS+/I3DKu66Z02Bxnka8bDHUaT3iOK+Dw
	 54/H8LfRZaLClN7AKrPVw0TqlAb9FNPBVF44MEUC000pA1uQu/gE1us5Sks91ogf+U+Jp
	 y3pshpn9nlonuz2S4YQ/3nGQsP0vSjDv0WXAogKjUwou7/8DfPGBU4RfXDiXqeQpKjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792645842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qlIladVEOmQLdoFhjnqy+Z5s4dT1JTNtojsnKAmeS68=;
	b=VMrP+XA3VG3cBVZiexEVs+uIZMF7qDVRj2IYlODYX+8kBlFyFINdkWoNUPh8Nu2RZW4c
	 cQ0iw1piCY6m0ix7AQISfNDDvio87b4xY2bHsGgHUIVLZRO2sio/febla8AzCL8PlLBD9
	 AluitqasiclicnIDqi4hI06X+uyLKF7+XV5rtciX+e1qpdtajX22viAgor3J8wP8PmyUo
	 LjBrVEu+a1ViQ6k2jIhpv4LLbH6QaGImMqnu0FN1QZbY+vj+jKpXrHZheGnmVgFaKta/y
	 urpPMQ+WQg1wavsJCPAcbc7FbgKGpiCacy6f5d2qBD8/66eAF2l7+Q/xSjsc4EG50Xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VlvCMD7Q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792645842;
	bh=qlIladVEOmQLdoFhjnqy+Z5s4dT1JTNtojsnKAmeS68=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X5Lh4miXFp+BDwB1ZirXbiwZwkcpDzjxUrKajzXajWzn0Fc+FZYTl/7AojOjVIv+o
	 rN7ge2uUB5v0NujU1/yki6WhMv1/WrhAsrG0Qgna6dM1bY/LCv/LBvvcSqW80Wq+6l
	 7EGO8B9ZBBysPBWCPBtg2G3EVjbkuYrWbdmKP4fzGpYEr9951lAFLf8uvScnDzL8lF
	 5TAiLtBFv5mvaG3sH38eOolrsSF9UpyW9e+rMeGLwF2O/NUmxW3rkjCW8JGdPJblTh
	 u6dm2o/oh2uGt3fvQ12e6WpymLjv7C7XCw/LQzwtOheVgTcYhrQz6H5a+OePCd3MKx
	 PvUWhNqcELdDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941274057B;
	Thu, 22 Oct 2026 05:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C20423A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A835C4057B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdHpLpGWtBzG for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 05:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5CAC64057A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792645839;
 b=f6EcHVyoL47tlSIHSYLrMG/7F31Gs32ICk6IACjoXQyudddIywMPRAdTQNnwstH7f1Tc
 OzDDf9WzjKsQnAOth3V5jgc1wXzESIk1uoH8MRjoDL3cDufeJUYFq5MDl0l6vi6eBRlaP
 Dt5WaUKS8A9ZRk7Z7Kh37JXFGgoQqh3Iu/gKc5bcBTMcmqRiQ80ZkDSbIm3jjJgBYKgAI
 Mr+ijt93oaO8oPTyF9YbH/X0XhKiZQBjc0nrq8MR0wL9LOlxGaHvKuU3iTFoBo/JJEjyI
 dYow4TPKkeffClO6B31p5A+pcyc8AeZgmKM6BaUs4rHzh8++yg550aRQQr1+wT57p6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792645839;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=feSkm20kt/YlG3A9T5OVSmyjKBanpArxFr09FEaRmS8=;
 b=fV2b12qffT+wBAMR4d6J/6kRExzUIx3eJf29q0q6rq85WLRU8A/6TbjSvjvGAc31C36u
 2tlB6v/3gVVdGoGYSdvyQHUEMOgkK6UBQ8XQZ4PjQljqHom+hTkFreM1r9D28JDsamR77
 NM8/NfaSDit15SMLd6FtvhccFul21rp8Y26m/9AHgnvng4cf2dkY1PrfjCbwNUtfO39r6
 88rJN8H5wJAY6m8M5pr/NAtXc3D38MLal08wqkmVqNFH/0SxWAFTsqiHGJMm9rx1jx25Z
 YQa2c3eZVrDzrwPhb4YjzGJp/5vYPrTOkbjz6/xzLgH5hMIoc53VN9AnWUNCduUwXkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VlvCMD7Q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VlvCMD7Q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CAC64057A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792645834;
 bh=feSkm20kt/YlG3A9T5OVSmyjKBanpArxFr09FEaRmS8=;
 h=From:To:Cc:Subject:Date:From;
 b=VlvCMD7Q81XpAL5CcoyoLQNekhex0oi002FiWGwHyq+GG2La8CJbSp+dR7PhoVa+i
 9hUX69oCIFF3P25ngd6h1hhruRUAZefoK9Md/0YDcpmwMZp/qaA0F/WSYjcxnK0vmI
 aye0zwQicBkppvdMgXdbdQd5vjnlqUu9SNb1KTVAT0eX/mKZkubGCS3/wMvGvTJ0sv
 lon6vdgb6YiXhg69rTFO2hi7l7nL4BLarInwaY7hvby/02hny+7AOouNGnZHl+eOeJ
 bnphFA9jrLyqJgTo+VupPzbVtfV3cz1u8MtK/q2Po1sI2x7s1S0LB+NVy2QaTgAAu5
 k9cI1pFu2IOoA==
X-KAS-Sym: v3:f51bdf72230551df:dvRQnSoirjFrkl+6nf2Ex4c+FN4SYVpYJefIsKxdAZm1C
 zyVaeMi5uXC8hYhH4FDu30JiWluh1m8ugqQ1a7hVHHjHvqD2JHo1IgVT7wIFRZfy1Rk6fRTRFqc
 XNij8e7YGl+LIzPLLupgQBygGOqTY0iJ17+Ng3amiV95FbIvqj9ZkeeTJdv8q4/SMmYskvKPjYE
 mPkqt7+BJG7z3tkp4VJCDxAN1TWAd1khSE2JSJiZH70kQMeUcdtMNCSWC2+Oni2nKmEX4jOtoy5
 UE0wVosLDTkG5nMET6eKAuVDHPL3/QgFwi7QePq4i8NKF0NZPCBgo5q5/7M1PYMwirtKFRXQ==:
 HY6D10Fq/Iv3yYRcviiiGcuCH/dQuCD3HB8ln7rDB6tlqSJ0DSEpXYpwHoHSA82JuoeBjjj7DBx
 hvclEoWeNxnq+q/PsTa6drkpfooWiV8FBmrMRPunvRYBHwwb1mC4b0VMicZXOguvoBbYB9/eZwz
 a5kGCvJfgtpDEwB3Ow+/a8houjsKGiQN7kgLuQyyQJAzfVydh/N6vGGgkbXhQyRw1XzbTa907qZ
 mHxjDhBzurmUt+fndDbRNJOXoixr7iPU6djnw3W5jVkzC81WsIbUgwAKh9a+0b/ckj+wdYSnAf4
 RqjUlOq+m01w8cSuXwPcLSQmUo4iykLJsQ7MyHqjmzlvC2EPY/TervRGJgA7OvWPV1hGQP/NrBe
 xjy8KqQcc5IRqll/MeD0hLXws4cVBqqRVkGQtWH+nbvDOXKOnjxmrzh53F5ebf7pm+wTf5umGNK
 /jTp+gGiteReozOGjaaooyojlahhGpyMCUFbCki8C17AdVp3RopP4lWiQHMOITpgZc4w8WYOkQZ
 MT1vKtQ47z0kdYJ2AZolrdlqslUVKoCQfbTLZJAvhUzOWbEXjN93CAjTmcv22rmusnjSYq4omPM
 edyWZq0VifXR7xqiwV8ph9SruQt/xRNwLxK7D9p64kT4Pkw8ZstD4ikpHUNlDXVvYM5wBYLJqLk
 yVAflsN4Bc4k=
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11D6BA4C5E40;
 Thu, 22 Oct 2026 07:10:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60196)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJl4T-0000000043G-1A2S;
 Thu, 22 Oct 2026 05:10:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 22 Oct 2026 07:10:31 +0200
Message-ID: <20261022051033.5024-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 1/3] package/llvm-project/libclc: fix build
 with llvm 23
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

Buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac bumped the
llvm packages from 22.1.8 to 23.1.0 causing configure errors with the
libclc package:

-- Check for working CLC compiler: /usr/bin/gcc
CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
  The CLC compiler

    /usr/bin/gcc

  is not able to compile a simple OpenCL test program.

  Output:

  gcc: error: unrecognized command-line option
  '--target=spirv64-unknown-unknown'

Update various configure options to switch to clang.

Fixes was inspired by Arch Linux:
https://gitlab.archlinux.org/archlinux/packaging/packages/libclc/-/commit/ca75c4b19c76ae856a368d070d914b12f71203a5#line_9b9baac1e_A56

'spirv64-unknown-unknown' is needed both for the host and target build,
see LibreELEC commit for a similar fix:
https://github.com/LibreELEC/LibreELEC.tv/commit/04c2de1c89b4946e822d1a977b918802ce4222e8

Fixes:
https://autobuild.buildroot.net/results/3fc/3fcdcb71be590b090df2f765c68aeaecc44dd215/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch description (Thomas)
    removed post install hooks, instead a fix for mesa was added to this
    series

 package/llvm-project/libclc/libclc.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index ff00871747..2f59ca3dec 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -36,13 +36,18 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
-	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
-	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
+	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \
 	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBCLC_TARGET=spirv64-unknown-unknown \
 	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
 
 HOST_LIBCLC_CONF_OPTS = \
-	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+	-DCMAKE_C_COMPILER_FORCED=ON \
+	-DCMAKE_CXX_COMPILER_FORCED=ON \
+	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DLIBCLC_TARGET=spirv64-unknown-unknown
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
