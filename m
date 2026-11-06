Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0769D606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o4bxwGUn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B1881227;
	Fri,  6 Nov 2026 13:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuX0rSK4GqAc; Fri,  6 Nov 2026 13:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEBD48121E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793973282;
	b=LRrtvT6Q21Ay5Xr2EemmmoiWqr0NIu5pmJf9zEw04VZCXlQzdRWVGvcZyOyHFXT00cez
	 pRe49Hnnk21M/MsdX5oECEnbDyi/AmsUPgiHGbryNiT+H1OoI+1jyPwlwoljVYoR2lqVS
	 6RlJbsqrfSOXQRJZH0b/x1JPjsj4GRTMrw5JmnGnsJDMeZhq79MFwwkImzQXuGOAppw5T
	 Ru2D6d+1HCZpbbnR2J20aBgU+ZJxLEG9jSGxzth1soRWI+HooY/htdMge/46yvhzdHu1e
	 PzJWd1TPOsjEaCvdLAiGCTd+khBYCT9DaDFfTDFbFwT89wHaQpqzWGIFqTcIFEk3tgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793973282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F2jysbpc+AlopPPgyE/NMKeoukjSSyk6dhuNgZu9WCg=;
	b=bYS/bdZMC7Lc52MjvnSYT2j0y4LZ/ix4x932dE6QigTsDXJ4eQ66iIuZboVTywyNrGPM
	 23AbME/moZ/rNy1mzZ3kkXH7Kzxk4rp4C3WHQ0LeioyHlxyKID3g5Mr0DEULJyNtuBoDj
	 r6GtldOOnczaB1SANsewMvK502Y71+AjmyI1RyqwxPLxVa2fs7kAAsEDoo14li3d6+bxM
	 BnBuogHgB7nrAzIavt6hByRFPKCzHHlkZ1LHkZiuGOvqwuHL1faioW63g60zdye30B8Up
	 OXdoNL8cmw0Xjvjn9KLN7r/lMQ+AXDgL0O2H1LXuq46elydUn4Lp8TPjFngWcQKrNNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793973282;
	bh=F2jysbpc+AlopPPgyE/NMKeoukjSSyk6dhuNgZu9WCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=o4bxwGUn18bm40r2SVGDFhl0VLwmx3ppUPieUkr92DVS7PkaR6vrSdZBze7A508eA
	 fr60Gz8QQUEDFr6LZY6ZFC03m7LcVXoAVfO5tt+MOWz4aeZe2pFbhOhuPj2ZhB7fUz
	 MzOwogbhU1bpvEc7uxNOGcXJeSyczQSt0CINW59/Yk5vnWhIdtZCcboaq7bpB+DVaB
	 Y2VIl45/6J941TvDbYYXRULx+UTLlix8W8OHyi/30scLpDWl+MwmgfrI+BzSJo0mQG
	 N4xE2NbIZ7JuvuWlxMyt7VcJSh3rVYQyyT1H/TuaVuMoAqon7v5E1j8AUh5089EEVb
	 qkyaExwxHEQwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEBD48121E;
	Fri,  6 Nov 2026 13:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D94F362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED75400FF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgpIL2rINpie for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 13:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1533D400CD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1533D400CD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 13:54:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DC2E1814BF; Fri, 06 Nov 2026 14:54:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:54:15 +0100
Message-ID: <20261106135416.1844554-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/harfbuzz: fix race during compilation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[0] changed the order of generating the shader headers. This introduced
a race condition during build. Sometimes the headers are not in place
when the gpu objects are compiled.

This patch introduces a dependency on the headers in the meson build.

The issue landed in buildroot when the bump to Harfbuzz 14.0.0 happened

Fixes:
https://autobuild.buildroot.org/results/c6d/c6d2cd8550a63efab728135f3d5d4c5b022ebf7d//
Fixes: 2fb10c689c ("package/harfbuzz: bump version to 14.0.0")

[0] https://github.com/harfbuzz/harfbuzz/commit/b1ad797e501310bf020bb419d8ce5c8e56a0c346

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...ix-GPU-shader-header-generation-race.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/harfbuzz/0002-meson-fix-GPU-shader-header-generation-race.patch

diff --git a/package/harfbuzz/0002-meson-fix-GPU-shader-header-generation-race.patch b/package/harfbuzz/0002-meson-fix-GPU-shader-header-generation-race.patch
new file mode 100644
index 0000000000..0ad26069dc
--- /dev/null
+++ b/package/harfbuzz/0002-meson-fix-GPU-shader-header-generation-race.patch
@@ -0,0 +1,53 @@
+From: Michael Nosthoff <buildroot@heine.tech>
+Subject: [PATCH] meson: order GPU compilation after shader header generation
+
+The shader header custom targets are built by default, but their outputs
+are not included in the sources of libharfbuzz-gpu. This allows Ninja to
+compile the GPU sources concurrently with shader header generation.
+
+The generator also copies each generated header into the source directory.
+The GPU sources use quoted includes, which find these source-tree copies
+first. Since the copy truncates its destination before writing, a compiler
+running concurrently can read an empty header and report undeclared shader
+symbols.
+
+Collect the shader header targets and add them to the GPU library sources.
+Meson then orders compilation after those targets have completed, including
+their copies back into the source tree.
+
+Keep the existing build-by-default behavior unchanged.
+
+Fixes: b1ad797 ("[gpu] Commit stringized shader headers; auto-regenerate like ragel")
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Assisted-by: Copilot <223556219+Copilot@users.noreply.github.com>
+
+Upstream: https://github.com/harfbuzz/harfbuzz/pull/6590
+
+---
+ src/meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -851,8 +851,9 @@ hb_gpu_shader_sources = [
+ ]
+ 
+ hb_gpu_shader_helper = find_program('gen-gpu-shader-artifacts.py')
++hb_gpu_shader_headers = []
+ foreach p: hb_gpu_shader_sources
+-  custom_target('@0@'.format(p.get(1)),
++  hb_gpu_shader_headers += custom_target('@0@'.format(p.get(1)),
+     build_by_default: true,
+     input: p.get(0),
+     output: p.get(1),
+@@ -877,6 +878,7 @@ if not get_option('gpu').disabled()
+ 
+   libharfbuzz_gpu = library('harfbuzz-gpu',
+     hb_gpu_sources,
++    hb_gpu_shader_headers,
+     include_directories: incconfig,
+     dependencies: gpu_deps,
+     link_with: [libharfbuzz],
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
