Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C0CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB72477BF;
	Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jFzcVqL9T6f; Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A0947999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010336;
	bh=oPtGUu90snabneoa1pq6Lo+TWE/64sswa40TNtJmXV4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MxdbsEfmwL2uEq8e40nzDLm2CVB2FzqOxNvrYC2terrBtvoyTjDCTBXKNfcLFRPOK
	 otX/JyBMXOHB+VedU1E4/AzTyaOxfMOXobltPLyqZoSg9itwfYmULgsKK1IzYppAnD
	 ckkAV/QWS5E8KbIr9mzzsfGV3Fljcy20UHYjY7A16PGY6gOH2LM5dBeCgvCMTzUwiA
	 yo4lFp0MWOcc2MKYeb8B0wgjZ3a2m+Xi9a7oWPt/0zeSXdni72yIZecMqjT5G8nijM
	 ZcOF0hKCczS5xSx6x+YH31Fab4njW+pkTqxoTMFqPoVYjhZGjUwKYqEsXxoWbqaKNB
	 FDdKPJd5XPFfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A0947999;
	Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51E97196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A8114598A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5FPFTh6VNtK for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A80BB44C77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80BB44C77
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3A5987E7E; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:45:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c58fb5f97b7cc6177c1ac675467f0ec43de44b8e
X-Git-Newrev: 35f52c7dc55898eaf063ff5782f3e17e8b228f99
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.E3A5987E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2026.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3715049670020780275=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3715049670020780275==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35f52c7dc55898eaf063ff5782f3e17e8b228f99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 2090d01692..2f7da1434f 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5f1ca733af596aebdec49c890b59e5406b4217e28da00e616b71706f7de98b87  qbee-agent-2026.10-go2.tar.gz
+sha256  de72c9754f46d63c3d6dd286e4fa967c4b592c2679b172ff8ce9e7e6ae13a4d4  qbee-agent-2026.19-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index c4f891b0fa..ccbf7cab40 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2026.10
+QBEE_AGENT_VERSION = 2026.19
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = cfeec991b97648aaecb894d4c9389ffde7711aa8
+QBEE_AGENT_COMMIT_ID = 99a0b5a56bb0ae2d7dec29abcf25d29be16f2c36
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============3715049670020780275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3715049670020780275==--
