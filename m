Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC1CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2876640575;
	Sun, 11 Oct 2026 13:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ja4DlyWyXEqT; Sun, 11 Oct 2026 13:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C46CA406AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724094;
	b=L2lXdCw/6vV4bc1No6zh5do4dcId8B6qQZbYCPxgFgXMVSz40isY50zyYeNZlvpycyfS
	 Db35JYfzgmluk9MOb0PT0eaWxY9EPfFRtOVEOoygLuPTjrexF77fXe0v9ifXcmShQkw8Z
	 WedVzWukPFldVzzV0/VqNXFs2jGJMStdL8CYACHYMU6armZNLSngCPeCxiF52uy5qVIBW
	 cMjDTeX8C74qw/2qSwM3XDFpDT7PbYlvyxwUmctortjEnl6ks9jsk8MmjBEH9nZTv8a1s
	 Oqx5q3KtKBAlX5wVToneV2zns/IGwh2N5F8KpGf6twa6l5XR8GBG2mUcR1Y8F00URbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724094;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	b=H0YEvLprLX4n7f+zcUdmv/HtSZET6bF7oTkFrHsRul5GUtlDVihLNRNjzJ8q/w73evdH
	 WjscHfgOgQAcv9AP/lSsPnzZPYj2ihQLKHB6wPbFOBFueW/g8bCEcQnMWdoJq9fo+pfq9
	 EjzgOmCRdnaEes++/vq/G6Gpg84vYCr4mdQ3IUWLCnsIfd+wB2hiB1jnd0tU6m7o03PTe
	 fOoIJ58vipBlZ4vFQWLS4ttE38HbCsroICVxmvltQ3gSYm1d8My6IBvkMHwqB0eIXEFMB
	 DiXNFARLPL6Nio3hTvK9lSzfsWHcZG8ZboV4BSwKUfmMkDdpx8zoum3PDy/lG1QA/Aw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724094;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7BSC9ubgyb7id3pwTyMaECZ1958qnjru/xcYYQxjAQtG3q2S4iNx8urnSn08WyVg
	 8CLPQzCSqIkuaPzfO9xccmTf3IPw8jETS2Q7i2ySlyB1Jh7Ak7MNywhsdRFX0Oyy4n
	 N7I6dlnXK5X5R6dB9bZ4hS60y4bDpLedE3+3S96LONyyN3W/C2zXXa8hNCX8xuqYMo
	 qf40/lTo8gff3VHZ9A3vmwE+YO4uf9TZ7cZ3DRxRly6WmiHFges2P482CNqYsntApy
	 B5qsVpv0zaGAg0cGa+QLupZFymjP43IX9lSLZzW9BgHP3nEsknNLTZBRPQ182WOCaD
	 I93a97BapYrMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46CA406AE;
	Sun, 11 Oct 2026 13:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB088194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B84A860658
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y90MQB9AY5tG for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CEE060616
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724092;
 b=Xojxcdcr9z4ZTThRVN7W/rXNSrjNcVExXxxgxRe7c4psxSSum9JgmoRs/bU+/nm1GdLY
 iX+dIeYgsr2njKudyWAU4cq/UokNucqE7liWRAFzJrf6qW1+4pk+ApTltE6rHeYoHGDXB
 pi2abEccNBRcWzF0P5kKLiBJvW4OsNcxkFyoGJSuqmNjzu3tw4lyCdFSoQ455gJRJFlD/
 hYU9xoXOGf4Q41tC8ZIZY51Ltuft8d5ww/69KXgDKJ7M6xzUs/ESRXnecatrgGttADIu6
 3V5NVTVlnAw4KHhzo71EtqRuohF1s2FxjOniAaRDSF5DUrFXPpkR8J+anT+jHZlLPiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724092;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 b=m/0R/HnqMjkBkPcG9PJwm7a2HcmwzITrOfH2k0Z6gQcua/rok1qoK06o2sLKcxzKJzMU
 QlHZreCoLpQ6tq76rf6HIuk1g3MuF1EFEJ1B8/ILBDQTH5SOSQczBe6FQPuSvGOol9DLH
 aKeWtkDU8CFLmNqet90EAUwm7ERs2dU8sXR38TTN0pY6MEpsrR/k6UfVj942bP2/AfTTo
 8UMproErw1DfSx9zjYYUS+HF4RcHfJbMp8LGczOucBW/duY6hh/L+Ra7J4qIiYPVpVxTC
 cMDFQD/RAneG5BImi6LRrXLNT8rCDPXm8OnbsR+ZglHr5ciNjObzs4Jxs6dHkthu+nQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="NhOzpgd/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NhOzpgd/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CEE060616
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723665;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=NhOzpgd/Kkl/5KCBO5FKIUgG0S6syTjQOGl2BGkzl7aILvMaYNMa82/6Vo9l3AkaR
 WxOrj088ucm5eKsi3BLtO58flQ4d5s/ZW3w7fZK/1l+cklvy8672GjP1Qc022a7Fbd
 sgx4IEm7HqFFj5MXVg2hi6MPaQ5vLTNOSeJMLYhWf4B9X5Hzlb5fwcXTqsHcBxgeUJ
 fk7KedxcPabbtrzuB9TCiZ8H3+qlCNokWwLeqJ3gUqCIVxNftoCJjS/IZIHYA86qWg
 k8pgy3U80JMo9zNf7MBd0glCR6hbc0KwRFe5TAByohL9cyDDJIRFQNJJHnvRz1STQo
 iqqC1h4KoX1/w==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 PKZlM29A/JoHq7HQ5w5DThfago6qGIWuTMfAhn4Qk8Q7qdKZMNWYjKBKN/nVL/+/Dplf6MS3A05
 tbDtW6bK00tUIm5Tm4ZTUZHiVDJBkI3vE/ZMIN43ldOtx3nNTB1Eb5c3E1OnonupZokEEKMdW0z
 0VAlLfzj6Dd1aXfzxQ3bS8/vkZ6LgYY8msmuPa6c669CLEOX0G1XsX+6ZTLReL7V0I5Hk4K/TmL
 jaYJKdEtsHX/GYChPPGhj2RxDrhTj2x6zhsgwVAM6Vzee9XwoJSBoGwGrqSwA5w1KcAQxfgAsQ4
 ri2qU9ETmM+1YpIrqNigU33XUDH9iir4EEze4VaLcHl4wPnMs/VocDgE8lfKfkduxb7sGFt9GFf
 U0MQc38i8eh3/G9RoNLyygCvMoaZ3eEumSeLpm72eVRf3k4jsdmCqgsiagTuxl932nqP04bZ/Sx
 pOnuhVLAr3kDOOMCQ7s4mtM+KMTRCPSmZceqRcuFyktZDRHjagnp5Jv7cMBeW+slP+3bJdjt8Ib
 F35zydG29RaCx53tFs9geSpN/7wJPX2+nNsdEmCsPx970ZVLgp2eo5OwBe5lOB5ZCHVdAdbzCBL
 UsCeDjI=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D54FA4C5893
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAm-000000007Fz-3Xey
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:39 +0200
Message-ID: <20261011130058.3443432-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 34/52] package/kodi-audiodecoder-*: mass
 version bump to Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk    | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash    | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash    | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash    | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk    | 2 +-
 .../kodi-audiodecoder-vgmstream.hash                            | 2 +-
 .../kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index d011e38fe9..84eb36bd80 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2828685f1c353bf7123d0f9e88b28f53064388f6ea3ee357b8fb22d5c237ac8  kodi-audiodecoder-modplug-21.0.2-Omega.tar.gz
