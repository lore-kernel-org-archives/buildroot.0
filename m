Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D422CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B771614FA;
	Mon,  4 May 2026 14:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrIkzhgT3Zs0; Mon,  4 May 2026 14:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23CA6152B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906019;
	bh=tSejrIydwWxbS1dgsoJAvkv/8SbTlq9F1W88D3xqvwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QHN3HOrEEcRqo9hV6O/Y069odI7oHflorWbT/NBdDjZcAD9tuXJsSpD42dfpLKpff
	 gmQv2dxfrCbJg6TNCkdFqdnajOVyu1w/CqFEf15SaSbL0belpY0ysbHgCjr8RIV9FP
	 3TE4U2yymBhsAybbdTi4XuOU+PAm/l5zqx1fUKDST0Vvhyap/wTNCXP83p5T+3Adus
	 3hTg8MLeBs41czWZy/Brpss1JNqaZszkkAPYg7DRrVr8nhyfoH6ET6W7r0GPrRNUhl
	 jSqJOSia8LjL8IgFskYf2JJ1dzAwlptKf5XbC+4xyuliAlZ7gfiyNjHKf08NJ/O4aq
	 nzVXCKEtEumrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C23CA6152B;
	Mon,  4 May 2026 14:46:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3A325D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA24A61376
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERdmbbcaqNZp for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F7D61355
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61F7D61355
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4731E84285; Mon,  4 May 2026 14:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:11:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 88f383a0989dc77e31f111a855a3dbd3734d6f41
X-Git-Newrev: bb46c259f480dd68ec4ebc06714ed539dcf27b02
X-Patchwork-Hint: ignore
Message-Id: <20260504144644.4731E84285@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sudo: bump
 version to 1.9.17p2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb46c259f480dd68ec4ebc06714ed539dcf27b02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/sudo-project/sudo/blob/v1.9.17p2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d96eb2f7daf51d96602b1076ed8399e3781569e8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 3bbce74cbc..340d155346 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
+sha256  4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb  sudo-1.9.17p2.tar.gz
 # Locally calculated
 sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0aacd8207d..8602e62b0b 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUDO_VERSION_MAJOR = 1.9.17
-SUDO_VERSION_MINOR = p1
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
