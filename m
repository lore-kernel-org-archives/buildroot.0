Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367AC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A124052F;
	Sun, 24 Dec 2023 08:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A124052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmW8dmR3rMwL; Sun, 24 Dec 2023 08:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38DDC40490;
	Sun, 24 Dec 2023 08:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38DDC40490
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350141BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A573417D1
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A573417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUqY3iESoKSd for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:14:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 379F9417C9
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379F9417C9
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EB5FA4C0E7E;
 Sun, 24 Dec 2023 09:13:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34492)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJbt-0000sF-1o;
 Sun, 24 Dec 2023 09:13:21 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:13:17 +0100
Message-Id: <20231224081321.19791-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231224081321.19791-1-bernd@kuhls.net>
References: <20231224081321.19791-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405602;
 bh=gikDtYMASVmX9Qrg0YjG49plu70RGBQFvhoudNU9JBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVuWE4qXZlun0p3ilvMdQ7vG1c22fpbi/0gLZF8ruwQIU4qg6RpG6pJHE/guwf0/T
 CiiCXCrHAyhzx/nUWPD9KTMBW4jQplkcnJVQHLNYvVRdsbSYw1MYBjtcm3spR6mzcI
 bt5a3+mcG3FqPsg0J0SONkkHX+3jazVtpsOII5QI72vZfExIczzmi6TCXxvdRCVAVs
 ngxYirpAScoQ02pT5kSd2wiNwovReQqBsLHafeyqpXbhn15ZmFwAfLS7vK+Me2Wnqh
 RYQkVsUkPdKVOFV5McOhzYIEQ7KwXyvf7Nbaw2guhMdGMD5KRhYtjtqYTlLlvpgNDl
 VBHIdauPOBMIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=YVuWE4qX
Subject: [Buildroot] [PATCH 2/6] package/intel-gmmlib: bump version to
 22.3.16
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 01b573d1e9..6154ce636d 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  63b879a5a20756b6f74244068f4555a56c4f705c96cbc87e5163448a893e133f  intel-gmmlib-22.3.14.tar.gz
+sha256  083b86fd65ec9515971723872e56e1ba72e83ff75a9737d41a55938c0f2d4ac2  intel-gmmlib-22.3.16.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index c1a92aaf4f..2244f5755e 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.14
+INTEL_GMMLIB_VERSION = 22.3.16
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
