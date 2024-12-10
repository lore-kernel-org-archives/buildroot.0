Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF5C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C2E4EF01;
	Fri, 28 Feb 2025 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcmsDBaFp1In; Fri, 28 Feb 2025 16:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A02CA4254D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A02CA4254D;
	Fri, 28 Feb 2025 16:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1985794F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C98424BA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBAsUE7FTRrH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711F0419DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 711F0419DB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54199844AB; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Dec 2024 22:02:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4b43fee63a26db65a60c93e2657b2a8d3df6c83
X-Git-Newrev: 5d800afa97273fb3f0f0d218871d83e35bee8dd5
X-Patchwork-Hint: ignore
Message-Id: <20250228162936.54199844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/versal/post-build.sh:
 link to board/zynqmp/post-build.sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d800afa97273fb3f0f0d218871d83e35bee8dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The board/versal/post-build.sh and board/zynqmp/post-build.sh files are
identical.  So this patch removes the board/versal/post-build.sh script and
replaces it with a link to the board/zynqmp/post-build.sh script.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal/post-build.sh | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
deleted file mode 100755
index faa75a0de3..0000000000
--- a/board/versal/post-build.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-CONSOLE="$2"
-ROOT="$3"
-
-mkdir -p "${BINARIES_DIR}"
-cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
-	label linux
-	  kernel /Image
-	  devicetree /system.dtb
-	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
-	__HEADER_EOF
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
new file mode 120000
index 0000000000..0130ff23d2
--- /dev/null
+++ b/board/versal/post-build.sh
@@ -0,0 +1 @@
+../zynqmp/post-build.sh
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
