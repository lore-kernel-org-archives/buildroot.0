Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB0C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A0A40718;
	Wed, 16 Sep 2026 12:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Kzgylhi1ezR; Wed, 16 Sep 2026 12:53:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E4A834071D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789563183;
	b=HvS783B5dlwkAJ36Nwa26/Q51gVhUTTeUeVcKU9gl2BgMkcgwnYUuFhGxjXg0ZR6S8W4
	 CwaoukPOuA6DPXmYm/7OtltKqvJRNOnypN/slJcYOn2Bcbu7pfsa1Oh/NEN1psbzmXlNl
	 EFE5WI1/IMbYBfLzn7u+zNexHj0ThGLXt7fNmfgrAVptMezbofJ5rZmYKYKqLT5RJKRae
	 b4jDEIlUoWSim90ojguFRBm4tzynAMe7WS55IQCd6OJ1fsQX+NmOmUZSAofRapRHQphS5
	 BNt/CUi0jBjX6N2HzGLmJC/Ii7d0Yqqhqu0xCnt//9ofXg+BctEBDZTaizgnUZuYAAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789563183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8ecsvhPlnH4bTzNHmhEIxUTOX1bd3121iyyRlFs+vvU=;
	b=BjYg6i86q/YDyDEqs9BTAPZoF42ntEGhpRFQlfom1q65H63V3baUcrttv9BVd/shtFgx
	 J76ru3SuQC3GYYYZ8EUcjCmG8jrukL1T3/8pYjTJX9WMjT9Io949qdhArSj4D1Ixr6f2u
	 vpft2lGlTa+4p/CZLYdJj6WQOGiOpnGA083y6aVmAPWvpEzmolUUU7vGhB//Br5P7YtfS
	 IQejHP3PlEdrIwA65aOpmIMQEUAE5F75Q4g/ymelUzj/e8rf/USaAOlwRQq3zXwLhX2nJ
	 BPjTFFMsshKoEHRR67uG5AZVvJrAYnBzQtfhAbq7m7TkVPEQZRv6myxe67r3iabvSGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789563183;
	bh=8ecsvhPlnH4bTzNHmhEIxUTOX1bd3121iyyRlFs+vvU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pzLML9ai+/lJCQOF+ompbrO41eWsIKjQK9gGaz/QOSdGU8q+j12Eup98BiELrpB6y
	 FgeKFCMeF+iR3HReBj4KNpYpFh3uqio59uYmuHle2sbqaUUOShqnXW/Mi59tla0cSn
	 h2vdoY6o5O+uelXYixkOIgI76h5/61AXFR8ZPcOfuzWU/4PCsNdbORs0rS0kHDk80e
	 8qv4Ni3mw3Es4HCteASih0z3RYBGbA+uwB3+3ibK1I9yedvteMhTN+3wCgCtDKACcF
	 8Mt+nKAdrFMSlIRIzaTSsQp/bslAQi/zvdku+83VcxwT35Y8nNOnLWWXn81dXdowvH
	 jOPnUlpaR1ZdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A834071D;
	Wed, 16 Sep 2026 12:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15370388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF8AD402DF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfhrZl9gasIe for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BD91440093
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789563180;
 b=CV9HMJs1OvVwFP6WdUdgZ00fWKtJZumSLQ3Ggdo8+RLYqT6oyelYgsnvQYTh5/GU+fWj
 GIWk0QGwICB43JUmtRnqqMqT+SfdmjNxsSkkRp61vGBat7h37Hf6x7xXwDLCeX0Mov9Ca
 UIH9Ps6kNxkgGsICGQ9lOWVqx6ePuqyGE+7NJ5DTGnlJPjrrsXbF8cv5xqEtyiMtBDBNw
 BJ9w8FF8n0EZWHN+n+qftQ9czfBnom/YXLUtt1C0EZsLq48a9gEnp+E/rs7DuHdR9n342
 c5rhpkZzgMR8UBFwwT8nz431n178bZeWQXmc/IHa7FQFUd4w6kXUsIu5RE23UzopUIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789563180;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=nRWthBoBkIdR38NRbtgVLEdpkyTPoLwyNQVFuvrEfXk=;
 b=r5T4J55HYPYF9AdEgMaUHpr6lG9DfPy+koZXKGmC3k0GNm8wtJcEGbErCTOHmHzuWsNZ
 TLIaGNG+2KxGypgrug06T2qSoZKMC3BvMb65O6AoF+KejlRQQW0ZgluJ/eGGm7OTWO6jd
 YnOkegNFVFeQ+RXKNVnUxFpmUHcQ1HbGg6L+nHg8TtR96fGgLZnzlnPkmrZkQh0AL+9GK
 nb/G68KcjBeBxfaJ0iCno/pd6USAkm6luWS0IfJ0cOTt1HqKwXKrDN3gJlUbi9rLEXLTQ
 BymONK1idUlZqtehVdhwdIs3yB6xeN4FLjaz/BcxQngFcnO+Gksj7mQc2DzEdRGEVGQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GXepbwGq; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD91440093
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:52:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1xG04x0Qzp-00Ysd5; Wed, 16
 Sep 2026 14:52:50 +0200
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 14:52:32 +0200
Message-ID: <20260916125236.2759304-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125236.2759304-1-fiona.klute@gmx.de>
References: <20260916125236.2759304-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+qpLOf26Y/HHBaRglVEpMKUPUQcu7tt4fI5xHMf/ONKRFBI/22S
 QFn8B8LYsnCTj6mQxohPWJWJyOhk1hGSygsK8lBnf+vHP4mqOz/IstEq9iqZRmMkPQ7Vyyj
 ZvAQA4W0L6z9njhE/Tbup9fJoaERZz04175YrL7fsiFPIIzYsfxtmAV0A1Y8Sb1UZu4Hjl9
 L692w7s1yxFTOvqZ02J7w==
UI-OutboundReport: notjunk:1;M01:P0:Kblbq59nCS8=;At/xTZ4xG+iPFchzjD09MROOKJp
 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
Subject: [Buildroot] [PATCH 1/5] package/btrfs-progs: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(othermo GmbH\)" <fiona.klute@gmx.de>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_BTRFS_PROGS_DEPENDENCIES already contains host-util-linux, select
its config option to avoid confusion.

Fixes: 72bc28e0ddfb97a327a2bb5a2f98959abc88a612

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/btrfs-progs/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/btrfs-progs/Config.in.host b/package/btrfs-progs/Config.in.host
index cdcd2e4ec4..e7557838c5 100644
--- a/package/btrfs-progs/Config.in.host
+++ b/package/btrfs-progs/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_BTRFS_PROGS
 	bool "host btrfs-progs"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
 	  Btrfs filesystem utilities
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
