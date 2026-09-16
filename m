Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59CBC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 07:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 652246062A;
	Wed, 16 Sep 2026 07:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUQzNbX6C7fg; Wed, 16 Sep 2026 07:42:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 88CB6607C7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789544556;
	b=WSvZeSJOriInFPNb93yPUfE4A75SuCCef+L+BtiX3g9v5GZJMCJEdVukyzsM6TpUB7Zl
	 eSz22xqnxdrTBAZ0ztNWfZ6qnhWkHQWF3LyNXlcSEhV+jn5xIKEvFSPsoIoC95pnMSNx8
	 W8YQNAe+9VyuDzx+AMAXJcGrWtQNQ0I3F+yV/eXewmQF6LW2gkRqpG503RZjUzdQTSsme
	 dExbbALdViPFvXv2H4fx+xut2zld+dVtOmuIxaq047reXjwN3n0iK5Mjrvtm3XWv5nui9
	 M37f+rSCcstJVk8aYEQ+p6edSU+Q33LwqZn3Cpc0B4r/++rfMCorNLYatxT9hvGeQLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789544556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YGETSkMiovuDoXO3/KnslOZ59MxgD64oPWOBUuW13kk=;
	b=TMV9BQGyOffJbQqkkdOn8RsPM9XG6SSD+SMp6OvNgjU+0nU6OepHvsCwzUx8PYjDJSAt
	 aGM751sU8o8BT4qhQrGgUwueD4T51m1ytNv4qEni3y7zQuKYJy/fbY4dsaBIXU553YY8b
	 ZAl9MdeH0Qu2Lhdzw7dnq54e2QfFaEToiAnB2VcheB2i9q1BFcMRr5pOkZ1Za5T0sPn/v
	 WMzNxnLvf3U3VP7cHR8h1+TMn4NGEmzEw8TyINE+1UtuatgwgatqxsAbMkv6KbOc7MU8e
	 xwUvEi1wihzJAyylaYuzu5rfDqfIBkzJgWUaWuEaXWPkydHgOYAgACdbL6E8h3MrZgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789544556;
	bh=YGETSkMiovuDoXO3/KnslOZ59MxgD64oPWOBUuW13kk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P/hhDNr+BUAOogjtuljVjhIyXqa+ylRh0tE/IWPQRJskKqalHtuweTxdojCQ4jLyM
	 ENjrsLMhTMDMxs2p2NwGwfToAYU4cQGolVMkLAcr7P3CvdFMLe8Hwd/Hp9TJJTHpUD
	 w3y1K4mx56jxo9iCYvxurlSCn+D2j1K1ad/4ZG4eipW+sg0RTXyUnSPy1O/YvCaYgK
	 yjfjpcujc399o89hJuRj+6vCwDAzjyWWuyELgJI5q/NqzMYTcuaKkb+OQk7hWjDb52
	 87eXiuv1sPlR95zBJsQf4fkxb0UQ14hORPvEQ712g+ITcjE4jaqYHt8hu/XhElqchr
	 S6umoR9XWumRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88CB6607C7;
	Wed, 16 Sep 2026 07:42:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 045D529B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 07:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E99FC808E7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 07:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2eBsZNbHmNB for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 07:42:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 86DE9808C8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789544554;
 b=DedHVXymOg8/oLqgJZ3ohXuqCp+aIxlS8obXgsqenqULHSlJDkV0BnZRxiTjGN4j/SOO
 fm7LnSBXUQITdF68+2ytGHk7myR3DkZEL4XBzkGaajfZ2mQQhQJjHjJYBEQpHv4yuwW6K
 3QaAIWDufIOqKjXjmUuyybSTj0lutYUjn00mJzQ7SnRVdeykUKBuVkGwYnTdPESFUltAD
 Fj8fFrgfF+r7y4GZneFLOOfjLQTPfXNuKHMTUEsZQ4YMIeJ8ew+NzzrJW8neI+FKZC/VT
 5z6lojWEY120v6L/PU4KLyufgvK3US/hturNELU4pVtQpDbEs8YHjAXleTUwifpFb4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789544554;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=IVpRvSb97NZ+eCrQor3K0rIMmU0dKP4/rhrG6VNgjK0=;
 b=SQg+ikHgwlrUAhbTStg9wcnt55FQIyi1cByW5byyKMv01s3oMdde/t2YKNBwQMsk/MVV
 Teesr5m/T0UM1JYC95TfMDxk7GJQxwx3iZQU+wK9tvzxVsKhsQfKvCRrPDdOLKOV+K9hr
 sEbI11b9Mx+yUz8OLaQwMta/eYQ09Qn3XsigzDfXuMr5XXBbHsfkWiEeMzv/QzG8pmWHv
 UVMTeC8D7UWBjhA+pBbmiqxYTyIooBxvVnc8kkuUO+GJ9kBL7NZOmFuSdpmk1eD5qxsWX
 NEOxgo+X3AnheLa7ePq0Z/0e7j4UKYbVqPnebr5w+PL5uYYkHCunMlsUtXkOycE7DUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rJdEThEA; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rJdEThEA
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86DE9808C8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 07:42:32 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so257098f8f.3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1789544551; x=1790149351;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IVpRvSb97NZ+eCrQor3K0rIMmU0dKP4/rhrG6VNgjK0=;
 b=rJdEThEAg6rYRIQJXmfDRW/Obf/UR9i7eM/rjqI2UMumZNZ7mECTUdUjxPUo9Uj477
 AzD/6fAMyRH4mPoRiTA1ul/FO186+wjs/BT0wL6pKS//OoimvHyxEjv54RU3CbtX3CPF
 gnldAumGmIvhoNR5vkuitjlyoAVU8jPkBIrYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789544551; x=1790149351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IVpRvSb97NZ+eCrQor3K0rIMmU0dKP4/rhrG6VNgjK0=;
 b=lsz2oWIYFs/fm24gaWS/mnZoMxRo2SMYO/nwpQAE0BOwzixp48z9KpaWlQG808UVlA
 NN7DSafJZOY5iLSRKbF0jESqKUuJ4FyHRjaJzb9UfpSV1PgYoR26n6ly1rE5gRatVm/L
 Sd1zASbf9q9gVvlgcCobzxB4oymNzS3BN5hj4cigPDaZYh0Gx4PZc5PtpKJ6S4azYO/G
 Z2/uuNs+iQEiZYT4OwVdt0cw3K63v5BQmOJFdH5JaswRop4YwpRs6/Z7+CNyn4b0CgF9
 4JJdIKXQtRCTTjP+a5Ztc4drxfPMjXE0KATSeqosW0DHbB0QKpGdokZU/DFU4CUKsyJr
 L4lg==
