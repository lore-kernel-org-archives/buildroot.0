Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F0CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FF5607AE;
	Mon, 18 May 2026 20:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEteEZ4cG_6O; Mon, 18 May 2026 20:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C086079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779134476;
	bh=rjI8gE3J0sUM9aO15kf+8dlGBSXk18cNCxU4aPp5uVI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ItSbb4HfjXQ033ljBOC8ixBZch2pWVj8ih/nGahLpS+kI02r6lT1teEFddKN01D+b
	 VT0WczhxS01KHrzTty+EhyEjuwQPAjPvuaWcJNfTlNbV40l9b/AgQOYZg3u0k9ZP/O
	 RuHk27MI34a6xp4C/6Kh0CLSJjGe7DxLbCEeHWazey036cFTBv/ZkZlhBTA10Iz0tr
	 R5NRLnJc/p4hw+Yt/tYBb4KhUfaMGYk7fQ0z+J6NP1cENISDTK/sCnnBvOWNqQZRp1
	 z+SOUAfY+N1+/YfCp+4JNPElRV1KsxJde1L7uBkYBoMLn1/sLkDyF1++p+fdd1u6My
	 McJiKC7V47opw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C086079D;
	Mon, 18 May 2026 20:01:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C517282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DD824090B
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uH4Lg9qvC6LP for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C237F4077B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C237F4077B
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72299866EC; Mon, 18 May 2026 20:01:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:10:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 418ee5a2b6cce22bfa9560ca0289fce728a2bde0
X-Git-Newrev: 319eeda6fa83b5bd21b14dc795f407fc5495953d
X-Patchwork-Hint: ignore
Message-Id: <20260518200106.72299866EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{clang,
 llvm}: Move removal of opt-viewer to the correct package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/319eeda6fa83b5bd21b14dc795f407fc5495953d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The files are installed by llvm but deleted by clang, this causes a
mismatch in the packaging.

Remove the files from the correct package.

Cc: Daniel Lang <dalang@gmx.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/llvm-project/clang/clang.mk | 1 -
 package/llvm-project/llvm/llvm.mk   | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 116389449b..7eae54556c 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -84,7 +84,6 @@ CLANG_FILES_TO_REMOVE = \
 	/usr/libexec/c++-analyzer \
 	/usr/libexec/ccc-analyzer \
 	/usr/share/clang \
-	/usr/share/opt-viewer \
 	/usr/share/scan-build \
 	/usr/share/scan-view \
 	/usr/share/man/man1/scan-build.1 \
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 577128bb1e..fb59aa64e8 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -316,7 +316,9 @@ endif
 
 # By default llvm-tblgen is built and installed on the target but it is
 # not necessary. Also erase LLVMHello.so from /usr/lib
+# opt-viewer is not necessary either, remove that too
 define LLVM_DELETE_LLVM_TBLGEN_TARGET
+	rm -rf $(TARGET_DIR)/usr/share/opt-viewer
 	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen $(TARGET_DIR)/usr/lib/LLVMHello.so
 endef
 LLVM_POST_INSTALL_TARGET_HOOKS = LLVM_DELETE_LLVM_TBLGEN_TARGET
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
