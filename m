Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC7BC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE8A440D7D;
	Sun, 20 Sep 2026 17:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r35lPzfOQhCZ; Sun, 20 Sep 2026 17:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BE83B40D9D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924179;
	b=lDJRRYJUZBMq3u9ZZ6Cj8GoMAUCLoFcWAjTYBPr7Au1cd4l6yNlGOYyF8Sr4iyXd1q2M
	 GXOGhGmDP/CueNJZceJaHoRIXWyXqlvFM8yTjsMli8+oUFEtr6/YmpyhDUqV8Pwei6+cj
	 UKr8ajTlcxdDrc6GwdTw9u9uY0sIs9/5rGRseS47SUIrNNg/ZPd8Upon40BqbKLG5ZJIO
	 R7tSlRsL4GTWkoZ3iHm1+mEpz7719Fh093MLpy/BlhllD7b0md9H6wEhXVndDV8Z9fHKE
	 njF9IhJnWCtlHCoyCftY57sArMILhBjCd+rQScSvyQcKNPyUIg3rXRekbZeJ2e/TxMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=pKiSW/FgT6BU95lJnXnTArA43fUIqGqcxqLDPmwGNT3HcweuRHmLtribSoAmbJUJ1Jq4
	 n71NtUvwOmMZ9Xya/tn7/5Lw517s4uhf/Tvql+xlYoZRrAzlm37oqsFmFSLg/JacXElm8
	 aUk2L4sxXY70geV9mHsAzBGW86LKkZRY9X6ARSumJ6fdoHCsS5Q+p66rpnzV5snUPcJeJ
	 3dfI7IYUqjKR2xEQ6xIbdQ2mSzIWEPQBicTsjT78rWM1Nx+N+8N0UPwinEO6bQF+I3NZw
	 zxKCKabUiPD2qH0w3Kfe0sSG0A3ub62g8RiXioR+455Oz6e1JdxAvNtvLQGEkmuX0HA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924179;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cVNpAkuAxgspqA4wAYhZ7Rb2023vkanrgSoEJpe/+AtpUSeKy++2LzI5EssoeK1gI
	 sbn0WFSld5HBg8wCgJOLRpwR2WHodfX84O0zimPEFeWmGYRr7jg3p89nWzq9cE9mKj
	 10OfMVOMbPJQ0EW4csvIFLaM0Lx723W1Y9OfSEFaljx0Xgqm5xIfnQWhrbEDcWv0i8
	 SGQol3spyeEct1BlOFWZJrnjfCDBqdvFcjmg1tquApBGxgJhjmmexmxG22ACaoq5ft
	 Wehgs/gIHpbHmTYQ5s/V2+6Gn8ZuR/QZkacKB2BF/7P3esFsB+5Sgz5O3qEJ/jPvxl
	 zEuUPLMGKl3VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE83B40D9D;
	Sun, 20 Sep 2026 17:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A78B53DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 998A2606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aaAUIROqT9Z for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:09:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E495606F8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924177;
 b=fBYwPcWBVnO0TAjF01zBJ1DUc+Y+k53t8Gyq2pwBBE1YhNi5+7kMZ1804W9dP4Jo8T/q
 IB1MHX2GEvpmkofs8pF3zgdqJm4cbwrfNzH+ZLCPg29YPUA3YdAJDmkYiBJfknYrXk35H
 /PXpsjeTohITpiZQ65IDn7QmF6KgOEI78kh99yvkY2Pkfm8pt+ITtQhoy17HVCnmiscEB
 sAKSgvuRdJt4vpy5TRVM6gfqGSa5zSrNHeKYXD/Q2XguvylF3ic9hJZhz6kLKk0XCs5vA
 2CMdYQy4iG8PiCzI7ZQF3ShhlSW7PvTrtCz5pShxr9BZlKfnSnFrlRQyl07uf3Hbi7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924177;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=eiuP4fRjvfCZEQ6aTHOckismRP2JRblaB9rZBIKpkAcCygj6HXYDBKsKzIMu0SHyulUT
 vgw6mXj5pwzP+qqzlMHgLh8Xf9c1KhmhsGiVsq01w/ENYfBnIeDwN8P2wAsuDLWDiA0v6
 xWo3NiATpuvE62rO+hOi16BcHvOnaFTTIhaHTK1iw02sJrIeSLDaAm1upvIQgnJcUkqha
 ySv9yl8/xZdWSLEOQ8ALDI9LwtABdEvdpi7M4LVQvE77/kQqaFyqJ8FTV9zqTcFg+IvOw
 KdJ1tgnHvX9MyqHFJ4KpQr8F/lULGMZFLU4hOfEM1UtnlCTly9n05VOLmCMRPnG6bvQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=atvGf6vw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=atvGf6vw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E495606F8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924098;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=atvGf6vws4W4rszMCNCf3Hf+Gw5jdAndeqWnsyGts5yfrx6qBOzG+TTKMBjXUD35S
 fNKblnjqptOHsFKrkyHhlR1gEkS3W5e2QUgiQGGk/SxGnCZd1WaRs4rgvgeyLCC2JW
 dOeWdTIR1ABX7BnbtyC1N+qCqqgqd9Zeh37soxfggc2rhrk01Re/qrbN+F13JPvWvR
 +gjBJI+UKWD/FqW+tiRA4LljDwycGQV4b+5kyKzl5O/wLcjTfAzFyv4Nq3WaP6zyo0
 P/O1bPTTUgXA6tfXXmuNkOspXpUIHqW2VKRJc9uEmDCj4nEWiihv+n1m82+2rQ4LCI
 OPcfDsm0vAriw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:FSX8loUr61WqJQTnhxzV+ORFfxcuZdsadQ2Ph7aTamNvyvZy/YRElNySYTGhA0SjszPSb66OOIdzfAopmRwo8K/FnbVhdxc/baYtRK6a2IH/ZJJylrYxGaPHAUbYjzsaH80RCIL4KozMDG28B+142iaS21J/P1T1cijk1+sx5MwoJphOHTVd2Q2NDw9iQ8EZ+SJfQk9K9KPaBI6c4sb3QLQbFltStun3C5AtlLZ3hWw2drGkaZu4JEDBH1bVPRDQHPOdP2DssnwuTP8PT1aiZZR81I5iuKq1egXmF+3T/nM92OUNbGMcIp3J74acznfFRIGc1RfGBWqTS9Usw/O3G7RWJ5Mbc17UbvWl/rw0CrAMvli+ogEHOMILwVRO7IDDOUaN9yCJxvbmIr+YL0bXbt7lM+BK0JP7shBLdjYJhBE1Hd8q8U5aaki7NBUF4fvj44FSNkpkjytMX+53uD5ZpI2uwhXdiSAdVKaWes/VVmArhc0y3X3ln+6Axw8m1J/1dC/NgYMc7LowhBrMOrukbwEmiefCNlJ4AtVaIf5TOAWVYcD0ogTpeplpxo/Xf1wDrHhIY+XmeuelxM4yvDet2KFDTfUyAjQOCeFzPoWNoC5ayP
 cJLGDVZ2JyYfIGN9Jr1gUXD343+9wgQxALR7W1G8ebejVvCmOdMxM70SdYbdBKLErsOaWaBQZ+t3nvAEaIsuzP4cBsDg+yYlkIkLasSFanUdINyQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2E50A4C4868;
 Sun, 20 Sep 2026 19:08:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1W-000000000o7-0lWV;
 Sun, 20 Sep 2026 17:08:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:13 +0200
Message-ID: <20260920170815.240247-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 06/67] package/asterisk: bump bundled pjsip
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
