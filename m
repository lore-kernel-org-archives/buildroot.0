Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A668CDD1D2
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FDB84ECD;
	Fri, 27 Sep 2024 18:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4bBmhDSvE5g; Fri, 27 Sep 2024 18:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83DDB84ECB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DDB84ECB;
	Fri, 27 Sep 2024 18:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF2761BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD58640042
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVPOrPy0SjtE for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B4DD40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4DD40022
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B4DD40022
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:34:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1suFn80to8-00597O; Fri, 27
 Sep 2024 20:34:10 +0200
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 20:33:57 +0200
Message-ID: <20240927183400.339491-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:fJ5kyEVAwIwfEPuHCvAMPpjz5S8VIV7bu7hJxPAILU0DIpkGRNP
 OBs33vHrwOu+whiUGv7U1KJs9vX05ZMOeMifXUs6ZaRKGNMgYqFlUlooc236RUWTm6Fi1hS
 CCA/ZE7onch7McfhG4a1g80oNzY4s7ET/9cS/RA15w2BLf5ODboCg1TIWvDjX+UXG/xHZio
 EgcLjpmlKZW7Xnwn201Ew==
UI-OutboundReport: notjunk:1;M01:P0:Azw/yyK04nc=;YVFTtl+JMiYUC5TZxRBC2TBaX7x
 9R9qzzGnxywueLXo0WeLVW57kqECBnKrdGKJ5fzJdZEIEOKL9mF/lzPNdyTNOG8xC866r8csB
 I2XhMvZtNPLsXkZnIzX/YGzNhjbugCjSpWeb1BcfH7F0euK71DpksbhaPhYoqnV23v8/2q6jJ
 p/i6geyrIuVeLWoz2gyFhuaXMbtYD8SWNVa4GZDH0uHerJzElc6s6xGIkMDX0UHJmYq9EwIk1
 rUgvu/5/KA7NnXshiP045n3qH8VfE95sXyaiC90v38+lBnmgltEAtwBeHBurxS3HwxGivDOzO
 lqBsZdv9Q1YIIH2tfzVBD9MQ6ikeozJjPw8+9OSxyPD5yFnSqo42GrOT+5Ldi34iZ7hUhFW3B
 /OR/kUO48cN5sYamAE/MWsRVdZ+HH3WpqUcAjOGXgxDkIus65sTYfMr2VyYabNlXLV0xE7hCC
 KIQM8J65TkknIPF2ZKEJYBMQrAH508B2SFPQCYOzTk7uLeRtTYaBkd+BQXSuM+kbk5/WqIpnQ
 IWanJe2oxVQGHbSpQlxYBCvPdCo8+O9cocO2RSTNwC+eGPW9yfHax4DLQj6xF7IhwHIkXWH7w
 bP0Kykq2U8ENe2l0DemfHvE7V+87x+UW5CCaldJaxtTR8s5wJmSbg8NKjVtCqhKCeeEziCxnH
 4DM22F1RxWzvp33khmG5yCJyyaSA4HvAOOBeDm8EtP/bJ4qPQwWNMs5ghg3uFbWO9gTx5QqQf
 SriNnnusInUKzTwNx8f3ab8W3YYeStH3TpEoCm4BOMVMQ2dUCV5e3WC8vJWH2A0kSRKwBxV/L
 7jiuAkhgNtS+xp5XyEtfzElg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727462050; x=1728066850; i=fiona.klute@gmx.de;
 bh=1lz8BJr3l3scXv4VTmVEUqUnAMI5f/wedqUVbIai73E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uGU/nwPHsJ8jADcSENfY7CPIbY6Kl/Jii2qrWgYfRVNDNJ2n1pRfcAUd6gGBLbat
 SoGvHm3iWFJnPOox+WLgZwZe6aXOyOu96AzondVyRPy7T1L49UYMd1BLWaTotJ41p
 omJwmT/OEq2FC9JdjBnqzTaqw+6qNYcpdAqkw0oMjrqL/RVOimZMDv6f/hBYP0xE6
 2xedc+pdlSMOFE9yzQ4uQeg+JyNH78F3HGhUEHNigAud79Rqt/59C6qoc0aP+YggT
 dxg5ywPV/OXPsyomhFqKqhlfRbtIgJWitnSHrR+dno7A6DtYqlEOvUHm87GgchuZs
 DEY8a1GlxqTuGdoS2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uGU/nwPH
Subject: [Buildroot] [PATCH 1/4] package/python-tomlkit: add host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Required to run poetry-dynamic-versioning on the host.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-tomlkit/python-tomlkit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index 99b974da5d..0b1d32c374 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -11,5 +11,7 @@ PYTHON_TOMLKIT_SETUP_TYPE = pep517
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
 PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core
+HOST_PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core

 $(eval $(python-package))
+$(eval $(host-python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
