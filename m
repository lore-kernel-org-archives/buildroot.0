Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158D6C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBB1A417DE;
	Wed, 30 Aug 2023 20:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB1A417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_fnVQb0G61a; Wed, 30 Aug 2023 20:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23C48417DF;
	Wed, 30 Aug 2023 20:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C48417DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3551BF40B
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A2940899
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 20:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A2940899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L01FhROF3JLO for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 20:54:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73CA34087E
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 20:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CA34087E
Received: from fli4l.lan.fli4l (p5b3a0af8.dip0.t-ipconnect.de [91.58.10.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B0B9A4C0BFA;
 Wed, 30 Aug 2023 22:54:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37156)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qbSCR-00087b-1H;
 Wed, 30 Aug 2023 22:54:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 22:54:03 +0200
Message-Id: <20230830205403.1205586-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830205403.1205586-1-bernd@kuhls.net>
References: <20230830205403.1205586-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693428843;
 bh=3507k7oGOeKYv3PmKCvr000nKPxZ2u2CzXUsqFvLLXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rti6IVLQS6OBrVQ61dGMQS4csW2WG7fZ0wINSELTgBD2UuNCuSnzGLBTgRpK9jCv9
 C66z3UNghA4S6FEs4TPyhgdwfbnW+VTlEe2CjMS9oKtReQJqSt71Kcky0ancCtKzjg
 Xf+y4H5ZyzJnFEdXdW54UgfXVbxbuYPPoiLNqBHDjib+8TLOHhyzo/XN1MSk82SX1V
 3NsEVkozkexTEQ7HL/cFaaSV4FYB6YHlnt3Qxpm3X/dbj+dCh7LQc+j+vXsd+kw78v
 LcT17J5YhF8Xd5qfU1jbxKuP6blb5YN3G7rTKvKw4+Bp3RBnFuQO96LsX6wGOFfP4A
 MUQizTVE+ujSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Rti6IVLQ
Subject: [Buildroot] [PATCH/next 2/2] package/onevpl-intel-gpu: bump version
 to 23.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
index fa8e96959b..70af121d28 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  51052b2cb0c1d0e628aa1e04b19ffdcd5098993c6c368045a79d87d21ca4ebe5  onevpl-intel-gpu-23.3.1.tar.gz
+sha256  311658f18b45645ffa9337a6307d59a1025b6f77f8fe122c332f536a14e1ef44  onevpl-intel-gpu-23.3.2.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 33b32b5d94..cbc612f4f3 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONEVPL_INTEL_GPU_VERSION = 23.3.1
+ONEVPL_INTEL_GPU_VERSION = 23.3.2
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
