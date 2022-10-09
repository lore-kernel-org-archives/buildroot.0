Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C9C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 18:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6939F81438;
	Sun,  9 Oct 2022 18:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6939F81438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OIy__1mJ1LW; Sun,  9 Oct 2022 18:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A30DD8142C;
	Sun,  9 Oct 2022 18:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30DD8142C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB9F21BF2A4
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 18:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3A9B81432
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 18:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A9B81432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcFYJvtHg0an for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 18:09:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 050F981414
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 18:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050F981414
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E57C886ADC; Sun,  9 Oct 2022 18:09:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Oct 2022 20:05:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f00b909b9ee637c255a882fdda580fb1a66a014
X-Git-Newrev: d95faeea442796d0f79cae2bc666824955a668fe
X-Patchwork-Hint: ignore
Message-Id: <20221009180918.E57C886ADC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qdecoder: add
 QDECODER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=d95faeea442796d0f79cae2bc666824955a668fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:qdecoder_project:qdecoder is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aqdecoder_project%3Aqdecoder

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 05ee657131..c465617e26 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -8,6 +8,7 @@ QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
+QDECODER_CPE_ID_VENDOR = qdecoder_project
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
