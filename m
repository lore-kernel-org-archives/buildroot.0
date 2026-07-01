Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0ADC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5C2841B8;
	Wed,  1 Jul 2026 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AfyYl0jyokd; Wed,  1 Jul 2026 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 563F6841C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936787;
	bh=bkMG7BHlSz4AOafH0bNByTg5R6ELMhIFfkCxbtirCyQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VZa7FGA2KM2SKMqRHq2n3kT/JbtpFUH84qUtZ03wQe7/6Zmn9iPPBOJREvmB7/OKo
	 lkRWB9wkq6qSzFc4Ml1fWsmVXSeWnT+2++Jv6CrnvwUvzOBsRJIf4v+8BZDLk070tR
	 dvS8qmW2ZSEOhQDuUsEBqt3ErQVnX3MdDWv67rtmgOwiiJTTFcy4FncRl+Au3DrsVK
	 JxgEnVLXPWjqP7FF3HGyrJ+nqOY0ZTCyxqNZjcTLV0TlCO8nfp02956rkSjEDxONUh
	 EUsliX/YxV6gDDONMZG8b5Cb0EPgFxyiThxoSKvcCf4IZGXHrjrXRTGbyzKK4VylPI
	 uCD+/xmD4MHAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 563F6841C5;
	Wed,  1 Jul 2026 20:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A58E3127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97AC060BDA
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s9TMv13Hdpu for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A0B608B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25A0B608B1
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8844087A9F; Wed,  1 Jul 2026 20:12:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 22:11:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf0c6695c208c344076065e8746c9bf6615c8d2e
X-Git-Newrev: 8a66e2f197c850f23689087c468308559cd9b8a6
X-Patchwork-Hint: ignore
Message-Id: <20260701201234.8844087A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 21.5.21-Omega
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a66e2f197c850f23689087c468308559cd9b8a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.20-Omega
https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.21-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index d05e1c217f..dd9be8de87 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  20922de1891c9980f9807a10edbe2d1ae9224c298c438a3458d7b7105d5b7c21  kodi-inputstream-adaptive-21.5.19-Omega.tar.gz
+sha256  31b441cd3bfd9b7f773bf4e80a71a729aa722db28359646fc5667e625cc9b082  kodi-inputstream-adaptive-21.5.21-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6afbb241a1..fc79a31772 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.19-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.21-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
