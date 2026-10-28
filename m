Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E0606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gp9AFgyA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rJu30YZW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9811A605D2;
	Wed, 28 Oct 2026 22:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSEt-pJ9I3VQ; Wed, 28 Oct 2026 22:33:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8819E60709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226812;
	b=sdJTwPK3jbED1RDSOvQ6XbiE88FQDaMBLrj89qOmli4ynu1qRLJRrBclWFK3RUG3eiag
	 Tk71eZG/5/bSVio5u9WfRllElf9OocDD4C7EIbPYvPJBz675WPTwNaMaA+TIcMYK22fJF
	 n8Y51f5ggEbVDKlzbzNYbvPTzYDtVe5+MCvQRYXsmV0KVkAEMypVtfp0Y1t7MP7943bWC
	 b7hOTJ9GX82c9BBXeozor/4BuAQ9CtAICoo7PpJEkWC995fGoGGonVhoz3wKz+35i7MkR
	 nkMLmLQrODfox/IgDrTUpG5uDSvsDIQ4mtbOUNUEPLgLELrzIeMRvaKImk9jlm/cCyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	b=mwatau3Tss2qLDkocgOqSasNWqhSNVpuY1Gmz55c9C/6mgeD385ICmgJeVnmzU5SbvYN
	 lkU51SV2K53f2CChwRua4Kq/HOISJ2riYsscLDAbPn1zie69BSexS9nVHWByUlzZvaOMy
	 WZ3BGBXbBoHBCxS1JfTJ4qY8s8bgP98txJw9yqd2OKpokKj142P3RgU4wLoyQn41uXbhh
	 7Ua7fptNXXRAhpgrY5AuZT7ybqy+6Jmjia+O9GASAPIN9IY/6kbzMFBHjiTRz9epz+vgv
	 /7oGTZpe/4aXHV9eaXGtvGyezN7Pm0mEcCQXaHD8bUjXkDHn1+HpQ5tmeM8g6p7IS0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226812;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gp9AFgyADaPuekwBYGlRAyUBwwAeeGh/AQ8ZOsbSQqvgl2lqux17p6jNptnwgopuQ
	 gK6cKdC3pqJrb9RNfsw6u8bAgBuWqfGab1iGG4juSlbKF5g+CFK5zL3PMoEaqFTqpp
	 3fYO490vYq8hynPnDnTtgPeb4CCoNjhmQECli6VwCGCSzkONtpXvYFjVlyc2alClap
	 UCkC/kkpGWIpccLACYVdfyqsXgk+MmhqRw76g6A/ROpplQoWAwD5frgxOR4aVl2Y5g
	 idDAUU910oN2dVmcmGEU/OyneaH0eUOmO7/6oFALXIeWjXB8jT4Y+6Z6SGOV6GxQvX
	 AsfUTtnJIuGdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8819E60709;
	Wed, 28 Oct 2026 22:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 565D72E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 480D680A53
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id minyKVn8sTWt for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E50981000
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226810;
 b=PROb5tTLb+mMQ5GZRXENeGsCNgukGH2GVpzRvAxfv1Wjo4d0u/W42W3CfGToP3EfDENs
 C7tTPj+8sifeArdrNeYbcsKdGI8aKnneuGtnr0dvWq6ncUcWA/5TVyZj976GIq6JPNuav
 uNQzDRo0KnEFkAC2Z6Gp+7YlVVjz+C9F/uBeI0B+Tb+0Fh9wLhuIO0wFBZWgvumBco7gQ
 ASDgBGjpDraCKugSCBMRc7MEksJUFK/H6hJPFelarGSqi3SpljTbMm1yI1RLH+kGEg9yl
 8FNoATz6Io2lZBGs7Di9eiLsAoY80GAzS0+dh8ZTTChB1cgmWFEEdQ6g4mkr+O9fmGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226810;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 b=RsU2HfUAmBCKsL9wzoHUH4ioL6dCGNaouEAkgqvpTYh93BSqQHNRxaF80uX+ZbuHZ8K0
 l9bycZjqTIWivJUrqjDQocETsYkuf13HeORpRgg/VyjKI9U3YcsF46O5tGi4pX5PUeeit
 sedenMXLcHn0ZCxNmD3FAmvYm0pL1Z/GA14N/iPmEfsppQ9RPpvLw4YGppVZ2RkiobN7P
 6K4Yh9uLiutLdsxxTTZ1TAe4vwl747HzqlicaJMrI0RWcvRUOL+mF7wVdQyNi7dbypeX5
 PzMm50zWZyZBxPuPJbZgFSmfagy8k3qiWM56EYrw4pUqwwyvvsxWeWFlpbcF+BXxsdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rJu30YZW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rJu30YZW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E50981000
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226577;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rJu30YZWLN/qxdPPzqODDX3ItD6sF7C332rf85gIodhYWbUoRgtxFc/MyKCotGMyx
 cGG19eXQHiQ9ctPGryzrV2grD5QvnWXeOFhWlqlkf/oDtxcFD4KwADCp9HKlHNEVaP
 1mzywD2AQJKDCMvsiAxmLSSqHzcXIrem/hnS10bH0g/q/OXzNG7I3o3K7ukG7s3DBQ
 6mMZAWVwP3jSmJYlQjHhrR9aLgEBHK+axlZ/Jfyf1SXflSajQKNOre36/zJxhMb0mg
 Ii2xAZqjtt3ggfqqYsC/8k2Gt2gB1WSq+HA2FCVJZlWxlkXA6BqkejtzqGokMLdGbG
 mEV/ASkFT3Bbg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 pv24NyxWXucLRMfvyXjRSV7DxsKK5bQT2+NOfSAMJXcWkLX4lQYgZ+nJI/jNCM71AaEdYo+44E5
 yFoKsmQ7q3fLE3AiXludpHxBFdJn57XAVn8BjW94CrWvarETGzolpxOXbaXX+GdO4ONOy/A0HEd
 37+w4qVyupay8nzEgYYnvPAwIBttYsASJ7ygL3nEWIDjyDVJ3kZyj7Ooq3KBCI5aUgDrTMlg+yL
 K4ccbjm5KAHeGwn66EO8QnAkeY2GoxWvsASy1nA21wPD5D9KneJUVjWaROcQ01tsAi4+vdFsCYd
 qE1hdI81OBZKyLTEDSuIVDa7UCue6Nvvkcm9fjGN73kx3zLfEURzgwbu4IP8LPaUVALDtlBqkDo
 WiwdrBPDsqyohnJtxBogN3pYWHTFAWvlaonty/oD6AZbF4lwF9PoPTM/vz6NKvE1gJvh24/xJtk
 o2u6SEI8u2Gh5gm5IFvxLxr+0E9v+83MyoJXPkQRu3oalTWzzTdSMMYJfi5/SeW4xAXIodZMW0W
 XirFaULQi/GLRxzz04sRtcpwLnriSa4Xtsxzfx/aaj9JtbB2Eu+ZHzNKfBeFphPnBklUnVYGxY/
 Gf51
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BFF9A4C6FC8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9J-000000001i7-2FxK
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:21 +0100
Message-ID: <20261028222936.514451-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 04/18] package/kodi-audioencoder-*: mass version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
