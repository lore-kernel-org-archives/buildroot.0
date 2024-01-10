Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E8C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21DE43731;
	Wed, 10 Jan 2024 20:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21DE43731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBb35SJ2dOgd; Wed, 10 Jan 2024 20:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B551A43777;
	Wed, 10 Jan 2024 20:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B551A43777
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 214DC1BF966
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D093F83C67
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D093F83C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKbSKbFl3pV3 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 111EF83A77
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111EF83A77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F346185CC9; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:02:02 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b5bfff37f5bdeaeea442c1d974edc2be9e99c337
X-Git-Newrev: ad202bc68ffcf43376dba03aff5fb1dbed9128b6
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.F346185CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libiec61850: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad202bc68ffcf43376dba03aff5fb1dbed9128b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
