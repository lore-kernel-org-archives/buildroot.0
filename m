Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E4CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB3D40A0C;
	Sun,  4 Oct 2026 08:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUN-T1_4m9or; Sun,  4 Oct 2026 08:02:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2241B40A10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791100938;
	b=Crql251tNT69atUAyMeT78FB7ZrGv0hZI+CrXnMUC/MRyh03BVvmZERg5cpaD2Ede0Q0
	 W4jAW6wmJQjBENsbooMjKrCL8b9ogmxvW24ck/un7IuQDGRWa7xtQrWawowiWKPyXv6SK
	 1nzw1QgR3LhSV8a3vJbmuRsTriG3f1pngPbUDCSrO3H+ESZH65Qt1U9EUPf1mRwiZ2Bx7
	 SeyxjVa8inyVItyyQmyIlS11RDLRC/RDujLfM6lshg2cS/poIWvfiJ0TuQFDD07g5OJzk
	 0D1gvCAB/hiiIMcK0F/vrUh2qK3/kbxKXxCX6DLWYCYu5mRTEJId+A9yf5ACMZZGfIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791100938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=keSU1gDfyvqemb4W3yVpEOR1P2x2nGVptng2KlhYZd0=;
	b=VA3ii8avV3CIIfLCpMO3HLNZugPgI22D2fbpb/I3T9DTe7mjvpSzrG0MMbHrrhAePnuW
	 +tDQMPSweAuIsLLFf/VVwebudi/Oy6ka+yPDWVH4EhwSWQqRUaeM2/w2hxUPH5zux5yv3
	 sh5vUq3uOjeXxKCi6J0uHaltJJEl29A2ELfOEzYe04axeeQ/jzGhW9W3lUhlgUzUU4kvH
	 fSiPgU8ZV8Te1EaTX2hpshFXQU+TG21YZfozHot+Ss8k4zQCPIr8k62MwUGsRr2NhI8IM
	 eF9ZZ5zYIjrQmLzE2unUfrOTEkQfzNG5+7Nsfg6CghZVTgnP1dF7+ggUllUa6/fYTDw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791100938;
	bh=keSU1gDfyvqemb4W3yVpEOR1P2x2nGVptng2KlhYZd0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qBT79th48vLHsggNlzH/vGAjE2F5CXtGdCmPGn1gizTqWgDZvisbV27KmeYqce+P9
	 OAmfjki2MbScEj5xIeDFZlvn4fnrIMmk7nAtALwf69Epzo8eZuUCe8OIOsJnBh7Y4h
	 14NyMJ4KrQ3p9WJAkpyjXkMxn16UB9aNTPf5wN7ZjcG9l+c7DP0tHZQ/CUsXTXpMgZ
	 LSEKSv16bTe7B9TdtbVdXJ6WqyNBHIZy2fxFiHvZtXPbNX+Se1mw/SFBoXkICA4p6i
	 NiKR7RU4LL5Y4n/xewwJOlQDj8wKWk0sKap7WyechcK87EZLYACbtoMtB0WEeEZ8TW
	 AHYG9a6lKh6Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2241B40A10;
	Sun,  4 Oct 2026 08:02:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D785335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B7DE40079
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tplaPoHeJAcs for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D4E154006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791100935;
 b=VjEmmiUU6Qvsj29sl3YZz04WX5fpBjYyJybvrYAqoVi37JrWLP2RVg5wqwFarwt0kKSY
 gkUON8CHoRD12gKZLW6pomxQZ1ALug2fookNOWNohbzsXY01/M3SnuvWzPjZvbJHeAYdt
 lSn/9PMpiTdu3H8wu/5UYl2EcMK/L47lIAezWy5/wvcek6yEjwDSop6IUFvGI7qTRz4Ai
 mZow25w7gSNJj2E4DocFed6yrMwAC9SSL+fNzWHLUIgLK1IZObEEUygBXM5Tyr46hUXqs
 3PEpsfOIgpZW8ZQWsd5TZj7BnHt9RlC5Rm4DmLywT6+vkjh9BEj9S0XNMZxMhKXrwBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791100935;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WV3ytA6iEfBB9vCaIFc9hxqxl4b14oI+po8Bz/Wrw90=;
 b=lBk98RfmRGEtMJeLlJXsmHIpUuitOsiSZM+l2kjRNf+O56eodnPQ/5SxV7SCuwmSelSs
 vVmfA3FeGlB9c5GXBdpQO6Je3UjceM8roT29VRyFgEH0zkUUUbCh+1TwNsRC7OhfwdBI9
 IYqBhIp2nDX+J18DEUiaERYj2VlcFpcIXAUjNpX9cvapos8S+9z2kqWbTj5qkTWo9GbhO
 rliJYe5jF1hzXwxA6kjljONlEjhGqpba+16kZ6SKV0M/9cUMUuwjJBzOUs+woAhvxICil
 ZJqMtI4yeOfflZpZM+CzEqSzg0QJeOCk/C3TB1zqQ2x5qzeH5OHAK/PjfEfzlKoJyGA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZKaWH0w8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZKaWH0w8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4E154006B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791100932;
 bh=WV3ytA6iEfBB9vCaIFc9hxqxl4b14oI+po8Bz/Wrw90=;
 h=From:To:Subject:Date:From;
 b=ZKaWH0w8r8iiNeK+eWIieIeTZzkgkknxP50EVSN9U7dZDdlSAmxc3XO9YrwOqCmDx
 4fYQO7LVKVVsc8KqPuXDdajW2WivoVi0tE2Ii/NJZORV3uFuP3EKslMYxFn6FSQPmE
 MlLwvyyDGu9MpCyJxCo1eF4SkeHsFJyhzPYSQ/PRrfUSxQxB3f9GjaYnwmnFfFJefo
 GEWvScrAB1VoMRAGxSoKOowzeRcZ5znRYrz/Bhk334ra4Y1KR0d5HeBHGwS7nmHJSn
 /8qYPe+8J0qbsJy8OShGbFPTADJ9fEgdcFfLivDrn2ZO9krblyg5hdG0jexLBem+Wu
 qDzJfEPm+gUCA==
