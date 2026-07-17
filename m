Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07550C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DCB740A8C;
	Fri, 17 Jul 2026 15:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QClbJuz2a8GW; Fri, 17 Jul 2026 15:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A79A40A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303164;
	bh=BZKyx+Dpxu4CEicpszE5WiIW0xUNul5O2JvD5rPvFCA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sv607Zh3U1mHbuUgglZVth514QIetI8PMv8i5m7PhEuL/MyaZewY0P64KfBM2+/8e
	 xcDG6bKjw5aU7ummIK8EUEjf6LZwAou7CFT9PUVF7KbMmzHTnKSO6I3I1c6CCMTVKL
	 eWkfw33FB9vLp2K16qQMsI2m705tEyZ6jEKs5Jen9Y7qSemZD3Tlz9o7MRXfKHSA5H
	 huO6qnkSSv3km44VmzPGxO2qEj1HLCEsJoiJBhYSLO/1mCu7yl7S2VNYUjueTTSYg6
	 g5f9R8m/jMziLLyi/GUwXUpAbr/LbNMuPdJIK4a9dHl7JkIxR/kogH73aSp3DCh0Pz
	 ou+f9zJgYYGVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A79A40A61;
	Fri, 17 Jul 2026 15:46:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3C1636E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B59E160732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4ZPBEuB02Wl for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3C660ACB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C3C660ACB
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 190B088E51; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:11:33 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e2d7dbfeeecb5371171f44b51beded2a9a47c6cf
X-Git-Newrev: f85f4793ffa286815d3b04dbf38867b918c9ace8
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.190B088E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ogre: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f85f4793ffa286815d3b04dbf38867b918c9ace8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
index f3e3fc1d8e..4f19b285be 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-OGRE_VERSION = v14.4.1
+OGRE_VERSION_UPSTREAM = 14.4.1
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
