Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B3D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE7B4140A;
	Wed,  7 Jan 2026 18:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCy4xKpf452z; Wed,  7 Jan 2026 18:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1362840896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808939;
	bh=6TKg3dTIS9+y0NpacJW8ZHq6ib6Q/tUcNpBb6/tfNgw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qfqPn5QMsZvRqXvmRfKldCaskq3jdTG4YBeB6AYPi7BJHAi3ZKjmizsTk0v12AOvw
	 WajZ5Jg/BGWq4Fk2c2AI9xgezH7/xNM48KyVh0ZKXr1mJRsUQSvAb5hlLI0ymyPH9N
	 Oo4uKIbzcUwCS0a1IwoNR08yFseYzTRy4msMdO6lgK0p5Ot2W4xTO8D/Roa3MupgW7
	 6SyNgHixGbWlR1vcTmyufPIhzWz+lkrAYLJdjZT/LpLPJud71U2mNrz7feCW9aPyvk
	 Z2Rz5ZQQxPDd1cEVCKrkAc2xTM0CwlogHMEZyicOarTfsv3x9Ww3Iki1bMecXf3Hze
	 wQZnu0h7BMX0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1362840896;
	Wed,  7 Jan 2026 18:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DCA0AEB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E48D86085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAlZJ-9QaI_Q for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1512460859
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1512460859
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 143D080333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:01:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5222d152d38cd96012df186879bf7e3ddc6df209
X-Git-Newrev: aa066a537f8a8f72aeb49da4cdd71091d84f3213
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.143D080333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa066a537f8a8f72aeb49da4cdd71091d84f3213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
