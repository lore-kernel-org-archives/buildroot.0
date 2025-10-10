Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5405FCCD187
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 22:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434C78209B;
	Fri, 10 Oct 2025 22:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXQ01qPNuh27; Fri, 10 Oct 2025 22:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25095821AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25095821AC;
	Fri, 10 Oct 2025 22:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0169C299
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB77160726
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snKVi1n7knz9 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 22:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B05B606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B05B606F4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B05B606F4
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.114.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1uWukF0Cgm-00buY9; Sat, 11
 Oct 2025 00:21:51 +0200
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 11 Oct 2025 00:21:22 +0200
Message-ID: <20251010222122.1911651-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010222122.1911651-1-fiona.klute@gmx.de>
References: <20251010222122.1911651-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:MYsrbazdQ3V0O31bWXNzn8xvfhw7xJYeDZ+8clBX2U4IhqAds8Z
 1A2mgP8BLBXkYpLfAtUmikV62a7hC9dI088NVAhAKndDEqm9hbJSuR0IR5JnyTN8guROS2v
 ZTNK+D8Zh9XJ8u/j17di/v/fH/nX6H0iZJyN9K0PoBfPhe0tlaCFo5TW8hBG1EjT5mX75ob
 AHrMBJEONHwaE1A/2yVbA==
UI-OutboundReport: notjunk:1;M01:P0:g+kbuALIV1c=;uDf9Hunm4qdTnn4BaK6kBzndTmr
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760134911; x=1760739711; i=fiona.klute@gmx.de;
 bh=U2blwO6E0H59MVRBoYJhMVBkhO3D4HrxmRkDZsWtY7w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=j/JvEXyTgjLqHgfwC46C6bxPrR0hgqTlm2elwlx1MxiNuOiXKa9MLEgs/JUtGWyG
 uyep+v7EEE+MpyvIGm5zPZEuuvm6MZn+0HItTQJgjdmI3pEMA+Pfi7dnc6WgSfLDi
 o5KMlUOrUCrrP0ppe4mcW0OwzKuerjPP+56kKwoirouksYXJ0QZ4+iNKwvEniGLEL
 VQSyKU7qCBCKJ6hhXQJHmH2W1WRmRaOJ7gt2I99yCEvEwHmTEWh+uOHIwMPImocMk
 BN8H9EzS363dCoWn0TXiqHQk12DrOG7NiBp4eoJqBQT1m0AGNJSIOn0gMAPwA9Lv7
 Cxr3UNmyBf/GvJTbnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=j/JvEXyT
Subject: [Buildroot] [PATCH 2/2] package/refpolicy: bump version to
 2.20250923
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The update makes some warnings about unknown classes and permissions
during boot with current kernels go away.

Upstream changelogs [1, 2] list as "notable changes":

* Updates to support screen 5.0.
* Add labeling for bcachefs.
* Various systemd updates and fixes.
* Several updates and fixes for systemd
* Add new permissions and policy capabilities
* Drop reiserfs support (it was removed in kernel 6.13)

Plus a number of new modules.

[1] https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250618
[2] https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250923

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
The SELinux tests (tests.core.test_selinux.*,
tests.init.test_systemd_selinux.*) passed.

 package/refpolicy/refpolicy.hash | 3 +--
 package/refpolicy/refpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 76bbf482ae..761ac919f7 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,4 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  d2487c49420e8710e999b18bbe699fbff033fe5adc5127e3f0c7dafaa9b4d209  refpolicy-2.20250213.tar.bz2
-
+sha256  e5b435c934048d01ca4415a1f2670a51e113f26f5d01ad4227c98fbe8dea8d5b  refpolicy-2.20250923.tar.bz2
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 2b8a7c7e24..7619496db0 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20250213
+REFPOLICY_VERSION = 2.20250923
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
