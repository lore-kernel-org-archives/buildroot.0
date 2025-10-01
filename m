Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78996CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4604183DDD;
	Wed,  1 Oct 2025 16:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhfACAdZp_Uu; Wed,  1 Oct 2025 16:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F72E83DE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F72E83DE6;
	Wed,  1 Oct 2025 16:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B13322A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9808D41050
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg3pVboqPIhw for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6592B41049
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6592B41049
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6592B41049
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:08:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1ECE45FF95;
 Wed,  1 Oct 2025 18:08:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed,  1 Oct 2025 18:08:19 +0200
Message-ID: <20251001160820.8829-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759334906;
 bh=2BQBbqb+cgKOUKAQ3RNwfiNGISXdwFN6lyHDERAFDYg=;
 h=From:To:Cc:Subject:Date:From;
 b=DkqrMJvcJLEP2o6BvI6ZH96AWv3Pr9Es3vatmPwegpGP4NFQr76YcFQ6BMAsL68if
 v1nvbMtULJz12vjyNu1oTVz3JAUD82aU0f42B0I8FN2RXc/zG45hk4uXdhsrLW/owa
 cPlRgy7FnlbsCpjbifDTx0RE9U0yPlkuCiPSL18rm3dIW6sHdOtzX0APDJtplhlJGK
 DGGhqVhNpvRIhzx7lFjzCQvYxCs8KAgxc1zO30tKfU3orQ+ffLcZOyjHBikxOwwueY
 FCU8RFQzneBV94EDTr+fr2j6kcUYnNsBXx22zR4vdpglpCMus5ulkOb777XWm1e3OE
 ROEI0qLLGV3vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DkqrMJvc
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.09.00
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2025-September/014087.html

The archive of this new version now includes a "fwts-25.09.00/" top
directory. Therefore, this commit removes "FWTS_STRIP_COMPONENTS = 0".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/11555006341
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 9a4422069c..3f04288fb8 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
-sha256  19450b19cfd71a43d3716e4108d06db8b52f10801fb24bfb76f30dc0023d5142  fwts-V25.07.00.tar.gz
+sha256  ecba21d367b1c7aea41b378ad8fd3d43706c0fa4033cc31b59f8152c9cc0d69e  fwts-V25.09.00.tar.gz
 
 # Hash for license file
 sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b3860c6fad..f8537fbcf5 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-FWTS_VERSION = 25.07.00
+FWTS_VERSION = 25.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
-FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
