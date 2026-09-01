Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B93CC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 18:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223A6607B1;
	Tue,  1 Sep 2026 18:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5R-6X1U5Kx3i; Tue,  1 Sep 2026 18:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788286660;
	bh=5u1b74uY0Rts9iK0Og9HLHF1oU6+ILmmsZYKXRlkCk4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l5exa4yokgntsvB3v4p4QHhuM8vGmxjmmgiUe85vHJclGCJ3DTOToh2Z+lcHTXm2Q
	 i+17U+CXehe9pxCtAX+9TQ6e+o5f9D+B7vu9Lf5g0saDA0cL68itSAqh2xBx99h9tB
	 EH0YqioHuROkVlHZUdMi9dy9ena+b0/dNQ++K5NZrBdJ4QETLjwba22lEntrpAAp6+
	 DPLja//nLDyw5wUbJI6zbvO5HLVmpL4JD4tsm5zSKqgfR416P8LqUfu/HvJbXkb0Vo
	 hIadcwnOFquHQOOJO/3TgU4VcOZDaR7cfHtUd0logPBlyOyLmxgzeY0Um9KELSNabk
	 vfZrUuUgs0JfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD4D607B8;
	Tue,  1 Sep 2026 18:17:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C71CF2FE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD64A40789
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QoVxVMxHI0M for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 282714076F
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11D5A93550; Tue,  1 Sep 2026 18:16:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:09:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 798741f4dc8da3baed0c7947d459d9d4223d90d4
X-Git-Newrev: 1a87a2669d9dac045f1c088bf6acaf4e46e53b38
X-Patchwork-Hint: ignore
Message-Id: <20260901181639.11D5A93550@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/xilinx: add Linux
 6.18.40 hash
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1a87a2669d9dac045f1c088bf6acaf4e46e53b38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add the hash for the Xilinx Linux 6.18.40 release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash  | 1 +
 board/xilinx/linux_6.18.40/patches/linux/linux.hash                | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/linux_6.18.40/patches/linux/linux.hash b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
new file mode 100644
index 0000000000..f0b8984573
--- /dev/null
+++ b/board/xilinx/linux_6.18.40/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  bdb5c40d7b43f8a1ea6ee34e2392a389935120b11cf54c36ad3ccff937b1a179  xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
