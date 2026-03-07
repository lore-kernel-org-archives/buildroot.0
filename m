Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36AEF5510A
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FF241BB1;
	Sat,  7 Mar 2026 21:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkKpqijfXD7K; Sat,  7 Mar 2026 21:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D8541BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772920277;
	bh=ZsErCLSNxYXioaIPNOp8KL5ldX4XvXheVCCrCGzJ9lw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WzmZ48N+IqoFSIsVfkdMBL/oBkF9EtEw9/xBkWYNYjuaazG+L1yGnVVtCieCDRIXG
	 FWNmxGJRkdAnf1M+MKjZTAGGb8uBY+dFopJ7PVvifkkgm/vziG7XEQODo/FvbXma96
	 vs5A4X3zInB0ADQv8rP0rjPpXBw8UZRYHP1Wcx00CBrLmGiq+aj+J4PoCRd/48niSh
	 /u4TNh2kWlfmCEj2gs29P/9727T2psePxnV3rHWE0s823OYGxdKSzgWR2V5lVJdvcJ
	 hqfisqFtcla9m6EWrOScfWQkpJHpisx4VsQZiYknyJghoVIXr+i5+IpluwAADWIMIN
	 KbVfs0Jgtu8Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D8541BC4;
	Sat,  7 Mar 2026 21:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1790169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D767660F03
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxePckR1_wca for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC0360EE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AC0360EE8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EDD485388; Sat,  7 Mar 2026 21:51:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 22:45:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04120910b9964ed6ec1d4cf352a4c5ee6c48c8df
X-Git-Newrev: 60ac9e27704ae80a41217ee064b9b2bfb7b43e17
X-Patchwork-Hint: ignore
Message-Id: <20260307215115.2EDD485388@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2026.10
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
Content-Type: multipart/mixed; boundary="===============6765142948115974741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6765142948115974741==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60ac9e27704ae80a41217ee064b9b2bfb7b43e17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 53a1f1ac55..2090d01692 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  75e2fff2077cd13c6d42b2f42c2da5d04fce41408efd6b77caf1e13cee80073c  qbee-agent-2025.49-go2.tar.gz
+sha256  5f1ca733af596aebdec49c890b59e5406b4217e28da00e616b71706f7de98b87  qbee-agent-2026.10-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index f40dd40bf8..c4f891b0fa 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2025.49
+QBEE_AGENT_VERSION = 2026.10
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = 9493a57f7f4f2cb4c0db3dfd1812042b96479fc2
+QBEE_AGENT_COMMIT_ID = cfeec991b97648aaecb894d4c9389ffde7711aa8
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============6765142948115974741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6765142948115974741==--
