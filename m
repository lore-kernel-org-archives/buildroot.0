Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7196C44506
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE04607A2;
	Sun, 12 Jul 2026 14:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxlDOS9Vuhoo; Sun, 12 Jul 2026 14:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46CED606C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865975;
	bh=wmCVvmT617SeKge7FevEi0sFWGRuJR//LnSN/Em/cTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HoKoW1fenvRUOyRWXtKUgSJv6Q1Mteg49KTHaIVGoPGniwB9WdtDExAl/Uiyy9ftp
	 rAKNq+Y44lO2dQvKYnXPpWW9R6xRbQPLH6zKWbN9rBR/5IvSOnB+gbBja44y5jHO2P
	 1jg8vRBApzfzgab0ta/F6ShIuo2Wo9cdY9GCUHA53KL1OH9rUgEIgQMEAf938YY9zy
	 WsPa6dTqRcbKHF4K1QoodA3aExncVY60ZNWsYT4j+4uUV+YrF1V07ao7W90VfWwu3U
	 XvyZt+aNwWbxIw2d3wiF/oMtc42JsiFG5nrDtNQBe2UFOuLS3jWV0aqtobS4VYYgjG
	 54YRNDERx9O8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CED606C5;
	Sun, 12 Jul 2026 14:19:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 926EA2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 842A54077E
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd8veSPBpUKE for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D47A407C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D47A407C8
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C875A88733; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4412e6e1af11637ae8ff8dec4adf9cf37a8a2bd3
X-Git-Newrev: abc25b9c3b2b1328a8dfe4be3e03eedb6bfe49ff
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.C875A88733@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xilinx-fpgautil: bump to
 xlnx-rel-v2026.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/abc25b9c3b2b1328a8dfe4be3e03eedb6bfe49ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump xilinx-fpgautil to xlnx-rel-v2026.1 version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index b66ef8186b..42a10c40bd 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  043d87f12550283008ee0850f18ca807a48cc4ee085182ae84f8bed65fa73425  xilinx-fpgautil-xlnx-rel-v2025.2.tar.gz
+sha256  6126a6d1baa937bf94e044fdde1eaecbd1c0b545835293bad51bbf5a8e6b7cc0  xilinx-fpgautil-xlnx-rel-v2026.1.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index f53ed80e2f..bc63427f18 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.2
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2026.1
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
