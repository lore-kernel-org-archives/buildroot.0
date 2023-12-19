Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E5C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 23:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9734581444;
	Tue, 19 Dec 2023 23:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9734581444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6-RXR7c4Rjm; Tue, 19 Dec 2023 23:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD214813A2;
	Tue, 19 Dec 2023 23:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD214813A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1E21BF3E9
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 23:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CEF44194F
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 23:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEF44194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aITr6Vclcsib for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 23:13:29 +0000 (UTC)
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28C5241621
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 23:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C5241621
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FjHBr8xDOBwDvFjHBrN7vn; Wed, 20 Dec 2023 00:13:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 00:13:24 +0100
Message-Id: <20231219231324.936423-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMw/BM7InfTvm3Xwm7oN8Up4FjfL6GIanzntCfOv20cHQKWq3erCaZKgUGNye6qBPJ0qE96sMdeuQdDDOlHpvnn6FpADXyFjbyswk6lla3+DpKSD4BUq
 gkS883hfLyyDU/MOklvcOudK8o9tGJ+74ZBJd7vFYoHaWb6fraOdlK4MT9ltDFgz8grVWtkmOrMInzTuEWzinewug81naLvt4XkBsPxtzGuA54JFqjtjx6wj
 QrJJwAuyxHf5N56OqGqpiAb6Ci9ZM1DeOrPMM9nNudzFTQ96amk1/UcPCnQBmj7kWy/FvFFWqma/wbEHI2fOeQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703027605; bh=2No1rsltegAUjO3emFS/drl9WygpSY+RK/Nu/smsw9M=;
 h=From:To:Subject:Date:MIME-Version;
 b=mR2hs3d03mOxgXZALMWiSdJvO4SoTmaxmSnlCjK8WFE8z+RkExpF95prf/+8mWRkh
 +oEnsUYsqn5l/oFgKhxGGydVMQHa7oTwn9xUArOPK7dIbol+C49Z0ma94QYk9jdQlp
 dfxChaO7mtplL8P+bK1TgwVsNppQCXjH8bvmMkr35+9w6kwjWsMHAQh6fGvBtt1bK9
 fXjOhYZ4y6/pMPHWawN/66UmA3UXs3OvcUXn7/UQKTncohsDXFUHTTnMN20UEoRQtn
 iS/EyFYg7dAFPjHuKxe3MfJ0QfzIsVwTosyYO4x7mmKFEAMJLp7CA2A40HWacYPhub
 T6CM6dqdTpvSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mR2hs3d0
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.96.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 046f0efcca..e44f729363 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_95_RTM/src/SHA256SUMS
-sha256  469888e41e8a780051ce00edcd914e8a6bd38da88a82cfb84898dd388635822a  nss-3.95.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_96_1_RTM/src/SHA256SUMS
+sha256  c51e89f6fbb06163f4302e368eeb672d748b52d583948bdb15ef1b069237a496  nss-3.96.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 43645e26fc..459b00123d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.95
+LIBNSS_VERSION = 3.96.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
