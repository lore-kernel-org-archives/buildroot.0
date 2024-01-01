Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9962DC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0499740A77;
	Mon,  1 Jan 2024 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0499740A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkFH70h06fXc; Mon,  1 Jan 2024 21:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F11A94356C;
	Mon,  1 Jan 2024 21:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11A94356C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 429E81BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749F9408FD
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749F9408FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MTBcTDDUx1m for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:05:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EA0442125
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA0442125
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E922F83AE3; Mon,  1 Jan 2024 21:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:36:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a92c0efb9f37e6c8d5eae19fbce38d1a49cf44a5
X-Git-Newrev: 4d07864d4c1b7d964e23f8ab75f5c6f828a674c5
X-Patchwork-Hint: ignore
Message-Id: <20240101210510.E922F83AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiec61850: add mbedtls optional
 dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d07864d4c1b7d964e23f8ab75f5c6f828a674c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbedtls is an optional dependency since bump to version 1.5.0 in
commit a42e0e4600be785fa750c6b481c41a76d041df03 and
https://github.com/mz-automation/libiec61850/commit/19f2cbf0e7066753476ff8c38c07a6f0df73a622

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiec61850/libiec61850.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 4b61e40c6d..a3cfb74b03 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -15,4 +15,11 @@ LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 # https://github.com/mz-automation/libiec61850/issues/442
 LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBIEC61850_DEPENDENCIES += mbedtls
+LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=ON
+else
+LIBIEC61850_CONF_OPTS += -DCONFIG_USE_EXTERNAL_MBEDTLS_DYNLIB=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
