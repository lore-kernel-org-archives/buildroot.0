Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834CFC3271F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A5B847C4;
	Thu,  4 Jul 2024 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qd97kefSFT00; Thu,  4 Jul 2024 19:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A57D8847D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57D8847D6;
	Thu,  4 Jul 2024 19:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1595D1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 039766085C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHzMxluC83r3 for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 897CB6086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897CB6086C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 897CB6086C
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1s0FyM2GIX-00jfsR; Thu, 04
 Jul 2024 21:40:39 +0200
Date: Thu, 04 Jul 2024 21:40:31 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-5-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1047;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=TSqfQRbn8qbhCqsWliJAF+wkKDyf5L1bO45evWGB4v4=;
 b=W4mmbb611+4RU2LKUCBNucJ/ut5Oe/cas1r58tUieqn+Rlj+yzyIeIkrCMV3JbJ8KkQdoxic6
 XloPNfQDI8uDvTK1KYYEyaSIX0uvpZACX2dlCMVzAWLIVKTpFGfgWSV
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:tZjJePj/qYpRzcQ2+/e22kC6vxBs/6jEia7jAT0Xsc0PHIE8iJm
 OEF1iZZp5irsIZ5Jb/i0FWcRoBQD4z+ulBIQjmQe+mXJbuIm7QeCqmSer4QbwL6T4/56OXq
 lNZq0oQifOKFUXQ7ooG2rLfkhuCOf5dCHwDTcTwu4vK9sOtINOd1Fo6GSGJ4TlGS1nkglra
 fAwGBgR1Vv4iUhNhKizhw==
UI-OutboundReport: notjunk:1;M01:P0:DJ4Lh58K7Kg=;XoMfirItUhk5rXTY89WVydiNaFy
 jaTXvI4p2t+5wXkieOtXwCovZXQhFlZya9wU316XcJEjhpeQ84w7o/EvcWFNhDNEqFLFmOlkX
 eZyGfI34agXkJfNw0jSbDrhnBwyXlvlkgeDwz+VJXO3obQor5WSCv82HQVYWbzgQY6+zdyf03
 imgam6ew7dk5iNF2xeolh7snuWf6CDTKfzNhQSedK0jPMiRB8r1gn6C2tVR5E90K1iK7RnQen
 dsfCo17rOQD5Gx7/R4REk9YmkFCpIa9CIhLZlM3rTr5SoJ81xQViV19TxutmQ8rc7NHUB20/r
 hQDmBbYgDk++P/tS81yzvwHeQvrYYLslbg8Dq2sxTELr+HUI0xrdXYbTx8Iptwuv21X4bPL90
 r+UMJbu5Gk+/bEUSJgZzK2pEouVDC1a/j7E9bsyuAa0sVh3W19NXqRztSslp/M4ha+w/yHDWA
 B/RlKYnMGW+ZYdO19y+UO/qAyBPVWC952xd3uH0fw8K6z82812hkJmAV/gHg7NXjrVZPtbq+/
 hQNg5XaEjVyF1ExEOK8KT2Xv0CDcklclipNn3oDjZJ4BiArvUg3Wr3szAtxNBkYNuX0EXOKll
 hZmo5minlgmkBR1hYmCbpKm1dDEDijz4gpnYif0tkFsSspzC+GcJQwVP5eUQEOqdFFxi4jIo3
 fbacdm+BbnPYvbdq07DrSajFAL1Suo1Bv+jXCkWMoXybaTvKICyerj3jNatLTJtG4V2mg7ZjW
 pgC0ZEt17zQqCb8PHnJnK0kPrQ4GGrizQEzUmX+MxuVYffKnSW+flLGPIOEa5mGW4Gy6misO7
 J+E88ueJ5Fjr31XLxklzwfImKvxNlKw6E/+YlFKmwSKM8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122039; x=1720726839; i=j.neuschaefer@gmx.net;
 bh=OULbjwGbYNuY4KQWL/29Ip8v8d4Uw5Q9OFNXCPHJ1vU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ScTOv3EnmOfiV+UmFQFssNfTjWJZMnwg6UlcyUlKAXtf4uSW8zus+QDaoFozrICy
 LUnkk5xf54f6KF2z7dFujs1Pgmq9Z9Tsg8M+fdtsTZ8LNcleQ0SiBImAAnM5N45A9
 UJLoJuTsUtUmURzsEte0gjIaoMa9mqnQyumbmpKdZl/1iV/rD13nw9xv3xpswvJQU
 vJYscRUMH3+LB8a6CJsJp3dNhdB11pBNqDqRT5yHcEuT75AVlV7d7i6FiJOWSSQ8b
 P8BMlkbQR8VuJfzwMa9sA4ZD45ysxVZhGhrXDIwy4gt+1wVfNtaJQUnoiGTPWcrr6
 IyhHNVUvU7QMu5OcZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ScTOv3En
Subject: [Buildroot] [PATCH 5/8] s6-rc: bump to version 0.5.4.3
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/s6-rc/s6-rc.hash | 2 +-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index a09c08ba3c..2cc308ef95 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  00bdfa596fa7161512e972ec9282a2abd8fd0e31f09177bad7a2bc3d8f283982  s6-rc-0.5.4.2.tar.gz
+sha256  e3272796a947904de37ab34ec10430e26107b8ef05210d81059c8b36203e6a9f  s6-rc-0.5.4.3.tar.gz
 sha256  f68451e55e6686dc187df1ca427c574d9ac0d6f6926e1bdb909ad8b657668fe5  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 61090c9a27..301c705910 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-S6_RC_VERSION = 0.5.4.2
+S6_RC_VERSION = 0.5.4.3
 S6_RC_SITE = https://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
