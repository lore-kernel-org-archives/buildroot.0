Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6DEC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5C78473E;
	Thu,  4 Jul 2024 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iX8JrcD5Umwp; Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C1684721
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C1684721;
	Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABDF31BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99FB46086D
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIi2RQIf5NTp for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E1386085C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E1386085C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E1386085C
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVDM-1sjB42090a-00IgIt; Thu, 04
 Jul 2024 21:40:38 +0200
Date: Thu, 04 Jul 2024 21:40:28 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-2-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=967;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=uzv4+IrR78VJOzD/0x94xhZKC8rraJbBxIiWtuHX228=;
 b=3Qbkt3osJ2voKyZUpaPTSySch6Do7FKn/FjXUz8sWra3AQ2hVoERXEIiGC1PNi4rtWlz5IrX3
 fBqlX51kFXOAZZZ6RzlzoXs8Wuo5iXDwsRGqeefodHqpr8GYBui+4Tn
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:TyyvOhpAelKwOOuLE5l2DLGMUT0vCEmL2dRz372Meo/kkg1HLym
 PaCshv4d55CJ7aWLNe4ivZMwJr1ldpOol069HPQO2ZBDY3/7suexjzxbEh2udZpYnL9ezRe
 I/x0Wo3mPOrBtvYwRIYf/stOuVoqVChOVQx1vHB8uNvpVO+vh8IHRk5ISZu8MdK3ieMjnEv
 pRRG+Kv7WwVTFuvMzdIgw==
UI-OutboundReport: notjunk:1;M01:P0:f7av0rMZnwM=;Zwffxs0v8wTwPpi3bSHr8mJjJ4V
 eLdR4lQkH1kw263tIf/S3xz+pyQkY/2difyc2JwE5CazzR9WU8Nhx+2SmOWjNsZXHmrhK9Xvf
 35pTcAAsQ9Ydypl9O/hiGPyOc2SIaIMPqmj+fEj6+oV5jMTf0Ryb4moLIYU+PUJfYnFj1f8pV
 lA/YJNKTWL1bvwRkUKCN7qcHNHAbz14831qhvH26PgTyUgtMALCBYcofIwiO2a3maaa//wUPI
 FxDzldX0Q4E9CufvOfYd97rOomJrjZchSfI/JodtoIlv8p45yNasKLVei6f7FzSTMez/QEI7f
 jySlNMNRcWn4DoxUMgRA4aHshqrJhK4vrz3wO0EPynBhg3/x81ketfQFj6bOZP5ShBFxxt9Sn
 2ya5tHbEGIm441ZU/CVhPmFF3fnlPkIMc4W/Y2Xn/nV7u7RztPT57K/Gv7oMyjSZnin8tFYdP
 qz3youjUDXw1KK3ob2CDo9VRZmKqSUlG3Xs9tvgefyknFQ1UoVKwO+74TYYUYyzQJPIb6NqIb
 5yMUPxaEINVNR3J1LRG5rEFJKF9J6XHfd6W5KVN5lgAI3SLYs9sMruOmOVZ+Mql0i7OogbmV8
 /SJmmTEXOH0L1fVTmypEaEFZwSTiixafqlyFsYMzlvyEE2kzxsPMF5EeWYGyPc9BLKqFmm1Pl
 GIRgTHxRpc2nbBcUd8kS3SBOva3bV85i7P8Zy4gE24is4Gpo14U1PVvHKe/VD4SzKvlVqcYLu
 BQK6iwbwt4NtWxM5i9RK+8e2cGw2E5ZgdD86rSZqU2VBU2/6lXSHt9yv2DAFNnK75+3iq6Dif
 CqsXWOmcspDmf8fufsni6zoxPyUYZTL+HeAbgWjjLlEFU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122038; x=1720726838; i=j.neuschaefer@gmx.net;
 bh=+VyvqwVekbZF5019PauQci7PCLvP/BJ2NW7JisquqdU=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lZfGrdytTjEtoDjAGPiZ9av6s7qdX/iJP2Mv1eh/dRa50g0gF5Rc3l46nBWAKwo/
 Cuo05PGXGVNMGs18eVAoxa2G3NTsnOX6NxS0otkAW8sHE0ySJgxytD+9lBkMrRcbd
 1BZDW6nvbHssRBZmtjwhakQTHf2i1POgrX5Ya625IwPaXjlPD+H+5UkrKdN2H9zHO
 Oy9w/vmaL8EbhVij2wwNuRW8f/CkR3vKPPQyQtJ31bsnoYoiqjLIaaUc56Cc3FkKC
 UQPjxneGK76CywWD2aCE53lBZ/YoD43fSonSXO94cqLFdXjes7GzZWGgU75jSCLgy
 BFVFFv0uIf3poHBujg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lZfGrdyt
Subject: [Buildroot] [PATCH 2/8] s6: bump to version 2.13.0.1
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
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index fb5e74e403..6abeb8066a 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c95d51787602e0c8c8e4f92a710cbdaa4ee797ee886e71342727e2974f95c06b  s6-2.12.0.4.tar.gz
+sha256  7e46f8f55d80bb0e2025a64d5d649af4a4ac21e348020caaadde30ba5e5b4830  s6-2.13.0.0.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index fb4910e28b..7e02c26d03 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-S6_VERSION = 2.12.0.4
+S6_VERSION = 2.13.0.0
 S6_SITE = https://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
