Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AABC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC215405A2;
	Sat, 19 Sep 2026 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_s9VAdi4ll3; Sat, 19 Sep 2026 16:02:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D7C6E405AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833743;
	b=OyA6yQaOZKzumjwdjus8A7u4A04CXNRuMlvPzPbCGHvNyBYr1T1G5grcLtDedSQ+68xv
	 KeJQE8/kN3nJ6jYr5PGzv8qdzI4/iTON2cSHXbBGLcyeoe7abODN903VSE+ie9LDS7k4u
	 MnYje29q4PMJKwlzIIDMvFyGA70KRv7oXVCwdWX7BgE8rDPn+rLhGv3SF0ta4jIitU5C4
	 oVxUOsIEt29aL+PyG8lX8n8KhpDJU2CiiMSs7AXNhvHGgwQlfZY+0ZCTtQvZ+zDksOkbY
	 vW2aPvjItm5gQ3YOxlds5DcEWmKZT5wWO6Dys84KcKNT+f4zX+jryGkzUVGptDyOoDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=VNLix//Uqk2mEu2s/MtIAMJHxhR0nEshi4YAuUtZ9+N0VwoabiEFeGABhYVhID35su9u
	 9uO/y+Aq2csDuVHyL3xFTPzpUdNlGMcdP7XjJOu1QqlX4zxRFtHRw2g9RXO9mpC6DFF0p
	 N85D4+KjGyRvd6uJPPWU4WXTLG/xq1fdJaJo3TM4RnY0HJ0IzhKfvpgVy0uees6HWJfei
	 KXUC16MqQ5a9V7Gtoq/AxyMMbEQ/Cu+nTSTXoM+klbZlRt6zAJFGMmkJ1BOQJjU+e5b0M
	 +3JYTko4e61rHyFUgs8axyAbMIMZKbtRMBG863P3w+WGW/XtIKB3xxIi+xNVcGzIaVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833742;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kYXNk741rdUb5CJR/+FQQMK5p17hSx5+IOGaee5Ceq4eZpg6YMEHKHFJBeHCxyWyv
	 bvBoKpBzEgFyjZLDQUYvPoq2cXqUDc1JKWFn6PwRHLhopPMOfl2K7p+vUaNlUsVVya
	 THJ81yJHRwfsdrrQAA0hznn8juPSNrrH15ifb9YsQ6TdmL4LHmuHXUWDad3xjS2Bho
	 itJyvu/YYEFf/hEdOhv8BYfPwtx3rlet0ro3HVOTBZVSSyveapDtTZmQMICUpfeTIP
	 g4eGKFZzhtfnevbSHSMbXj+kwnTswQuJ86qHuc2eHBKMjcgLB4dvFMDR/6U0k9U4F3
	 +R0e+XvlCw1lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C6E405AE;
	Sat, 19 Sep 2026 16:02:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4DB224D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CA46400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnYdoQlcNLoz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:02:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6942F40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833740;
 b=JHtPPw8z/i2/etdG6SlMPsWaJQIEh20Dp37p6gCx3DcK+U8oX/ojg/64089l0LDdqrTf
 2B2CgtJcuDyJ7OPNraCdVMXITF384va5TzWzeH/RlRCuXHTpckDxC25/lG5cReyjZ8aZg
 EmjLUfkJOfVIz74TGQMIdXtXRV0SR6eQFitw4XxcqJg94H8hD472qxkrkVINhYKp/EMYc
 OpIUvKoVDp8SsuDbi8WuKYD+cyZt/cXv/ot2JGuyUvEGaaLsHgq0k+w6ivFArUpya05bo
 7vvNxCqDQKwZgUtgx/dAMYTNqnSPCOfVE9DqPFe8T5abDywW9E0e/s8Gk1InxrhR6FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833740;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=qnjDjSt+YnsaCT1kcB8xxsl5viJ94NeNrBrYrtdTwix1lyiAB9pyAQFtRNcpMmhYVkAA
 krsXjtXTSYp1gIHn2tqoImKuorsQcy/oeV/c2RyqNE4Lh0+MYO5X6pQLhHAzi601XGpAl
 nME5HScE5pdf81XCLg+nUOWco5SLb8kDGb4mG1HM0amutMVRONLtlPKNdYsTG1TgscMDx
 +PeIHketpxpzWAm5EuNEfxo55Ep8Kevw90oC7hMRDkhaqzJMurruBlYseL7wmiqa/JtD+
 OlRFyOoFPMpMHz+Hc7T6K+3j/dfRYs9yOZJvCtmmth4rNTze2ihUap62WkY9+eOSwGw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rKxBs96C; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rKxBs96C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6942F40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833532;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rKxBs96CsqhT34DgiKkDeV731WbO1MaoATiznoGK+rtSN13as2ZK7BpTsh5vAPI6/
 E2059bliHdz0ztL7LfvUy9a/4Gurf4BzXV5Di0P2Zi7z/S6XlnCpLpxY6W3SD/PhCE
 ucLXiVTKswpQTXKkuCTNoRZi5fLAPr6Ygnzny8asLf0fXGWxYSKFs5OlQA5P7oe+dk
 1Pd54bINZAdjKxLJOL7NCTF8UiPQRTav1iqiKzBC753pDv7IMLt1CtDC4cFd+wkaTm
 HMRLGqt7vCgKHOt/nBkjzEyPEeYVguklMI7bBp8dWmdg1emx61KOp7Q6yBjZk2vRtL
 xKVHSHS5WOpNA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:oG0A1ShJI4fv3+ZRCI78/8hC0VOlgooqGo5juqA0lHvsbwUL7CMNUYRizDLP6cNMoqc3prLdgVKMUVLdJTpWJ5z8Sjmj9VPxBgRLOPL2AO0hg9fL3VunIsoL3BkErN8/FiPJkKYoMgy98EVb6oLR5I+rX5Tz+RatRnLCpoDq1GN1NtYLPO/TGBtkokv5yqHlIgAOZVn6o/bNkLfpkpOrUqLUmI7pyQochh/NKrIzxouPidSan8JPn4Hv1UwWYxcvDkwGiLQr2Ca6wH5s2+WFpAvNgkurRDSyV7zRiODNUNcuNak8UyBhReQ2TkWwocoWQtZoVQblipo+eDS3RKuzawhBtZARRLYIDRvRWbyy+uk5LI+tOQa75tOrmqBRzShPk2A9FarzTvhdkULKTJGkBdQ3Fx5mycvJgRhYu4T0YbYQ7ryEGsJbcbQJ2WkwwBeOVNbAm/Kwzi9pm6e4hgUA+oy7aIXLyFqQ2XwBDdGR+a0sci8Nx89drQFM8rW+9xFpuXEpArYTpvMM7FkLl8XT2JxcU1/8ernKZ5K15ZfXbIxTUryihDaiWo2nuKjMKWKEEbVRZTKozbhrTUNPF2lzK+lX83vE3mvFWKuVYs4ommHC3H
 AJex35DOM6YOowWXqeBaYskHfOzoSNYzvDAhBto/p8bLdUDxfBrMv+VZVPDK03qdrrTwUj9/3ksQfTCTD1APMVOOQm3W6tK9U9oTZ1aHfFKSx6
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36D55A4C47AD;
 Sat, 19 Sep 2026 17:58:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSl-000000005Jx-2PRp;
 Sat, 19 Sep 2026 15:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:39 +0200
