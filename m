Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC6C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C035980F51;
	Sun, 20 Sep 2026 14:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrwEO4qB4vik; Sun, 20 Sep 2026 14:46:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E4ABD80F28
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915616;
	b=p3b9gkzpLNVgC3Kc9KwTK9dQgf96ZtE9zo+nt+ulhQ1okRf5HE6o41QsF79C9OQVGMaQ
	 Gj5sMV/RoNU19lg2ubJGeNd+a5n5qNgTYy1WTXkNyxznqMFjl1wTCENIK2uWV11evFkN8
	 pZ5RkRfo+bgrdpau9oP6wtIdv/cnNou5N3MsvhmzqJg2dlJXutoUVKUsA5eL5+8kuzUaK
	 PGGR9LIGavjxl0eHpmXfj5FOd4xjLBoQHpHW+db/VbR72KThtzE6nk4rv/Vcqnh50lLRM
	 vkYHGOuDXsfyukCkUsh+QFuw2dSD+VTYjmqtMblCt0VM4BbPXqnojE8hUDemRltj9QQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=TC81gEU9u7Zt3JqRS5iUskvegwhhIxkZVK3BMzmdv696qSia1GsE0eTnDdH8dXDItx++
	 DfOho67KO7S2ALuZQV2CssO9xxknBtPT9FC90WEUJgnu5bEy/sScUalwLv/u4sakgI5zw
	 hYLALa8OFSDxGQ4zWcTWQ9viNEZEmOqOZYC0uociRpF1pmM76JOcZVr1N1c6dOlvuPdAN
	 b9TpxFNfPK4lnHvKaanMAZqZhoFxTHcxSh0TH4QVwJaFmiMwmsks8IbACDyPGSNrg1Jvh
	 MVYnsXhnJWnpW+iZoaza/h0/tAVJq8m53eHzZ5AoIRsW0XW5G53IX1bRpfeLVoSOqiQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915616;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAELHFrvZXxEG75KMN4E6+T9WCDuXCaC4t2dFSBqVZwmgNJ1qHnZUNAf1VH8WAXmI
	 7aHfkbFDQUhIfSbYvoOEy3X9/4soYh8Z5AfHZfRYH1gFVcsK1VbgQe6TI1SII41KQh
	 Z8Tk0t1VrXv4O6UiDg1CpnKMms52xwH4S9y6d0PAYyGXIaVGqelcREcHtaqx8Hfljy
	 TjlXI893x3vBfdQP+HOqNAmRqxk+PPy7Y/m7oNb5Qs/DE9tcXp3d2QXiFNJiPBuQ1H
	 dDNrEj7ZUrwFoYxmEJb6z6PY3KgJXIgaonav7i3Ftq9ziGwLtwsPA0Drt5N/148ZdV
	 zHnPlzl6GDyEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4ABD80F28;
	Sun, 20 Sep 2026 14:46:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED4937A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20B7540D83
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hnx83iL8GHM9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:46:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4A00E40BE2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915613;
 b=OLxlgssPn2pVttl1UhXs1CAuCupR5q57J2SjHxJ0uLBZ3vXG/H1dCwK+Gu0uI8fw2KJV
 GAR5THp/2urz0H9Q9yagaJEpK1QEgvQeqE7OtPM7Sdy/zdmJad0nyGCZ2ys8IeYkel/bj
 G/T9G5fyVAFIckw6QuLm8UwLh6Ttjvd/uCRvc2q07dOPaNFoDCs0LDj7u3s3gV/an2LSQ
 WXTgCQODQDQflQBWUrcOiy6wtuATQUTXLaWfz1kuV+yebt7nrbXok0Rn0bPvvHlW01EE7
 1xtQZnH/+WaaN1hyxIn7J1DLxG1d7A1rlYKzfTHH99uQ/Q1Vda3CmJNGZChvXXKljGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915613;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=Kw6lmOyKNTR105hEFjGhyeYBm/0D3YDoQsapIHpEtKXX5LYFmCfpLx+3pdgLUzpC8hQl
 zMOisyRARWZ/0JxlO6Q6mJe9OqfjDPv2YmkFT9yNREI8IWP+S9CRMEO60bHWB9TzWSU/y
 MjDFdIg0adB6Vb/CtoWGhJ28P9BZfhPk72bPL52HUIgkI1DL1JUa2P4kmeLf3W3TGPacJ
 g3JYouCQWa8I3dO6JWNRwORkoylYHo0H5p3XgTsrGZVJ2Sz8jPL6x+YKQuoe74AFvlzMI
 6MoWxEwaljkT1SMU2vNnkIEzZvRc/xOAZmLO73OEDIttBAo1t1gh4P0fk6EUErn4wmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GDGVct7W; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GDGVct7W
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A00E40BE2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915490;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=GDGVct7WeXeH3UK0BsNbpeb+oFUPwhOic2kryAR4aNMDAK7LEQ1VVftxHa0SDzo8N
 UoB86Vhlq1E7jMfeFHvCjgoLxzkRI7AvShWeYdamk+tguLBWuITNOridUf3vytQn+p
 US11kCbe5CvT+oNFkqx2O2pcb/6zlEJCskb01pdGkVck6EEYzoh5QvC7xdofcKGBCL
 DrlVJJs9BPPwrmQay0guknh7iTqJooFKJvHjxZ0nkDYY9xvVzlwB1rBLq29YfKhjWQ
 w9cGeuBEXedPcwF7tCxY/HIRuR2RriA4YuEGL0Yzw1LFm7lsUF9jgXWduO4AcuOsjB
 yrlU/ENZ32WBQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:8rv0xbu4bryk5rj1a+8l1rRkMqUT+uU+TYRFxFGjQsIbB8tq03ne70fOTIt5HBds4esBnSPM1uHrQySDjyy2iWoMjwolGjJKfzcfg4JHActzKmelp+0RxC9odcKAiXP7BAUToWAJLcmYlt1gxhXj6nRTH3pEM93XGYOwGjn4Gm1xUV4ql0fpbiciyHlm0ve7v2SlkbPHYZYeSh0kh1hsf7cKWJhfFnZxg9NL1aJEOX7noLnCulGJufCdY94xWla1zbF2lR9z8ysi/Ver/EkyAcroV1eAiNtf+DbfHEKj+r77/pEIurlF4ynqxlKy9tQa5cx4sXdDTzXIJ8zkxtbYvaSuvjghJDAkL2EvdxAkw2vT/nzrROBs5/Q4Ac2K6qc3nmqNrZQtdC323S4Y34XhFE7G00Wk68JUHNfPZ41zJ/uPok0GdFgM0C5LOf5DSi+gLO0TdWE6jrNcr9Ovr4+cp2Uw4WQGtgoEfBzTGm4uQk8dTHxquXU847s/0LowSemmw9NOHS1w2XIk6fJI0WpS0bxEVoPy1Ls4WwYH8eLDN7yOXFio/7Fy6BBGobigWP+Nw9pZK28zpxBEmWRCzh9S2+KCFkEvA28=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 969C2A4C47BF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Img-000000000hB-1bT8
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:35 +0200
Message-ID: <20260920144428.3009612-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 14/66] package/poco: bump version to 1.15.3
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
