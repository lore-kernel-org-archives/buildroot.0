Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D952AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 05:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7292B41995;
	Mon, 30 May 2022 05:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALFjAS3588aS; Mon, 30 May 2022 05:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E05C41773;
	Mon, 30 May 2022 05:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5795C1BF47A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 05:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41FAF405B3
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 05:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-NFNuf4Jy74 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 05:08:13 +0000 (UTC)
X-Greylist: delayed 02:19:59 by SQLgrey-1.8.0
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net
 [46.105.79.203])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31A54049F
 for <buildroot@buildroot.org>; Mon, 30 May 2022 05:08:12 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.110.208.131])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 9D77223D33
 for <buildroot@buildroot.org>; Sun, 29 May 2022 22:33:08 +0000 (UTC)
Received: from blach.pl (unknown [178.218.193.145])
 (Authenticated sender: grzegorz@blach.pl)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 3A4282AEAC178;
 Sun, 29 May 2022 22:32:59 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d89a792d-0779-42ec-ade8-5ca32006430e,
 B6E767EC557CE4FA95D05743EA4C0310EE7C05D6) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 178.218.193.145
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 00:32:43 +0200
Message-Id: <20220529223248.51556-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17627933369963200833
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeeuvdehgeelledugeelgefggfeukeehtdefleeugeffheelhfeihfetjedvueeuteenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpudejkedrvddukedrudelfedrudegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 1/5] package/python-rpi-ws281x: Bump to version
 4.3.4
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
 package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
 package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.hash b/package/python-rpi-ws281x/python-rpi-ws281x.hash
index 06b2d18607..ffdd826b6f 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.hash
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/rpi-ws281x/json
-md5  333dacfc58058d5f485f9af74551c70e  rpi_ws281x-4.3.0.tar.gz
-sha256  0b9549687ab7117acbc4bac0e92742fd2c8290fd204514d72fed91c06ba2e805  rpi_ws281x-4.3.0.tar.gz
+md5  016e1f03f9168ef03d4baf074aa60f03  rpi_ws281x-4.3.4.tar.gz
+sha256  072eff1787e579d1710381b27c467709e3aab28ac579c7a47d7cc87398496f28  rpi_ws281x-4.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  LICENSE
 sha256  7bbf6337c1eee7169579e6acd398f31ea274dfa3a1689ab7e654ca3585d5a8a9  lib/LICENSE
diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index b711039615..73befeb56e 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPI_WS281X_VERSION = 4.3.0
+PYTHON_RPI_WS281X_VERSION = 4.3.4
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
-PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/cd/b3/eb7ac93376952f165577707ec756f40c9537ed53c59fcbc3290c357370e0
+PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/e2/d4/75fcc4f3412b9b16e39e6cd6156f2e171fe7b2e79057be17d1acf38fded4
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
 PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
