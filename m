Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3511DCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 072746127B;
	Sun,  3 May 2026 14:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRrqu7cwl4OZ; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1248961281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819830;
	bh=dGcOXQK/FySXMIFRixVRMbAA1ocYnE915D4Gl1OnnPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZYH1hSmSG75Wh4dvFDkI02lDtkefol/xUOxWeccEfMnixEVeRF/iQ5U2d+r+v8lx6
	 KOqH3xZBwYhTweo07HWJcIGZ1w1UmtCNTMfSpWYccfEyEmsByPQu6twVra3FqId57j
	 2v878r634fCv2bcXxdjGjiuBBhgN9GQmoUeHupU9ZYRCx/bFD2nyj8/V/enqdRiHkm
	 CxRK3Xx1eDju2Yr0bKbxojT7YIdfBBDIRE4/WkpgeWpK6B1SML08xl17keQoyJ175I
	 rkNhMV+pHIAQ/LSd6ypVaR0RmcW8L8/4rJqc/g69hABj/QDzpYnWScKWqLKAePoAso
	 M7lyIKtOIyI/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1248961281;
	Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEAE47E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E46406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfhVj_B3GC7k for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B555E4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B555E4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 722B383FAE; Sun,  3 May 2026 14:50:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b2e8baf2e14217292f485c6db40046a53bd1eca
X-Git-Newrev: ab7bd853fadae29593504d75144f88ceea189244
X-Patchwork-Hint: ignore
Message-Id: <20260503145024.722B383FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: bump version to 3.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab7bd853fadae29593504d75144f88ceea189244
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/hbldh/bleak/blob/v3.0.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index c9af5ebfb7..abc75d6917 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  e757918dbfcba6bdfcb69e82048fc3a9  bleak-2.1.1.tar.gz
-sha256  4600cc5852f2392ce886547e127623f188e689489c5946d422172adf80635cf9  bleak-2.1.1.tar.gz
+md5  513384cf6ed28ebcad27ed829c4ad3a2  bleak-3.0.1.tar.gz
+sha256  c8ff077519f8c30a972fd0d22f47a54b981184b2f2a0886d02e55acadbc1045d  bleak-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index abb556e348..e873d1234f 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 2.1.1
+PYTHON_BLEAK_VERSION = 3.0.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/45/8a/5acbd4da6a5a301fab56ff6d6e9e6b6945e6e4a2d1d213898c21b1d3a19b
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/9f/dd19d92309e4a37823210827f0f42460e69603254309b99499622b511294
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
