Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0F5C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD9A680B3F;
	Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5SOxMsS5xhK; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B89AF80B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303061;
	bh=+7TqfrRaVoDUyh3+A432/4ARtAz4KUbRTmFFHuSO0OM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J9wjGE4vHQ7uKQC1zfw/cu+nykx7nVWcX66fw/Rnxyfu10Bn3x0/DucgMvKD8kZuW
	 IqkOUw06Uz4/cS4JBrMI1Yuxew5rb41GIFas6sUNq8K3l6uIjbdgCM9fMZjT0iDUM6
	 loLHyEkjY9Ixod7Ct3ILC8e8h/uv1cLR72Kk3sPTo3lySYloXNSwaiSLAhVdIuaTu4
	 myPxNiEbGcRZu0HAZxmT8kXT7mso/vfUBo0Oz84ELZnPlgEp+H0WuWjlzi2RGARIgI
	 MSOXYqhhAjZobHfFMFax7nosVVRqnHZt2WniyNsFMkD9pNpquhlcz3GUCe1w/8qt7W
	 e3dFioHv8tSsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89AF80B50;
	Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF3E1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FEC640A0F
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SsICA1eLFEw for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B851409CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B851409CF
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC93988E51; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:11:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ab8cf429b93a52299ed01297aed87fe2d5b33253
X-Git-Newrev: f20bcc4a4ff22d4a47b9e73f7e6d00a9971ab16f
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.DC93988E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ogre: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f20bcc4a4ff22d4a47b9e73f7e6d00a9971ab16f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Vulnerabilities such as [1][2] are assigned to the ogre package with the
cpe: ogre3d:ogre.

To correctly match against those vulnerabilities the CPE_ID_VERSION uses
the version without the 'v' prepended.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11014
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-11017

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fe1f45c1330f5975722c416e4d1c518471e49307)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ogre/ogre.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 3fd2fc4650..2ad2275f51 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-OGRE_VERSION = v1.12.12
+OGRE_VERSION_UPSTREAM = 1.12.12
+OGRE_VERSION = v$(OGRE_VERSION_UPSTREAM)
 OGRE_SITE = https://github.com/OGRECave/ogre
 OGRE_SITE_METHOD = git
 OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
 OGRE_LICENSE_FILES = LICENSE
 OGRE_INSTALL_STAGING = YES
+OGRE_CPE_ID_VENDOR = ogre3d
+OGRE_CPE_ID_VERSION = $(OGRE_VERSION_UPSTREAM)
 
 # Download with imgui submodule (https://github.com/ocornut/imgui
 OGRE_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
