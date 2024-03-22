Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18C9C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 06:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1842B415DE;
	Fri, 22 Mar 2024 06:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ikj-6BpdZ6_R; Fri, 22 Mar 2024 06:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2194168D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2194168D;
	Fri, 22 Mar 2024 06:03:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6CB1BF421
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 06:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07071417DC
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 06:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lbn33AFDtPJd for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 06:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B443740125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B443740125
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B443740125
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 06:03:13 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp6-g21.free.fr (Postfix) with ESMTP id C4D0778034D
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 07:03:09 +0100 (CET)
Date: Fri, 22 Mar 2024 07:03:09 +0100 (CET)
From: friedtj@free.fr
To: buildroot@buildroot.org
Message-ID: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.12.170.33]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF124 (Linux)/9.0.0_GA_1337)
Thread-Index: YVi8kiDSGROpJ0jDrcxIyDi0h5yygw==
Thread-Topic: package/gnuradio: activate gr-iio
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711087389;
 bh=79mAEsBqJLGVdpAwdIcq7Exu3Jnl13FJcb0CTSVC8/U=;
 h=Date:From:To:Subject:From;
 b=S7iGkyZNXQms5d6190ANBdxJZugiekk/17YJcme3UAovSlIbAstp2Md30rv2Y5Fsi
 MUs6TkfG1Ue4N5TYyye4xcYTjlnQKVCAKB1neGSSg/1REZ2mr03Ehp2CBbMpmuuQBA
 Qoz6yUXjBl7znem/K0xc1IPhVfuAihpYP6Vv8wEJGrvcaGpr32S5JHgy3puiiQtABn
 z2BAeBpdxXAlv/lU0TJK/EOBuBw8djVUeWN7gX7FG4FnLYV3NEzWF9yVkE7FpJ3APU
 q2/Km1SaEP2EZ/DkWIG4Stl0cjt4I/pSH+SGbUM5LBguNxt3WSvlPf5IKjOasp75H5
 6nlxmjiihvOvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S7iGkyZN
Subject: [Buildroot] package/gnuradio: activate gr-iio
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

From 3b5476d595b8db8a9920fb83348eaf5e2047b0d3 Mon Sep 17 00:00:00 2001
From: JM Friedt <jmfriedt@femto-st.fr>
Date: Fri, 22 Mar 2024 05:56:38 +0000
Subject: [PATCH 1/1] package/gnuradio: activate gr-iio

---
 package/gnuradio/gnuradio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 4e82c9e129..ef4965c578 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -25,6 +25,7 @@ GNURADIO_CONF_OPTS = \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_GNURADIO_RUNTIME=ON \
        -DENABLE_TESTING=OFF \
+       -DENABLE_GR_IIO=ON \
        -DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
-- 
2.43.0

Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr> 

Prior to GNU Radio 3.10, gr-iio, Analog Device's Industrial I/O driver for
GNU Radio, used to be shipped as an out of tree (OOT) module. Since GNU
Radio 3.10, gr-iio is part of the main software but not active by default.
This patch activates the gr-iio option.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
