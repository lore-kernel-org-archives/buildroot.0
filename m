Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583A1FED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CE584D74;
	Fri, 24 Apr 2026 16:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k8YvSz4ynjI; Fri, 24 Apr 2026 16:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1078684E16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047975;
	bh=S5IOaInA1vkxoHADiLM0mC9CstnMqc4ZzLDyzCNcTAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s6+q37KlNGKxLVKVu8eG0TrkWP4a9ftZt+pmmtIXJshkDUP682iC83OIN+Z+dpYP+
	 gMeFkgsO6fl8WV3jpREjby4Z/s+pBV+/lGkUFxWoUt4/99G7qAgn52vdnold3XxKyE
	 yG3xZSL7dzOcYjV04rO+YomcnhQVd7jrsF62BNAlgXssYsU1ECN+C1Wmnc2FAlULbP
	 l/z+xo/utoBndHi6t9u04Y2/bbwIfkkjR/5mWyqkwQaSkWyip73FvcGfARtcFVlFbc
	 YFuT1FiUIhfte5h6Jix3wMwbdcll7IHXePdnMhdgVARK3tNWzxoEgd80HOhdb94WD9
	 EJhnxSa4kKGZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1078684E16;
	Fri, 24 Apr 2026 16:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB67206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F3CF4295D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kkyj0v10CgJM for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53EAD428E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53EAD428E4
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B31982AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 136f41d0e908d2094fe7ad87fdf738a882e8b1a3
X-Git-Newrev: e0914c0ef7ad85b3f969788af8f0c49cf021c2b8
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.0B31982AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xz: patch
 CVE-2026-34743
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0914c0ef7ad85b3f969788af8f0c49cf021c2b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-34743:
    XZ Utils provide a general-purpose data-compression library plus
    command-line tools. Prior to version 5.8.3, if lzma_index_decoder()
    was used to decode an Index that contained no Records, the resulting
    lzma_index was left in a state where where a subsequent
    lzma_index_append() would allocate too little memory, and a buffer
    overflow would occur. This issue has been patched in version 5.8.3.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-34743
  - https://security-tracker.debian.org/tracker/CVE-2026-34743
  - https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87

(cherry picked from commit 724635227314010518372c5bad4d37d7c58950c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ix-a-buffer-overflow-in-lzma-index-append.patch | 62 ++++++++++++++++++++++
 package/xz/xz.mk                                   |  5 +-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
new file mode 100644
index 0000000000..034122d4f7
--- /dev/null
+++ b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
@@ -0,0 +1,62 @@
+From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Sun, 29 Mar 2026 19:11:21 +0300
+Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
+
+If lzma_index_decoder() was used to decode an Index that contained no
+Records, the resulting lzma_index had an invalid internal "prealloc"
+value. If lzma_index_append() was called on this lzma_index, too
+little memory would be allocated and a buffer overflow would occur.
+
+While this combination of the API functions is meant to work, in the
+real-world apps this call sequence is rare or might not exist at all.
+
+This bug is older than xz 5.0.0, so all stable releases are affected.
+
+Reported-by: GitHub user christos-spearbit
+CVE: CVE-2026-34743
+Upstream: https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 6add6a683..c4aadb9b0 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
+ 	if (records > PREALLOC_MAX)
+ 		records = PREALLOC_MAX;
+ 
++	// If index_decoder.c calls us with records == 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records == 0, use the default value
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
++	// didn't have this check and could set i->prealloc = 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records == 0)
++		records = INDEX_GROUP_SIZE;
++
+ 	i->prealloc = (size_t)(records);
+ 	return;
+ }
+@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g = lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 60c2df70ee..205ab928a7 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -22,7 +22,10 @@ HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
 # 0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
 # 0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
 # 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
-XZ_IGNORE_CVES = CVE-2025-31115
+XZ_IGNORE_CVES += CVE-2025-31115
+
+# 0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
+XZ_IGNORE_CVES += CVE-2026-34743
 
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
