Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C3C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D945640607;
	Sun, 20 Sep 2026 14:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCEUvbQQHx8X; Sun, 20 Sep 2026 14:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 092FD40BA9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913253;
	b=cpf0Yff5q6SjAFU9j6zi7X8gJgECt4cw+wsObEyVhlP6bati6ERThIOHYdM6BBD8Ripw
	 SXNNKLBSRajV7FEYvFB/vQnPmVdr9i1Sh5zMK/gwIkbEiWMX8lrwT420MHXePKufv4CMQ
	 Mp2xlG1ob+SXSN6nQf4c4AiHCfJIdZFSUYlP/A2t6pSb/iY3g9a/VRsljMh8QLHI79P/k
	 wpMPgjOon3VeuN/fFvaavFW6cEHPQ7sZEbYcnsmCFkfN+SOBmiNMSWEMZGRdD6iUanZ9l
	 e++Sr4ME2X0bOdl8luIxI0aewyQkj0MLExMmaFoW21w2PjH+BSghGb4ypQSt8qrpXXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=PrITHxuZseeywcvBwqRAK9UVYK65WGGBCmX0i/ZfXF0HWwbV/aZTjOpgVei74F4KWsFL
	 1u2gniM0b6Nzxi/6BGyHoOCb9tMBkhkrzuyDZyRL+USHhBYHdNx3vaIaHqQsXFHnguEFi
	 R1r8giGzO62zDCnA482brLa+Os6zKmjlzVMOMs7vtpL1CviKqGbIl5OBWK74aaG/lTg+h
	 rSXj1ihwQBb4CxFCEF1IcRccwhBqPi1ohAMGLPpszO/CGS8ZGdcgO60rzGJwuZlg405bY
	 fdfy7rlJabpkHVg3sQRydYwVtrfm10rzNi78YM1PIqzDmV6FwUmfEAhUe4+Dh0Wp6Ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913253;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pCGIe9DCOA+Lyw/hbW5hfhvQCcEOxhxdctd6dvCXUZARawXX8R6U0h6orOe8FVkR2
	 3bptRkKNV0sq5LNXXZtaFS5UUkXzXoUzoxyca7+/uwIg0V66vuvKLMMUQ0Zk4xZpG2
	 iWneyU01Q/7FeGd3/5EMDS76UsetNbA5RqcOzrUfjJB3ofhE3MTCg+Z4Pmba83ihkn
	 6yxOae0d/00ZZMd3uM91UrZ+5mUgOUWudzHRl7BsnipCnw7NDqi04eFMsY5MJ3UH0A
	 pjQDcFA5V6b8wckNP159WNElMJaa4brX3BFtZd3sAudwp1X784xFusheQOH5EwvuK4
	 8OZ0roOmoevFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092FD40BA9;
	Sun, 20 Sep 2026 14:07:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0D5C392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969AD60638
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVpO1YSsImlG for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6ACF560621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913250;
 b=cgeUVBKVC2+E2lfBQp5BmFHRJJFYZrWoDk0nmHDf0n+mLUGyZQ0Z9+7Q8/o6UEAV1nK1
 ekEoU61HvxTWTW1Z1QVk7mwbXYMKTfrTmfONz3OWIH2hCUI90iZH/dy6zWVriJvOrVm9B
 dzs5noi57/n6PmbCIqat4KMqeGID+4I7/wonQPA2zolQ/ayJkZDRvqlHbz8eVXm2Q0sZ4
 DaKZqacs9WGl95pXj+TVWWRwVKJyXClC2N4tF4Q+2l933tOt6l8L/8Tw8iRFt9oauzl3r
 tva28wz47jNlnkkH+Yb0eYDpJoB0EVM1kkndAQoa5CtJbgoaH9SutmZHJBmA0l+REyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913250;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=XZfbkgFcH21vKwaHV6eqoiAXCd4xn7s3vBr6jaS2aEigOJeJkwFcOIMzYQgH2w1mmYaW
 0feZmPkn1MMBHetxvBgguH7BNqVlL4Z193NEdg+cMaaRsxhX70NHFunjnEq1mKSK/Lt3y
 uwiOG++gAl7G+pIfvOhxOZ0g3CpGhiywE8hTkBeLeZ34O9AM+yufSBX93jNfFvnPNcpRN
 TSdAl3Cj2t8ss7Cu2eBJw5J1xHyAJEnD2e6muVwqZ8zmM146BEKwfi1K2CQcSAJUPBw4q
 5X992ze3gL7L+fyepsdtPlRAeesH0F/5LrF58TkuB29sdoXSJOKMHRGbcDzNxB5kUFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J1v7Rz91; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J1v7Rz91
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ACF560621
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913168;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J1v7Rz91vtn6x8Fz5pVF0AdfVZA8J+HHRF+RRQnu2tnisOTdCvfnUD5bXuchEh9IV
 V9B7mc2smt1GywQiGuu+W7egKhvQDIj6nZ36SSiCfIYfE4KFEz8TcHjCaJqK8QDudl
 XRgaPBywdNWDhBZNl/C0CCKuzW81fQzSyB3sVhpYwVmU09+wOiv6sY48itctJ+In7U
 85Oa7XsvnPE7p4S+gxZPbT8UHmCpbixh8hCMDVlGly3NnCiBlA0HUEmak0mzdml6Oz
 aVIA66kOgQ7C9R0hA9xKkOYEfKhQOJ/0YRwbbPCAdz8Wb8frAIkAsWvZYVN23fT1zi
 hXCYGVA0J6N+g==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:xqdTkystfALs/6mBu2Ib9zQEEWCyUCP2Ts/oqfqJ3rbjZvzwWaNkCiXS8mNi6blkpHoI2uQpHWjdSWLB9uqiEh/B1SU3y9dca+9QCEMEQiqJEASu+czbykB6KYh4QN/MWrYoYrPcjBs0TCoXMuye6OZM6F2Uqr2eILSNUrOKMUCSyTv7N2Uk3rQ8TTIPEV2J4RdVpfOTrOW6GE7mj3FHbrtRmNEJzkfKa1XkmuboSNpK9q+r5kROcQnqIcTZIEYoZtc5LeScLv7P74YlT4KfurpqWcmWsL5Ak2uLOHAlsZpeIeGL3jmG2HTVlIhYSoko7SSeL9yFr7uOECugZqz4InbCXczImza+A3QM3GspApgffgfRsC8BdWiW7OuxXT0raejLbhK2HY9NKTBZz+YqZWLUV2teJFQdm++5uGTQcHUwuTMajOiWPAKKURzcYQ9LHNeBt9QxdJH5PWq50oEgzPpPBgtKAIYj0y4Q0nc1oQnCtaGfz2J+xWyejvgl0rtRa5fDpQovi8esPFkVRLw+F4r0qKnqlAhO7awU+G4oY1m/sxISXg6/dVEh+XorLBks0xR6xnasTydYocuUGBqHAEr5cifPyeF2M1WUDk5R9aW9ct
 eNyZI1G1kLjGvP7dOjOF6r/WGC4wm5bRmBA6QnPsyG9q7hrJ6DbdR90sSX+9gIHa/YqYjjP/IA6Nq6y6FYHJjKcUGW+S0nukQ3O4DhmRoxXlTaNPE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A104CA4C4804;
 Sun, 20 Sep 2026 16:06:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBE-000000002J9-0ERX;
 Sun, 20 Sep 2026 14:06:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:04 +0200
Message-ID: <20260920140605.3005461-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 06/66] package/asterisk: bump bundled pjsip
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
