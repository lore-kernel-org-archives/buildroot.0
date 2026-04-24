Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F397FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C81D84DEB;
	Fri, 24 Apr 2026 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEFgw6AAZIUn; Fri, 24 Apr 2026 16:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2671784DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047964;
	bh=zNBosxkCxjY/y19N0LVuu7r+WkPDuqRtRjew+hoAcDs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ksQwZzr3iKWjorBatay2tAeIk6iULT7N46y/BhjJuWaFYQAkWzuFD5WFB9FM28rKp
	 Cj6g0rXtCF7Xdr1TIr6JfgNuwXIsJmkJH/sN2N4j1oa+kRs/FwORsrYZV9ENg/0lAc
	 mkPh7iOEblPYL033+F2JkIoOkwOLijkMVlwnuJrI9z2Ild56CA+yIrfO0Xl4g43fY/
	 kPq4UzcvLbzIB1Hmw4npG8vm2yiaZSLpdby+p0xMkmBFJxwzO05VzSPEIU9fKR4IyL
	 fesQkwHsgxN5W/aV5iMErub/1JAQT1Xgee+6JfFgGFFSW2N3tTZUM7Xi3T4SWDBCuM
	 AltSydRlLQgFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2671784DD8;
	Fri, 24 Apr 2026 16:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0D224D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44EC428ED
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUsRtGqJ2AuU for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D10794295C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D10794295C
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87F1182AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8ecf930abf9bab3dff8d0fddf44f59a398fd923f
X-Git-Newrev: cbe45c6848a042af7f84ca2a42008326daf43ad8
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.87F1182AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ghostscript: Fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbe45c6848a042af7f84ca2a42008326daf43ad8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
