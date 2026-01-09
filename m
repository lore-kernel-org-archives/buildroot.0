Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E2CD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E54583F5A;
	Tue, 13 Jan 2026 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1Ofkj8tktbr; Tue, 13 Jan 2026 19:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37BFC83F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333293;
	bh=sezHni9V49pabqt5UjIiTjQCOkAhIvLyHlQdeucrJTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ftrJR3lHoloW4LBcVg/+XDZr34nUxefoAqB6LolqzfJLMfqj86R3pRweky4IVOGS7
	 XGPRjbxk92c1rlR08LHN09xeOaOUU4VJtaU8yklTXvvdXNjZkzxxQIUAIvnDuAR51c
	 NBG23apdWyad1nofZSJeHpop0Q790nF3xd62yBhnmFDaYNINcBabSAJYl2LhU/Q0F+
	 mda252DAwrWJdgqs7jPoAy1GixOnhLtTQ13U3x2hlmkuMr5H7F6YRNE/ODVTv1fjjW
	 qjqITXZS1+JYffGJvXAeG4LuBPHjYkLKkBhziusL6zB8tAq9cKNfvPlk77lcGZoe6u
	 l4HgFGX3A2nVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37BFC83F2E;
	Tue, 13 Jan 2026 19:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C451C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CBF8338B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T23jQ7GyAti for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94174830E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94174830E6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9128287684; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:15 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 68ed68d578bb69bea325fce611f6cfcdbecf98d5
X-Git-Newrev: 6f1f23e55c429dab0ed2c779bd0d4a68ab30e25e
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.9128287684@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mender: ignore
 mender CVE because it doesn't affect the client package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f1f23e55c429dab0ed2c779bd0d4a68ab30e25e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

CVE-2024-46948 only affects the device management and update server part
of Mender, and not the client running on the devices

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f16475f3773dbb910356c1b9dbb8a663266a55b0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 770589390f..76dc28d547 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -8,6 +8,8 @@ MENDER_VERSION = 3.5.3
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
+# CVE-2024-46948 only affects mender-server
+MENDER_IGNORE_CVES = CVE-2024-46948
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
