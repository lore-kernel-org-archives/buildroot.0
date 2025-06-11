Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956AC71136
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 22:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F8C6079F;
	Wed, 11 Jun 2025 22:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6Mc2c9oul9A; Wed, 11 Jun 2025 22:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530D5607AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530D5607AF;
	Wed, 11 Jun 2025 22:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 808AA1F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 22:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6664C6079F
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 22:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROR2fBUDGl9T for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 22:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E0B5607AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0B5607AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E0B5607AF
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 22:23:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 30387B0055A;
 Thu, 12 Jun 2025 00:23:36 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Jun 2025 00:23:24 +0200
Message-ID: <20250611222324.292547-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749680617;
 bh=XZbl1U3HIKrr0jgF5JUKhBYeOsRgmJzyCbEK7k4uiKk=;
 h=From:To:Cc:Subject:Date:From;
 b=fB3YRUknjoUQpFDlBaraECR7CoxOuohLRoODxxPWLMkU1re00vMz+7sL2didfih6w
 Yio4cqHeZ2NmrtV/dJWduhBTOcIclKeeDoOOXcpm2eDb/YJmsM0n7dTnJ9dPR6t4o2
 mnFOYAJcs77H3aoQkrX0Ivmx3WIB04+1lMn95YvQCUANAxP6ZTlCfwnyC5llrZCaEQ
 dnmLqbO5wVx1tTu+ptZ+sLEzb/tDPrq238xpLIdBI27xeDVaGlhFzx7JftFuIpchzS
 mCs3Cshu3HHkgcjSGWGb3gX2/TY0BkmaV81HwdktOAOXj7kTQx6/mCtlu/vtemxYYB
 2474SgRvLveNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fB3YRUkn
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.15.1
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

For change log since 4.13.3, see:
https://github.com/Z3Prover/z3/blob/z3-4.15.1/RELEASE_NOTES.md#version-4151

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/10324327101
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index 8514043594..a6a421b4e7 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f59c9cf600ea57fb64ffeffbffd0f2d2b896854f339e846f48f069d23bc14ba0  z3-4.13.3.tar.gz
+sha256  ebf6eed5f2cb217d62abddaa94526189ae40bf3c415fb9c2e2128e099f16fda0  z3-4.15.1.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 16db30ac21..22947e93cc 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.13.3
+Z3_VERSION = 4.15.1
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
