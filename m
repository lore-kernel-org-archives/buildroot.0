Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACD5C5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D2980BDB;
	Mon, 10 Aug 2026 19:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyIJVNP-w8Qt; Mon, 10 Aug 2026 19:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABDC80F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786389805;
	bh=8wpYdqMllPkPXoPRHnMg5/SgIC38jAxEG6016z2sc2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SI4qU1lXWixwlvb/4Mc07OhGIuP3kiJ3nPNMi+W6iuV/DxUpcIAdMvkeRGpQ08tzo
	 FCGLDI0+CyiM+OkKVIMSnSRW3nEZiZ1V7bLaiN5iiKZMmlg1IZgHy6dSb1BunwbfP9
	 zISpXFdRJVyROYPsccVmR5fv7+c0V+oIbxONec/8JBkWeuIVTbJGjNoNr9UmQf5/i1
	 iVTP4+laFCbz1QxrTHTa+yL9993yDk2SXZVEiZOe3IPzFFMXTEfOdsdSD4R0jP1B09
	 615UAAN8MDTl5KHY4+7xkWbJ7Y/2UQPCUS4as5rOWEpF6LRiaB5HOVq3GbpTUkZMyP
	 U8fRDwiNyL91w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ABDC80F0D;
	Mon, 10 Aug 2026 19:23:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2909910E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2F34019A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSbYTlL91XCd for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 682C240175
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 682C240175
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 139DB8D313; Mon, 10 Aug 2026 19:22:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 21:15:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d372ec29a7d527237b4e638aeb6d3ff42f0bc5a
X-Git-Newrev: b4532b924aa3822d748f8977faf39605259dda9d
X-Patchwork-Hint: ignore
Message-Id: <20260810192235.139DB8D313@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: bump version to 2026.27
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
Content-Type: multipart/mixed; boundary="===============8528900969445214557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8528900969445214557==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4532b924aa3822d748f8977faf39605259dda9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qbee-agent/qbee-agent.hash | 2 +-
 package/qbee-agent/qbee-agent.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
index 2f7da1434f..02109f274a 100644
--- a/package/qbee-agent/qbee-agent.hash
+++ b/package/qbee-agent/qbee-agent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de72c9754f46d63c3d6dd286e4fa967c4b592c2679b172ff8ce9e7e6ae13a4d4  qbee-agent-2026.19-go2.tar.gz
+sha256  ade55d580115cb1c81b0e35766cbba2b3718f45e9b4262dd795f5c964bb2ca2b  qbee-agent-2026.27-go2.tar.gz
 sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
index ccbf7cab40..93c6f501a4 100644
--- a/package/qbee-agent/qbee-agent.mk
+++ b/package/qbee-agent/qbee-agent.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 # keep QBEE_AGENT_COMMIT_ID in sync when updating
-QBEE_AGENT_VERSION = 2026.19
+QBEE_AGENT_VERSION = 2026.27
 QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
 QBEE_AGENT_LICENSE = Apache-2.0
 QBEE_AGENT_LICENSE_FILES = LICENSE
 
-QBEE_AGENT_COMMIT_ID = 99a0b5a56bb0ae2d7dec29abcf25d29be16f2c36
+QBEE_AGENT_COMMIT_ID = 6710abd49906d00ba6c4e446f6436faab14fb5d9
 
 QBEE_AGENT_GOMOD = go.qbee.io/agent
 

--===============8528900969445214557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8528900969445214557==--
