Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB93DC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B7260699;
	Sun, 20 Sep 2026 14:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsGTT3KgKGR8; Sun, 20 Sep 2026 14:12:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B12746060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913544;
	b=oLtvigjjzGfmcqFWXKm4V/S3DwoZ/2/ihuThbKIVXEg4hvbUiKZiZrBoKwHBLH4PALVJ
	 TodomKRBb1YeFkikc+O1QHRCiME7hcAtGFzS53JGpL1t3DZjy3JMyYeBR0qvQuHJ/75zl
	 xVcj6Ebzk4n963rwjuJu7JMtAEXFubagskduWbay84EngNwlFPIbzRNV8nAe4c6UTsxLC
	 da3QB2rOb7FS9aDHR4duZsy4hk0ZdyXPfZ/ZD6Gaep149cQCM29NHFL7Fjwgu2hiwHGLv
	 U8q1YlEy5KXbMvPFXFc1LqbdLNuXpfuVIhreM6SMmdeMIHn4ms8FNwcD2HApSKOtcSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=JR5b+4UtAF3aPlMOSBLcL++TjPYlC8w5N7T3a+vDV+qD7sIpYld6keIiPtVJFXsY8ATG
	 4uWDORGrrC+cOQ1pBZ7kc5GD7kGUQSl86rEi9YVK7EcqvZYQdEO+v5J6isofurWsAFKrq
	 b96C3Hh4miNImz8Bcd9eIKxbCO0ZExJ9P4lehy48ptus57OQfqSknQMkq5/+CC96SpqtD
	 mbLtQFWmOWcXLDAfkEeLTzG3b6b2aBpMJMgPi+2W0MRSRVogF+WtRW9BlaeZFak0tteNx
	 iwxgL8DRYpfpH6iYfDPlg8enuaZcsO2KKOen6u9YM96ed+ichsGXDQ5hvakwYye1bIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913544;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EEoHb30S8+a94X0z2DNhbVkK3TFt0xKRqbbKrsjJ7xWb81GopC67c39NWyhsZB4N7
	 idGr8wPwgzErtuCJyJ6e3OjR1PpweT0AYW01k7klFjBtfuiYPI1iOtdP3lyt+IdoO8
	 7EFWNUG1hPH0VR2I6oc8G5lyzNc7PLGWDcu+i2U+NsxNrnkSTYdwplKH3svTV95Zap
	 82ogiVq0VAeiaNk2ovd+z6JUfv9slFyRXKV5ruik7lRFr/Bh/jd1UEVEFBlOCGsSMG
	 YQzbSJXpRQebHvjKAJMCq6muF7nkEo1tXXykE0JNwJyXo2yq5ZSfP4n39cHVCDsgpc
	 PmODSGUSj+zpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12746060E;
	Sun, 20 Sep 2026 14:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A44C2371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95ED880BF7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH2F4As-jObG for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A37C880BEA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913542;
 b=pf6ZvVIsVA/eh3pJ3RQ9VnEtuAVDaRularee+ctJ5kpnvJheJawsbt2NOOR0z4SgG/6c
 AofHYT/2lS0pdNWpEWaxxcjNsWbSNxkaVBgmC1UAq+ygW6kBU449tFcl+eNAVUeR43hqU
 Sa2sCLLuM44enUjY37hbN4uEUkpZmjRz89WfPua9cQAl/ikhbw9ZuSRVzII09GkLFi2sq
 HYHAsEJ9UMPBNOIUZERJyf1rkZoXVyTq3T20x6ug6uXmdz+2b5IV5SA1PtClYrsHDlpN7
 fcEft3JqnmSt2cOdcmf2nRb9xgcjSB6fzC1DsNUnk8CnheMuE7J4RMIh68dMhoniKjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913542;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=mXli/9+Mx5YJ8E3TwRjpXB7C0k+sA9cLj0a6PR4UaNnsuiQnsQmr1w0E4rEcYKcYSfid
 3payBdwq1utfFhHu/b2RZGIqRYN0DLXjGYddl09a/y7IjLOohdQdrmiUu2cikoYFEZ7Mh
 uhjfqw9rCWdIwGcZ4AH8af8XUpZYnuOs0wu17llVVqY0pJZob0jWfJG14Vd1P1FeSouRO
 t/Tq9vC9C9Zh8bVtrvUSuYZDlS+4/K0aMz+g+g+RmiV8lXCJzM4LgzMPtYdXGz90+KE40
 uh0a8oSxYJb73Y6p0yjdRKCtK8/ojMuFIxzATblqjFhBuVykG4I6m9YUpjpnXPvXsGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bSrQB610; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bSrQB610
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A37C880BEA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913233;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bSrQB610NvnnRGW/1tD1zAzZ6SBjeu328o3qy6ZUjEJYYi4fo8JiROU+Md1BWOzKg
 QIl6RpCWnUS4Qt6pPbynPZQ7yIzl5oNJrs5ap1Kq7JBnW4wD6/EdhSDyLO19sY1Lbh
 iwmmnZ2HenuKVDm+SaH1WktJxlyji7PkY2ihMFlmSWYBtxGeiSjPqpwyfeKaEQJzc1
 eNjur3pAn3LwG68xFVfxQoTyB5I0e0oxF+6k8wR/sV5fSFbJtZdRidA0yYSlaL5Stq
 UG85kfPAcYpFr9VA0pmQ9iXziJWWaBbtxmw20/DZAkvEdcjq8etZpn+AObUjB/cQat
 0bez9P7pnqKNw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:5gf0fK5jx5QBjMu/19L156SuGv8Ncpj+qy3avE7sHeUY8q9zcGf5rKYmRCRAHjA6UOO6oWDGMC8+ADXJgfFjTZgaSQTjeQv7OBHCJixic9UzUzLTy1/6Aw+yiwaqKsi268ZWkFyW4ZoQlNV+iL/WmKWGin+HoO5otEezwM84m8dCLlbfqpODEOGNQMQKXN6wybQMdTADfsKuFYEyKqqs4o7drsjAJkjjP9Azg3l+8F1I1mTsdtFhD9eUsWw8c0+LoUzRq2dqQg7EQJjlFEUgkqRhrleHnKOLJWaSY34yx13jw4/Hly+DT0WgJ+qnIDsVzs8QAcV7Jl8edT0b+kkzxJMVITL8fV2BQW7JiRsEQgvo1S1i5j8Ui/DZz/xbM/pApGPL1chnxWvtmJzKcMxCVGJGQ6rGeZoohByqqExpHOu85T4ZWhzVHgx7usdG7o0OgjmwUQTRO7PuPLgsblg3gIC40yNSYLXlqxW4wX0eKPuE85w3KiaZlVH9LSj+Sz/Mmt3vwujo1FQK+6a7yFN7ThrwQdO2putDEatDk5a4q7G/bk58hC0E/peKemgIrRbroS29it3MdNk8NhiQDXoUuvdM4uWW6q8WzgDrZV0yMFMX8h
 BwLSrvz4HGy0dOeQqNzBC5KcKOl73X0j10MdXt1IQZethBG4KWqqZxr6G4gM9pAEGFla6SLEs=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06BC0A4C486D;
 Sun, 20 Sep 2026 16:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-2FVY;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:18 +0200
Message-ID: <20260920140605.3005461-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 20/66] package/snort3: bump version to
 3.12.2.0
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

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
