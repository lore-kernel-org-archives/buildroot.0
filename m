Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE08C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFE35827D2;
	Tue, 18 Jan 2022 21:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuDDKZibYXvg; Tue, 18 Jan 2022 21:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14523827C5;
	Tue, 18 Jan 2022 21:14:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2981BF33E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A45F400E4
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPEi3uyEgzCY for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 21:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 274BE400E3
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642540477;
 bh=hN9UCEysWaEA2qnET3nPRZT+qVX6FDBqSMlQKUfsX0I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y8GibBu4AzRCtjCuBDoDXAkahC6FLJ8yX4nXTppAE2+o5M4zA8Y5lc8xHl1a3uRAO
 JkSlapWs/C0C0KcfJF7C66KQ3If/Gw1gf7XfpydkffR0doC7LoKe0MtsJtmJJ0hiUN
 I6Miuyxpnz9iut2iwdZsD4j+CwLZmU9uWhIjaSXg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N1Obh-1mBsGN3Vpj-012rIA; Tue, 18 Jan 2022 22:14:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 22:14:31 +0100
Message-Id: <20220118211434.9854-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ambjBHsMXWzrKBoIE5w1zOjARZas7LdkR5ln4nnhy1JMjUjI2Nz
 4wyAKxMPEzrUXK8gsi+a6mRdqYAdRKkHXsw6XCDpEBurTSF9Mh9vYlg2doKBeIWOgAXPmmk
 B6KWQiXS4+rX9ipJwtg3TxOKls3VYIvXR4Xer3yivWVzAECCvkyN2HIErJu8z/CVfb+8csd
 hF7qdd00LW/RXF3SrpFjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r1eSpcCl/N8=:2HRMHtHqXX3K7MQClZcA2c
 DA5h+4HDrxcY0MomKBPqPuzxYnS4vYXEgD4YM4ejAUxUrb6MVfP0XVS5RRszSKZvS/fJlGYlJ
 v26wEgfZs1fF+oDUdMBaLIUKl/2dsSsORNyjEBntPrmk92hHJSVawm/Ddwt741/bMSxe+boP1
 LwXvJQEjaEnTu3WbESih4J8vc+pbNaJsILgC4q0+RMofv9CSgTU8vCKWe8ILtnlYOAnSUDD/H
 wLkc2Yt043PARUKz2VnsLoBLnAk5L+/LFajpIQmETOBsvd/l22drUUYufObog8xe7rYGkyB/4
 GmbmNMPkLCYsRVwyt1Hyuhmnc1VQPnQuiRBCJ32xn+CmZkRSYQOAwSby0adRmYZ0O1UQkpGFK
 ec7Ir15l6M/WaDYok1C1peicwsjYE1DO9fwsmcsPNjanPwN6nb6xuUk+gU0tXoLIYdoFH97fo
 KpZxS1zzBF1AsTXond5G50duqsSVZFWiQ3H1HB93BVVwUHk7xXs5kNUIhxJE1HE/vLdafJmn6
 WXzZEBZl5XDrE5ei0iBSyvTn/lesQSiZkDpyLsbV0ce4Wf8edkmhjUvI2zfoWAbeTTz2PQHdP
 ++U9qF+Se2A0Y9kDOrajt8ACVRKTgsg0tOfuP4xtAGdvnIIriVqhlTKZV/rY6Q2sP0Jy5r5D2
 ZGsYhJut8ETP2g/tsdAucK82nzA39t2OwwOng0W9DCYG9XdaBbRgJyQQ+gB/cMLKSkiG14rhJ
 gWQE8I01oKKa/oTcoa/3nCDRyBbbB5AzkZz8Ec8xq3mcwTo/0gLMrEQn8foA3ALzAOm6wROtu
 h7zSOJsTeR4VolYvtStbU7jmowMvEX3HvIdB5qltmA4DCvjPQORzMVPNAM7hVXEjdWmkY8xQl
 c6J5FEYK8r2YjucyfKMefA63SUEaZNTcNfmIFHSGhfMu2TMZkCfWx9OIaerzRZoIC8jivJmFC
 QpzV0Ecrgh8kHPD+tSDZkNMWZUabe6ErZgJ2arZvSwMkIYKPsgPf/aUvkMed+3HBVcZRXemkD
 apu0B7b6IE0SrWwee/YCYByAvXKT+SEkd9SwfNHKkIJkamCyT2tNFnoiLhiSxcJl7tY9iZE6D
 gGSnJLyN6/9OdY=
Subject: [Buildroot] [PATCH v1 3/6] package/rpi-userland: bump version to
 14b90ff
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  f5404b2 raspicam: Check system is running legacy camera stack
  14b90ff mmal: Hack to make mmal core register VideoCore components

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 8ea184a4f6..b837cfe709 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
+sha256  bb682f3c20bc5c7877531d5666c8dcc674a2f347aa792cf979dc0b07b6261e77  rpi-userland-14b90ff9d9f031391a299e6e006965d02bfd1bb1.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 09a7f6af74..84050b6df3 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = bab9bf8790cd69660d443ce43b4e372999f3f7ac
+RPI_USERLAND_VERSION = 14b90ff9d9f031391a299e6e006965d02bfd1bb1
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
