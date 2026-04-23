Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5CFED3EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336B142967;
	Fri, 24 Apr 2026 16:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4LxNaCcDyRz; Fri, 24 Apr 2026 16:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABDB42969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048734;
	bh=HzF8kjqoY4FcSDSRtMoCAiPRDnkXAtqAHiD8rnttQ+8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BZi/f7tPxVzU3x5nY4fal3Zh7NaTWUvuXPwwVRKdcbGkjzJ2eaVAuAhZuK+aVE/bK
	 TD+jAXawZTo6eS/ZxlLvvwXYUj0sQvkd6x8LhKx58gQ3yzFlCkPpaYGxzvOMZXgpiu
	 KPn+1+0/LF+I8FyjPyKky1LGGJZstwOTqhKmPyxe2ku7XB4wBnuaABi81UfY7HVqr9
	 hrVYN1aRGdfQxs0N8KeR4oMbfvp1KkBxRzImVYyRCVGJFqgXtoBqIg7sbFzLaFedwQ
	 rn0NhEqq6yi9vwWQb9Ln3LUzIFzQQ+RforEtjabpi1mSWFdZjKI7SZDO+7QjOHRPsf
	 3mnDiSONfoi0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABDB42969;
	Fri, 24 Apr 2026 16:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9847231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC5E40776
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGgenODcGqvA for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD53423EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFD53423EF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 880D282B2E; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:25:38 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 67692112f76e1e2f9296ebf3f5b62b608f8555a3
X-Git-Newrev: 7c9a398ebac9f5a50cc060c8cc582eb3c8746da3
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.880D282B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ghostscript: Fix
 brotli build failure on ARMv7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c9a398ebac9f5a50cc060c8cc582eb3c8746da3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
https://autobuild.buildroot.net/results/9e3/9e3435752d50ed3db55b0ff03e412bf42728f73a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2965d8af98ef9e881c8d76f076d44a9b68956674)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ghostscript/0002-brotli.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0002-brotli.patch
new file mode 100644
index 0000000000..55915cfef3
--- /dev/null
+++ b/package/ghostscript/0002-brotli.patch
@@ -0,0 +1,29 @@
+Fix brotli build failure in ghostscript 10.06.0 on ARMv7
+
+Downloaded from https://bugs.ghostscript.com/show_bug.cgi?id=708831
+
+Upstream: https://github.com/google/brotli/issues/1415
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/brotli/c/dec/decode.c b/brotli/c/dec/decode.c
+index f8d550cf4c..07da1fb44e 100644
+--- a/brotli/c/dec/decode.c
++++ b/brotli/c/dec/decode.c
+@@ -436,11 +436,12 @@ static BROTLI_INLINE void PreloadSymbol(int safe,
+                                         brotli_reg_t* value) {
+   if (safe) {
+     return;
++  } else {
++    BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
++    BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
++    *bits = BROTLI_HC_FAST_LOAD_BITS(table);
++    *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+   }
+-  BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
+-  BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
+-  *bits = BROTLI_HC_FAST_LOAD_BITS(table);
+-  *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+ }
+ 
+ /* Decodes the next Huffman code using data prepared by PreloadSymbol.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
