Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E926CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D7560DCB;
	Mon, 19 Jan 2026 09:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJjRzDKp0sZG; Mon, 19 Jan 2026 09:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 043EB60DD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816754;
	bh=eTPQRV+oZOJVGhf3X+ycKt9MVmxqh/DCKPcZRAejyaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wxa0oMQHZZsEHfPdLS/mQPf5JVa4dFaClHIdJiUvgXP2JsceaJdy0V43NDWXeaCnJ
	 L3eRVBATGFnikdjJenER5kYI/PoAP8ZeWORRJkC9s85UVQ223tlEWiWXWp29qmV672
	 wX7l4Szs0fvG50/6+EiPMDAzzsfTOEr56ZFrrVu8oLTzJ58/yc7TlAMBI0jRhRdTMs
	 cTNHk86o//dNzf4MAm84pA8+Nz1UpUIpIe/csI/w3d9ffBITm27LU2ryh4tBS+3cBS
	 t3ZU7Dd+Xy8Tj9xH62D+tSoYISVEVKsFIw8sHWMuk1C3iWFmm3ruoCvZYoFxSPv54L
	 XtD75oscOpJzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043EB60DD7;
	Mon, 19 Jan 2026 09:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E20E6160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD6C406D1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aav1r0vC33gq for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A925406D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A925406D3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5849788366; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:23:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9206e34bbcca37b529fa5b22eac8efc265d729db
X-Git-Newrev: 9606a6d0336f43a2aef0654ea93eecf572f716cc
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.5849788366@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-certifi:
 bump to version 2026.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9606a6d0336f43a2aef0654ea93eecf572f716cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3e5fa2e9d207abfc4a6c4ff813b5e95af0e6b822)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index cc80fa1bbe..176da86300 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  430a5fa9f18895a9b69a018d2beae67b  certifi-2025.11.12.tar.gz
-sha256  d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316  certifi-2025.11.12.tar.gz
+md5  d8447ad858fa15af16f91e32f182aa85  certifi-2026.1.4.tar.gz
+sha256  ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120  certifi-2026.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 1f889d425d..fe28f5878b 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2025.11.12
+PYTHON_CERTIFI_VERSION = 2026.1.4
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a2/8c/58f469717fa48465e4a50c014a0400602d3c437d7c0c468e17ada824da3a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
