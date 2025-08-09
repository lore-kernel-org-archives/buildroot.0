Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8F4C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 22:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D63360E20;
	Sat,  9 Aug 2025 22:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va6m3JhzU-Ml; Sat,  9 Aug 2025 22:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C0D60BE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C0D60BE7;
	Sat,  9 Aug 2025 22:44:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E93154
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C05760BE7
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDIBrzQvGh0o for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 22:44:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F273460B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F273460B73
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F273460B73
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 22:44:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.119.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1uBGMe2MLZ-00ouuf; Sun, 10
 Aug 2025 00:31:33 +0200
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 00:31:18 +0200
Message-ID: <20250809223118.2306727-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:CaNg+ZsKeVa0GmyxKI7xqQcURDWFfH+jqerSGhKzmCdL0gbbAvR
 o6lMrHpySCAGc73cDsb7mxA50uxK3Klw5X4kAJluYAeKnuMsjXigHIcfZkPYlpr/Ihok12F
 86P3tlghs188Yxn0mLrUdu6KYBcFS7y9JjdypCEphRZA9s4FsZTtLwphLnoOhAcyy/b84ZB
 2uPJIN1pDUcbCoQxKm8yw==
UI-OutboundReport: notjunk:1;M01:P0:Odn2VofGT4I=;rNGxvkmuXWqKQjcrcAZqcW9UTes
 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
 h/SPR3dMU9YqS4cBFfRQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754779453; x=1755384253; i=fiona.klute@gmx.de;
 bh=ipc2Ierw5wlHMdk3aDkFcARpPSgvmJ0CSVb/cidQMsM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aikCRyFPazUn/aCb45y/RisPCWtsvpGnz9O0CA9q79mVaKRJ22LKbXkzXCUO1+06
 Dvih+LHUlgABFV1Iup+LBehWMUm97SVEoBduivFmt0YCn5g9VZ0y4SGAQkndbMw4m
 gB0kgq6uAi2dwWS3cHwL1SB0Mi6rk0FiwvtQUbQ/a0TmKU58O07KPyP1xpbvslLHO
 g6x5v2eobxpI+vDW8xS8dVIXZzqiP3JeYfqXpocVvinvWfy9U6gGifk4hu45GRANz
 qKeALJFYmwJRW5ZX9uDbdoiLCvQ8Bbni3OEtH01N81PP8pnvIOfQBOyWfThWX1MCz
 bQybQbaKO/t1NIBiFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=aikCRyFP
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to version
 0.9.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

From 0.9.1 the pyroute2 core is async, the synchronous API remains
available as a wrapper.

Upstream changelog:
https://github.com/svinota/pyroute2/blob/0.9.4/CHANGELOG.rst

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 3785c9ad7f..87402b9dbb 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  6699294168d3051b2897a556ceeaf6c2  pyroute2-0.8.1.tar.gz
-sha256  b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11  pyroute2-0.8.1.tar.gz
+md5  225d6899da226df8899efcff2557204a  pyroute2-0.9.4.tar.gz
+sha256  3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070  pyroute2-0.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index fea6e43979..efe8d73f52 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.8.1
+PYTHON_PYROUTE2_VERSION = 0.9.4
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/4d/04/c9060b6cb024d05467e17ea93d3ca4bd2f3b05deb2372b7f79321640e8ad
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/b0/5e/fc64e211cce0078555c6db98aaf14348aed527565f3c4876913a290a5b2c
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