+sha256  9a0b5bfce44d937726529a5c32d1f33e4d70261eeed5ace443dffd1d159641f1  kodi-audiodecoder-modplug-22.0.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 15a1d96635..9f3e089527 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_MODPLUG_VERSION = 22.0.2-Piers
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index d743433027..7093b6c48e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c82bf0ffab2d09f26b84d382fd00f70695d5f6a6d781be2818f9f5e10bc675a  kodi-audiodecoder-nosefart-21.0.2-Omega.tar.gz
+sha256  f0b89b0ac85c2248c6aeafba1b805c2c21524fe5dd229f2a5ba362b3ea8dd313  kodi-audiodecoder-nosefart-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index ca45739a02..ede46e0698 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_NOSEFART_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 87cf151859..c03bf7434f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d10dd65baed2db1272ff57fde76f0b268a4a434d57022539c4dc5bf6f8b54e  kodi-audiodecoder-sidplay-21.0.2-Omega.tar.gz
+sha256  1657509ee534600bec9f66cd651e7d6342502fde1a213e81a807eb17feb3c565  kodi-audiodecoder-sidplay-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d98fc4a7f5..a99cd32f9f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SIDPLAY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 0ebd6cf128..16e353d2e7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98afd81a9653efd9c6fe69dd7918755c75a4671322b793a35bce610acac0d128  kodi-audiodecoder-snesapu-21.0.2-Omega.tar.gz
+sha256  5bffae158b9e02d2fba2fca7950fc9497dc65928f90ab336f37ae51819b662a7  kodi-audiodecoder-snesapu-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index aa8178c55a..03b3e121a4 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SNESAPU_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 560c93b74f..9d463dd168 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  089ddd6c890e571f69eda0a85077d8ffe91c4b31fd0f9e20f47d4053c1e984a8  kodi-audiodecoder-stsound-21.0.2-Omega.tar.gz
+sha256  c40edfdc694f62d0ce0129f93b16fafa97cf254526d8d874a473560819c31894  kodi-audiodecoder-stsound-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 2bd37a8e04..086e2ff6ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_STSOUND_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 22e7015ff8..5240efc8a6 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb7bee9453825f86275ae05c4561fb52ee7fd9fa21857e303933cb57d28ccc4b  kodi-audiodecoder-timidity-21.0.2-Omega.tar.gz
+sha256  90354522f51889c341541694bc964f24a4739c342c0c8f28ae3c002ac41eebbf  kodi-audiodecoder-timidity-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index c165492416..ab417ee150 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_TIMIDITY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 010315db59..27a721d85d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f5dddc0e6161426b8c40bfd1136ca555588db27ae78c02178b6ac5da93b377c  kodi-audiodecoder-vgmstream-21.0.2-Omega.tar.gz
+sha256  c6ae413f47d9261f3a20cd4e2d380b44a57a82a93d03ddfdf2ac0666b230ac6b  kodi-audiodecoder-vgmstream-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 66beec0a37..74a5f05a0e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
