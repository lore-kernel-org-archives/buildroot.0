Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CFDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 08:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028E184574;
	Wed, 13 Jul 2022 08:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028E184574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCxqaw4IO3nF; Wed, 13 Jul 2022 08:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F397884202;
	Wed, 13 Jul 2022 08:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F397884202
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFA71BF392
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 067A94158C
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 067A94158C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIbLou68lgMK for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 08:46:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B23E411B9
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B23E411B9
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 08:46:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.92,267,1650902400"; d="scan'208";a="205586538"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2022 16:46:51 +0800
IronPort-SDR: BcKJloY8HAEKqq7+yW9MmfAE0lgpkP1QU4Ea+D4GKh6s0dXyilAUebLTmfWIZ89ioGhuC7ihHC
 3MquGs4Ng8C22xM9FFndXDi/y9o1XcLqGG9nVXD64M1CV7YDINcdCeqTNR6dvxEkASvtI7r/D9
 /1OTWnEHdbT6VDCWLfnvpjgWDCZPdi+5Js6+2/4Jmm5N9T6hu+zOkowMFO8znpCzSx4aRzbyxm
 tFAwrgd7yQEVh8qPiygpiq6S+RNq5JLrSnRv9FDmggFd8FGraKneDT5FeSbI5XgV16XRqZBFqk
 1/HoEMbzYlg8hymFX18EUz25
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2022 01:08:28 -0700
IronPort-SDR: bJoyP3CPDHPnIhkQpeiYbtmu0fvebcuUAzde1/V0rDsJ/EM+0SFmgz5/ZMXxeaQUfY9iJPUlIZ
 J7FN6mjfctuk+VptHfMGEI4bvswxtavn3o1pceHUTuYGa3w19hTTItEkA9fpXvTBH0BtQO5CsB
 Qp9kKrS8gG/V6AFaZc79VettKbP47EvQT4iJ8LtWD4jfzjgsAZCNKxbd7KjhsN6JQQJ4VZdMqB
 JBKZ3agsiRwP+bYvyee5K/r+z9kJOoH0/vwpa2j4RH4841hgynGccDuMZfHbGu43DFt/dnD2+f
 YQw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2022 01:46:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LjWSr5cHLz1Rw4L
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 01:46:52 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xAEmR0J9gzNQ for <buildroot@buildroot.org>;
 Wed, 13 Jul 2022 01:46:52 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LjWSq3NlBz1RtVk;
 Wed, 13 Jul 2022 01:46:51 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jul 2022 17:46:48 +0900
Message-Id: <20220713084648.1941220-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657702013; x=1689238013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHrPdGtI+betEalb9oLHazVBNnIxVNmLnyq8Gs0hwsU=;
 b=BJ9DEeLnjcZB8jBYGYm8db2Kdi/K7zvn1l8u7gviBi/+lJr2QELL7lJB
 iCk8HEkZnoR/OPHTcgKAETSSWfz1e3HrNfSHtfwtrqwPMNB6fCq/GYG/v
 cwVTNr6zw2Rc+EdsK5IdyTUQ5WnNb8n4erlttLwfRvKtfL/Nzs/VPwPJ5
 FraPdpao7K5vMMKtyoow4CYs3rCLg3JobBZFKWROIhmMkMn3iE9A/E4hR
 /YtOzTdfbZWBjlY1hG/o44F101bjNyT5AASan6tNZP6LTEVBo4hj+bSfF
 61syYqaAbuRIX9gbTL6ZsR+rwMxZi6zTMsBLYscQTa17I9Yo1krozao7b
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1657702012;
 x=1660294013; bh=RHrPdGtI+betEalb9oLHazVBNnIxVNmLnyq8Gs0hwsU=; b=
 OXBybbTBolMs1YBO4GAix0ZIuOGXM0+WQ5zcJxhsM5tH2u1/6jYyA8G/LlAYpjJf
 Ve+wAj7uvw83i+H1P6QXT55l9bHamVhtu5YhkS9PjTIoruRmtmtSW8gv/m22ODay
 v4+JLvWO9G8ZwZepVU9OsaqLVfO2wtcPSTjMIAckmU6BfVY2a3FD9I69Te6RRTzq
 IUorYF00bwJScFhvfQd/j97CV8EDTvchmYscmgBEGotL9UJ8PPrYVZA3hJHWNED6
 bHOGmWvHQsJu9YprR4Ij+iHKASua4hTvE7BTWXjDWYKNrmvSWKNSyDHeAS2uGoKv
 Ha46dGgozzVZwqy92Go2hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=BJ9DEeLn; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=OXBybbTB
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: [Buildroot] [PATCH] package/python-kflash: Update to version 1.1.6
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the python-kflash package to the new verseion 1.1.6 (from 1.1.5).

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 package/python-kflash/python-kflash.hash | 4 ++--
 package/python-kflash/python-kflash.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-kflash/python-kflash.hash b/package/python-kflash/python-kflash.hash
index 722c4e879b..a4e5238635 100644
--- a/package/python-kflash/python-kflash.hash
+++ b/package/python-kflash/python-kflash.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kflash/json
-md5  85549bcc1faa0f2cd5ebe3b04759e7fa  kflash-1.1.5.tar.gz
-sha256  40a0976b52942c7a3bdfa2d9e2bdc8d7526cf6deb0759c8384281240c8fb404e  kflash-1.1.5.tar.gz
+md5  5b4376ea60f20368852d0c4743e6ed08  kflash-1.1.6.tar.gz
+sha256  ec5fbb35ea81a91c89f458d375e24a6dab3d3865c69a7e6250511b2e93f4b695  kflash-1.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  c48133d7a08d743c2c01c6190fc1860f7d73777afa2199ed8d0a035b754d8bf9  LICENSE
diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
index adbf6b30b0..efc0f52eba 100644
--- a/package/python-kflash/python-kflash.mk
+++ b/package/python-kflash/python-kflash.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KFLASH_VERSION = 1.1.5
+PYTHON_KFLASH_VERSION = 1.1.6
 PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
-PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/c4/b3/1c25a92922bfd3dbc05d972352c071167cad035c615f6f068f75c2f0fd01
+PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/4f/80/d2eaa114bf4434b18fcf8960a907ffce12c9400b08c05902b36007d545b7
 PYTHON_KFLASH_SETUP_TYPE = setuptools
 PYTHON_KFLASH_LICENSE = MIT
 PYTHON_KFLASH_LICENSE_FILES = LICENSE
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
