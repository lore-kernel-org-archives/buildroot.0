Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DFFEDA1A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0160810B6;
	Tue, 17 Mar 2026 20:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8RmycblIs1X; Tue, 17 Mar 2026 20:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3985283E43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773777994;
	bh=AkImL/AJcUzhXOcVtVaKvtOEPTRgdaWBAqomYXccSJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Epl0D2PKEkKWKBztEN6HgeE9miKvJFwB6ZsYmq+i4qvFBHhXnRmb6UMHj8BAz0QaK
	 OJPC+5toVX2kSKFHVE5snv3g4QF5EkXvKWAhInuBzSF3IyX3widgBDyrf8snQLnvCh
	 1uIGhx4Gz0l80u8MDK8RSA9yxd0tRQoNUDxllhPAnCDyAKpIe1vhvOPfbS2cqsmhyr
	 JFq7ELnPEtTxi96YN5vHxcdwtOr9HzlntnZfW12mcdQf6wsHjZGK7nRPiRkbcHyzDS
	 Yo2nArK0Ho9JQggAYzGpD2Vo5Chb7wJncUBjO5gen4R8H7QW+nYqJaNbxknkoKjKM4
	 Wlwya+jnH5DOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3985283E43;
	Tue, 17 Mar 2026 20:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16FFD1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1432041560
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GSERboO1SSH for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 20:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EACB41553
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EACB41553
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 20:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80FF487563; Tue, 17 Mar 2026 20:06:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Mar 2026 21:06:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 91f60590fdacb13faeeee7dd50d089cf84bbe5a3
X-Git-Newrev: ffbffaea9f3fa08a5bdbad772441ee8e0e506401
X-Patchwork-Hint: ignore
Message-Id: <20260317200631.80FF487563@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] Makefile: update for
 2025.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffbffaea9f3fa08a5bdbad772441ee8e0e506401
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5769cf5e0e..16ce114a53 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11.2
+export BR2_VERSION := 2025.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1771574700
+BR2_VERSION_EPOCH = 1773778000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
