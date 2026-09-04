Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA2C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 17:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A6860645;
	Fri,  4 Sep 2026 17:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79s4qfMoUKR7; Fri,  4 Sep 2026 17:16:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3EF5A60679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788542161;
	b=R4dyK5iSYm8/cfzOVi1+byOiE5v1VS4jL94XQL4efpdqnMUurTvMYuyj2bg7w7TkuTTx
	 SJzMA6Otw4AV7irmFonYnV8UhJs1U8pcA3oeT8LTG08Z6JEDFlMCIDsBg1SXGVVxSpaK3
	 REG7+9rJQbAF4RYVoHVeJGkszjmPsN5F+yHG6id648jKjuJg4ZYgkMDZIFV9svcWGhhdX
	 VS+m2j6g/mONbWT7yEdqhReWy8tE4NMPqJNVLy013yROcAL1wHzsHE/+lUZIv6/wHDiEm
	 83k4j7tA8Xtpb8YbP6KtVt8DdfMeiRrCaw4HrUEfgTnyhJhajZ2RFQf3vRfUlFC0R1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788542161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+9e2h939DA8eaQl9Nchpuiw5Ux3lz3e7tYWzsldGDVM=;
	b=pe3B0XrJ3+DwsD1Qqlc+cf5m5yff5IT1mNanD8yhI5nGMBE0I1ebibeq4SrkiHdVyNPy
	 qtfTVfx2LgiGEUYATust9pSo42ZVpqUVz2QL1ChkvpTg/boRV07jWdeXqNOmzvABwPx4o
	 iERWRSiXxVU6bBMPB9aOkDrrDzMuZRa2s/Yuip27tVOgrgKhyE3SAAX3aW4BSaMLfd5qr
	 zqkJl3XxNZ0nNWIO1BWK9V0mF9pXXPK+83p/XfhbTatRMWKMi9iWlFGQh97sDzGl3QONx
	 qyJ+iBZ+BUl5v8DeT2q9NX9XrF/xXn1FwIElKp99bZgZaTxtMnlB30xwESnnlwTG+JQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788542161;
	bh=+9e2h939DA8eaQl9Nchpuiw5Ux3lz3e7tYWzsldGDVM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mPbMoKe/dfqAHZN2VnSRCrcED/TtqACUGwEvWdebaSO4z+q6nVF+CDsXAUT3rDqX1
	 S362o/e6hEkKpDoN0d5lnqjRPcws51/lYeBC0I0CqwPMMRIhZWa2lw+hjL6jeYrG1B
	 ZH05pqkZLVUavZP0scHPiivT1vCyWT6sX/vxah0zTyaPwPs6pYHmM/3uGA+icv8UgK
	 zO8RaijUcLr8PAsJFUY1mYwiOOsX8ShGJmKyEaemhyKLVg6kStMVMOwSVP3UIo1Bjh
	 28jEjJQ2jeHKrIl5d5wkZ+/1uvvUaS4tkk3571I5g9cIQIsFunIKbYcvltnGFG/KZu
	 Q29certrj7Rjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF5A60679;
	Fri,  4 Sep 2026 17:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AB23388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06A681111
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9g5nMtou1u05 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 17:15:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D88C681099
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788542158;
 b=nhxnnOdaUTLQENjB6bf1DNtLjVppKEGxwEVsmDFcBSeYSAOVX/A2X0NVGu0OzEFjfTi3
 0fscfMsv5FWyFxHat+ihBVJFenYw/sV1xLyzfMORNSYp4/SuX1jsyu0WZeLCu93T3mszb
 YOfTJKJpcZ3DYblzJRnI6WsZgoARZUME8cfI7mGQeHoHyyUbJBM/o5ctulYO+UFPv3N2n
 hdLxHe5x9lulduXEw0nmpbT5RBowFtbyR3/2vYz30izbO4U47oAV8qFM30eiwbl4bSWZb
 A5gn0taAAsbubNY2Oz2X40YeqalqpKhrXx5Vr5OxHwoNHECtcKGoQXf3g+Ls2d/KHQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788542158;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=RUbgTXfQHp+JQaZL1UGAGJyPCjJHjt6KptrKxlyqNsU=;
 b=KYCLcjEeyvoy9q++cVzNRkuXs61PyAsvbj0VDDs7UhJ68nzDdUTpmz91zZ87xM1xEYwg
 K7OQ0GhmE0rCBZfgLkxdkBbIefuDoDt2xxQ7hTq36CvBk8K+N76i9mYPi2asB/0Ivhe1E
 2Hf7+cv+LXLicUVBT1T194zmDcEtED81QJeeNjHSUDM+x9lXV+RYWeRdM5RVM4dCp/Nk/
 7QBrjiM1MMgjEUxHkh38KpQp4jIPJ6oySwRoaYqFM0SVZK0KYMdaTlJLJv2QgEaYkv3Ii
 xqlBM0O5Y2f2jqZ8jJMQIjA9RDFF3F1etwmUsiDRZNc/fLk73pxKjKhLSoa1aIzX2pg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=haricHwb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=haricHwb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D88C681099
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788542155;
 bh=RUbgTXfQHp+JQaZL1UGAGJyPCjJHjt6KptrKxlyqNsU=;
 h=From:To:Cc:Subject:Date:From;
 b=haricHwbYXlJu4uSXho0UP8EpIdVYM2/sDYoizdG9QrkKfDTsQSgTQUa31teyPIg9
 BJjaYBYFToM1X+4wWC7GM7Q/HL7pE3ebMjQ1+E1k5hHRCTm2QIYIWsGqAZm4GJBRKg
 qGSXrv+0vmT37eXImqomCnIUItDLccwwmT4oR9fgXWVglZoUwNTLTvBrCzHtUX6H60
 V5BE2DlpxoWHKeHKWSST2m6YQCqdxvQv23IPcDlIwOzWq2+guOndPVMm3TXotreERF
 y6zxUGGjCr4R09FHRu/oJGW3brIz0WoAQgxHSdVMd/fkLu6T3mfWBXauj7JbFcJQYE
 S0QLxgFBc7gOQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23209A4C205F;
 Fri,  4 Sep 2026 19:15:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39068)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2XW6-000000005uj-3c9a;
 Fri, 04 Sep 2026 17:15:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Sep 2026 19:15:54 +0200
Message-ID: <20260904171554.195575-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump version to 2.4.1
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

http://www.mutt.org/news.html
http://www.mutt.org/relnotes/2.4/
https://gitlab.com/muttmua/mutt/raw/stable/UPDATING

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2fbf2ce17b36a5b13d2327bdccc48e5f63db026d

 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 40965d21fd..44ad90fbc9 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b4f7a442e41c057774ba7c36fa41aba2edd2e7a12a86031e6ebb113bab2c79e  mutt-2.3.2.tar.gz
+sha256  5624321f0b1cc1eff6cab9ef08f25954ff64c51b33d4bf3b99484cf1edd8cfff  mutt-2.4.1.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 1be1f8b682..8097c6780b 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.3.2
+MUTT_VERSION = 2.4.1
 MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
