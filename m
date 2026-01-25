Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234ABD7237C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E597C82151;
	Sun, 25 Jan 2026 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2tpPJSWojog; Sun, 25 Jan 2026 21:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E729E8141F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377655;
	bh=PlWIFYghreBKdaDmYAR+AGTpsljFFjwKq6iOIv8LCAs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YLFdsam9UoI/4k8mbC4AGPpoiwUnfkDjT2GLhyY+Vzj3sgaRRC9fLx09pmunt6k6I
	 Ic5QKQ3aAhO0fhn9dw+g7az1q70ulPwUpI5T8AlAE4ZNXKTkF45B+jbopYwqc6ExoD
	 owLtNOrra24PCyAZu0v4lWck83sgRm5DmBDseQot3qH3yKotjEj4BcKTRKgEeMABO8
	 OfjBgPAjQRpUotZTm7k+yAkxWKBMSaZLTbV03AFexZnmVp1JSU1zuqcSoNqBGLEyxP
	 u2zC7sTygZkiBn1nfqlGNvLmCbmDmFCsD0vnUfY5hbHYgPMG8OtdKe9wQhczFdit0H
	 q4TQntY1h4YNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E729E8141F;
	Sun, 25 Jan 2026 21:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72BBC972
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EEC660A6E
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9z0euscYnmad for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1CA60883
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB1CA60883
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3874876F3; Sun, 25 Jan 2026 21:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 21:59:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2dcd7547c9dc4357e588cf5425ccd6242d91cf8
X-Git-Newrev: dcb1764e6f0cd00bf5346711598fd43fb48608c8
X-Patchwork-Hint: ignore
Message-Id: <20260125214727.C3874876F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/common/am6xx: exit post-build.sh
 on error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dcb1764e6f0cd00bf5346711598fd43fb48608c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/ti/common/am6xx/post-build.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/ti/common/am6xx/post-build.sh b/board/ti/common/am6xx/post-build.sh
index e3ff4d7f12..c32cfe25b2 100755
--- a/board/ti/common/am6xx/post-build.sh
+++ b/board/ti/common/am6xx/post-build.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+set -eu
 
 # genimage will need to find the extlinux.conf
 # in the binaries directory
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
