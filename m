Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D85E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C93861296;
	Wed,  4 Feb 2026 17:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmM2kQkkFMxg; Wed,  4 Feb 2026 17:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE0A61291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224945;
	bh=Ki91aFUvm6AjrIHUDcWDZWGAVKsgC+Sgw85DkFqU4+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IcBeIDZzRiXUtEYued+0mx4BJpZw1IqXv/hZQC1n8X5UyzFWNYU3vEyLwVxyZw3dS
	 InatXJyXuHy1OopL/FEOtGuL5JprjE4Kx115h4jmCWA0vGd19XIXOyiwuoDeOOd7+o
	 XzaIDI5GEQ5KhnuETLOHFYyNuDl3Ko019m7V6KdChv3ALD09n7CXuu1Qp2k9H9Th/M
	 ba8REZtkVrRoRXMXm4P4uvT/SfjAvriYvcB6G6G9m8UHfAGmkkCQC7NODYEfS/YWD4
	 ducBNjIgz8ax1F/O+yTddkXyJCHddw4Gi+Lzg6hCDi01gtj3ZMZs0TFDfN0aib4BM3
	 qXITWpaNACzlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE0A61291;
	Wed,  4 Feb 2026 17:09:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB119173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5024D4056A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWDbqkoGDaRb for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5F54056D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D5F54056D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0243286977; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:34:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6ab145e751c895a443d6b5b21a4aeef4f367619b
X-Git-Newrev: bbd26eab5db0483ffe6ee87d48f8ee89c6cb9ac2
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.0243286977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 board/beagleboard/beaglebone: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbd26eab5db0483ffe6ee87d48f8ee89c6cb9ac2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c22dc1b819b3428eb0313afc5216bd69575c1021)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/beagleboard/beaglebone/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
index dc84d26eca..dcb923356d 100755
--- a/board/beagleboard/beaglebone/post-build.sh
+++ b/board/beagleboard/beaglebone/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
