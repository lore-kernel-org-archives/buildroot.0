Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E2E9D418
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AAA610C8;
	Wed,  4 Feb 2026 17:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2v4Y2Y3jmbj; Wed,  4 Feb 2026 17:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8522610CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224815;
	bh=3bvs+YWyoePW1Oj7K87cFfcbZ4G4xXjEmryt+6fkngM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kGFGRJ/S1hPhCw+EbDwJSwJWkX38DYS9SzDYal8ToFe4SIBtcrcQZrZq7dVnOqSfS
	 aKuH9usySMTzL0qSoGpHgkLmnpnX+p50LDH+2bDoSKW1/5yxa90dv1VJMJk4ywE7aJ
	 26uvmTF3fGqTg7Xo8AZgJrk8pYKVV+0+byk2dk/ZMyaSoQBUnBZ46tWf0NAfw3bSTU
	 UyTt2MRQipqU8iz+RkHVSDfyKhBnc4aWl+3Q5X7O6p4pUioI26EXLJd6JEmRKkxwn1
	 c980sRuCthDblFBdB89/4KFKn/uRA5Ift1Ca2yHALnoiNfJ57cvCNJuZY7tnEhAnQH
	 Fu6wMD7O+MunQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8522610CF;
	Wed,  4 Feb 2026 17:06:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9531F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD374403E0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGrZFtows5pf for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D392740377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D392740377
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A591F86979; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a19f7f9ecb6388e1950eb2df6c7aa4dbba8e6c5d
X-Git-Newrev: dff1de6497cc187d8cef368f8a52fca5b5ae1976
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.A591F86979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/stmicroelectronics/stm32f746-disco: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dff1de6497cc187d8cef368f8a52fca5b5ae1976
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3eec14e664c475b6574d2858a3c63b7c6126e91e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/stmicroelectronics/stm32f746-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
index 03e9dcae82..74c59fdb72 100755
--- a/board/stmicroelectronics/stm32f746-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
