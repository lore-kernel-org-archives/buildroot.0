Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE38ACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4AC6F5C8;
	Fri, 13 Oct 2023 15:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A4AC6F5C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw3U6qWYXAEJ; Fri, 13 Oct 2023 15:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C650B61048;
	Fri, 13 Oct 2023 15:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C650B61048
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52C741BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39D5B81E1D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D5B81E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IV-4P4hF8hBV for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:25:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D77981E6D
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D77981E6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B92F848E6; Fri, 13 Oct 2023 15:25:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:15:16 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0aa03c6b9283f5a8bc302cc79e2712fafc18df10
X-Git-Newrev: 00855772b8b09e86fdc6c450259997a30dd16594
X-Patchwork-Hint: ignore
Message-Id: <20231013152517.2B92F848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sslh: add
 SSLH_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=00855772b8b09e86fdc6c450259997a30dd16594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:sslh_project:sslh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3E1DF528-5507-4919-A3EC-4283949BE06F

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5fcd2ef29d2f6e782b9bd5928e2e835daf627ae8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sslh/sslh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 897b3b6505..6ef7cda1a9 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -9,6 +9,7 @@ SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
+SSLH_CPE_ID_VENDOR = sslh_project
 SSLH_DEPENDENCIES = pcre2
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