X-Gm-Message-State: AFuF++nchPaAh/6sNou0DwgiSb1NLUXVyWnRXFiQpGcGOSIYDhJrEtQ0
 ia3OfKD4LS1HR3BEWLzOYvEC8KR0E8iNgeT/dF3DKRPK86EcC9BH1Re7rc+86wltId68lml+p84
 qnusTKoA=
X-Gm-Gg: AYBFou13BHaAtm5GayEsPNwkqLx84fHCtsrZPRYQ8WmsilPyt7juSY077GI4DiakuGb
 wTSUhqJUlBrNW0QpnA4pTXdJorW+Zuq64z86J5bZad+l4PhgEvoscDDKm8Frc7t9BnlWUlm3qIq
 DruEfIJVNHaCZ19qoqtlWcqFFCt2QcOP5N/YCdPx838d6gRpNhvIG7tcpnnPOxz1IyE49bqZM1G
 +wY64pSGoZiAXoj175xhMzguXCt9iCdwpgcKtEuQvkzM5707Ja5tckX2+0mhhrK457IebGsMbms
 n0+ggP4fGxuSpGVl4kUKpNGwJye92HJuwVhZh2HmrHY8lou00d/CVf0YK4uVZpvtVrHOEL7r57/
 gSN18ymfacXOcXgfaHa8pqhM/duU43nosxHx4Dr831EJJyH+OaNyHKKEcwWpH1ZGNf4tm6PQJM5
 xJ4YRBticYlNWAB/YZcsv3v+THNLosMZMHDJEhcjqaVA66cCX5aLZ0ktMGRFquqo6vgSshE0Dhw
 sc/zQguOHx/zE7GAxnHtKEcxn9WOQCwb+xEb/oGEuQqX/HhQaGbAn0IT6oTX25z01sAmTQ8ACPd
 gWghZDWXM3Ssa4tCn9ULaSxvohUN5cIpB8VuxSOezYwcSGn0V5lYZ2x8KY8pcNvbrVz4ioT7jK1
 apduHT0DP632QbEDLPzKszsvJ8ctjTMWhCCf4cPC6cXM6XlPEfM/J4w==
X-Received: by 2002:a05:6000:654:b0:487:72f:fb42 with SMTP id
 ffacd0b85a97d-4870cf29d90mr3179626f8f.14.1789544550914; 
 Wed, 16 Sep 2026 00:42:30 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-14-44-139.retail.telecomitalia.it. [87.14.44.139])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1f98csm4713663f8f.11.2026.09.16.00.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 00:42:30 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 16 Sep 2026 09:42:18 +0200
Message-ID: <20260916074218.29706-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cutekeyboard: bump version to 1.7.0
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

Release notes: https://github.com/amarula/cutekeyboard/releases/tag/v1.7.0

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index acd2017056..9472bcf00f 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5e00ab346038e41e11662016b56c4e95fa08e7efeb7ca61aeab5b863a0bb7300  cutekeyboard-1.6.0.tar.gz
+sha256  50029bb5219eb72a4e89435f157235ec541c546ec82e1d5ed8056af27c48362a  cutekeyboard-1.7.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 12a6573d52..2b0f5a9f2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.6.0
+CUTEKEYBOARD_VERSION = 1.7.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
