Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92F606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lt5hfU1x
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A6140A67;
	Thu, 29 Oct 2026 20:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8JeJk8Ij_sM; Thu, 29 Oct 2026 20:23:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3021F40A68
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305412;
	b=dFCLpgTWIQmrDD5mEkvBjK7AVHfpvJAqSv3lw+88Fsr2RmuJSQIlX8B1jBeWxxVYUZAL
	 e+nadqSFnVJpuk+1azkb2eaDovX8efdIIbpLD3sF4YfaPIzrTNBBF4qX3qNkLNECe9BRI
	 mdM6RJpwQZTE0+tju1UDv48aA/66n9uo/kj5thHX2BAq+JtDpYgmiDGMunEi4culSufYs
	 FEvF7rwrDQOUHURzfyBJFMUGscJEISwbo5OJcKXyOiQ6ARxaEREDxtl5rtaOhEGkNe1Zm
	 uMUOYROc3DrFUIVppA33EckbpdmS4bUyM9y/h4uNftUWhJsGkCXVlm1jLQh/IXCkMmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7PecfLLxWZ+ysc/7PJ6/907kz69chgeaaswdOcOyCs8=;
	b=j0/pXzdhKqFXNLiYkuls4B3SvQv/noyUhefVHCS5YBvuHM6HyWa5pzs2dc9gj3Lai7Wz
	 xgmuff0KDAvLoyfZKk6+8ixGDGClkdAOXrHXYAfOUcO5Ec5YXDPShkBlzItdLFXAAnu2g
	 R8fZABDEie/OwFjD5IEuIRNphK378MZUjGSMAmllTqELbhbXC2O4ISTJHONvp7TDVVVU1
	 wXZK47BuDKuxxti0tFj1G3G15Vd3MXa9DDdtnsk8kxhCBBrFtPZd3ldmVkI4u6sHcIl+m
	 Sb7p+eWMyU/skNJwMAK7RPPEN9ZSskkisV3BtMI33oHWu4esLjOMRz4YFJMAF9xTlDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305412;
	bh=7PecfLLxWZ+ysc/7PJ6/907kz69chgeaaswdOcOyCs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lt5hfU1xigLq1H3NHoFgyDIGHRzcRr4L8d0TnoUGz17uQUNYiJOHRVdHow06Uz/s4
	 wyGaYkIJjYeSrocnUXPJ/0PHuRpWMmXAiNbryRu2IiUc3z5dxnv6UAfwx109imaRAe
	 MnsMDlQsnMC+YSR9GtrdwnYh5TBYM3aU51QJReX9hAusNMEjsY5WpoUhBvT8DPWFso
	 dwBzcWZ+4o49fnoaXk19Zn7x8fisL2CeC8TDfQfId4T1uR1y92tDlZtkOwrqsCxwDD
	 LSyiGYb/hi3Qc257lkvUiXG7iiIladXGuVV01lF61ZMkpwBsLlQFCSB+xgEg78Et0K
	 Stgloz7tBb6UQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3021F40A68;
	Thu, 29 Oct 2026 20:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 933AD972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A3BE404FF
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN40ktDo-tfj for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6CAE2404F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=lwAMygpVSuwnrJ8h+D57bfFNHxOeSkXhP9evtQP7Qa/Si59AUbbKXx1xKdST++FmrmUf
 BYvdTfjGiazIN2VzMPKtiE8bVq4iHOmHVd9fW76qxkLScAKWNVMWwIQC9Oms3emnDvAuo
 UpA5ObRYTTV302aggZMblTi0Pxsec+L7mF0bFrHnExKVyREniAP6+YbPT2hOtrK7bTXgk
 oAnma9v3rQLDu+x7cI89+2WdE3tUozBAsC743Xfnm7BDl8lBRh7giOmDLnOIPls7dlP/N
 xawIKMdGq9c/it0iAxubktBzR36EcGNZE7QRoD44+GNB17wfHwwJlvkEpDWx0mTWcbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2xjjmt9Q4Sv7LEoaqGPcmhHduGGcUtBjrCdhC4ERiFg=;
 b=CZZuysfjpJuhfJNZeX4NxaBTT6f0d+mwHSrLQSPdpyY1lRjckKAznDmMQMOlChERGSI9
 hZ4CTFLFEz1eMnww0K6YlQMn8Renr7aOh7OLpmPAQzvHhTj5zOo7H4AkibQrnPdaJLoI7
 CEYXKYQXC4JVx0Grp6Xtc9oCXdlp/Pj4p7/SqEOQpOgmGzCBGKWHYWuQj+1CVqyLmhsXK
 mih61fjVNpULanJdEgeGD7JMGO2j5wm/ZmFj0Tu9c5wZcA8KKV/WTGGeY1eielNuZ+/oM
 1+CXgGuMAuJs9l9ihq9mCgQlUnpcndGqMKUTrXyQNpAWisos8mfGwLzzW1FvSOopIzg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CAE2404F1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E39BE9D2EE; Thu, 29 Oct 2026 20:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3d7e8468317a1eadc902de50c4fa0a53c17d52e
X-Git-Newrev: f9b7b190bd9bc17c4cb13fb80a3255e75e5b72ce
X-Patchwork-Hint: ignore
Message-Id: <20261029202152.E39BE9D2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-audioencoder-*: mass version
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9b7b190bd9bc17c4cb13fb80a3255e75e5b72ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash     | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk       | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash     | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk       | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash       | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index de326bc619..e88e0d5271 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e7f21f4c42ac2c627ed381436d430a83f18ebc07cb92e91b6c98c4ff9528cc5  kodi-audioencoder-flac-21.0.2-Omega.tar.gz
+sha256  f944778346057068d21b3b3b0f92c996c076fa512a82bf54e552ee929d382aa0  kodi-audioencoder-flac-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 5fccb82313..5e9ee8406c 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_FLAC_VERSION = 22.0.5-Piers
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6c9439ec5d..fc55bd3b5c 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf593053e7413f6790352ab3c2fcf227763a23c8e7a90381b46afdde3d92df7f  kodi-audioencoder-lame-21.0.2-Omega.tar.gz
+sha256  7edb92db2cc6af11d79f7f0111a60345c25aff422da719a1afef1e9e9f6fc401  kodi-audioencoder-lame-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index a1fa2c51dd..e44bc62647 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_LAME_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 91f51421c2..7ff0f9c324 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5acd05c5e90459c1f07abe60c1df40f72ebcb3519287f104968c7cad17aca07d  kodi-audioencoder-vorbis-21.0.2-Omega.tar.gz
+sha256  7409360a8b540303cd3f9e6b21a52e21dfcfe2f516f8a92a94b4035a90c5efb6  kodi-audioencoder-vorbis-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 85a320c55c..a976a51ec4 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_VORBIS_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 34370b536b..fff9f8773e 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bbc3e15706e02bbd3e6be3c232522e2091509a6fdf88d8af5db4cd6bf7b3476  kodi-audioencoder-wav-21.0.2-Omega.tar.gz
+sha256  8ca6b38660815593adb8c276347a51cbb91138d42de7f05bb2abda37624e3638  kodi-audioencoder-wav-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 76f092302b..ccc9ada4c8 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_WAV_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
