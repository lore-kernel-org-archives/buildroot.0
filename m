Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C94DC43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9DC83FC7;
	Tue, 26 Jul 2022 08:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9DC83FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6PeeG-Sm7df; Tue, 26 Jul 2022 08:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD1283FC4;
	Tue, 26 Jul 2022 08:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD1283FC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54DB71BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DCFB418EE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DCFB418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Qdn2udcn6MG for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:55:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458A6418E5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458A6418E5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DD68D85EC5; Tue, 26 Jul 2022 08:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:55:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a40a516c8ae2e8c11549115e10aa74d98a4fab5d
X-Git-Newrev: 506ec804c94136d030a9843e6d99106e78dbb8dd
X-Patchwork-Hint: ignore
Message-Id: <20220726084209.DD68D85EC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: add ZEEK_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=506ec804c94136d030a9843e6d99106e78dbb8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zeek:zeek is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azeek%3Azeek

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeek/zeek.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
index 6c8fa06875..584bfb0778 100644
--- a/package/zeek/zeek.mk
+++ b/package/zeek/zeek.mk
@@ -17,6 +17,7 @@ ZEEK_LICENSE = \
 	Apache-2.0 (highwayhash, folly), \
 	MPL-2.0 (mozilla-ca-list.zeek)
 ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_CPE_ID_VENDOR = zeek
 ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
 ZEEK_DEPENDENCIES = \
 	host-bison \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
