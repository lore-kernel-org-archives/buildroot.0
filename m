Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89914C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35A12437B2;
	Wed, 10 Jan 2024 20:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A12437B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTlcKOwwSjtu; Wed, 10 Jan 2024 20:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CA3437F4;
	Wed, 10 Jan 2024 20:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CA3437F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3C21BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A730461564
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A730461564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Dp9wiUhB1Dn for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E22BB613FF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E22BB613FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFDFA85D64; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:02:15 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d643e10124c17b8b34b888dda024deae1828fed1
X-Git-Newrev: 232a03959253f6a19e90d3588c280d2f904fc4ad
X-Patchwork-Hint: ignore
Message-Id: <20240110202203.CFDFA85D64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libiec61850: add
 mbedtls optional dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=232a03959253f6a19e90d3588c280d2f904fc4ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

mbedtls is an optional dependency since bump to version 1.5.0 in
commit a42e0e4600be785fa750c6b481c41a76d041df03 and
https://github.com/mz-automation/libiec61850/commit/19f2cbf0e7066753476ff8c38c07a6f0df73a622

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4d07864d4c1b7d964e23f8ab75f5c6f828a674c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
