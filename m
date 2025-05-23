Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E35C54F2E
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F9280DF0;
	Fri, 23 May 2025 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGRjpWSWrUrp; Fri, 23 May 2025 12:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E917780D55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E917780D55;
	Fri, 23 May 2025 12:15:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8A52179
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF2B36060E
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyK86vJM2Kzy for <buildroot@buildroot.org>;
 Fri, 23 May 2025 12:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9026F60836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9026F60836
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9026F60836
 for <buildroot@buildroot.org>; Fri, 23 May 2025 12:15:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1uv4uf2Tk4-00b89U; Fri, 23
 May 2025 14:15:41 +0200
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 14:15:21 +0200
Message-ID: <20250523121521.380704-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523121521.380704-1-fiona.klute@gmx.de>
References: <20250523121521.380704-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lowr9I/xzp8Ml+qZm90JVx6bWVmO+Q6uLA0FguzTDSuts4tGWkS
 G3LQUM6X3rdalkcQFBu5LtJqS0rz8jSjaCAB5HmlkhLGIB0ZSiiV+YaDkLWktRVPRQnd33x
 uCx704EjuHL9R8qUsmiDDJNkmOaFFuBl5vLVnEigU+DyqkUQiQRkeus2fbHAZhmKkjEf/O3
 GUtGKzAlk898YpgbF1lzg==
UI-OutboundReport: notjunk:1;M01:P0:DdeFx0Yg+bQ=;OSyeXuw4jZt3dO+BrMum9UK3mUk
 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
 gOiZRGwWIoDR5+C5U9HWBFG5J+UKie+5kb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748002541; x=1748607341; i=fiona.klute@gmx.de;
 bh=pn0+u2jDRddHZIw1pSMJGpZXXvCLRKDi7PZ099Fjtps=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Gycg1CmchQX0OluzyIrmYRwFMLZ5rx2ebExqzfhAIX2FQOR0ssiJRCW7a9tBjomU
 8ZQoTKZnPUuPsRUfpFOo55eq1Uf03DnoQ7yrahf3RiexuEpHolb4rLbdaZVt/JuBO
 lJRDp5VJsDaY8JsVz+Rqmp3/gkcDqdP9eXPUBdNaBBc3SgqBA9Xr7AXEfFTMkNhux
 K47C0WK5Bj+fPOIkzL11AdfKHRTJ1xcI0E3udCh13KOe7SKp8v44IonEBKKmCf7+1
 rE1IfHNRmiWTov89CgscLdhi94Mdx7pk1Siug55BTWzNUPL9K8bkvybLqFBhPHu/3
 bfU3bvfguRVUXnGQ8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Gycg1Cmc
Subject: [Buildroot] [PATCH v6 4/4] package/libglib2: bump version to 2.84.2
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
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This is the current bug fix release on the 2.84 branch, upstream
changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.84.2/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Change v5 -> v6: Update to 2.84.2 instead of 2.84.1 (new upstream
release)

Patch added in v3 (new upstream release).

 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9bc244ff22..bfa74f7505 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
-sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.2.sha256sum
+sha256  88e960dd937057407d61fcb3b45a860704b25923c37ae2478b85f2ecb5a4021f  glib-2.84.2.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index a1a3954914..05f6ac0c20 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
