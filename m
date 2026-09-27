Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF21C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567274082B;
	Sun, 27 Sep 2026 10:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik0Y08KhfTNY; Sun, 27 Sep 2026 10:53:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 59EA240830
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506407;
	b=Nv8kxpgHtXAChTdu/V1H4KG/SeixtI8lXNyehDlOUBMXktWma3SBvUVVpSbZ8M3kabQa
	 xqrujTtQESqxziTy9eBBQgu8NQy+EUE0Vt88dMYGtfkT3iAWU6TVnAcYV6KqsTeWA+d6A
	 X5bQAmYDW71+GRMctBqvBuMi5lrtONhf+LsIV8np9oSkE4AD2IqkoCZnGaiQGrDHwafpa
	 /AlaFFC8YNP7sdxFS6SXTVwNtl5K1cEBQdFTTZAGawplU4t9zbw5GfInpTKaNFFLWU/6q
	 ZsrrNaglwZ4kU/TGkB9Lkg2dPP7IiAHLq6qV3qNMexKKPpCF5VeX/Ix3WUbHecIt53w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=rYq6fyp+OL0/oz0E6if+biM6AX57e1mdOGCqhSHBZxS8PppXHd48wWw9Rm8QtFA6SQdw
	 PJgDaPtij9QyWytCZX0HwIwG/gOr6IOT8HRnGjjBR2hIi/fmDXrkKk1L9yGs3hqclYvFM
	 ouplVRd33BTDSZU5gfvkRb/BKb++HYq5LHA4zKs/W5HnA1r1WnxKBLOOPUIV2TOifDb17
	 G+zRugai9G5UstHhCTBvtnzAD7mrZTk3MjKifL1yQ84YGHDac8+9SMVcMl8QFUWyZVYk7
	 L2IBWVdZwnic80lwBAaSAm1sRkvYQeTUFP0gM6FI3u4kOQXXtSht/vS6NO+/nK6u/rw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506407;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AOVt25rx/gdjEHXnwJ3EhKN20wuyNlc208Q1FCpOGC78797Yn/h9Qkd221bWv3SNi
	 B3ehApyq+QALF8uAOZmVbHI00UEj39mYjZLztFIQ0iSbfOqf6mNHtmdarWAGq3FynT
	 JFnlS895XpcjKy7Hf1Hb8n8puDt21sR+6lwpXm+6q6fl0J+EsIfwbJ0btatdkKvL86
	 gVX0Ds4m5q0Gh8rZKUSGgdB7z5R95iIBHUdBU+weHaXlQSXlL1BMctbtR4gpWuI+v8
	 7MLcbqn16PYmmApHawUQgyi+M5sJUeiNxR1NIjReebzF6qBCaAuhUYoqIQowH9MloY
	 L3ZMskMA6pwLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59EA240830;
	Sun, 27 Sep 2026 10:53:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D8FD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9543D60601
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-WwjdmRHqSr for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:53:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6EA1360685
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506404;
 b=tXiVKLqgpa1rNC8DTPanEDHZoQ/sZfzkFPRUwLFvCBDAOBEgsOZWmPOpkH2Mj92ywY/v
 PW7XkM/KiihOg63WLCeY44rYsCzB1RJY3RAzQ5TYWqAAGUazReqgx34yRx/RXwhMm73fs
 04Raaa0DoqodOoGnR4KG2taoRsQmVIkqR3VzJM4C7ZPYJVfHgJYaqChnpmImdg29D2PCy
 mOSTy+jXKiOxO1EkQkXvoz3e0g1wX58pENzpl9hgCeMijrTPrBfs1PxNid55smeF+ACT4
 T4kpm2AuLWPxmcMgzFH+UwQ6BRa/MkoYiYgx/fklz+IhCU709LYTdUeeedJdAsIGXqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506404;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=UnJ92V2CX93vFO4qy2hjq/VLf+t5zRPV5h9u4sofxmt/8yBuy3+x0ZItPV4VOHEoucU/
 QrHstQme6pGowlRGFF7UV/oLjQxrTjb/hi51uDSK710WjH2kWzk3iUTLJHvKvZPk7NRbi
 zoXzhzu4AbIjTkVL/vJvce7CPBuFvW8xBvyYDEGBp8N1Iw5Vhda8L9s7SQFAYNWk+fD9X
 IBJ43BHS/Me03Dlskd+N40AYx+EwUr2fCm3e9vfGkU0Ji8w18cbyTnG/0RfLlFX11n8Lh
 LrXBDtr54Ims6cyEvq80CSvEt7i/YrHAc3yxXaRux9GEetWVJigHH2eH/eBkTY0qmyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QKialEcb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QKialEcb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EA1360685
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505853;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QKialEcbAK/CSSjVONYGdrSJ3m951MPWuCMzU0rSlxhFh958aXq0YCQ0MuDvw/Jmh
 A7YQb+zf5W98PNy3cunJH6sx6k6RCQldvcFyFDLnVUo5NqR4Lq5MA36CxfrVYsVaoq
 wnye3+Xb7wNg4sBVqqvjZ3DBBn4u0qIAzMEZzfnLV+iiBzJF52JJnN2G+UmMb/uuKG
 sQ2/vLAoZAI5IbPZunM15jR/P6uPYuX7hYgLkAU3qlx7OaWpAfSFRdk4OC4UcVHrQ6
 DNSIYnjrYGxv9ObVuETFMiUJgJt7e0i2grVYTryc2nJd+a+zyNxMPGtnckuZj55hvk
 XAaJXSGVF4//A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 n7yFcx8OT0QToiCvIGFlCKQN9+Ub+oCvMBORdmry2yn3UvmUkMenpJfSwh0zvCrfF61O4hM4ZWn
 0MqusR+ekiHftnryEImL0O6v+eIDd9HzL27xVsCp0wmgk9FTkpliuWtcZCsVhlbnDllwveQyznv
 BWHOyUAZSKbeEWzxcrf/4zjQl2Qx83VOOqLDjoUPfbC607mW+wMdNiJ2UAvGuSrNsNLBjDxMcRs
 8LDbw6J5vJsY6UzaaLAor+pKTpIemce/BoqpI7TKuQLTYtHfCdyQyS0eAIFjMxiao1MEj/bNy25
 GZ5ucLEb5i7n8yvLqW8CmZ1wfPgIfyaIKbLv6NtuzCl62GvF8VOoaVIt6C62OoUvbrqSefRk7hU
 eItuSfPUmSmAiDmbWyY00Rr2iEWCtCkbBEfHIrx2v/DOEFYscmQ/jU6S2V7stPJlia7scNJi4Kx
 rwndTtec/J0Gv5riLa+oFIZ84Xnz6zZFJiP7JLGNjZiIvEoqnOr0PWgzOuzCI4DwqSZ87TAm703
 n8qZ2drEqEtwQK91hxJmNTeQgB0M4qvdLMb35sbbiO/aT5T/sQiS2DOzeXxBIccIV1UTSCfB7mq
 hBDEzSsTg9vngPWevmZ7B6umFDJVAzB9tUefOb68jRLNFuH5CAq/utvhRsDe0gFGTDJWy8OaIHd
 /0xiVJ0chka7SqEaTlbwb+mVbKuKbvFVkuaCX/vYjcg65seQcWvZvpqEGHOQI9A==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2C93A4C4FA9;
 Sun, 27 Sep 2026 12:44:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLZ-0000000007a-0hE1;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:59 +0200
Message-ID: <20260927104301.1801638-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 21/82] package/asterisk: bump bundled pjsip
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
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
