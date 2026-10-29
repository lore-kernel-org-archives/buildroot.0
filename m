Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCD606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AIEKoi3M
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F76A8102F;
	Thu, 29 Oct 2026 20:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcQJ_FtBypiA; Thu, 29 Oct 2026 20:23:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05A0E81061
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305432;
	b=FZl3B9uN8PpU5YJ30QVCb8LHoPT1Px99Gi0ePFbju84Lx1QjiwOiCwSknoE1THknblGP
	 ZQquL0xkRIPuYYc0NpIflEMooiI901By7EEDXWoo90YtzLaN8xJLWM8Gq1oq1GpC3mkE9
	 BG4CYDpDF0tbkKMmbEElA3dSAuUGJh525UixSSTCAgfPV1UHgVYJVAKPkn+cS2dtHRAcJ
	 YmjuxAn5SsYdDlfsHhkspMf2hWoG2eqPvR61CAoi1F66xxkvFz0/FB01c57EqOcUC9jMJ
	 CuQSayVqQG2DC0SNoOzQCx8tS7aXZlmDWh8O84AunZn2b0bfWYk5SJzwZthV7nJ0z0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nmnf+PzIDCl/+R8YRalfa/yhgOBq/cQzUpl2a3cSt9g=;
	b=X99NJUKKsnEL908nHDvJNXTXzlE6U3iR1tbWIZ3/vyHacCSZHRg9pUlADukcE4KHRx9U
	 KMHLAS2++BJBoVxcWCK6oNzilz0ToXnPVAe3Yk4zK9JueYB2HPbwenfqeJrUkqTbIBJVJ
	 nB4OsN3DBwc6CXxyCQ65MambLVVIMLogqHfXnQQZTpivXY+A+1sMODv+rnddKr5gjPE6u
	 JgG+eI22lUK0DirTE3rdgT+XSOHIU+gg9K2JlwT4HTUwSfO+pLb/7e7UWDbwlQDviCr1w
	 9MAyzb4WUKdnN6QBNgfmwcDIhVfoVgmY3g5ZuW2KRCfBzMvXc/rVFCyQ+QrxthqaqFA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305432;
	bh=nmnf+PzIDCl/+R8YRalfa/yhgOBq/cQzUpl2a3cSt9g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AIEKoi3MIIPS3F2MqSGxPkb08lRllctLfq4Bic6g0AEPNkPdOnM7rzKCh20kHAuLZ
	 ykRFueytuBaEg/JzuN4qB6kRPRUwdeBWvlnKdPdx5QKeUeFK875DF4quqhJh+f5DUh
	 oYYVfWAyJ3WQz3KarFF38xfOJW6wT2X3RdP6FYz3nOJic2HoGEBs6jEAcEnUOX9pu5
	 Y1FRM/7UY6IkE5Ti+aTlnxEPc0IV6GDrReJqDyFw9r6Z0xgLzG1EHjEXoOmdXc6OTH
	 PEG3pYHUGlb7WvrPaW0sY1ZJMW11BmOzQWhrPD6hRy7j1uNl/dFyiPkqVqLj7I3M3E
	 r3O8FpTzPN1Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A0E81061;
	Thu, 29 Oct 2026 20:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A78E3A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B60540A82
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMO_1bLm7kEp for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9AD8F40A68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305408;
 b=dIZxG80R9E3TdkS+/3Vvh8D2xT7dojhZotknVCF47wxdI6FXsk7yOXKlZRLScrM7S6ab
 4WO6157eumLnIMIOqBlAT2nLfmdDz0wetOkgG/FZn+NylUoqn926EOU/OjEJ/5H0/73rx
 JAP12bxBCzhFDv8dHilXcD/cFwVS3Fc0J+5Q60zjznZNnJ+AWAoAHgRiF7kHh9V7z0+zw
 Dd5z9M47wsJGzESzGjkWAG7+X3K4cwb+ltCV7StqGRwRB0ympN0hgqJXnl8lLpY4kpTMP
 h34E57uzNg1EnmRLJBDpVSoW2OmsjsL+jb4/lL7hyPMr9ddqRpaO80527T43/YXqDXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305408;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p/+FVRr8evoomNw+JclT4pGywcrfFuucohEaNERPURU=;
 b=GhR5lQBJ38K7mL6sd9fldZzWqZ0WrTWB/j8vRAl9qYFI4am26zUoyhjcL1GkonKCiKZ9
 110JiDTMlDES61RxDW9TCIuHM533hnGF99CbhO4OQ0O5rIJBBwLPKnD1eqN8oaO8xtRyd
 DSLqb1C9AWJf4IpPGqUaRUQa9k9wB9nKD2f79VG1J9zKvwMDjS6PNqj4NjnmSbqd7HEYF
 6hK/r9frfkrWbP2lLB3U33pL9EaYueFmq0JiGO/mHDY88WlVWmcMEmrPT9JZCgbRDpuRE
 75xQj7OfoI54+nTI8DPZ5Y3MrOCPn1Bg0d+SOfz6BxWqlPV6h3xf1p6dwovvTwIgjeg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD8F40A68
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114A79D2C2; Thu, 29 Oct 2026 20:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcca24b3dfdfd5b16191f5d19da760ca478b5130
X-Git-Newrev: def7f1937fc8385d1c21ff3cb22064264aa5747c
X-Patchwork-Hint: ignore
Message-Id: <20261029202201.114A79D2C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/def7f1937fc8385d1c21ff3cb22064264aa5747c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash     | 2 +-
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk       | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash           | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk             | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash       | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk         | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash | 2 +-
 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk   | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash   | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk     | 2 +-
 package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash | 2 +-
 package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk     | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 3f5f761968..7224b062aa 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7433e4e88e29f1dd3524d2d0b660ce529852561f14f479f4b83a9c5ac436ffc  kodi-visualisation-fishbmc-21.0.2-Omega.tar.gz
