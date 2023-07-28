Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE53C001E0
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2514784172;
	Fri, 28 Jul 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2514784172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-Iy1gtBeCdj; Fri, 28 Jul 2023 18:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9AC84166;
	Fri, 28 Jul 2023 18:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9AC84166
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 665BC1BF2C8
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 18:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB07614B6
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 18:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB07614B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqQtb8CsKyA7 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 18:08:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 094A6614A7
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 18:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094A6614A7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68A3FA4C0C45
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48364)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPRtW-0004y5-0Q
 for buildroot@buildroot.org; Fri, 28 Jul 2023 20:08:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 20:08:54 +0200
Message-Id: <20230728180854.3808246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690567734;
 bh=aITl1u3QBmadPu8SWKkcDf87rRY6FjnVYYcquU3WGn4=;
 h=From:To:Subject:Date:From;
 b=ALydicofTzrA+mIjDsVaw9VPa+VdUvynq1njwGD+6nXGHbSS2VcQra+vhXsnpiDQ0
 AW9gjX3YpW4c+ZyyBZ7VThwjTe/xZStPQE3Ld7avJz3jY1E86d1KvyYCV2YNWZ57LL
 izYUp82VQFUpf8nYdEY8qXf0uszOrDw5C3VhdkWQenzj+Wi9behJGS9iHtkqOKMJyV
 DfuB2fKnEpeeCrp97OAGMbafLG6prfJAGk2rBvYcR4LOZ2sNt9mUjiiJHTo2EIWXJK
 JTBzICEQ5mz2xRYVeRsBZAgQGipixcNQtv42PB7zOjaXwkULdaMPU7OhbsTHxZLU6V
 N1ixnPWIUiviQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ALydicof
Subject: [Buildroot] [PATCH 1/1] package/mpg123: force arm mode instead of
 Thumb mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:
Error: selected processor does not support `smull r3,ip,r2,r10' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/848/8484fc6be618f3edbf39a13928ab9a4b7b442235/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpg123/mpg123.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 64c8e0d8e5..5ec5590267 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -13,6 +13,13 @@ MPG123_LICENSE_FILES = COPYING
 MPG123_CPE_ID_VENDOR = mpg123
 MPG123_DEPENDENCIES = host-pkgconf
 
+# mpg123 has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `smull r3,ip,r2,r10' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MPG123_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
 ifeq ($(BR2_aarch64),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
