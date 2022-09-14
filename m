Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6A0ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 19:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C65E826A8;
	Wed, 14 Sep 2022 19:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C65E826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eb3awGPLsQc; Wed, 14 Sep 2022 19:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3FC48196A;
	Wed, 14 Sep 2022 19:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FC48196A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1D571BF283
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B0041828
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B0041828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnUa5hx_FNd3 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 19:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C4A41827
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31C4A41827
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 19:26:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YY2Co4ktqjvAqYY2Corylt; Wed, 14 Sep 2022 21:26:56 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 21:26:55 +0200
Message-Id: <20220914192655.899570-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEhIzeARDcXdVPpcMVuyDJtWpE3gMZ1X75FfC4AX+K4uxh/o5rU5pwh77zEFNi+ub/fKfFDAsTLkYkQgsnncA4ns1gxO9aUGVc14ayum1VOLhe9bQgTb
 LWkaXJbwZWSS7CNZIWoP/xARKZt93lBIMHnLIqZTOrAgp9MWZz4rq/ZkLgYVVGGj5St4DEys/LT298taoa2+XRLn8DD17SSi++2pZ2smdL2QHjJVrsTyLSmk
 TqfaLLHcmhqzOPBUKcwUrYG8ZTELJRh/Fv7fsSzJIeyYpRuvYditr/u5dxUFmxprCp0ZH+KvoMdzppxqKFTtFG5nXNBW+Tu3qPuhYhMrCgNztALZVp0mIR65
 3kw317gZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663183616; bh=16S1nWi907wCD6j85Fkx05QfXeDyB0wJs0VdvYreQF8=;
 h=From:To:Subject:Date:MIME-Version;
 b=kshzgNR1zgubdhRROiSC60SHaWLkuH1YM4HhF0rqokSM+DBsmomanZm0jGpNGJ58D
 PLsdIjNgrtXaykWZ995yB9WwuyclC7o1Vp3MS8CmORUs7JSjwUsQGtamkFovFahWYA
 dc0PENjGdsiQ5/dPe3iVgVM/gUieyzQIJQG2R7bqy0qiozKORJq3QtnWWuuKwLg2P0
 J89sW+Sx2qFTtyIrMD6LT61WFm/9hyzbS2maG1EyVppfnjOTgPaSSZitHaLDzwBbWG
 uHN2O/cMBSkg6dzXiFXy4wf65o+GhQEiM0fohdIOAOLQUXG85ngkBO+I6stOwNt+/t
 knJeXdooFEG2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kshzgNR1
Subject: [Buildroot] [PATCH] package/python-uvloop: bump version to 0.17.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 39951b50bb..16c5e81e98 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  79f9a7f3cfe154daf0aade23555dc9d4  uvloop-0.16.0.tar.gz
-sha256  f74bc20c7b67d1c27c72601c78cf95be99d5c2cdd4514502b4f3eb0933ff1228  uvloop-0.16.0.tar.gz
+md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
+sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index cfd9b1a66f..147062cf7b 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.16.0
+PYTHON_UVLOOP_VERSION = 0.17.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ab/d9/22bbffa8f8d7e075ccdb29e8134107adfb4710feb10039f9d357db8b589c
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ba/86/6dda1760481abf244cbd3908b79a4520d757040ca9ec37a79fc0fd01e2a0
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
