Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90131D1039D
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 564BC606CB;
	Wed, 26 Nov 2025 10:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQ70BomtlV1O; Wed, 26 Nov 2025 10:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7097160673
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7097160673;
	Wed, 26 Nov 2025 10:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E264359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3099B60718
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBmv1NRw4Gn5 for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F81960673
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F81960673
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C86185F7C; Wed, 26 Nov 2025 10:47:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 11:37:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c8ce4fc7cf4998480852d62ffaf19359591fde27
X-Git-Newrev: 9c1dfb619994a05a620649c42a5ac39d7848c1e7
X-Patchwork-Hint: ignore
Message-Id: <20251126104748.6C86185F7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-embeddedsw: add
 xilinx_v2025.2 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c1dfb619994a05a620649c42a5ac39d7848c1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for xilinx_v2025.2 version, so that example defconfigs can be
bumped to the latest version individually.

Since the license.txt changes with each release, move the hashes to version
specific directories instead of having a generic hash file.

xilinx_v2025.1 hash is moved to boot/xilinx-embeddedsw/xilinx_v2025.1
xilinx_v2025.2 hash is added to boot/xilinx-embeddedsw/xilinx_v2025.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/xilinx-embeddedsw/{ => xilinx_v2025.1}/xilinx-embeddedsw.hash | 0
 boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash       | 5 +++++
 2 files changed, 5 insertions(+)

diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
similarity index 100%
rename from boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
rename to boot/xilinx-embeddedsw/xilinx_v2025.1/xilinx-embeddedsw.hash
diff --git a/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..77b4c2467c
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx_v2025.2/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  fb9a705a2974fa4d8d79142baea204d388389b9b37d6f26194b7b759f8978457  xilinx-embeddedsw-xilinx_v2025.2.tar.gz
+
+# Locally calculated
+sha256  5ed583a37f9592d4bef73061f14f85c2ca70b8b7a12ffe1ef8ea808fbb764425  license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
