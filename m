Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62E606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MaTqHRR/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBAB81004;
	Thu, 29 Oct 2026 20:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gurDWMQMroOD; Thu, 29 Oct 2026 20:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DD4A81027
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305415;
	b=ClmwibX0GqWbyP2rdqV9aw4B0rBR+PbhOgj6AnvxgB/pD7gK1oBfZcmCO2DL3+5xZsJu
	 3g6DYzG6lNZN9aATHKqyDdAR5M04RVr9g9c+lPhkcYMmISieFuhku9tcAKYdASH6GQ2Yn
	 /Q7BsdsDhNN3KQt5sQ/rq0u30UgnAW9EYeTTnQ+85yshTNGNBSdwBBfTQXEY1jkp8hbz3
	 lzfhazl55tGjna+J8Dwwvagb0Er4qHx14iVfJqbz7/whKjLoH72SvizgY4q3O930la+cr
	 cZhMvQu/vJF0DTl9GstTCmpCdKEv+VvkXrJr0+hxey+oqPPI6ts/x+SHM6PX2ZWbNow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305415;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9kPLhZqTN1O6rb7JFWYBdcH9Mb0X/HYytbr/+T7mI/I=;
	b=s+k6ENXC5nmABNjHwmZId/ApIEBGEUApQdX61IRHoIv4Vy9XyB7ToRH64/s1i/Lhwv+G
	 Dea9lj/8hRdnBQuGTF09m6hi0utHNcanwRYmve3QG7LccNo4QqrlN0E5abBtXD0m+OtuF
	 f8XD2ZSG6htXpGRal6Is2eOmWHJPIcjFMTtA+ZL6WlpZVZwHCM6DOOvxGDOO6O8UJxu38
	 L+5LJFlmiVoWa8wMb7g9tnl5T7IFjR1/RsAcxzP9+sSLI5l7Q84kDToVWZ/qhv3kSnJQO
	 DaK4+Vj11NtbmTiivFeXJ8h3ZrBRbBVhGB5W5+yDfxGhXUwPQBpwvz8XD3O61ol3PJQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305415;
	bh=9kPLhZqTN1O6rb7JFWYBdcH9Mb0X/HYytbr/+T7mI/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MaTqHRR/vbGaJsWO12upSUExZd80gf9xZwwBHRbGtpER50ErdJSDAHVHKjM1XfgWG
	 jFgjS7cFP+zgYcC3zvfEV6OqdzOwbXwA310zxMX6MVcqXw8EYHjJWiNElH3//56wzF
	 5elIgT/szKXOlfl7WUdjwf83Ea+4h6syjVau+6WfJIioRL0E5jCMfV7AJyUA5NTpzg
	 V660Z795L9UxEaFYu86GlnDYHW7V6z8lhJwXAYQTgfbtIEweV7L39z0DltkAiohoQA
	 uBrvAigSbpSx3XYVw7Lb3FIg0HBumQW+a7tOnP/xbgvkdw+cz1MRrInRicFtfVLBw1
	 MpTr2ICcGsXkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD4A81027;
	Thu, 29 Oct 2026 20:23:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C85E33A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3BB180DAB
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNezuJuY6QVY for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB9338101D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=Oh909ZJ2EoRbTmel3iqQ8trEi3OIA88HmUnMLfpgtVTHecLHBjPgxyPX/4np1GPXjut8
 zz9uGCSHggS4YpHpNcXzNjMSvKTB2LEw4/ZpOiLiL7WtXoOZGUfOqaIQaTOmgze/1maIU
 Naf5NCjxh2KvAlf3QQ+RfoUpIgsGOSt9ytO6UHawTWxNHmJymgFBMfJAszjmGDO1pG/ep
 /IAjlLYlTSKpIS8ptodPt+bUNEkfddK29B7WGtrYocZpODtiOoXpjIATSNKYUohrTAVRX
 Un3qbj/Ei6VL6UpVQypY9LGe9gh6R1QS9azIY8Rz1ZmIFO98Ks4sUXGsec07G3DbszQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lgwcSZ4TFc4qXXN6FpPgvSPDjp39C4qMEyB1Lu7/wDs=;
 b=aFAGKfeFg/1vhwDy0ZJpir23yNYu8QZYn9GJiT2jHiqtHlcVh3d2Xfg8kjlcQQbO/xoX
 n7xsUOoy80cNfmkM7tob50+5kXGBg1EyQsIfublQ+u/766Hb1DmIcd/NJrNUT9ywLxkyp
 DE6/Pjsy+Ls1NJ0/xjmTwIpzVNUMz2DvdNNaS57u16hYHGkDnjh3xl1iNJNuXg1xBP1dQ
 t+nDWV9KqpOHCydI9HW30QwWqUAk1ZbpokkxKH6oyYYeTWsQpoFlSqHT/qMqebh8r3J1o
 5gV86oifskq7lezUSo3f1n0Chw8bQ5Ty/B6vAgF65weZrxIc967PE85U+3kAxszP0yg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9338101D
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 605D29D2E2; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3634ac3c1d052141398dec4cd529ed10c53fce86
X-Git-Newrev: e0eff71017c9dca10514f4a6096a30036e451f12
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.605D29D2E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-plutotv: bump version to
 22.3.1-Piers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0eff71017c9dca10514f4a6096a30036e451f12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced dependency rapidjson with nlohmann-json:
https://github.com/kodi-pvr/pvr.plutotv/commit/c6d0c6800421d2245922a497c3ff2994136ab374

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-plutotv/Config.in             | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-plutotv/Config.in b/package/kodi-pvr-plutotv/Config.in
index 37441283ce..29e6d8c485 100644
--- a/package/kodi-pvr-plutotv/Config.in
+++ b/package/kodi-pvr-plutotv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PLUTOTV
 	bool "kodi-pvr-plutotv"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Pluto.tv PVR Client for Kodi
 
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 7381749ea2..f3d4e6f985 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b65a30f4a5c0cfbf1ab669f06a3afb0cc7b2732ed6d6d4e768d16fd10a0da02  kodi-pvr-plutotv-21.3.3-Omega.tar.gz
+sha256  a56bbd15ea5eca3143feba281fa6f0f6dfc42ebed37e886d7ddd18013cae4f8e  kodi-pvr-plutotv-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 898b0aad0c..3bab7ddb1a 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.3-Omega
+KODI_PVR_PLUTOTV_VERSION = 22.3.2-Piers
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-KODI_PVR_PLUTOTV_DEPENDENCIES = kodi rapidjson
+KODI_PVR_PLUTOTV_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
