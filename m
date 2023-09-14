Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025F5EEAA62
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A290A41FB0;
	Thu, 14 Sep 2023 19:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A290A41FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BN7M0xSp6mi4; Thu, 14 Sep 2023 19:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3D2401CC;
	Thu, 14 Sep 2023 19:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A3D2401CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C52671BF410
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE556128E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE556128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJgqvMXLDQx8 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA896129E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA896129E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3718B86F87; Thu, 14 Sep 2023 19:18:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 21:05:17 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 73554da86f840a8d6905412c2e94c7d49b7d97aa
X-Git-Newrev: 6fb61f11b71d923baad10b0ecdaee13ca6bbc1a2
X-Patchwork-Hint: ignore
Message-Id: <20230914191810.3718B86F87@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libiec61850:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fb61f11b71d923baad10b0ecdaee13ca6bbc1a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
