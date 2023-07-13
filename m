Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF4EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8476561315;
	Thu, 13 Jul 2023 07:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8476561315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDsYmO81JYng; Thu, 13 Jul 2023 07:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E9A6132B;
	Thu, 13 Jul 2023 07:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E9A6132B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79EB51BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8509340BE4
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8509340BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjyq-ugtjo4e for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F29940AFF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F29940AFF
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYeMt-1qWHGT1Aot-00VhH5; Thu, 13 Jul 2023 09:38:58 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:53 +0200
Message-ID: <20230713073854.19510-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2lR00v4v8aWmNbICK3Ap51xZi1zUKNNAbIUrHrN2xpQD+lfpFmm
 EYU+GJTzAfRR5pm5bNhzusm7svGe1N/iGNzINmoXCbaBPLaI1xNzU4uFutT0fDlU+SAxm7d
 EEQY9anpcr0kGrs34HSWZto5SrXfwtl64YaphCk7Un+cgm8efffFVVGW+95viybxCUeNInE
 0nnBexHmgU0oLINBi90ag==
UI-OutboundReport: notjunk:1;M01:P0:kNWPWgoKnjI=;CiJQelYjal9o8tWDuamKvG4ZPDp
 +M8ONIcgDWUounZExUB4bRowG4+KuCRrDNalZrx7UJ4xmYngjf5wHqvdqIrvP6zn/TMeVxDWA
 22Gigmx4pvTf4Xq3kboeR/Ygy175/OWIqyL4bf9k8n52AQJyo4O7YRkJv/eCkh95HvHaM43lO
 KT+O6Q4LLoVGxpmYRxMqLFuc8XVo7o/c9xWjPj1GSAc4X3fQf8vNzfc3/BD73GRyndEZwDwDS
 hQuKIdpUZIzAL6E0Po9VW9ADJ7RcHUo3R+a3UflnQRU+beHiOPrGpa6rS0yRsmpc1RnT6vAdl
 x7pier8g8jQKs9zGFpGBOzKfebYGI9O5/KvkiwAsp10BXMFE9A93PKFkNoShJQ8X/aBkluhRZ
 E0JOK4nCXQhqobRK5unnQsaRvrjw+jUG8TYFE445i8EAObXTVBIB3AN7Hv6wi2y/74OmVOlLL
 AHvtsnTBcCnUKsGq33M8CiOS5319+NOdI2J3qbIR9XqWKgScgPnzWTEHc1ztIoVGRTbH5M+zB
 EFx7XUelbQB2F3twSMrDt/+cqRheqt3no11gbdrGABHfIhB8EKJUGyJcBPbyadrHQ4kmtTuFo
 WS1oAx250eTsIGFYGetfWkeo339cpXGbM/1UE/cTkETtgEH2fl7Jq6jLg0Nt9ZdXZq/BqaCtg
 atkKPPqS5qUkI+xXlRhXJKGhJn1KwpKqN0ZyPOpOwSGGasgGTC9Xc1h+m/vwhy3hnfZvNFZwB
 rXTXmt/DBVeF9Ci8yAir9ARTdiaiZCH/hWRFXULMc0BhkjQhvsORV+8/meTJv6WtGpiNKeIub
 VwwVHFcmJHWqVdW/74ntv1cpu7SToeXEg2a8pHV9gVxNwGFyvqETZXxpIuS3veMqCll21g3kw
 4EOmloIhlqZ2qcYrE1wYtEEz2DASOY+mPBBeirmlflbcVVVBZxZIOAwdvpEBQrxkxrVPaHCmi
 k2hPcc8bFX7r0UPU3o67QNFxLo0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233938; x=1689838738; i=ps.report@gmx.net;
 bh=9AMcuL4BvznGWYMJVJ2wK3X3R9kNqwcxw7m0rPRfOOk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C8kGAsICd8qEgQ6NkKN/Pos09IjSfGiKrMObl9s96TNS6wXfppO6smtG6/K/booX7x+DJF0
 fetfF8wG+rudJnNtEvNMDjDq8cQURubkWiwUmqsb2iVqU32+OmNOmvmGHpz5V5AheTFV13+mn
 o9Q06JvQgkBscjvIExCx1iiJ609J2Oq0Uxo1rxuv0AP7Rzir+TpLhEyaOnrgUnW+5Iw4hjw1v
 yw7IcOoIGpmON+P1IjpGXEvWRQMIvb8+JZeJEFgqdrZ1YCNDfxUSiHn67rZ0wrF/UmUt2/6zH
 NIj3Q+n7510pWWLjrWwYhnH97Zp7wIHV238SlF9s/iSw0h6zG0lQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=C8kGAsIC
Subject: [Buildroot] [PATCH v1 8/9] package/python-flask-wtf: bump version
 to 1.1.1
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
 package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 01e4290950..9d21ffab2f 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  d86dbc0befe30fd577a623a51689b900  Flask-WTF-1.0.1.tar.gz
-sha256  34fe5c6fee0f69b50e30f81a3b7ea16aa1492a771fe9ad0974d164610c09a6c9  Flask-WTF-1.0.1.tar.gz
+md5  007c1ff973c63096dec0fa805412d8ad  Flask-WTF-1.1.1.tar.gz
+sha256  41c4244e9ae626d63bed42ae4785b90667b885b1535d5a4095e1f63060d12aa9  Flask-WTF-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 97291e1b26..7b4d37ef56 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 1.0.1
+PYTHON_FLASK_WTF_VERSION = 1.1.1
 PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/d9/38/d4798dd05be711d666e1befb08b1d3db57bd146d1a14d15657f60c88b446
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/80/55/5114035eb8f6200fbe838a4b9828409ac831408c4591bf7875aed299d5f8
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
