Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700CC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F51141763;
	Wed, 20 Dec 2023 20:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F51141763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id li0N2p6cKhXh; Wed, 20 Dec 2023 20:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EAC2436D2;
	Wed, 20 Dec 2023 20:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EAC2436D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1D91BF39C
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC78B41740
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC78B41740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtUFFERCx0qJ for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:01:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1117540A74
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1117540A74
Received: by mail.gandi.net (Postfix) with ESMTPA id 4D77260003;
 Wed, 20 Dec 2023 20:01:17 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, peter.verbrugge@technolution.nl
Date: Wed, 20 Dec 2023 21:01:07 +0100
Message-ID: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703102478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hXRl7Cq/ls+8U7IHGey3gz1h2xMaf0E0lEcm7esmHOg=;
 b=mtwlIAuBn5Zj23knTcfuu/bxUW0BG6JMX9997grYS/Fdd51dBH5eGB5gJkyM5P4mStOtOF
 J7D89lXBa2s+AgkdSa5SwJiGqv97JyzP8hkYE8NqSq61ba+dYSxqC3754iXid3y4IuS7Te
 htyV8tJ8OBjr76CA8fELHXCnadMTfvcLgfL0FqQGRgfcngG07HY6nx7W6g667WvdVCh45i
 MagjDN5mj0oDFWDcBbAyAGJLpEqgJIG5h4Y4I1IttTLYxqIzKoEyNFo2flPh27ghZLIxyZ
 kXkumLsV9lEpEmJX2oHAN2MfMV0eeyNIByCxrdvD3PBn17XCpsB1yMzdRjQMqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtwlIAuB
Subject: [Buildroot] [PATCH 1/3] package/glibc: add proper CPE ID version
 detail
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in bug 15895, the GLIBC_VERSION field having a value
looking like 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701, it
prevents the CPE/CVE matching with the NVD database to work correctly.

This commit fixes that by defining GLIBC_CPE_ID_VERSION, derived from
GLIBC_VERSION, by extracting the base version.

Also, we update GLIBC_IGNORE_CVES to account for the CVEs that have
clearly been fixed between 2.38 and
2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701. There are a number
of other CVEs still affecting the glibc package, but they are not
related to this
2.38...2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701 range.

Fixes: #15895

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0b71530310..32e6516c7f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,6 +20,22 @@ GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
+# Extract the base version (e.g. 2.38) from GLIBC_VERSION) in order to
+# allow proper matching with the CPE database.
+GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
+
+# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
+# 2.38 and the version we're really using
+GLIBC_IGNORE_CVES += CVE-2023-4527
+
+# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-4911
+
+# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-5156
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
