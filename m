Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56526CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 12:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1EC83841;
	Sat,  4 Oct 2025 12:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21BqhufCR8Fv; Sat,  4 Oct 2025 12:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4C2837CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4C2837CE;
	Sat,  4 Oct 2025 12:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6007B226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FFD40A73
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQJjFbrtSU_H for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 12:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C4C2408EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4C2408EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C4C2408EF
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:51:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45FFCA4C5D4A
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 14:51:20 +0200 (CEST)
Received: from [192.168.1.144] (port=57936 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51jL-000000008Gq-3ptl
 for buildroot@buildroot.org; Sat, 04 Oct 2025 12:51:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 14:51:19 +0200
Message-ID: <20251004125119.2289470-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251004125119.2289470-1-bernd@kuhls.net>
References: <20251004125119.2289470-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759582280;
 bh=MaSNN1byWQKz6LPsUUCDt05bUou07VhnWbmJxy60HVM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=qw8rM1zL/ZBd214bsUEBpWx0hO5quIag/WZ8y1KhJP1fYvZ3MXSUsZPmvqjXf0bvC
 TMKM64A8VxGdXDC72lr5rymAjKxtgKQq4OY4xlwlP6n4M61g+0x9y6G/rZrlSEm97v
 dALTvX1Ozb7Fa08mTxj7N36K7bLwPEfjFhu+dN9BS9GBFq8rXKiCy6y7JdBM/+8VZk
 FAD2Q1WwkM4EvbL/KWwx0D5vPnoc2Z0tGzu3hEk00tLBqqfK4WSIUOD00BkBlD6ouN
 CW89r1rgUzGhDdsWxEmU68mC3gtyWMtVB5dl95jsIOiGHy3AiFcPSmysuSqFEb6xrO
 09C/DI0xg8RCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=qw8rM1zL
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls for libid3tag
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d9be4a61..7bf03f12a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -418,6 +418,7 @@ F:	package/libglew/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
+F:	package/libid3tag/
 F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
