Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1449CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 20:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67BED408F3;
	Tue,  5 May 2026 20:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9rwNGL0RWwC; Tue,  5 May 2026 20:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D362408E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778012972;
	bh=ji3cBPcWglEykjiDtqPo8sSACkBdI2/FtsPuEYuvkGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ej1nrPxPUAQTY3APH0OvUYT6h6qxI5O3yF3saPmfXxjKR48Lwz8QrnPXcpFtYPrsy
	 kcf10UjSOeBSQnTTiX1S3tH8J69SpSF1Z+1JfXAgYkdthD7tYCX35D9/bGXeXwSrI6
	 fIwKh3KeFqci0dQiQfkdJSMAtbbgktuT2gRobrCFv8PKAb81p/tfa8yBjpPWznYeOe
	 dpVQ+DxYqd7OrbAtkACav/K445wm5FKNPv4CWH84q/UCUEbPARilJovnZd8zbq2O54
	 ks3waz337DoTY2cj5AfewWsNo/PUnO+SxOuwWh/DSI9G2NxptgGRtTvksK63jYFKNc
	 VX7NRu0Gfslaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D362408E0;
	Tue,  5 May 2026 20:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 067E9280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0C2C60B33
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1tdNO17efi5 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 20:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E407E60B38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E407E60B38
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA67584679; Tue,  5 May 2026 20:29:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 22:16:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d937c4a8e646777c134b9fa215c8c151e432b5c
X-Git-Newrev: 760e16dcc033bb743cacf56449011bc6cdaf7bed
X-Patchwork-Hint: ignore
Message-Id: <20260505202928.EA67584679@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p7zip: security bump to version
 v17.06
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/760e16dcc033bb743cacf56449011bc6cdaf7bed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

What's Changed:
  - Fix CVE-2021-3520 affected components Lz4 1.9.3 in p7zip17 (#239)

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>a
[Marcus: mark as security bump]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/p7zip/p7zip.hash | 2 +-
 package/p7zip/p7zip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index f0b9c27113..d352965950 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6  p7zip-17.05.tar.gz
+sha256  c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1  p7zip-17.06.tar.gz
 sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 803fd38b7f..ee5a7d2e10 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 17.05
+P7ZIP_VERSION = 17.06
 P7ZIP_SITE = $(call github,p7zip-project,p7zip,v$(P7ZIP_VERSION))
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
