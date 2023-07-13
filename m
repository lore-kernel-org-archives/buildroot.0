Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA90EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5775B61312;
	Thu, 13 Jul 2023 07:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5775B61312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fykP9MRM3EP9; Thu, 13 Jul 2023 07:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D78612FB;
	Thu, 13 Jul 2023 07:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D78612FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFC5D1BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 819C841C3F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 819C841C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsRG7olslC7l for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D499B41BE2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D499B41BE2
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOREc-1qc55K1vAM-00PxaU; Thu, 13 Jul 2023 09:38:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:48 +0200
Message-ID: <20230713073854.19510-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:t6Fk9rDSlQ+f8nXhtFJZBQM09sT+8KdtsfIuFCvcVeA4WoZq6YM
 7+xvDLzGZk/ip97AennWb8eakTt6CRwlNfQngQC0W/0C3tYzHy3apNIs3cEDw3vtQh/aqSu
 WopMDMxMe+zjEeP8OeRz1dh+Qo7NfKkVfhmINot/gI6r3ccoTdSogzsrUrPoHgPVlT/MCl/
 WRs90IBOdwuvipKo2x8Ww==
UI-OutboundReport: notjunk:1;M01:P0:0Ii+1JfIm90=;u0d6CBuhhRPeIsh22wdibgmzPw9
 6X/y5J0OAd/nfkgkf/vPsguNnXEJtqYY/cwR0RFiprmKu1dPq3n6AGxYe9nTm2DUzEMZ8s/7b
 FPbWV58IG+jQenEsTE7Q5FBzJ65ypBxUp4N9x7aK2EsJptFa/8vnyMpzq3jayWY0qZemftWlz
 e1Lx2gMEh47Yl1reUUnN9mLhoasW0vjn7QC2n1731t6BI0yb61/Iq0la1UNxcCnPjUVtD8mlq
 L2VajikIQrYIX9w99EkfQFVoSoHEKcBSLCWdZzXrLH60150nHJeebl2F1VJgAqVLTC2Iy9oPf
 ARGZq5OSLjpNBaGytYVJrUK4hBPNGLBYvSwcpYZnmEZqr4HXu1nYJiKd0oVYztRVp4m+zrFE0
 /X0Jtne2NZWdDfG83y6v6YJgGc+392MvshKwk0da8v/aUx2JiDoKzzSqiujL7utYBk/7+JmeI
 FjaVaZyrTMmYcuErB9a9st9PEg2FpOQMGWGog+0ja4C1yzc8kjaoQ0Ta87UPbGzaKBF2q6gsF
 Qpqy5I1dSXnvsIVLuz5DAQrZ2RkGlrOUNnhuOJ0Cn0LvJgR6fpBRvJrhtGkcw9JZZOqvLK+si
 Anzf96u+pHx55pjMbU1wUsty7BWzO5E3pRSaRUHwAiJT/Qt6enjCgEP63nHazTuLdQ3DdvyOB
 bJ0ktuukA8v5iWHVZTSxa9SfioJSX6BLtUHxKiFDpgLRR7NGWJNDP4sPoHY0XVOTYLc3b/QDQ
 rSZ+WTb0QdKLse4Bnn3Cse+w1Iwhi1tuHiQ5Wahbs9CwqUQr5NDmor0yHlsqrAfTuUaX2JHvj
 5ONwYekEJW/gaXesnKwf0r08Gk3lmdaM9COn2HZcqU7GAu36scGj508ksnPkx18owt+tOKQCj
 Y/0lNDlxkdGRjVV9Cv2VXuYGslcP4MUo4z2Iz+82s3sjqgQ0QqZJfNwHJkj7Uk/+0fvqa9o0X
 +zyuteCEzxtswFVJO3kS/K7VPt0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233936; x=1689838736; i=ps.report@gmx.net;
 bh=QA859psZNoPzNNdM5SFFGpX4WjF2gwq64lOVRTMFtak=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BChuD90tSgvRbIumhrKAw/Ts6BUGqQVrv3U/4+rh4GvyFPYu1z9j274HSOEmrJ1NOKrfgg2
 KJehXnGkLZ/Y5lrDeaxGJoRwtOFKlyL+fJ3Td3j0YN+dw2+jK0iaictquyJfkL9l0Zb+aEiFJ
 rVqqkPIdZcwpPYX0NKjsCs0pmKMpILw1273mbQLEQH33pE9Et6IYxoTF35Y1zfPseA0xeG4MV
 7uAC6gkDPoQ3LoeDZGJIcC1kL7zl5rM4mftuiYsha05qsmI9SN7ZP2ariFlxU1j84hKuB5I5C
 NSoqJo3Ln8dRoaHvLO1GuZcNRzXIBmn/pCSbLoNb+/Ne4YNE+sfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=BChuD90t
Subject: [Buildroot] [PATCH v1 3/9] package/python-pytz: bump version to
 2023.3
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 6d6e1b606c..861f9d6f35 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  3b9356e4dcd441df922cc01e8eb15983  pytz-2022.7.tar.gz
-sha256  7ccfae7b4b2c067464a6733c6261673fdb8fd1be905460396b97a073e9fa683a  pytz-2022.7.tar.gz
+md5  fe54c8f8a1544b4e78b523b264ab071b  pytz-2023.3.tar.gz
+sha256  1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588  pytz-2023.3.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 057a3ef173..4754efe41a 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2022.7
+PYTHON_PYTZ_VERSION = 2023.3
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/6d/37/54f2d7c147e42dc85ffbc6910862bb4f141fb3fc14d9a88efaa1a76c7df2
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/5e/32/12032aa8c673ee16707a9b6cdda2b09c0089131f35af55d443b6a9c69c1d
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
