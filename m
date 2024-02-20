Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEDEC5475B
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 18:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF7C40012;
	Tue, 20 Feb 2024 18:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 856EGFr5ATaR; Tue, 20 Feb 2024 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 596D240173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 596D240173;
	Tue, 20 Feb 2024 18:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A10E61BF2E3
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BAC881E8D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etl-LBMrZagJ for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 18:02:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 582D581E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582D581E87
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 582D581E87
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 18:02:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16E3CA4C2A0F
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:02:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34876)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rcURk-0000000049D-2PuJ
 for buildroot@buildroot.org; Tue, 20 Feb 2024 19:02:24 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 19:02:24 +0100
Message-Id: <20240220180224.42576-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220180224.42576-1-bernd@kuhls.net>
References: <20240220180224.42576-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708452145;
 bh=lqf+BoWA3Uh2syNlqNAhZiPkIKgG+/RRZTmw/Dqs0vI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V0/RYeOOlQMvUu5o1ROycfHNuJiF01X33yIzJ4BzcOHJyp8R+eoXQeo6Jv6/fw0wJ
 mQ/oHa9UQ5mDl365/eN6XmdsGAVsYG70qF4/DKcyYwOKvixNqdN1f1YfjOU3/bybmN
 sqK5ABHVaB1nhwXjIkSCM6N+fsoGHxYbXV0nCTLOIksbxqx5bILnMVCrdLIUI3UgJo
 hFbqwFoOe254TaLqvLhnuFu9Rzhy2/Koc5+kvczrdnPtCL6WFx5LIxGXSYClgPw6XI
 ixXv7Um6HG0Lmax+kWgEHGP9KJfnOZuZfLMkz4HR28U+/0QJ9D42Emhd7T5yHS0q2i
 WWZ3n/KxUDFbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=V0/RYeOO
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Bernd Kuhls to dnsmasq
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
index ba18d830d2..b9ca7eb647 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -350,6 +350,7 @@ F:	package/bitcoin/
 F:	package/clamav/
 F:	package/dav1d/
 F:	package/dht/
+F:	package/dnsmasq/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
