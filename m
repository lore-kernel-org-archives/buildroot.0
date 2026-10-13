Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2223CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB0760859;
	Tue, 13 Oct 2026 20:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcJE3QfZW4be; Tue, 13 Oct 2026 20:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BE35260861
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925065;
	b=ooV9YfLOsxCiCua2cZ8KMCKT70X9QkyAZI9VRN8hY6t4pYX7ZnQgngv2x7qdTXCBkM9a
	 A1YKBBiZ81e50DUVAifHNEIpVlru1VPySsuLlHm9t0xWbPqMzBQDNfvJRy4FrSEqD5OVW
	 HUPr7ZQi4FrF6o9RIgv34lAuJmUFhPY947qA1oPO0C7numBw+wfQxlBjwT0/1k6dAoI3f
	 FgeN5XLi9hU1uO6kuzwEtDGGbOfOZ54hZ4s7u/i8EQ6yrihvwnHz5EGCGuW/1w74ev4IT
	 qsVcvJmKBRTcAZzFwLfs6XkikpbXOzj8+0nVNR3p7sS++1IjpK6mg+1k0+qEL2EbAWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lk1C65beYVaxJELytD3RG9tQ2z+XIovXy14z/pShhK0=;
	b=Gjy+mop1zsJ8rsxf6RyxMZIT4WVCHb5K0Y5cr0Xqh+5yoIyJ5UW2n14eNptdNWHb2diY
	 LXG876UuFXHevf15S5whtSbN7F0lmImYG669/3DUJWuepbJq0pwMVlc7agswRdBy5f5b0
	 X9WKiDkqbaPgX/QeT/rk0sPwPcTppxB6llrml0ISl4lXX3EN3EPVUMXBzEOyVxOBScEqw
	 EHjKlYX5z03aQ+L2P6oOEW7e7T/FYsUMR8qvugBAbZlqVL91/mDwSvuRYpLdJzkwoVqDo
	 ZtRqo53rsEOJMjeCeqQiwAopWUScDpmhNz27UlEvnHnKJBF8a7WNhIRDOZb+QLelJ3Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925065;
	bh=lk1C65beYVaxJELytD3RG9tQ2z+XIovXy14z/pShhK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IkCBGzNEwRZBpGQRPZZAZDsfqdbtdzGiST5HsRB3W7sTBNQgXJaolbK+EBpTPVuHO
	 XmNYkq2+3QUkGGhaTSKJ4twZyhj1lzeiXwYYzXzn3pnbN6Ryx5K0BymAOvwDeWeME4
	 WZ6iXOQoAxBaV+uDmL6RQK7Y+L8ZayZ0pArCnq52Gtmb0fAA1tR2jnoYfOlFpfmJTZ
	 pt/NxcKsFdaeTNs6ae7uiral5R/pu1pUDVkrmDZvSjF/Rfn4iQQfQj5M2MlaWV1nEW
	 TbPNnPBd6+uum/AaLBvABvShYckxt9b4NvK6ReC8y/6C4DlkEfxbF2KUq6k5KP+Tuj
	 IfIBoSE8f76Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE35260861;
	Tue, 13 Oct 2026 20:57:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6FB243F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD06B402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WgMc7QFopOu for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1045B4008F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=CY/e9jBk11Zq89wYDWS49BI2mUMXayejjDzFM+JKb3AJ5rg6MegWup+yHzXn76zI/x5X
 pbryRN8+Sm4iuN774dX7r3XJyrhTmzWNYd4RY/pSgwX2/UtW0AymOebKuy8zpESiANNA6
 jDteTbLz+17Btci/lh8RUDYrSoq598wNAeJeLSvPr2GMLgnKm3TaajwNMoKwsv19ICqjF
 SBlPnePgRPQCu44x10d3YOwrBmiTAIuJ5WGVUf7/QEhbiCzLqGUWx/9uuM4ifp1G4g988
 2N79feMbRwJPS7gzFrXNscNp1Kwt95soemhglQdC991us6eb6/GCL3aHGIXdemaPsXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6XZKL5RBO0wpWjW6jR5Or4iZBJMkkKcdTAX4nmOUIyo=;
 b=hgmTduVzEqLjquhoz26IVTiXSrqSCLOoJcnoJ1xMyTLO+dlyMLgGLqnZE4V88DVgP80r
 aJEH2nYffVGA5FKRjd+OYglUC55NwqHbTMuqMgIM/5ILHOceMeJ43wG8pcSQx4pElPVxM
 K9AoGgI6VpPeBOQZHYCA5at0qot7+0+NQiIr4zazdr4HgvfK94WPb+rXnZ6wBOegSY7n4
 ARtcOYcepAFSTJF0MFRjnj6wUCT5Puiu3LFCj8IPS+IVPpM8KbEroYwWgyjfDlwWin23Z
 NQKBQRHWqN/asmOA4wTKieVTp45fgk3Rhq8TP3bVeIPd7gktLUCiiJF0C0bcq+Cxc6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1045B4008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3438095B65; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dec44147586a55867131723080768dd57b181ca3
X-Git-Newrev: b4b3da6de31b7fbdf7b94087523c8effa026c178
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.3438095B65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 2.72.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4b3da6de31b7fbdf7b94087523c8effa026c178
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 322dd2cefa..196132f5f8 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  079f53404c6f8059a7ae6e39842548d0  sentry_sdk-2.71.0.tar.gz
-sha256  7beb27a22f06396f3a05510c3da6ea10e1c79e02e859993c27ce4ff074e296d6  sentry_sdk-2.71.0.tar.gz
+md5  b4ab7ff3867322c4059ac4ede7afd5c0  sentry_sdk-2.72.0.tar.gz
+sha256  0d2ffbc28ee2e63cbaf3d015e93b448cffcc3ef3be03a44704ad36ade72faa95  sentry_sdk-2.72.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 645b2665a0..44e102d9cd 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.71.0
+PYTHON_SENTRY_SDK_VERSION = 2.72.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/67/93/9ef70bfb7346c778caf09b7cd10c17c33f601f2d17019fa1aedcda738b5f
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/c1/d2bbb2b03bdc2ef14b35e02b647b8489156c50b6e0b8bacc5fa303902e23
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
