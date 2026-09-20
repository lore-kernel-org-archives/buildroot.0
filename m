Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098B7C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0C3F40BC8;
	Sun, 20 Sep 2026 14:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LyxphvMITxE; Sun, 20 Sep 2026 14:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 013F540A70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913558;
	b=aNnkWBubEX4twLwb3amwzq9rV1Yf9Slhv9LHdadysrCxEiymgHTBziqDr1mvFAP9udC5
	 5K67b0Ljk4rf2S1DmiySOlQi+gSdE8uoqq8Iut9cinCyZz3eKOIpVw/LDWf8ehqSh0FB9
	 RB5lRWJ6LiksYmcrtgiY77w52iH17cgvSEB4rzvLcF3BRSNGuF+JDmQydXwvV5yZuiN6G
	 /BdVtJtGW32L69IhLPSsbUGkreUvATf6YsCdI2OUbnIie1RNtzNOuX5eU7vTjZQbGmJTA
	 veXjlW+Re5zDgtMdOEu3AmZNTspUJn0xJ4/oAm1PFL93KdQ8QgoXDJx001XGG/79HnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=AYJRrln+Yqgpv5w2CKd8LYekHF3SVENPMNKnkvIZz3+nvYbnGTU/ZRKcykRgM8KzkhwC
	 Ih5BPAsxSOBq+4/NDb7Sac+eRZn1CPlcK/V4zfrIJ9P8aedQRQseDWLXltKnWzIeM5nOZ
	 8T3cNbPhs/l7SRNZVP3N9IPP5PELBmixt61hvobREQv7chqImvez/hzNVgpXvEe2D2hII
	 CqiawhYddp8YYZdLqypYNLeWzqb1NiBA52MWUKtZgdEXScaq7+LLhoM5hyQ8hKoZ232UB
	 kXs93IVMl34oDrCl2qQZergF/waPMlMriCeI0KKM0HifjCxGKpK42rYBAonFOlXP4wQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913558;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UosfTbBv5FWfGkEW8spki88RB2J1r1x5n5l3neibNiJxNnAB1+Ynp9jiD/8f9e2Z0
	 M2Tc+2/MdYTWN8XWbdonHSTJeVmvvdlajMyZHKUbFlGRUnWxM728CiUxQXPugPy/1D
	 hU3/9Copa/T6w+sQKbFahDfC/o4oEjxQEgXXBqJkevMViMS4sOkM8bSIexXeIJxexg
	 yvbzQWXjkhBFd/8Cn1wExXzghQH0jw85Hin93UPmnxxcI/SsB8d9Ct4ovbv/8Uh2/H
	 HPoY/d1G98gG1bHutnc2G4CpGsEzCh7FRSTinbBccIFygfDtBILdPSbKycyMt7piZT
	 ezsboGnc/PVfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 013F540A70;
	Sun, 20 Sep 2026 14:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AFB0371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CBEA80BF7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUL7Vx316UOI for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:12:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9365A80BEA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913555;
 b=Rn6Grej3jOAhzZRV+ktfhBXqaowbvckacdTaIFG+k6+rCyXNOvWz9La1czXkbMnYBZkX
 vPK/wHYO5LuaFap+EZmL5H3It4ztGTyqvD7ARXua80BzNHoAy1TAafOQdGYAd+VFVyHY1
 knPh2UUmGOuzSsNoCQvRePYo+O+j8eMXnn86y9db0rEf2F22gaHh3kqGxt63cKHebzXiK
 3qNyTtG+xjAXpqyeinrr47HEc3mjTMvuQJ7jo6Y37Z0+AZmwhJCgNkpDwa4JeqeD+JzhI
 Hqt/LwUg+r+Ip5wgbrHEoRfX1YBmf2p4JEcWBjceD7xWa5r4yILlM7XHDnYoDlghOrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913555;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=IE3+0RPjvru/ShfhG6jxJOBXWdW0IN8a2KZ/Swrlv9QMOriAEcfQLPRa6JisEIjlC+Wx
 TMPR6GGnjNgqhVYw4FWZL170EFReIRd02t+mizmUDLs0RgrcTffzBVUj69chVIYC1Bq1B
 8qpJC5XhjhSOStSDCF5Yqk4UTpLo2PZwRDwz9je9ejqLnFHfYi5YFSkPqhUZ+dkE5BYGC
 EhJVDMiHje/Uj9BeBaJevkCGOXSlJFloglUibu1VZL1JuiHOxFGfWUHPBYtFa+6qzbs3+
 5Val+4QsgkVSk8/pThxcsT/FD358DUkc50Cd9jM7LY9zSeiZu9ck5UoMRu4DyIQeNDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GXig+iPf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GXig+iPf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9365A80BEA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913232;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GXig+iPfVCFTudA6BRH/6zFmjzygcfJ5HQPHu4qmaf5nrYii1rp5C7Q+D3xmSshCI
 vV7pd20Sgq+jsIzvWvhI1LFRtLMYFdBYuriPs4WaSV5PYzKuZ0JPKQSTNIHd8vkJ/y
 jXbZjuWzZNpDvf8frCjooNWR8Z7YdlOvdNNdc0K5a2UB2H27Ncz5Izn9tIF0TXcNlB
 4hWa7n+bOlnUIZnpY02le2LpmbJViD7IcvLGAqohQ0Js2cPFkicmBfy2MrpbwFn8jS
 cZvibIqrzzuvTmD/4x+Xemr7Ec/9mCkPP5EZqAjWyprk9FbQG8LGKrmTBe1h8S1MRp
 A4MX89tSLlvUw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:5Q3Zx8Vjy2Xe1mflo9UynhpeAsXbon6PDoyBllc3dOcLBmhgqSYZnPAjzdZFtF7tTssphuL/3gmGMWzTithVBz00/FCJGT0ca0ACvY3VEmzcidg4kbJtLgMU2BbBfItra5Uryg4Gx7qnZxkQceI7iNhZb2uJjpvkM14Ie0jTzs+W5RWivZgeIrRhiErcFLOxxYm9V8MvZaBExeZm2a7OKWUe30FS+ZBlWfYxbudVmvcMLdNdXeQaL1dAhAh+U2D/iGvRU2HoUm6fF+xk3XnJYx0drMcpCmclvBEb2NyEUG0MeO+PEQbs526OsjW17cQaWQs/HVtZztoNEJ7qgEKV5v9ocrBYjhrM/RY2ZouCcyqBqZwokQTqXfng3nLt1YPa1XYkQDLU5bmMXTx+i1d5jfjPHOfbBZcco38xCsm6WcDYhEOCUYbGZ0aiN973F/Rh66PUGaDak7cAIbZH+cnfFC4odzjpmHL2UPugliCui7oB5i80iJ9xva523Ep7e0Rksy9foWd0QqzgBUGyv/7dCOYVCL14as+NgSmTi2+T3ZSITF6xdD+GzZ8lDJntchCYq0VzrUP2Y/Y9W7cIjrHWXbZT1UzFVgKrvjXrr8nvx0t6oF
 maqrxuQsNxT+aeAvCw7cu77Vg8+IrLuQZeoGS/yGneaRRbG0T75JWwh7lx1v2wyiOtCHhXDVQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F61DA4C486A;
 Sun, 20 Sep 2026 16:07:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-1Ijt;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:16 +0200
Message-ID: <20260920140605.3005461-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 18/66] package/daq3: bump version to 3.0.27
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

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
