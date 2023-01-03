Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFA5C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82EA14176C;
	Tue,  3 Jan 2023 19:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82EA14176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gmWnT5wu8rq; Tue,  3 Jan 2023 19:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C9441753;
	Tue,  3 Jan 2023 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C9441753
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75DF01BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EC941753
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EC941753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWD99vG4ZDGW for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:37:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88ABC41748
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88ABC41748
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:37:11 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7780613F89D;
 Tue,  3 Jan 2023 20:37:06 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:36:48 +0100
Message-Id: <20230103193649.7488-4-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103193649.7488-1-ju.o@free.fr>
References: <20230103193649.7488-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672774628;
 bh=/Hl93AqpsEjZr29x5vbdkAwQ7I3ovRqi1yXsTwKhHJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DMThwkmCbBgOZBvF0xiWn0P3Yl805EMe6HnxnGmWlPJqmCcbpBvLHX5CVBDrO8Fvr
 tAV3+gZdY4VVrtsBvbxlCDCKIbE/JtLNYMEpSMuDdcTqmdDKG4WB5NdZVYDtZ7Mbcg
 Lh8T7gJSgB53gDnmYuGCf+1BzlZhACXEZ1Pkimfee0MbqCoq5ew+QkSpfPAU/Gc0UD
 OCIl13jZ9+SXGVU95EvFxwLArE8T9QjAJmn4XXBMgC3aDNSwHITaP0arK1nh9KPEpI
 Fp6176CC7FxV/f/uEIPQJiGRyvrs0IRCYWQ+rzZPrDl8JGKYZIx2Sge3VZA/UVULUk
 EFtuDX/mJ/ULg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DMThwkmC
Subject: [Buildroot] [PATCH 4/5] DEVELOPERS: add myself for package/gnupg2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8399dcc7af..86e3f0e7b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1682,6 +1682,7 @@ F:	configs/spike_riscv64_defconfig
 F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
+F:	package/gnupg2/
 F:	package/glslsandbox-player/
 F:	package/octave/
 F:	package/ola/
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