Message-ID: <20260919155845.5776-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 14/77] package/asterisk: bump bundled pjsip
 to 2.17
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 7f48325de69ddaed921572edad875694a8154419 bumped the
asterisk package from 22.9.0 to 22.10.1.

This bump includes upstream commit
https://github.com/asterisk/asterisk/commit/5d543ad80ce6ad8a697cbd6c1938565047d26a99
which bumped the bundled pjsip package to 2.17.

To allow offline builds we download the pjsip tarball so we need to keep
the version numbers in sync.

The autobuilders logs show a download process:
https://autobuild.buildroot.net/results/400/400e53158f11926446c11d22681eb8a9430caf1d/build-end.log

checking for embedded pjproject (may have to download)... configuring
[pjproject]  Downloading https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/pjproject-2.17.tar.bz2 to
               /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2
[pjproject]  Verifying /home/autobuild/autobuild/instance-3/dl/asterisk/pjproject-2.17.tar.bz2

where the tarball was once stored in the configured download directory:

  --with-download-cache=$(ASTERISK_DL_DIR)

to be used during later autobuilder runs.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 35aa1282e8..1bd76ef865 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -2,7 +2,7 @@
 sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
 
 # Locally computed
-sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
+sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
 sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b6b40645ee..8d03f2bdde 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -12,13 +12,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
 # https://github.com/asterisk/asterisk/issues/671
-ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
+ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.17/
 ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
-	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
+	$(ASTERISK_PJSIP_URL)/pjproject-2.17.tar.bz2 \
 	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