X-KAS-Sym: v3:f51bdf72230551df:b5Q2s6wqFQDspTkueKcHEEFCydoBlz3HaYz0hQEzVgUM0
 6J5DCveZ3Nt0oPAYTpgDUNMmzf2qotkcv1okts9qfHPf1FMRBW8rUMCU9/LOSohFCWPchcwP+KC
 YoOgXHLtq/qpa9LMWIPljSVmD86nklBpuSouMJpV4rqYlERuyVa4cbYMDAfsjHO2AJq6tshwbTI
 JYTR4cQuh+OOxqcomk0PNMpmFPhblVNkRh/58ZR2VZbSeLT5A0o8U9Oy6hLNQJXeRztMg+j6QKb
 F3O0gJpO7Ad/Uel8nqk3yUBR8yCJ5ZqPVlz2ivW9WSLM3C48qPUtz46y/vMUzSAXvL9zQbgg==:
 AAxYmnzuc5iE85Cq8Ib5ECp68Gh6jXHGypzrsvl3ZHxwdxyor+HhAy7srHfeMQ8ZMmCKLOGJd7l
 kIQXOPgGhFvyyoCCbUkQwGyVgPGVh9r3teEiNRVdKJf4OYHJDN54+GJFyhL7EcQUoTNHhmnmTd7
 wlxyM4Wlr80Vuhwdw1bhjnjaQ2Yp3/0WtWEdUORHLhFqP5BtbN1QJCKvQfRTxlwQrMh0e8fdVXm
 y/pE/u4lHPbpTnI3Yfgx8H3KGLWT0oy6FzGTGesNTY3ePWWDinNx3WDRvRncSdGlfDERFtdqv9m
 vCaV5e4d5sWJQGPcsTDGQr0Ve5KWYuzo3nDbA2L65H0A37uSMV0jR78zQH7p6pVELbZs1mqkNd7
 Ycal9b0wv4v+jtoQvcioxNC+S8NK3GPoggszADIBuvanMZrUZvrBWMfCd2oLFdWhtvdR/GPiuEc
 oC7cjn8v9L0d1cTiZ/dqAE6bxVwNVM5IWcURFhz4QwQk0QFXS7/rC3i6ZpjfyYv2R/ujWJBjCO8
 rLsh0c6nId5LkBJRQNkhG9c2zYgFRozm2CFaKNfqg9DYIER62Fw3n8+xdkqOrBOHzV82Mt6x8Do
 InsL3w==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05D37A4C51CF
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 10:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46916)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHAh-000000002q1-483O
 for buildroot@buildroot.org; Sun, 04 Oct 2026 08:02:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 10:02:11 +0200
Message-ID: <20261004080211.2996307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.412
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

https://github.com/vcrhonek/hwdata/releases/tag/v0.412

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 0046b56c75..a698a26265 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
+sha256  f0c64cd7e31d70a5fb3a52e53ab50a61e74c0421a6381eaa45114eec3bde5fe7  hwdata-0.412.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 20ecd799b8..5858b821af 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.411
+HWDATA_VERSION = 0.412
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
