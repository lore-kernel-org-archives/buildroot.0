Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8874ECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5796B85024;
	Sat, 30 May 2026 21:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO9JfJeJZVBM; Sat, 30 May 2026 21:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3458501D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780177573;
	bh=txF2G7r1q34q8D7m+G9DQI0Kscpcw68IwvOFJXg8Xyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=obmz8aa8vEZoTze6uIEucMROME6d0NXAEaYGOKKxqjzIzyDMJhGrwB1tmTdRqPIpm
	 smcde8dlpSjYoIslpCNSgA3kKMPLTJnCuiBJi6HvdQzqo9uGJb348jkjW0ejUAY1KE
	 zX9MshrXToW+I6k6ofd3kuRego3YGU1k3M4rtbkNsERpFVp/dXoGsWHUxLuSVDajrz
	 4jdmghMsDBfLvPJHu8AxNjoyaoyzvW4En/M2who7zAoVqgihKbP/Lb/+zQB42qkcL/
	 NxqtTsr2Aj9GHbyxTV7dBdT/5GpdkKRQ2x5B+3W4fn9bh/KZd0jcyBkLNBJj/8OTAr
	 F+Pa6VAyg0RZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3458501D;
	Sat, 30 May 2026 21:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D0EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08F6A8501C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFeeydxK484Y for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5368385014
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5368385014
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:46:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 167838762A; Sat, 30 May 2026 21:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:45:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c58fb5f97b7cc6177c1ac675467f0ec43de44b8e
X-Git-Newrev: 35f52c7dc55898eaf063ff5782f3e17e8b228f99
X-Patchwork-Hint: ignore
Message-Id: <20260530214558.167838762A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qbee-agent: bump
 version to 2026.19
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
Content-Type: multipart/mixed; boundary="===============6186499126290286747=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6186499126290286747==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35f52c7dc55898eaf063ff5782f3e17e8b228f99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
 

--===============6186499126290286747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6186499126290286747==--