+sha256  e0ec1dd6832cd916a0ec8a2baa8be55c65670bb618c9be8747c7cadaf22c1535  kodi-visualisation-fishbmc-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index b1eb305620..393cf19700 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_FISHBMC_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 71ce1c657e..72fd7ed709 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f87356122f91ea40d096d559d1180571e701e39867448768d14d6c2ba3b2e264  kodi-visualisation-goom-21.0.2-Omega.tar.gz
+sha256  3bb77b47d26aaf1e6cca451bbb9c22f162101f3a43b014a1bfa3583329e08f44  kodi-visualisation-goom-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 6b35c64a87..a4b7285589 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_GOOM_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index a924eaa6f8..aad763fadb 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0  kodi-visualisation-matrix-21.0.2-Omega.tar.gz
+sha256  a0060d82a8a9e9cdf2fb30451116271d5ab1dd9196c27cda1f6ae7eb1f787b02  kodi-visualisation-matrix-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index fd885712ad..05e4889c84 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_MATRIX_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 508820876d..6de80abd30 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30a5081365cea1dbdf49ccbb059076d4c7abc28604a58749fcd0d025e2faa760  kodi-visualisation-shadertoy-21.0.2-Omega.tar.gz
+sha256  ec4881e0a71ef4a01ff33a0704bb0e53acb573d49cdeb5bd67a4948b85659e1a  kodi-visualisation-shadertoy-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 32d6d6f056..d095247c2a 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SHADERTOY_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 6bbd7b8c9a..244d7f9881 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b6635789d226ee4cd4e17d54d57e880731d0762835802835d0d5ac4f0084b99  kodi-visualisation-spectrum-21.0.2-Omega.tar.gz
+sha256  dac63ce17984d48c8e20be136a840d2543cda184d12cf31c7839c8e810bcc537  kodi-visualisation-spectrum-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 1946cf598a..646917697a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SPECTRUM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index a362fbd23d..591c3883b5 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3f70985fee6b1014e7e7599431e646f36bd3870ead78bbc8936151b805e4241  kodi-visualisation-starburst-21.0.2-Omega.tar.gz
+sha256  35456e13ab3d82177dde6568b0ab6c09dd09a31acf851f4e141ab4062d787e94  kodi-visualisation-starburst-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 6adb21687e..ec922016f0 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_STARBURST_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1041fd5287..683f468cc3 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe6d2f3990ea5f2ea2d4a0a905f451b1c2c7f1300529d8957b5d93a97421f415  kodi-visualisation-waveform-21.0.2-Omega.tar.gz
+sha256  050a184a37c1cef8f87fcf05d5dd90c6d11f33008164bc5a86e370aac1d866fb  kodi-visualisation-waveform-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 819b064789..9a61a4d159 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_WAVEFORM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
