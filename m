Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4069DCA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124B94158B;
	Mon, 11 Aug 2025 16:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaiQZplS8LOJ; Mon, 11 Aug 2025 16:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0293D4158F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0293D4158F;
	Mon, 11 Aug 2025 16:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A971C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D0C140D47
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQoQuBKWqzqg for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACB33401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB33401DF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACB33401DF
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:02:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.127.180]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1uL08F2Px5-00cojn; Mon, 11
 Aug 2025 18:02:28 +0200
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 18:02:09 +0200
Message-ID: <20250811160210.3238772-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uyzPnHpxK50LrQeIgDQ0YJa46N7VwJaBMHU2RHgxn9X3etCerHt
 7RHKmRU0zWKsaWVZoxyE0fXpkvmGCpHBYWkzslaU56Yxvm0RS9Qn3kLCfJ/kPl5ZCjTKA2d
 s+LIS71fmEoQ1Qf3ASOn1qm+duA6aZUZRZLWY6dJRIRqw8zZO6ejMiApgsjlrix+5tne+9D
 RKkuXzy5rgxWu0jxKdcnQ==
UI-OutboundReport: notjunk:1;M01:P0:+PRlOk7aBeg=;8dtVEJvfRQBo7SiCQ3napX3x084
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754928148; x=1755532948; i=fiona.klute@gmx.de;
 bh=EYflroJqRbVN63oNVUwe68LgX4WZonEYlDKl10mhLHI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mZ4MBOg4FXjNLMh3t7+QMFRelgHFR+mPox7OIiXnszPF+YBUnkwGMQaojmoXhvWK
 r0Zz3Bhq512HcVRz2m9CxaTFa+I3ydr5z7uSTvgxpMDBXyp6f4e+S5S92PYm05LEx
 bmc2X9dXp86uwHsmD4AkRKL81Pk2nDZO/6bXrDGZn+kfv1B1tMuuhGjOhn67y0Ubg
 nN0SVAtIgBkV8L01cxxCD9EsdFB7qmhz62vsJf++74tC2u54J9ApyZMtZmg+B0mLo
 iGYIc4jJK9v2OlwG55oGK6tky8R2HPPDcNKWWkBsm+ifAU/ffbBwh4xRD7zskkVU9
 O43e8tPeH9lUQRz+Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mZ4MBOg4
Subject: [Buildroot] [PATCH v2 1/2] package/python-pyroute2: bump to version
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
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
Changes v1 -> v2:
* select BR2_PACKAGE_PYTHON3_SSL, test fails without it

 package/python-pyroute2/Config.in            | 1 +
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
index 9e685f9d1e..ad84a4ae4e 100644
--- a/package/python-pyroute2/Config.in
+++ b/package/python-pyroute2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYROUTE2
 	bool "python-pyroute2"
 	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  Python netlink library - Linux network / netns / wireless /
 	  ipset configuration.
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
