Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF1C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5434741E99;
	Sun, 14 May 2023 13:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5434741E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xs8v05nOalQn; Sun, 14 May 2023 13:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3289341E79;
	Sun, 14 May 2023 13:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3289341E79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3E01BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4184260BDE
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4184260BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n93oOKTfCyvr for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:37:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA8E60BDB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AA8E60BDB
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:37:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.58]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MKbg4-1pjpOe1WzE-00KzsY; Sun, 14 May 2023 15:37:36 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 15:36:37 +0200
Message-Id: <20230514133637.3556558-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:ANgJKbfDFAybRjm/C4c+KOF4XInYZxnrzAjQRGzQ4QjTWOUh/as
 juv0qkFrksuxmI14kHmhWu59wE9/QcdbzA9lkmwCfNXEmBrjgpkjXGIjr+5dmhdiGukIysO
 G7CHONiwKT5uLZLvTMZWEvEmaVU6yXnNzbf4gktRUJ22oc0hKQIgzRaqjf/SaD3ap8dBEjC
 GPphhERVDWIgnsNLcshCw==
UI-OutboundReport: notjunk:1;M01:P0:cKWXQWa7qg8=;MYZB+PLHzeq1hzOX7JckmDTYlzA
 UO9OKEdatj2QddXztFWX0Sm7IRdmw0Cd8JoD7wHWmpXorGWq+QyQFJdPHfq/A0qcBH1B1Lpse
 im1H8y1fQy+x6i+Gb5XeI3I/MstF4e5uH1T9hxC/scApiKeTpmP4nxA1k4esVdAyB3n2T1bgK
 22v10jMQXwwsdQ7wnVsFsGvH3lECjTPL2YG4w6KWCpErvqMrD8WAgggkMOFR0nqFkqPWw0wtv
 EiefkCOQ7YKotj3v0gqXLGZQU8xAE5GYnTyjCgDhk0EaPVXqe8S85oRbHgZITGf4W6AN30oRi
 pX2gFNU/PfJFOxakd35q+yocbl4hhtvPisE5e9HxruQ/eVHwwK1Yipb1ANaV4NeTZLOZTTWbj
 nsZTi7DA5/wPssUwczCgGpHvmUUrmT107NNP1nuttcE4h/Nrme6LlkjLjBReA+rRhF/sN160+
 htIg0m+QMmqJh2rvh0+DtBDtLX0N/B9cK08im0SZCjjjz3Rnj6Kr75G0CO1KI2eEuceE99llV
 U7nb4Soghaen6dk42uLDU0CAuVExC6K6uzOGeHOiQOArFkKFrLYE9xG59/ZNbe8aHhmfQUZut
 irLgAZh5MGbY22CszC0r9IbL0s5u2QXsPyWLjKJi8/BjHrJdAdVU/cZ+ilVjrFR/30G6JTOBm
 SjhLMdngrdcWYtX3oW6M02FTZfRi1o9MBuIKF1dONE2w4LYH/3DX85gICPYiXRSfwMTX72t66
 ah1x97nMhHtBMuIpQ8PvitYiDSgje/LqLtCSzyQVgv/Nxr8+q93cAp1uBEwMz2PXNrW8yPT/Z
 lq6wudMmC/4QfPnkCUnImpLxtbjbAKi/8ZrL8mh6krT1edqJvYWa+Oppw+iCd2AVHsVyoPvLI
 CATnRSGsgMeUQV1l6hRbHsPhXFBe4FXjB52sCfXmGoyLwCHNiReljNBr9HAfxVjOwhq43jszU
 Toslzesu6Q+mRZXI5yNVtIBx09o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1684071456; i=dalang@gmx.at;
 bh=8KmVrefIzUeb2ufNzh1w7F4IBrgybtpFdnOXAln7loQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G4Yo9tvVLFL7qjj4BQctsUDS+59AkrfinzH/MGVJ2NMCfsDG2aV1052iFodYDe1tX
 8FRftjOqUbuW1KlNafcGjXCgLH/PKqfR3CFbYL6r0VQpn9+Gkxm245VBoXpfpbfzE5
 2oDv6Cjq2797FXmtdYLgNZ3Mdjf6bZTVgobdTthK3KF0wXKhVRBgHo5hJ7pQqst6jH
 6NBDmux/EIK/n3AGqDVkZDZ4aRSa6hh6FKWJFlnoX0eVPIzoA/tRyfBXPQDgBJ0zCw
 L6FxW0YETyObJpdM69IK0esJll2gHMgAY582aGiiRNlcXaaSVDRfo9BRMmJqMwFbMG
 LQwCsAWerzZng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=G4Yo9tvV
Subject: [Buildroot] [PATCH] package/{tzdata,zic}: fix hash origin URL
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Richard Braun <rbraun@sceen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

179ae2f ("package/tzdata: bump version to 2023c") forgot to update the
URL of the hash files.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/tzdata/tzdata.hash | 2 +-
 package/zic/zic.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 3422655a71..5488625ddd 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
+# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
 sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 6a7f9f2f94..a2720a27ba 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
+# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
 sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
