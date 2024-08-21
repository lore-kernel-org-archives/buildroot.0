Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A39C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 09:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34ABC40323;
	Wed, 21 Aug 2024 09:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rm3Pb5c_bGWh; Wed, 21 Aug 2024 09:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF11640706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF11640706;
	Wed, 21 Aug 2024 09:51:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1441BF3CB
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 080BE6072C
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 09:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIbWwoeofYRf for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 09:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B899E60726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B899E60726
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B899E60726
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 09:51:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.9.113])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5709419F57B;
 Wed, 21 Aug 2024 11:50:57 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 11:50:43 +0200
Message-ID: <20240821095044.10038-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820233830.5927db8d@windsurf>
References: <20240820233830.5927db8d@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724233861;
 bh=31b7Q1HprhJYVyKxZm2Kp0lCR7AmfPLdPirXl7sGyys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oocpSx7622z4bBkXAt+DlrfoH1K4RPlqlaOjXOyGFSqJm2/fL6SdiQaOwDMMFLwA+
 u2FAl2j4zgm9Zw0XLu21wIj0QDdy6YJ5BGgfW8O/rzurkWUgvJYr7KGb5C/gOalfmQ
 9UB+EtYAKWZcZGrhnuI7V7Ep9UGWTVXr1wSMSqfEup6kTY8Z2SRcTXPWhfncuKkwOy
 dfTpVlEhK6uxxf9qIIo4G1RGunr7h+1MZwTwevyPfPeMlh/ajulYi5rPpyrmieHKBG
 bUXhW04VywUyzbEo1qiAmGFbmjRj8LLyC3sc8Zr+EyAzMzxCXa4vjjZX7oEjZv4hiI
 e/RnCV1YKfuWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oocpSx76
Subject: [Buildroot] [PATCH v2 0/1] package/lsuio: bump to 2020 version
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
Cc: Vincent Jardin <vjardin@free.fr>, peter@digitalbrains.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1 -> v2 changes:
  - Apply comment from Thomas Petazzoni
  - use $(call, github, ...)
  - version set to git hash (missing tag version/archive)

Vincent Jardin (1):
  package/lsuio: bump to 2020 version

 package/lsuio/lsuio.hash | 1 +
 package/lsuio/lsuio.mk   | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
