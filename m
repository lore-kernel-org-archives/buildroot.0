Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47ADC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 23:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CE760B1C;
	Sun, 11 Jun 2023 23:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CE760B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSCKB8sAaf7E; Sun, 11 Jun 2023 23:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9B260AFC;
	Sun, 11 Jun 2023 23:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9B260AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13EFD1BF39D
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E14B660AFC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14B660AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmwIKrIKg3-v for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 23:46:21 +0000 (UTC)
X-Greylist: delayed 01:39:50 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5B8607C0
Received: from 16.mo561.mail-out.ovh.net (16.mo561.mail-out.ovh.net
 [188.165.56.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C5B8607C0
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:46:21 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.136])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id DDDBA22B02
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pl8sk (unknown [10.109.138.36])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 581071FDAC;
 Sun, 11 Jun 2023 23:36:33 +0000 (UTC)
Received: from blach.pl ([37.59.142.107])
 by ghost-submission-6684bf9d7b-pl8sk with ESMTPSA
 id cIr1D4FahmSPFgAAc/dVnA
 (envelope-from <grzegorz@blach.pl>); Sun, 11 Jun 2023 23:36:33 +0000
X-OVh-ClientIp: 91.239.248.252
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 01:36:17 +0200
Message-Id: <20230611233619.128038-4-grzegorz@blach.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611233619.128038-1-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6521775210499817793
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhriigvghhorhiiuceulhgrtghhuceoghhriigvghhorhiisegslhgrtghhrdhplheqnecuggftrfgrthhtvghrnhepieffhfetleevtddutdeutdefleegvdejveefueethefgtdfgjefhvdetffejhedvnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdeluddrvdefledrvdegkedrvdehvddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhiivghgohhriiessghlrggthhdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b91a55ca-bdd7-4e45-8868-8ffbf94d8c7d,
 8D931DDE0DEECB89AEA118D672F623587F6625E2) smtp.auth=grzegorz@blach.pl
Subject: [Buildroot] [PATCH 4/6] package/python-pyjwt: bump to version 2.7.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index cc64be6cca..249f0e478e 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  aeed6d3a581ae383b2288a2079fa562d  PyJWT-2.6.0.tar.gz
-sha256  69285c7e31fc44f68a1feb309e948e0df53259d579295e6cfe2b1792329f05fd  PyJWT-2.6.0.tar.gz
+md5  228adbf1f9d2bcd42bbfb6d3b43dc48a  PyJWT-2.7.0.tar.gz
+sha256  bd6ca4a3c4285c1a2d4349e5a035fdf8fb94e04ccd0fcbe6ba289dae9cc3e074  PyJWT-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index fe4eeff38a..982bc758df 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.6.0
+PYTHON_PYJWT_VERSION = 2.7.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/75/65/db64904a7f23e12dbf0565b53de01db04d848a497c6c9b87e102f74c9304
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e0/f0/9804c72e9a314360c135f42c434eb42eaabb5e7ebad760cbd8fc7023be38
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
