Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB19D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E452941146;
	Thu, 11 Dec 2025 19:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWs9WsbF-Yi9; Thu, 11 Dec 2025 19:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 145EA41138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481408;
	bh=RjPxrxm2CRK4aA7kmOKMkdL8BhXO+ETWosnjbrowQfg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L4A/Zx9g26sJwz5ojX+vlwurNlCyx3DZkexn3M1yMhF+cCp9YyGPJZxIyTxCBXSQ4
	 zUWxInQn+9xK8rBWDYeUsFqzF0sG3x8di7d0ZUnH/hlkETZLYhEL50S2DZ16EEx8cB
	 lIVUH9XiEgnuUb3uFIoTU0QNvFyqFlj5gaBhauGu3FPASGV7INJmrmXKNAEkhhg0MY
	 Mv8IxKsg6cBBTskO/S9jJAwJWkOlWmCYP48UQTMC84U29npHssmN8NTqD4jI2DKXP+
	 CsKzYyrb4AazPIMxKF0g6XAcAYMms7x8BwdAi95W6/CxIFRz388OaO/xczj7KaMTBD
	 zXJsWC82AgqfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145EA41138;
	Thu, 11 Dec 2025 19:30:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F412C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FE8280C56
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URQ4FGp2hmxS for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C15809E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C15809E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C5DF86BE2; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:19 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 83f3a7799ea0fce43b523627c0ec3c7ecfa08c98
X-Git-Newrev: ec37574a63ff7795eff4f92f9da0b26122356c93
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.0C5DF86BE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/podman: security
 bump to version 5.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec37574a63ff7795eff4f92f9da0b26122356c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Changelog:
https://github.com/containers/podman/releases/tag/v5.7.0

This commit fixes the CVE-2025-52881 security vulnerability. See:
https://github.com/advisories/GHSA-cgrx-mc8f-2prm

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fc4ec2369baa790766c0af1b2d97d5fb2bf063fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index e52a353aa7..ff6600ac8f 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
+sha256  60de04a48c0ecf5006fb8e26543e2275126833aeaf2b5ea02ba492965d96173f  podman-v5.7.0-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 71eb26b496..31cc9ba349 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.6.2
+PODMAN_VERSION = v5.7.0
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
