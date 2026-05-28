Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F8CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E2E61357;
	Fri, 29 May 2026 08:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyHX2-oshl8k; Fri, 29 May 2026 08:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA5861393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043144;
	bh=u7PfkptsnI//gwZtKGqp8SUXmTlHrK8DDsEMOBheXSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nkph3CagOFsR2oIaDt4WyfB25zlEUsXigbjqPprE/wLSRxSIcfHQ46uM9hNITJYvZ
	 KNTi4X9O/NwiphTvsvxCpD4BKgFGX9irwJJnCngpl8+LeO5IwZc9Bq/vdYeT0YG9wS
	 1a+iqWhGQ4M5pN9CR95bKJXn7fWAumQFJA8HKbc2Q2mEJjOKwJ+6u9AVqNwNsyqE9y
	 oDzQ+a9W1N9Zc2yEt1JJ4g/2/ZBOlT9JpQYz01Ha/YarGQzjwJLdvb8QN8PNUDBAp3
	 fb2IFTQfaSohn8g4y6qpqpRJErdrY84ni404JtNXbu2FSXJlc7i4yD+KXEpLtYkUty
	 kaOFLKgq36CcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA5861393;
	Fri, 29 May 2026 08:25:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FD0288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC8341F6A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMZF12GyF93J for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8AF41F7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C8AF41F7B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F064D87334; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:43:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6fa2e5339a38246dd0366c5140ca1a27ddb2dfc2
X-Git-Newrev: 5f3e810e9a38e2ad39b029c5e62214b3f16062d9
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.F064D87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: bump
 version to 1.21.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f3e810e9a38e2ad39b029c5e62214b3f16062d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.21.2

Use sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4ed5af5288d3092c80e376cc260e7f2794363eae)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libheif/libheif.hash | 3 ++-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 3da82e3e27..0daabcb5dc 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libheif/releases/tag/v1.21.2
+sha256  75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42  libheif-1.21.2.tar.gz
 # Locally computed:
-sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index c4196f9353..77435dda5c 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.21.1
+LIBHEIF_VERSION = 1.21.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
