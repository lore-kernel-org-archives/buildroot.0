Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A7C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730B640B61;
	Sat, 19 Sep 2026 16:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Vx3d6r3aN0H; Sat, 19 Sep 2026 16:05:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96C8140B47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833909;
	b=lzZIqJHRXcaLb21Tr0MH1Q1f4mYnY06ncU5wN7MdBjYj3HnNU23uXTOClmlqNejthFle
	 bqItx8z+OkmQX2VBD2F3Z61Ywd74Xoc09vvjlEFUYnkTrk3/19ZE8J6POLzYhrd1yCEyI
	 SQeCmwGVLeyW1W26KUWKA4vt9sXtRIHKnqbj96/bjAgihBRWdsC5hudH3CeVrHnBxzURe
	 idQr96jx0zN93pza2TRaKsD+SqQ+73HVyKB9SPxP3al68XSqJ63LjW2dt89bXooNlCI1p
	 TD7JoUsd5mLQt2z7WsUyZ75VIcbK894iMCm9tLrtnKPua0PPCIfP4+3kOYOOPjzt0Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=WHNETimBJWhLXDLvYma8yTqbVVh7qDeWAfFfUB90MlHcUPYfnR61uYf8AySkfO6MQJCO
	 sz/5KYLYGFqQ8gGEWl1tOlDGo6GotOObFR8K1ZfIqI6oZqUKnrlC7P0kcbav3EDu/q/Rh
	 3f0jrpAy0fEpcnBzOgoxH1+2vMIO+4HT6LMO3fcDQSAaDIe7m2BrOihph7hZYgVD42Oil
	 GLzab3jym7x3EvXfwOl7CJck9ri56Q7rB3gAXv79fvEN6vuTFwQ+OuyF8dvBrrMpbSaZC
	 szctdaScPC5sSLH0YAOwKWzjcrmiY1EZEqL475gn/KWp/I8Bk38cREDsTf9ymVNFQlw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833909;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S5LmWhC9WijIM7vqP2STPtDhc8pQ/SpAnrs1TYxYAucKUZuV9SE/i4GuNgMr4ADVe
	 G5D4YzgH76qP/liRTNAvOnyKqSbBri6jRBsQLGmK9PcbD+rPgV6szKl/Qf0lylx3B+
	 AMRNpPVxKnBKXUuZoT3KzkQoJR631DcnxEm78SeQTe3I/N/pPBMWib7RY9q7OI5l2Q
	 7iPZMvwhci1JpMKYcb8v0zbwnWg3Pcw356POfCa03AAvzMF6JuRbe3jKFOhMOuQlSw
	 FkqFmGnSWhf3wWTwqrkRfAV/xTtA9XBa9N2PG4dgw6xlklcz+yq0V7ZMjEpFMhaNij
	 nrF+/aX0PQCjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C8140B47;
	Sat, 19 Sep 2026 16:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D71C37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F5AE400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 507fl8Hpejyg for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:05:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8254C40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833906;
 b=Ey8auAQjqlI5Ee/tIt2cczbBot5Nfl9U+ZRumIR/pg2N1cLZvm2F3HMsJUq9aJhBs6jJ
 t/wPPfl/R96VES0Wcqz2EgKY1W5BJoDiass/P8PDckuz0G8UEVbrTLTcghyj2JdSL+AIE
 wGs+bJvAs22EujPrlebBWPmDcvN7mxUaP1BPwr/h7VNQTEyZyFZvB2vr1Q5nCq0qQBhMH
 6lHLbOAFrtfYMg1fUADdUVFCk9PnWs0OK0CQzlhWRSIxz3oUlbo5HWOiWD+fVG5TTocIb
 TKHvUi1DcJtEhfRms8HGWdy0XaIC8IzfhjqRJtrJpGQu9ffpJC7WFOtxQdO+D6J/uNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833906;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=ISyhe00e++sV/cePQ+c0WUQ+SIX8hFgWMq+oE2soPntcTFp+3FfVJ4E3TXCFvPkOLqqJ
 JIQIB/8OWTN6qQYizQLRn7IhF9Uh2iCdp2aUutVqiWolEhIls7nhz/PUDoRgjWfffUHEa
 G4JeSS9b9lvrED6BqeKMbvXVj3qioL9aAuh6bb5hkz0RBFDho5hNY5yXcgXmYPpASM9EY
 03MrmgBr0YlrNWlTEAYTNLMmyh/5aFlqQIah4VqoN1peiR/kQemAi9jhZfO1pwD2i7bDz
 5dN92PMhphWZyNw6T7w05UibeA931wZbaaMeX9BnmfAqbIalXcaEvQiDav8LDOmBBeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FipxIGCf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FipxIGCf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8254C40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833546;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FipxIGCfuVKdn6fKbO5/6zQ0tFZ8mloWYUJqTXaEJnyUsc/YuNGnzTRk1wyHm5zQN
 EoTEom8wOj8rhDzAeuywBlC24pumPLQeWvGjAUFKG5pF8XHed3k18GJlL7vZ2ymSrD
 uC5Tyhx/ConTplqw2C4EG7qdc9udWgCNACfY/qSBuADLq2Zslwmv5isjT6YTS3Wf6n
 akoAhLj3MaOFDnA6MGEkijtjMCJjUHBGFgrKEmbMil7WsmAAEsbdCfMebi0/vD7xpD
 NZoCnPrknobVvj8dd7h/YWx3czoJzGOqk9VLHKQ+NJm/Mu4/HEvcbl1YPjnRrR05Vv
 MmtU1dEeb6GPQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:tGAT35jFgMaDrsV755MZ8yYX+7DMvSqbH0120meJAV/s48gLvP8ymU3knWFVFUfoeKVmHbv/H7qMQXmHSvpzscHu8GV+hHifuOPaauo0v8BdvxsGnOm4oDP0ivS4KNR2LS0gCIQLEfXt4acVXm3OhBS6T++tARjAlx6V7qsjg8YfIsE3AnmE7raMBdvRwQlUv2dXD8cqzYncbKIHHLej1isrugIhooVAr23vHozRfEpub1REOlH8BQfnjwgS/HNvUXF/sl/fe3xOvs3bJ5ILo/isxI4TxYZiyJflqYApD1QAokR6o1vrV+Jjoy0yCQJAOzuTdEB91+KyFGaKRRoaTWhlm8d5wsZzUNajzTBRJyZzmOTYcU+A417Heu8jR+Dds9MZtXtl+BftBKzZGpVhLkqP9Tzit5SQVaVrzH73KpQXOfRcOype67ccsqRMon/VaDnDYxVLn6o5GVFdt8ynjj5hC3MdcC1zH9M8MgCP6iWhZEwnf4kvO2KbykeeMgAST6U7dOSNFDLaw8YLaVi/4nRKHRCXlDt5uXi4KPYx9qsl37W6k1aIcV+f1hV0TfRwAX3HZxhCDYRRFZs/YYUu+h0dL0KuizD4uWJOp87X4WSNV3
 4cViPDWQ1w5dh/ykwEp3BRMiKYZ44ml/SAi7Mpf81fYzZsoQPUMx8/WQdTkEEv7ax7GTK/
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3AF6CA4C47BE;
 Sat, 19 Sep 2026 17:59:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSo-000000005Jx-0EEw;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:49 +0200
Message-ID: <20260919155845.5776-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 24/77] package/poco: bump version to 1.15.3
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

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
