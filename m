Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94930C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4A860621;
	Sun, 20 Sep 2026 14:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo2YcjdGUjB0; Sun, 20 Sep 2026 14:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6C4A660638
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913265;
	b=d5F+VomtSSgdh5OVIBSMA2AEztGio2OgCPDIvuxgYIQfXDpOuFwcdzS6o8cEMhKXsI1l
	 UxelsnCriHOzY5aOii4qf0OYhUNwQvcEbuq7WmOMk+3/myPnAtdnsURUhdOQvlMX9dB1H
	 R4PLlhNaeqteMSJkUZgo5ivMgNBzp1XhIvJ0K3C0HF1ap86Hz8v3xCamD9PwA6UjxAurT
	 qSvYTynDsHTupfY6lVN0/O7U3W6k05cZzXvvLuzOlgnng5oiDTzwddnL3ZAKQE1RZknmx
	 P9Hizhj6ji4bWIdp6aCVvQWug13edfyVifLWyDMLxri0Ia9bU6DmhTBi3F4AjnUGijA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=XTfLObOaANRlTHtHnCJmkSX0DLNCTRbHMr/PfWklIp+LEDlvIDO8n82w1m9KOepktl8J
	 2gCRCxdsZcFfKRhNpUY2gVc4As+MAsApRB4roYbgllAq/NBte2gkyDeYzTDpefSM8uAqP
	 3QLSEUkueZitRndkImXXQt/A3N5lba09taMWoJp+oZZXmP/9rmHK07AA14INQWMMfCyh0
	 jUqKt9WhnGY5zCeFK7EGwVC+9aKG9iLWF002DJQW/0W+soynqQxPGrYjdtBKHAWfkxHDP
	 hJPaJBk/MGbe6ybocd9JR7VY+aVAHBllB+kjAAtprvnQWE+p5ad2KyVf5UulaVlSB9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913265;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M/S2O2TaKuRTNhw7TwtpJX4ljgcwIcqwAVcIjPOu2d4aBOM8BSgIB6fhDnEKKKH4w
	 hEvlci/ZlpSYL+nNNKZiN1VsRFi6vTu9haKLL3Z053H5Ao/YTTdZniwvY4LQeZzwFi
	 xagS173CXRgLeNQlNetnnRQRkDBxy+Ik+7iTAoE+VDUl3cNBOqz0Hpvzz5Y4iV9Ntf
	 sU681In3n853xnadVPDoFeBjRkGggU2Y3kTzEoesSC2qYqP06AOv3FH1wIbpIM6PUh
	 aBecMtFFu2TWMI0pK/JWyTbuveUIIC9iNoNzs2fg/1Ix+KyMLZZ1Xh2G0EblhLPoQ+
	 ONEkXurA6qilw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C4A660638;
	Sun, 20 Sep 2026 14:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B1F13AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2127080EF6
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwk8jRc89eaE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:07:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 21B8E80EE3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913263;
 b=oJ7I/ZbeXc0YZRjIu4ZXGr7yp2WxqcmeVjiroxHA7fSZeUiYC4P315MUA20zSMdE+Bn+
 hvkQCZATYfLsgRsGq3T/vWyPV0dIuTBH2pXlVJH4PFmXFS7TX7ihb08mQ8LafXAQhjggm
 H9Narie8VG8w+FTps+S0ubN9ADF1fDKzU2LUbgz9JTisfFnNakhbU+B2KQzgoFei9rNF0
 RUL6NPmo+YLx5FiqKAyiJKQPFU/sncG1VM1nYTyDkFMUnp+sbxQrO2GKwkK4pY3jWzVZP
 3kLJ/RTJCup13FZKBKmsGbIKHup0mVEpkfUvp2LjOSsfD3cdTKxjvjj7zI6dxQ0kb0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913263;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=c/y/Pb95aTMSTcb8tgYk5qRqE7OMwo3iYDvesg5a9GnVfHt9Yr/ROkf9hcKrkmRgZIH4
 IwjaJ8ep1rds5N2+PFUdLU0hINQy0a4fMSGWukGpRse0JnE+nOgujKo1W2FnC2FOz5eSU
 4Gjv0HKQ5TBs9LKrvuRXO8enb0tW9QCN+GSlU8G3QriZEKae0QH2oqOMh0wpllG1PD/4z
 ZU57MscCq1uLtRGlj+0uSXiNNt8zzmMQG2kuQOsFQzMQtOtmDYz7gbRJCVUy3ZbX/63+f
 xPV/ltxxHN98TNdQP63GL64ToJKlCEL/haYYU7bZIB+87va/+1HF97e/eIqqIIKmH7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="h2l/pspC"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=h2l/pspC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21B8E80EE3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913168;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=h2l/pspCzRFWap8VAIOPWltBnmMvCWxoyEDogoqJkyIKd3qeLUM04k3kZiFU5N69Y
 kBGYiO4ogDRE0LVXlJtgogokPZnxpsl/Kq/h/3V4Rupdy4BP7XTaoSOhtCXpqEv3Ab
 TvW3Y9yahSUVBXNgU9MtSnviE9/ZZBDicWf1+0coXVHfVJuKarkts4SlieiE0hEA9A
 /HFcQrFuZm4pOUyhe4V7Tx8oI1wtEKInxrVd/i7Yzs6hrm+qm3YsgwKhspKDNd9zFL
 MIDzw0/Xv7HDRKbMZQHFkx3D1vbOkhxYSbHpwvLAlOP9W4Ge5OfgnZp2zTF4szI2ys
 dXW7T97yFGd3Q==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:A89ryduAzMqi9cXuNLA3N21Q5+mrhqVqHZYLFGtwlC7qO91FryfL2C9DWbba7xsLL6CqlaHbk8IOXckxOc7zn5xKux7+XDAr8tc1xz3odms8KMevjTOKFcL6y5gKA41ZF9C2ufJf5sW0+zNXOE7DwR8IJpsDBEM/Z+CGPH8925Lf8Oy1jq2M2d4H89Kh54pdpirYk7sCFvtoZzzCBO4KG9PhbZKUe+DI4SDnopcufUPnXQzF+NJpEw92mZ/f6N7/HbbIqDR5UXFnDKNIxanC2mCBaCfYLKDGhr+JJx+j/30Y9Jvwe9Ao8Loo/NBdVeE4kY9rgQ7CwGn5vQaWhzprTtOyhmHYJaIQw8M0/0OaVPRfwVTz6P8ptxeXxKhLn0QRsYqKHdJuvvhpPHwkhzqxnOV76j0ANBzHnw5DxoOzFKFWJd+5ch9MuDUmxqve2n2U64MXVA3QJnHCUbdiQGLRt34Y22Nzp69lAKtTYC9XDqBkpxNFcawd/4vjzMb2v4on5KpGp+9w4526ctmerNvmucSCMM7c4EVsbuEDvacRJRTyHgg8eQCsHvIZOBE5csSqCu1txdjPsDYk20nTATfbl5K6oQomtgUdOOCA8L1T5wn5NV
 eh6VoeAMXHc3+tCPLs4pHGP1sHm2+V35XBNWQjpDIkO5vmGGCeEjqQHaC4YN4nI8XPHUO5xlas4lspt9q3JPlMNugc/yDeQT2/or7A+q9P6Zpc0cM=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE86AA4C4849;
 Sun, 20 Sep 2026 16:06:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBE-000000002J9-0k6F;
 Sun, 20 Sep 2026 14:06:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:05 +0200
Message-ID: <20260920140605.3005461-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 07/66] package/asterisk: bump version to
 22.11.0
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

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
