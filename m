Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F74C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 17:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AB7C605F9;
	Sun, 13 Sep 2026 17:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KU6pxh0FgQWh; Sun, 13 Sep 2026 17:58:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BE97B605FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789322287;
	b=kWilaWSPJu6dDtonjzt3BI5ms+fjMH/7ctRiNDVp9RWmP4zw5ZKqrKTAFgGliqIhgiFj
	 Syw60i2H+HpF+tK7RhpK9IDDyvTOc40BJeDVZwPlqoY2R6Cp1HxuRbF6lYoaFCDCLvkp5
	 0huiuk3eIGWnFte9um5zqMZ+VdGwoXH19QpndltL+r2eorCwqP6e5RSd/IYD0szl0kST0
	 FQgZkY/hoIlY18dOYEq7gzdwpTBcwJoKlwd0G2n1VfYxKPa8l8y/h78RLS3pkajPgG4J6
	 KHd6J8saqJobRxNI6GxTtdchxzaWC5eoSTR5o7QhhwWhzAaFN3rORWWyhHPDJ6DQANw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789322287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=uQEaTpOdWizgBG44W6DUVYjpKGDLZmWGZrwgdNrLDeo=;
	b=gEPLwkRQcMpF94cDzh4JOXLiAfcdBIPaHX4dons5CZVj/DyVj/ICN3J84U0V2Jy77j2o
	 HLzzj7OMj9MpMOlQM3IDBhqlyLyOGqhOcVbUaqenEz1I2KuqtccNcZ0FPMTJI14IecrxG
	 GgCo9k+QnfHFvC7CdwEe+lS5j3B5rQecSdQanCA2e+VZPilJPKlI01+tBAC6ttAVN4PeF
	 NCf9NdX4bW5MNMEKk84rRXCujKT0kKHAF8WygZGs/qf1ndpP4godLpRD9glGGQ4re4+zh
	 Jxmyz0Sbc14NLp2pI1YEbH52gShF9UTRBp9pzatcVy7zQn3DaV4+SgJmJEBfG9g20DQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789322287;
	bh=uQEaTpOdWizgBG44W6DUVYjpKGDLZmWGZrwgdNrLDeo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=duZgMRvgWtEA1oqziHFgt9glk9WjiGapnVOP82cWoPEp/CgBklgRhwL7K44HC9u8k
	 aiWbeyUTXStGj8oenpvIkLKYVP1gXo7LWXS4EM8sg8TcYVH6uHyk5z2KVHwNPtPCtt
	 ynih6Cw4TgFCLsNoBlkICrrmSZMmkWB8u60Yj6bcp9ntC2NCrP9r2jR62fK6jn3D02
	 M3pW/XpQdWjcmyA73O/7vXIfmHXbn0UspDsfsd74sUhHlStdzBMzDjjSW/jEnCJ3hB
	 ylpu5hL4+TplOEwcaFNUZlys+qRR9Kmj6qi9ZVEWb7NpElmXvv9FMx4ZXGvzRgikpJ
	 TFeiyGRsipd5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE97B605FA;
	Sun, 13 Sep 2026 17:58:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B964124D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E6C4405AA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-FFFI1uqAJS for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 17:58:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C80E40345
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789322284;
 b=A/E4v5+wgcxv6+ODXt8fH7Yt15QKszn46WbzQOQ4Jq8VKFQklUq0ml5GqEWFL9DQKqx+
 KvxSYwzZyYqsZyyg0wsoIWBu4C4UmLCpM3FqOGaFAMsBU4gBZKS4VEOov7TAnwTg7yRqt
 qeNNYAim2cTfns+p9bx1hcH4ja3IJEJ7QdiGkkrQP2mucTAeoB89gU3wdRMpXsXSPJOCR
 H1XK9tthS8yBZXWTbZIs0kLo96LCc0961hXEHMVHO9oPXyPwXPnzBwa8NA6lbRjFM9O3C
 7KxY/JzmFdaXoH2TilCOzPQq1uFFDBHbk80eiA8d5RK5oMNw8k5gg90s5L1mtR3VDkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789322284;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=e1vO0RtRz7EauyCA/BAJQdxtaPFnUm3oQhHiH48ATCk=;
 b=VlNVtbqySbo6kLlA9ZY5kCR/Ss3/SmCC53GvOuCWqVALheUlCK6HQ2PR+6EkqznuRFPS
 uqUHCmMDP9aD5w54KQNCFcDcO/bZnsFP+dn7FLhUfyYw7k/ef5rKyegoTqKVMOiUTMRf4
 2JHJLWerlrSdsB0QsY1/WpKXBWLr67J+oG1YNJsI8zCyiO4yfGaH7nTrJ3HZRykRxYZwF
 h+SmiJNAJI1DBYCjWkuxsIoUQnsb3OyRcX6OF7v+1lR4LYD8s6+8BgAij7IJ4FHrQawRN
 Zsi+i5p3Xl+ZK6lWY7qsDIuutVePAYtgrou/GZs+KcG2tY4q/yHgJ7ijxTv/ZSUptMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r4C8Ad11; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C80E40345
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:58:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 466351A051C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:58:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64CDA60435;
 Sun, 13 Sep 2026 17:57:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E6FD11C78D5A; 
 Sun, 13 Sep 2026 19:57:57 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Date: Sun, 13 Sep 2026 19:57:55 +0200
Message-ID: <20260913175756.1702319-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/falcosecurity-libs: drop meaningless
 selects
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_FALCOSECURITY_LIBS selects BR2_PACKAGE_HOST_GRPC and
BR2_PACKAGE_HOST_PROTOBUF, neither of which exists. These selects are
anyway not needed, so drop them.

Fixes: a15e35c4ebc52f29f65372c8e86cefa874aa4aaf ("falcosecurity-libs: add new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/falcosecurity-libs/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 9e6c2d0227..9d9cbd12aa 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -14,8 +14,6 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_GRPC
 	select BR2_PACKAGE_GTEST
-	select BR2_PACKAGE_HOST_GRPC
-	select BR2_PACKAGE_HOST_PROTOBUF
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBB64
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
