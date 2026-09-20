Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC6BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C22680F3F;
	Sun, 20 Sep 2026 14:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVUoUJYRFcpa; Sun, 20 Sep 2026 14:45:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0FD4580F35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915528;
	b=l7GEcezWRfL3fw1sPtZ56PNzJ5lw53ijvpPNGenIo9d8LAT07kTyJp0g7uISvE2P8faA
	 +LaqfqdmcUrMzlPTqrTwgxqG7wKokdnJIsgk4ioiKtEKDbZV8RXGuXFLnmf6WwdvWWHiG
	 nABVZgJQiCRjP8Eu9ku007cKC8qgLmo7SvcFyChHdCznnwW6cs5+io3sNcCpaseybpzEv
	 7dqEMlzXrf4n4R3UrHKFznZPeobXpxaDALajGf75vbI25BalkBfMaLD94s0+rWzsCq0VF
	 gbtMDwCvVbbNlFg/wAg5nxeafjwsDHcyVp2OD5mdmU2W7xDsUSSTNXhCOCksRVOQ09g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	b=mgFR1/z2rvtARE7xV7QEk2Bnu06RM5eEfqiC+LcrUfEw8qsxNsUqW7YSsAfsWJBuINUi
	 Y7BgBOqrr+tmTqW46ka1xX07af695C52vBqW6PvnofWxNsLmgjPy5meKeO+OWy9R3VMMR
	 KIXEsroufb85AvjRnadspGUn0/UGafotgpzwnv1L5tbwm94C/vnaA5w71+abSReWwYAEK
	 RTRX7v7xnpZI+iacobJo9IgAcBfwo1NAOHFTqYJVupL1ZxA3XzQkIRBlS0L42nGaBfnH5
	 I+j2q0huPBnGyCLp1p29IIoENDr1F4KxLFvVm+V8YtfItZLxYYSWK1cmX16t9TEvPLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915528;
	bh=Ofj3m7pKK7xN/PXqXJkc4/X03e18205bDve+6WimUco=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=laHmlw4HPv+QjoOhIo0TrcZeHP2t0hjDO1DPXpwAmzF00/T2HhnWg1/TBhoiiLNn5
	 9Tf79SwLd3wiiBzFf0OXZFN1n8fjVdvwhu5GFWycU+qj/SXxrJbNI0c1aMvf45DFCK
	 St0mt0OroNWNim7Xn/+2KvlcvGbFbxPIaxo4h0tgMJGTDdkfOg+CZrhexdOyNCDSi3
	 IdByo4DIMZKFPB5DITbYm2FhayXyJLLC6mUYRGBzOATEwQjJOXQnLECrq2xyormxBi
	 3hkVn1WUPuTO6zYA3n8iD7X0kcBj2WfvMsmvzmYtL/cxUq0XZzqIN1+xWdWGHKnsz8
	 dqJ+KsFfgngcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD4580F35;
	Sun, 20 Sep 2026 14:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2762124D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DCD74009D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oV9SWOubMrHZ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 02E944002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915526;
 b=Z8Dr/emLKGm6WJqYAUIGm/RXLciIxp4V0SemZXgNjOHhgYh78qejmQUyJxh7jd7JEEEm
 GlTaGDHRBJmCJ82O8z+oyrJbz39lZC7h2KUKanm9vyz8BD7ueh+8DUx+9YCqqQy6D6N71
 b9EsHCfkKkp+AyG9HW6lSJ+2aLurQwBMXY539RIFPiQsEzb6dXeeh0ZaNPkZywyvwfxVC
 qAztzOfn8J3E/bgaxd/GnzCAg2wkS4vnIZPXKaJF6aatKoTzG3Liooct56BD6/iVYdeqB
 jCp72wJtPHlTowMPZ8IqGlOJCGfDTvbgsj5JQZdUjzpWZ1WzdsevlEq4MKN2xIC2f3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915526;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 b=j3myI+TmC/hDFDo56k1G5rxynHjRahNpq8ykyb3Y3GUUj5xJVAK+xXZx8AIPfT1i1i43
 6NzKM6pfBG+4Q3fRQm60aZIRaaWm88EYlUx5ZMiUy/7BrHynWK7WfBv7D6O3m3OXO/6h4
 70sDZR4MilMFbFXiYrXkk/C+ePnZ+davBlS1N+RbzLqznl3Dan+QhqnEljR5OJb3CBicY
 JU0iQm6HhhtXT+BonfvnkMAnVwjCu1Nb6quyX27bDTxsslzmrBD+25TnrFYiSNCXaIWp7
 8ZuMj8KbNL+nsBmcLMS8KUhav8pL3eWRsOnPYaS1LeSHmZ33Twcw1sTkmjj+MiW49Nw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=drdNBvaa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=drdNBvaa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02E944002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915483;
 bh=m905ue5f6mfXYv6WmeB1eW16yhM8QqmRPZj61avjkgo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=drdNBvaaUG9JMWUXolRuCGfhlguIMymMQu1MMQH8TBQ4UaBqyoOqm548w1J/YvcXg
 YdZ8bc0nKsj7KUVWpluQdfjw2+Sa+Vrb0Bn/5QQzLoKx6ARVTkyxKqjxGbbKpWnRUp
 6iFtb5vAF4wfID+1c/VaKwl9YEL7HlgppWpNUqCoVcKHJEj5AAAcp0ELT9lIoxumhH
 BhF9ON2XnsjJ4tmpYHM8/p4aMv1dwfe156sDuOXPy3TGIuifptw9mKeecHF+nzk0rR
 DBQT1vcC59Z6i+RZYfODwQyhOvvS/bxfCEQqX4ilzt/ZC2nHblMWobkU+uBpMlyDnH
 WFZfF7du1srnA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:md13D9sbDdMuHt6QT8Mwl9RZrqnTVv/aOB7UW++YyMEO7bwULUpemj2LzAsYJq40bcXuPeN+NqcQ3icOc7iqhA/Gfog7EkZZmUwzrnTdDsgbIirFuOEtJ7WMtxFAVbRx6qx+SfjpJSbYnTL12cSPcsy2x2LoTr7Csejb1Yuo9NZh5T2JGKLEgpGcmHWzc77fdzcjNNvIWCEnDVV3aTvnV7PY6xJTRYsSPLAo75mhs+O6zOkVSzNPPQUHpBWk3WA26vbK731MYcNA9OODF7SMWLlXZMpmmfaeyL77QTh5jzdIoth90KJMV9N75tf1LwBXTRMMj7qApHIyYe2RIsuiTOqLRiVOP6MtIWodRvEYAvBtx+PEdVulqeu2FGbLc7ZyFec2qKqJG/RegoXd9q34mldfo0IH0/q/psDLOqiURNc6j2EYPHwcz9mgJC/bZvrFw/4PwzyTx/hRRufCPOEA7u2Po/2a/oha3OiZeNlCIAJLKSs1J/jAyvuH/+GJXBNiF820dkvMBv/Bl/rcTDfYmVIvcfp/QAt631ps39RJj3HuPoLMnhgyCWZxc7ym3P/IKnXQHpYReiJ9EnrjYdS+Zc3uLxPKfF7ClZuNE4ij/yTCvi
 rZySAmLsXd677bX9Tj18GFtA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 833CAA4C47E8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ImZ-000000000hB-18Ad
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:27 +0200
Message-ID: <20260920144428.3009612-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 06/66] package/asterisk: bump bundled pjsip
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
