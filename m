Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E5606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZkRGzm8C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=WTXsVojL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C2C606E7;
	Wed, 28 Oct 2026 22:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0vWhXkRzQCt; Wed, 28 Oct 2026 22:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D32F760709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226563;
	b=Okn2E2pEHE0yCb6rDTWHzcfZb0XcL3mXDNgc5TzLo9aj/h2+4b5g9LNbjnvNiRqqUIuu
	 8J7rbTzsBsrAiHJnBchZQvS1ueORAD0Stc9DKGy5c2O4Pp9ViKAcEF5lsucMfgig1UXGq
	 TrJ64CC35SJuQ3umVcLeSClbZ+rrg/Ncr3NORzH5tr/X2F+S/QQ253zN3uVJA4ws59o/Y
	 IvoGOyi981VFP/YUapqQrPsTyZ+qgLcetOLIQgnYMdAYtz9a7cFrAC1jMmEoChIIc68JF
	 IEN9SFrAMbUKYEG0iNtgQxfvfYkFme3xZAkT7cRcTM+8QQOFrzlEi3VoP3BMa6KBapQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	b=bnz4Gq9R4RS15SIXgV3QaMMeVhHIo2C2xA63CLEthnULF7k8uB88ry7/R+iAwUAIwevb
	 JVrM2x0PpVtohHVuyuhEnT4niDSkFSllQrGa61HFoovw6R0msDAR9aGeaCVnMqMmTnXCv
	 ljWWi2H6KlLbM5Zg0Qdt2bReKVwE9y7y0WWLrsVoYzpH8P+zodqf9QtNKD2j9NQ1fMzdl
	 yfOH3yOJVacRACgEaB8NhSPRehAiXdGzfwKugE/b2Y/+P4019DduYipstLSgRM1z0xDYw
	 JItoMC175Nupai4anDxYP5EVYNW67N/BF/a4ZEq2LcBNvgDOfwyNBeTeu0CID9tp2dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226562;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkRGzm8Cb8399SmZD3gfawfNig1ryHQwPMsDI1c24H5t9Drhs0nOV3x7vUu609Q+j
	 BOPFFNzcN3PvTlJQXMoRWo6ESe+5sb0z1UDbAaa1ldBiN8WXYXulZomeNU5jQVxXAn
	 nkOxVgCWMJEsesrDj5h3FM3s6jXkN+fP566GrCk0NdqBCXm/cFgqRa4XSpayJz57s0
	 N/XDW0EVt0QzqK4RfM25qcIkJccv6ug6XKP4Lx3uRvu+KWB4nzcn/sicAFcG5CVfAL
	 V+CgCh1yIoY0iFG9Y9rcwspXHOe78JKp/OKN8xyDqd5+cScLFwuUNDd2OV0wlbyoOL
	 gRGyrfd1793qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32F760709;
	Wed, 28 Oct 2026 22:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 084463AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2796400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndp87cUtvVie for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3E3714004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226559;
 b=PcQ53WXyfEYoVBl2JwUzsJUlcc/x4qpR/fdc4lhZnBhooh12iV2wSmRl3ye7ShBGG/MZ
 g9fB3RnuwAjnZ/iyWqrXfl5AzxqRSXcJ0DJfqO1SxUnK2i/gzcfgpuFSN33/p1O9BQiQV
 andp62R3KRawW/XYP6zxKPvzzb04hs2tS6RAeGc4lozhdhDEHTv0jSuTBToXMoKI2iO6l
 9R6qv33QaBwS/dqOAPas8MIDhnKnpINMhBkdhpCcX9b+q+pVcJcMpav0NKu0eVO6GTWRu
 IJr6wtT8hWQaFxg0xf0hEvTsOJ++OzjK9E2lH6FHeAbO5dPjhxXLEsaON7RdScRCLQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226559;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 b=Kf4z/KofbeLd09Qd5azwSsk+DHR2S/vIbRROqBglBFvmLdnVJzA38Ic/Aya4RoFmcIZW
 ZCFKR8YdhxkhApBRahCKJ5lD1BA3PFvD7PUo6k/3ObLc1FzlOQ2gP6VyN3MbrJCS9itWF
 fyKYQIK211GqeJlh+cT9dOyeRTLojFXCtfPfu9WycpcWioynDBjVWjOevZHrJysnZFzvc
 fL03MGH+e0rcvv8picwoaoaI9yT5YTSdRiYH4mJkYKkCNjw6xFCgncXKeAsPvhzvqupoR
 4uJhkDdFoQZbuAtpWw3gd+iRAbf3oeDu6+WaWY/tFunxMSLV5sS/JBSy02PDCYJM1ZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WTXsVojL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WTXsVojL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E3714004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226504;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WTXsVojLyvGLtYTXOuNGkgtPTF7VChEpMsnA8bD/yqNhAnGCQILPhYBIKRgiLcajg
 onrXNKi7d1Ts6NGJjO83bWTeQ+5ISuePa7/qDOg/w1CVmdlFtaoeTcVwfI3IwHZN1j
 Pw4AuDOtakl9HPwBRj8XiaZAS+vn1DniGlkGZNGbQ+U7RtSiV/h3yl+wfi5RfQRh2q
 3H1r85r+9DdTkNW29vAt8qAmgtbKJj5BLVvCBui4B3yTDcI9DT9i6G6z1+WDpE6bzW
 J3SZRihhjDgLOUZ7dlsvRNL2rlqvmQILEEB3Acp8KDXRdzFkL3+gE9B1qI3zZuoO2x
 vO+nlLg8TeI5Q==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 4OQP27wS7wICFogj6D/oY5UiOm7gF8/pZUXMHMXuJ33AouU0IIgpMW+6SEWPkmRW6XLPSeL4MFq
 URzF7/kDthbLYqiRP5tkY9BxymB7oxul9rCJzYs78h/cd6pfEz/sbGMOBOXc6Sfwu+wWvUKezB6
 URtSil1m3CW15Hu7poxdF5ycpHTJaalkzalwFFLEcWtqrstqBQMpiC/MhOLsCiDMpMIfDow3hgJ
 W6DMy2Q2fkV6BwFs3XI6KM7Qyx+kxcLx/KhOCn/AafEY/B6r1pp5+n8qjO5EpHifhMOmphIIcUU
 DIQP6cK//gtbJspKq3ljAyIKLARLWevL3PmRHNPpkox5ZgUTg6o77vkNYTZ9S/fkUQDB5MV1O5y
 fTuvDVVaxG0Ay/vheuKwCvBpehwtdtPVd7+hogDdpalR04BvluZUkM90ApKFNhFVOC4GoGHlka9
 XB8AZCRUfRaSPF5L3PKxmhc093GiN19JloAPQfLS/1+FRyNs5zGOazAGDhuS4P2zAgOozagepMZ
 aMNqjpTsM0q824tKN5bY2F3HBrzli/Unj961BAk6HKZE2gkDbKwOvutOKmNOtR4ThMLtMbHjj9W
 1jVA
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1183A4C6FC6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:28:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-29P2
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:05 +0100
Message-ID: <20261028222822.490779-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 04/20] package/kodi-audioencoder-*: mass version
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
