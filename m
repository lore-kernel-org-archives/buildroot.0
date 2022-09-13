Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B4ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 16:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1187440330;
	Tue, 13 Sep 2022 16:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1187440330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TB_RxIfrFzaf; Tue, 13 Sep 2022 16:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00C340883;
	Tue, 13 Sep 2022 16:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00C340883
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9E3A1BF4E7
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 16:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CA640AF0
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 16:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5CA640AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAfUPOEv4IMF for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 16:05:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF5440AEB
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 16:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBF5440AEB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC3D483849; Tue, 13 Sep 2022 16:05:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 18:02:52 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 47de8ffc063142bea2e10db9ede80c6be0bfbabd
X-Git-Newrev: e0bbcf78ff1a694657c3fa582a3cff7202df9416
X-Patchwork-Hint: ignore
Message-Id: <20220913160514.DC3D483849@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/clamav: ignore
 CVE-2016-1405
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0bbcf78ff1a694657c3fa582a3cff7202df9416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a1d8717d13a376cfc5ec757bb9a5912c3750ef6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 10856ed971..bb95cb8d2b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -12,6 +12,8 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.unrar COPYING.zlib
 CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_SELINUX_MODULES = clamav
+# affects only Cisco devices
+CLAMAV_IGNORE_CVES += CVE-2016-1405
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
 	libcurl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
