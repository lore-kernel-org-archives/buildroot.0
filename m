Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA88CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 11:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A97C8822FC;
	Wed, 17 Sep 2025 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffEbWFNZoXNh; Wed, 17 Sep 2025 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14AA84166
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B14AA84166;
	Wed, 17 Sep 2025 11:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5575F279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE5361511
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lruxeaqoGbwf for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 11:24:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 879CB60C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879CB60C19
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 879CB60C19
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:24:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.105.45]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzSu-1ukadT1GH6-00Lhzp; Wed, 17
 Sep 2025 13:24:03 +0200
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 13:23:37 +0200
Message-ID: <20250917112337.2521059-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:I1Mhgof8YL0zFUJrdRbVvNDa7GQDwNVokVnbN5t5+SlvQruCuTG
 iaIZmWH7EtZC3aET50g0qEdevswPFNf8MHGWsbYrBSZpyL3ToMSawDnM0T6lGWYyqGAEHMh
 iY5BO7DlvDwxsPxRMlquD8ZHwLkj54hJ12nNEL6zkFfc+RBQ/Ff9OPtCGtwChl6KxypDjO1
 5CQ7Y061yLtAhxg+yTZdg==
UI-OutboundReport: notjunk:1;M01:P0:DM88JiJENUc=;J3l+9IDYQdybOVK4KQi/jOnJPmP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1758108243; x=1758713043; i=fiona.klute@gmx.de;
 bh=JAuWtuMG+ir5awWuI9+r4c4oMZwQwbY0uMfCPEDKLt4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SIRkza7QXrWj4VMz2wkR0smAdCu47+7bQbWVZ2mSYDRdj67XxiKgqQb0cUdESpG2
 PVVfR3hB9d2wYerZ+BHPOptXdv/Krj6mDt30LyeVspOT832BoYDaK4Q/OTW029wa4
 D6Y1xJQFgrDzJftOIVFoZ+eigwZUSQKUSNLXDZxOnF0CPts89PLmE3JuQ/W/ZPR04
 zSek+TRvMuSZjaxiLkTh2rLzsGtvvMDTh/jA+wzPaowBRZ5zQtT8P3rpvqz0mRTl6
 eId4AhKiHdPyfO3upknMnH2Onj9sdeniVeIej2wEjMfoWNdlIjF6mzq86+7HN7Vy8
 Z8c7h64jj5vtCeuBig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SIRkza7Q
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2025.9.11.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

package/python-cffi 2.0.0 (bumped in commit
07903d2b274bc98f930e06dee237682015acb1d7) fails to build due to an
unknown trove-classifier:

* Getting build dependencies for wheel...
configuration error: `project.classifiers[8]` must be trove-classifier
DESCRIPTION:
    `PyPI classifier <https://pypi.org/classifiers/>`_.

GIVEN VALUE:
    "Programming Language :: Python :: Free Threading :: 2 - Beta"

OFFENDING RULE: 'format'

DEFINITION:
    {
        "type": "string",
        "format": "trove-classifier"
    }

For more details about `format` see
https://validate-pyproject.readthedocs.io/en/latest/api/validate_pyproject.formats.html

The list of trove classifiers Setuptools checks against is provided by
package/python-trove-classifiers. Upstream has added the classifier as
of version 2025.5.8.15 [1], as well as a bunch of others [2], so
update to fix the problem.

[1] https://github.com/pypa/trove-classifiers/commit/331838aaea0eea6374e4e51e8fe05e13bf7e4957
[2] https://github.com/pypa/trove-classifiers/compare/2025.1.15.22...2025.9.11.17

Fixes: 07903d2b274bc98f930e06dee237682015acb1d7

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index bb9f40a7f3..008c3a0b3e 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  3656424a10a761108fa8250033ffe3d4  trove_classifiers-2025.1.15.22.tar.gz
-sha256  90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9  trove_classifiers-2025.1.15.22.tar.gz
+md5  769cd978e6756c423958bbfe76f130d8  trove_classifiers-2025.9.11.17.tar.gz
+sha256  931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd  trove_classifiers-2025.9.11.17.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 8d2238d41a..a556cbd3dd 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.15.22
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.9.11.17
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/f3/cb/8f6a91c74049180e395590901834d68bef5d6a2ce4c9ca9792cfadc1b9b4
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/ca/9a/778622bc06632529817c3c524c82749a112603ae2bbcf72ee3eb33a2c4f1
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
