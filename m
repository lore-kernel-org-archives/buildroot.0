Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D7CC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C9C40561;
	Fri, 18 Apr 2025 14:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFULkMl2j6vf; Fri, 18 Apr 2025 14:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1742340C4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1742340C4E;
	Fri, 18 Apr 2025 14:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE76711F
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3EE260D61
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3OEoeO1OGSg for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B7376078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B7376078B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B7376078B
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:40:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N3siG-1v5PzM48WW-015drf for <buildroot@buildroot.org>; Fri, 18 Apr 2025
 16:40:41 +0200
To: buildroot@buildroot.org
Date: Fri, 18 Apr 2025 16:40:03 +0200
Message-ID: <20250418144004.24089-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cmPDvLDjM9cdzEIG7yEiPS5abHZ9d47lVEFveW8qwT6B9UGs7m/
 AjYHyayeCFK2ImJItdPgRkyRya67fstGO5hejuNpncA5bUujzNrGUg559+DjGLfgJo4hTXM
 txHR8kpppD1bd4TiVqNmrYdXqJfeVX82OS9WpNf/iMUCHWwm3+UifK7yaLjT6Ab5e5KeRl1
 /1EFmsYW0XCp5EGKmhHYg==
UI-OutboundReport: notjunk:1;M01:P0:Nae7FhYgJkQ=;YbiEQD8LiJ40w5u0j1wFZa8ktzl
 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
 br/zLNAilJKqM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987241; x=1745592041; i=dalang@gmx.at;
 bh=G3FYd4y4D8blvPSvLqHx//s/sywjpbBuJgM0XW9f+Zc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qAKDKkPbN+Cy4I0n+qXxCk1/vhV2SRTKttm3q1CY8twTFAU7H2grynQ4rUwQsSWL
 5aO3a2K7BYw5N5xMwwyA5GAF1/SZryIlgl6bweveRVKlv7vV4eTGszSd0VT1ZvVS3
 oRqf55Qy59uD61n+LUIUATfhsjvmmW4+Z9cfoooPOt4qT8+bBNiPaNfiGuYdOdMq4
 njf4ev6bUt3M0o+j/OkLw8mcU95Na1tV30Xsz/CtbeXlm5tqQUlWGmPGEZYRaYcEl
 HNQ1GDKDOaM1DwcQkHF3iVmcVUqk750VVJNqDpQJQYFrs4ztwWvaFj3iX4FiEm6KK
 FGesJ0lCB6mfYjDY3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=qAKDKkPb
Subject: [Buildroot] [PATCH] package/atkmm2_28: bump to version 2.28.4
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.28.4/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/atkmm2_28/atkmm2_28.hash | 4 ++--
 package/atkmm2_28/atkmm2_28.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atkmm2_28/atkmm2_28.hash b/package/atkmm2_28/atkmm2_28.hash
index 776c9851b8..b7c106d2d0 100644
--- a/package/atkmm2_28/atkmm2_28.hash
+++ b/package/atkmm2_28/atkmm2_28.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.3.sha256sum
-sha256  7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969  atkmm-2.28.3.tar.xz
+# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.4.sha256sum
+sha256  0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3  atkmm-2.28.4.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
index b56da61ec0..47924e64b6 100644
--- a/package/atkmm2_28/atkmm2_28.mk
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATKMM2_28_VERSION_MAJOR = 2.28
-ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).3
+ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).4
 ATKMM2_28_SOURCE = atkmm-$(ATKMM2_28_VERSION).tar.xz
 ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MAJOR)
 ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
