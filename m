Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E01C369A9
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 13:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C71D60B4B;
	Thu, 10 Apr 2025 13:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZkkfmSmliZB; Thu, 10 Apr 2025 13:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27E461AC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27E461AC6;
	Thu, 10 Apr 2025 13:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7FE108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9122741EC7
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrD-ZVOWDAqo for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 13:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58B8A41EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B8A41EC5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58B8A41EC5
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:49:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.125.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1tmZn50QSR-00SYcW; Thu, 10
 Apr 2025 15:49:40 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 15:49:14 +0200
Message-ID: <20250410134914.916804-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134914.916804-1-fiona.klute@gmx.de>
References: <20250410134914.916804-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5RdqhSYRmouJ9W7e/dvFeHf0uL6CBhNN6YPF7Fa4Gg0MRMHUKhF
 DFXiquzz0Q8LA0EorcEf+bl4LZBOH+4jrFk5artB05K01jRLxrLzGIftygyNz2joY+QJC3N
 1vVNyoerQ5CyE62vXP76nz3MsJACu3gliQpY8jq6ybKR22M7bpJ2JL5OF2flqRtFuK5M/o7
 wj7EuKe2kKbeoNQrt8mSw==
UI-OutboundReport: notjunk:1;M01:P0:8flGGK/CWsA=;jA2DEfcd4lMIjwhR+wmNXDTJM5q
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744292980; x=1744897780; i=fiona.klute@gmx.de;
 bh=UH5Zk4vgkZuK/ONBcU+/VHddlsZfdxj0qGv8jct/JSU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZJhOzjoTX8rV+Dq1NscerW3qL/2MTNNWIIhtpHOWC3215Tpqx7V6eB2/0hznG+O/
 f83hyJngVgLjHu9ckbcqTCVnINdSXiLND73j1jfzPSCH+hFIP/iNzrtdiUAIbYIy0
 hXt8jlnu+nId2Usk95x2nEIcnqMhTu6qrSheV32Bg7dugYXn7B7Tn+Kea8exEfiTr
 Fxn3On4GpgbEh4UJcDfoInsVf6v73QOgkr0PNSVup1UVVMIcZzJVtK7nCr2CKv0FW
 KbJDP/Jg/u1NKy4HEO645k2r4qNE1DAqRjm1lP9b2gEzgVZ3rKbPTEJW9WbuuD/yJ
 QnrUc7VfOjcBdHfzjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZJhOzjoT
Subject: [Buildroot] [PATCH v3 4/4] package/libglib2: bump version to 2.84.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Bug fix release, upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.84.1/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Patch added in v3 (new upstream release).

 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9bc244ff22..5985c82d8a 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
-sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.1.sha256sum
+sha256  2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a  glib-2.84.1.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index a1a3954914..baa75fd10b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
