Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17033606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G6HiNM2d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE36D811DD;
	Fri, 23 Oct 2026 11:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id by020F4DA77b; Fri, 23 Oct 2026 11:05:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 06CA38119B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792753525;
	b=RmZFFZBw/1tt0N5w6/yxiMPQPeCz8lRxd/22g4eLXU+gkiHVZfEey6uTLlaWg39Tx+1Z
	 sFY0IThnyA5pjHJEVU9rH4CQlBuZvDMWRYPtPPX/sRTYNCQ2kmtV1W8dPVJPQrJiPMGIF
	 w/e4GBS+vM2T75T/9WruVjhl59S8vNKi//0RUQ0Lcl5mMw5EdDBDXsQOt7liUjdJ69For
	 ut5ZyqsMK6CzkLP4LRgab/1agFQhnblC1Gw7o/+UN1dChclzLZBav0hC/2GquBreSJRse
	 yhBNRK4btz4wNe2oV/06P54wbSLgFUR1eNMkKUO5pMYbjvoI63SN+8QIZoXvHicsjUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792753525;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nyq0ksVodbkvsWUX4Ruy/QzCzF3jIU80wjI4XG/O/DA=;
	b=IhCCjBi8dedrl3HjvJj9DGpc3nPOyfkd0S4XbiXDSkfjsj4D5h8sDarxQCclWuEbSn5v
	 lyaRn4aK+mYFo06GMNT7BVYU9wnO+ExcprOZvHDjfbupT901zsRRPDqml196CO7NTpjWH
	 DyLhbGa8xA/k6kKAPT6ovqZxEZ0c/pJBZSV2v5fthkEYtjX5qkpsZSl2kHS5a5i8GL5sn
	 NKSwqTKyAK656wK7P5RdKjKWDijRGhRExltuauHKfBACJlliWYWVROz4TqR5H7FG37LVc
	 cVNwT1c4vLLc+1nSrwRFZ6B8lF5U9bUcsA8+iKi5iQm7hLXN9eX/m30fadtI0FWlaYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792753525;
	bh=Nyq0ksVodbkvsWUX4Ruy/QzCzF3jIU80wjI4XG/O/DA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G6HiNM2dPZuscOshrdCHjqV/6BKqzxuYrPcNwaVYQkYYQIW/UYWkcxHmvbpvJpDeF
	 uqSflm/DbGGuCzqUbbkxxUUDn0c0a/C2Je+CpfPeMUc7/nlNcTX7CpjAtSRKC+R5BB
	 Ww/ctwZ5ANHxjbPD/yKWVAv7YU27v0Q74eDpIvksLTGgCqk1215LvLK+sH+gLz9ugb
	 iZ3Xr3mhOUvwTuh+t46NwFQCJQlpQtTiBOVWw6QRMVBddpasLKBMcZM0jClsll36sF
	 FJDfvBqJyyb9hK7K7XzKamHB0x6g60XHOrYenVg9KcauZhY6PfnQaL/UTI/0KBza9J
	 3kL8cTYPGEHhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06CA38119B;
	Fri, 23 Oct 2026 11:05:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB6D3AF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84EA1400D7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcGX9pjbYx1I for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 663F74008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792753522;
 b=hPkw10gg28zXVY80mbbCFB4Q9rITS4NDy+ZFOA90fm1RHOicfVdsHYaKHpaA08XJ2wGF
 riz9uNfRLBgBPVMfdI9Cp+bjqdrgHUwXUDIA+Z1BK2aidRuppCEpvYhkllIDqGuAqzZ91
 bEivgPGF90j9vc2pg4B6uM505yzfBEV2QtITUA9gD9jimPGPmyzixZWvAnjqWtR3lyQ+2
 e9cd61lszm1kTYvG5EhEBPYZkT3lIek2riGy7QxbY1cvSxykZeW2aLgRCPbRGrxfb3VVQ
 9SeQmChppPbjJIfDWuF69gal7xdunMsTwOi5kTCPLtmeUKErlFI2fbSUE+HOl+oLuWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792753522;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ovRm2oTg7iAC9xCYPm7nXzuKebda1w8BZCXjPX+p2M8=;
 b=CPPycv3czcYI+le5jKWbwVSzNbXcq3hkK7jC5/V/t2rvP3s7wecksIUV1gQerFtmNQAZ
 xodvcP3MZmqtQ/Fn80Odukf+S+QKEeQq3kzZmR0B+MyUKh1VJm3ZJVSWZXB5l9cUyxQbI
 PgyrtUTb2KBX64PxQnGPcy1bccJzPRV2tkI9yvJEaBMdHiaaztZgCNtqURIjRkodfVU42
 xas1T7q1/x2jmILBZcZtt9BYhCoIrbSLHoMSh4fjX+DMrS2/GxwEYPMq50EoHQj3IpayE
 YNMK2xbJEm3fXvZKFL6XSqBR7c9BKxsil/bZIrQM41QSpVxz4Ow1aTebQaK4ty3eaXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 663F74008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D008A9C659; Fri, 23 Oct 2026 11:03:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:04:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92b2747f46673d69710f4f330adcf836c0d66294
X-Git-Newrev: 4da3fc570f2e28d89868d48f62179be9d02fd030
X-Patchwork-Hint: ignore
Message-Id: <20261023110357.D008A9C659@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/libclc: fix build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4da3fc570f2e28d89868d48f62179be9d02fd030
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
