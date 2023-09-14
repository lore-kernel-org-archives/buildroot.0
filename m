Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26865EEAA65
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA4ED401CD;
	Thu, 14 Sep 2023 19:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA4ED401CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0IMMpqqXrMR; Thu, 14 Sep 2023 19:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB241401E9;
	Thu, 14 Sep 2023 19:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB241401E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 568091BF410
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC9F7836F1
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9F7836F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEWnZl9mfOxM for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04122836EA
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04122836EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E862A86FA0; Thu, 14 Sep 2023 19:19:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 21:05:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7fc1eeea27dc54b739e76a106541c3ad75fdf7f3
X-Git-Newrev: 1094120d6ad6f6094716a44d73107022af262d9b
X-Patchwork-Hint: ignore
Message-Id: <20230914191924.E862A86FA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libiec61850:
 ignore CVE-2023-27772
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

commit: https://git.buildroot.net/buildroot/commit/?id=1094120d6ad6f6094716a44d73107022af262d9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Segmentation fault in example code can be exploited.
BUILD_EXAMPLES is disabled for all cmake projects.

See https://github.com/mz-automation/libiec61850/issues/442

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b25f1cb47c55dab9de706d61809936839cfe8f5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiec61850/libiec61850.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 9bd55cb76a..4b61e40c6d 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -11,5 +11,8 @@ LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
+# Examples aren't build
+# https://github.com/mz-automation/libiec61850/issues/442
+LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
