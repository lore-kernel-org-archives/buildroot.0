Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77209D5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF4B60792;
	Sat, 13 Dec 2025 17:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG-gG40Dqyjh; Sat, 13 Dec 2025 17:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3F16072C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646989;
	bh=XMVlxSdyarHI7rTL9c3TtxnqYgPOWAP5frmKmhN8OL8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XOqVPoPHHVefeVJ9eEMhufq3DCM/HALs9APabSNB5xcQey5nC5zdxpAZZq2aJN1Dz
	 MlYJqGbHmVnrAJFZ8xu3DOSUfWCTcyghFsGLc17QYz25aH2esEx1VHpQQMffnBdu1n
	 2RiBo1um7EeDCOxVUooazxe/ngqyaPma+AD6YfUjsXkVjdT2GBTukB5vkMU4dqdjG1
	 YNKZMb399ueKiXeIHKxAivezBjqbE0wNJWTGxWbd/GCUTGINNbpoJ3GryMJlj6AuCx
	 lzJ7ti26qphmjWI5hV9dfWH/Md+1wBVzYnqMIrYFC3Pk/+HEvUMtulbI6Ukzt4bszG
	 AVLtc9z1RYncw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3F16072C;
	Sat, 13 Dec 2025 17:29:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48AB713D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EACF80A00
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ugHfap45JfI for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794A6809CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 794A6809CC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:29:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6969E86D3E; Sat, 13 Dec 2025 17:29:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 18:25:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ec337489a399f65df66dbad11317e35e44ef30d
X-Git-Newrev: 13bbd4ff47b294fc03f4e966eb595718e9a87d23
X-Patchwork-Hint: ignore
Message-Id: <20251213172947.6969E86D3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2025.49
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
Content-Type: multipart/mixed; boundary="===============3362311668371650352=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3362311668371650352==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13bbd4ff47b294fc03f4e966eb595718e9a87d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 3c022b5167..53a1f1ac55 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38379b0869d013fbd225d3e092fa16751c414b8f412437c1c4c7f3af118fee4b  qbee-agent-2024.50-go2.tar.gz
+sha256  75e2fff2077cd13c6d42b2f42c2da5d04fce41408efd6b77caf1e13cee80073c  qbee-agent-2025.49-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index c5df59a663..f40dd40bf8 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2024.50
+QBEE_AGENT_VERSION = 2025.49
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = 4303465d155f0680968b57fdf4421971786356a4
+QBEE_AGENT_COMMIT_ID = 9493a57f7f4f2cb4c0db3dfd1812042b96479fc2
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============3362311668371650352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3362311668371650352==--
