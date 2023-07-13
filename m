Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0DDC0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001206130E;
	Thu, 13 Jul 2023 07:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001206130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojaZVHSoXWCc; Thu, 13 Jul 2023 07:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EB661300;
	Thu, 13 Jul 2023 07:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20EB661300
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29ECF1BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0397240C5A
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0397240C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdiruIfoXO5O for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA23340BE4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA23340BE4
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MacSY-1phl0c3UXi-00c9HS; Thu, 13 Jul 2023 09:38:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:49 +0200
Message-ID: <20230713073854.19510-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XH2sczLKMC0WNjVZKovQB0JPpW1seB4kjnJologEk0OPBHYCtbq
 +WfN4J+UhuEwvDrayOf4rvitSTBSkGYwE0lFQG0QREpTI3B3A0b9sHLOchgpb3klJVTL6KJ
 /aWfK4nFAlZYoIKrMIeg0RRXXdNU0Q8plRS9T+NFVj3Hu3jUIfR++3ds+FDvLdIZOQYGS78
 mCwQNxOEynYNMMBEmg31w==
UI-OutboundReport: notjunk:1;M01:P0:esB1aNo7L8Y=;ZuWcEZXWjk0vP1NEmpQp9UEoYbW
 LisqjVrayfFKYX4n3/rtojaRQ7WSO5h0rC1z+BlCL6vYXxOFdefYot4M9wzVVFVxYb/3K6i4g
 Y9zZvGBPyQSxCfYWDZYdeYGxcksUnBFXUh9Xidl0SkumnobddXwiE+7tNrgpcLpg076anDlw0
 gTMEHxVxdXJ9PqqaXPEen4cqNDJydcBoYCEapWR6LTJ2sREJ30R4ok4b47408n0BoeglIsKca
 JoToYN1U3b+GoL7C1/ncEFdr6f224YaCPZaawNdBVEngs66PkufXciaK53bosjx1EBQRXviIX
 kLXbzzl2h+BOxoDaqCsBskZDZNvWJ2vI6cwy3bj4xMWOllu+657DHoF6dFIPozXiEnMx8zCvJ
 kE3Kc13Ff+9Ate7U5onSAossElhisu0rW1DfiRnNqQttk42AYIDP1rkfx1RvAmMzoA+9nxsw5
 yZh7SdM8SyW1MBlYTEPzyu+YZQDf4/sgpeeeOFhoWO33ez/HaK21BkLM4QOUBc415dYCZf/Ca
 BkdlTnKX3C4PckvCW1EG+c59Cg0vRQ5pXHBs9fm9XGM2aGbnjZ2Ji5ndRrm/xUkVeEgHw3Gfr
 MSNCdXEOfbxxa+QyNo/wIVlmZLRio+LbWr0M7s1l+gggCnFZxYZ5o/J9RNvhUFERX2PKwZpjM
 gAok7f38M+wMun7UVqkmB+FeXvN3UuDV+ax2+5Zu89qBQQhgVn46FuHKXPQV4wgd9BIeIEd2P
 gndWfz8+2ZuQeb/4AAzC+tSFMGpm+pXRYFJjMgN8Vev2irOJJMkPErGsatLyMWR5QZlIGZ3zr
 KBm2JONhm6zmWd5O+NFukSLdie1YaSoZyZ10ehO6MD4bmsFEbqIOlMWOv1YAHECvb70ThSLgy
 5XHm5b9rDffmsIueJSKJh0UAlD1XYFgH9GxtAKrXv/Do7UMdoAh26itxwocsgXkQH9gErxQbM
 PgdyxzX7nzHqkB9MPBagu37pJwc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233937; x=1689838737; i=ps.report@gmx.net;
 bh=lIrvl2GoOuLs5G+s+o6anikXMVbtbQedd9K40uXwcE4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RZNatxA0ce1eb7cqsv0/8RhGAZhjxyo0jTkK4pp7lZ6qGWJYcAOj5dcdc8Cy+AgxBLaaTgg
 V7qKnTWrhrfEzj9DmYHueXx18G46xaey6ZeLBGVBroyLbjtnQcRuxVYox/F5/6ZGRIDM49umc
 ZUncMoHp6C/98WaKl35JXkG2DDKhQyJEC0/8hFX+HY/7yqgoqrocNkrInMQQHNhbcJ7l25iUO
 X/b9uXisl6PTLM5J/vW0OPOOtMTAeWbPYbRTkctVQIfpDisdfUNug5WWe2J5iNiCrlc2ohity
 yfaD48o/r9B5aHvJSjUlAJkUTaNMrmjn8fC/uktoG6DSRur3p8IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RZNatxA0
Subject: [Buildroot] [PATCH v1 4/9] package/python-werkzeug: bump version to
 2.3.6
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
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 0b60a40066..07b6f2f40d 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  28c3ec6a4b1ce8f06c85612c1dfa351a  Werkzeug-2.2.3.tar.gz
-sha256  2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe  Werkzeug-2.2.3.tar.gz
+md5  de26f240d6f95689a8d15170c2d958b6  Werkzeug-2.3.6.tar.gz
+sha256  98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330  Werkzeug-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 0dd27d145f..3b7c663437 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.2.3
+PYTHON_WERKZEUG_VERSION = 2.3.6
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/02/3c/baaebf3235c87d61d6593467056d5a8fba7c75ac838b8d100a5e64eba7a0
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/d1/7e/c35cea5749237d40effc50ed1a1c7518d9f2e768fcf30b4e9ea119e74975
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
