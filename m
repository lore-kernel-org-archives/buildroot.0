Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CF6CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BEA5610AC;
	Tue, 30 Sep 2025 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHBTo8zfMrw6; Tue, 30 Sep 2025 20:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA15610A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA15610A2;
	Tue, 30 Sep 2025 20:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22EB6111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14473610A2
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vad0bjhYeHtG for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 151D7610A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 151D7610A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 151D7610A1
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:32:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c14e.dip0.t-ipconnect.de [79.214.193.78])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39179A4C575F
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 22:32:50 +0200 (CEST)
Received: from [192.168.1.144] (port=52236 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v3h1l-000000000kz-3kjp
 for buildroot@buildroot.org; Tue, 30 Sep 2025 20:32:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 22:32:49 +0200
Message-ID: <20250930203249.1197653-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759264370;
 bh=ipVHzNF/bFYDl3P1T04xqK39RZEd4hyMnMh48Zeh7cI=;
 h=From:To:Subject:Date:From;
 b=JaFxc4hPp+2UqxUZHqWUy2Cmpigfbbb3IMFMGCQPhTra8kAq9QQ/uLYpbcltB/46T
 n2SLyn/gQPn0u+7URqTIBus4H4v1IbZoHs3rqEHi2hl6sMoTqYXwsNJsPDWvFxAhha
 MezwurqGpMrQzfnKvE6PjTDoa9ZvXrgHnqwCcAVCcWZBoHLLTUjM9MXpNS3rOp2RDN
 Rf2Bxg1GcFbGX+wiIw9xzo43X2SNrgY3WrooG9o4jxqrin+f9kv60eAIcRH1ARGkwQ
 m8d/aAYLJo0qg1Q+Pfk8Buzg4KyRM4Zyfs9EziIitWXvM6cFaGFTM83/QdCrSVdhHZ
 VxlmZ6gLnv3uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=JaFxc4hP
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.16-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 61ed16d683..181e6c1d9c 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  40f44b1748b4d1bfe92260e2805904154b6388f96babf820bfd900b54db15d57  kodi-inputstream-adaptive-21.5.15-Omega.tar.gz
+sha256  da61399c2aa3f1f67b4e3f293952b0fa16c90a7e1effa606f99676ff8144d25e  kodi-inputstream-adaptive-21.5.16-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index c140b3a0a8..63e92f0103 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.15-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.16-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
