Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EF9C624D6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 18:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67C2407E0;
	Tue,  1 Sep 2026 18:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuxPF8Dn0DrO; Tue,  1 Sep 2026 18:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788286665;
	bh=YlKptC8w+T4a1h9yznqO8zgVYcHDoXVqoTGVC71rh1M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvE1AZHxaECxjo0uyD/mY0uLCMl41H9zERn9+aq7A4x02K9nMq+baz8MHC+kU/ku1
	 +vSH2XHyb+VOoOFZsOO6ZPy5hp74aPpb2HsOVRw8xLno0hBezpKQMlJGvGef8YjYY2
	 7b4/4OdSuXEGQ+DlXnPYIyXVBaA0dhZ5Pc0IbJOQ7dl//IF7KreJKZeUYsyVGD0lch
	 9yTc9ODsSuAvZ3S8wbQAB9XCRAzi5eMyKrwcrcUE0EF5qJeV8usMGYuk8Ywh3BUGg3
	 vlqH2tpmsSkXxhuUCK9CRjTMAHGRUl6+zyABEYdiob4oD19q6TmrWu8lA5+EhZxIRp
	 +k8ipILI42D7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DB2407E2;
	Tue,  1 Sep 2026 18:17:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 543B271E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A3280DCF
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvvoLoSbOvFH for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94D5480DF7
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78D7E93550; Tue,  1 Sep 2026 18:16:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:11:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6c3c5f8728ba9782fe11867723e0ec25b89c72f6
X-Git-Newrev: f92220f16b3b0c24cadae6f92a662d2ac22a879d
X-Patchwork-Hint: ignore
Message-Id: <20260901181639.78D7E93550@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx: remove
 xilinx_2026.1/linux.hash
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f92220f16b3b0c24cadae6f92a662d2ac22a879d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Now that all Xilinx boards have been bumped to Linux 6.18.40, remove the hash
for the xlnx_rebase_v6.18_LTS_2026.1 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash | 1 -
 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash               | 7 -------
 2 files changed, 8 deletions(-)

diff --git a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
deleted file mode 100644
index 6bfa4d2408..0000000000
--- a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  23c9cf18f5f419dfaafe5c3d3eda4812eb71bf1f2fbf3b35470478bbaa3d96bb  xlnx_rebase_v6.18_LTS_2026.1.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
