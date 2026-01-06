Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36A1D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F4240BA0;
	Wed,  7 Jan 2026 17:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1yTTxhTN6zs; Wed,  7 Jan 2026 17:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CF0408B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808095;
	bh=1vlsHoUXHRDFSQqidbUWWFzbwF6gAbpqVGkhspQLR6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iJeSH7ktBoZUMuGFA+C1ixRMms6clV4H/1lZQ46k+zws3Kl08N0L2Lwjv4oWeBDlc
	 7ZETGNoR+dQSfOsKecl6XkFCM1aomk5SKKQ9qLCaRXniiorIjiWNc68VLz86WhfWM8
	 yIWtEPKBxDltweHZgX0kKkxFImA1EjQSLPrLburYc3nZy0aFjVd8pF300GOGsh883Q
	 3Rpbn3zEa3YE0meWYvky+MjkaYzXiggVU06dw2Z3YMmIciyyFqyHw1hmbPuS194Df1
	 r3h6ivGNPM0coB6R7eOepIOMM5XuoHqkzDbPElERslmGHQeHcSO2Qb5cw1AeXdaI4G
	 l74fMlkahm5Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CF0408B5;
	Wed,  7 Jan 2026 17:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E33909ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1559E6087B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8UETA08RfBC for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AB760AC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3AB760AC1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F350081917; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ddcae0dbf6e513a9904213400f896024a866ced
X-Git-Newrev: be484f77704745171357aa400252b93cf83ed54b
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.F350081917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-pysnmp-mibs: update tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be484f77704745171357aa400252b93cf83ed54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0900ca523fe5a32832351520d504619650d269c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash | 4 ++--
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 52a507f4b3..4744963185 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
+# md5, sha256 from https://pypi.org/pypi/pysnmp-mibs/json
 md5  01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
-# Locally computed
 sha256  00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
+# Locally computed sha256 checksums
 sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index 9772b78c91..eb9119a352 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
-PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
+PYTHON_PYSNMP_MIBS_SITE = https://files.pythonhosted.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
