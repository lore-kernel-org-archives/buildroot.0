Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A664C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E4741C1E;
	Sat, 24 Sep 2022 21:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E4741C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wl0TR7xIlpKw; Sat, 24 Sep 2022 21:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9571F41977;
	Sat, 24 Sep 2022 21:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9571F41977
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEC491BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BEA83F72
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5BEA83F72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUGTEbUg4lj9 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A7DB83E69
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A7DB83E69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EADBA85FA5; Sat, 24 Sep 2022 21:40:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:39:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 711ec0ceaaa10275a5ca23d54e656f782d1a5d81
X-Git-Newrev: 06767e7d7792fd1ab1d0fae836701ad2acf54c6e
X-Patchwork-Hint: ignore
Message-Id: <20220924214013.EADBA85FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: add CRUN_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=06767e7d7792fd1ab1d0fae836701ad2acf54c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:crun_project:crun is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acrun_project%3Acrun

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crun/crun.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index c92e6e5605..4a0c150594 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -10,6 +10,7 @@ CRUN_DEPENDENCIES = host-pkgconf yajl
 
 CRUN_LICENSE = GPL-2.0+ (crun binary), LGPL-2.1+ (libcrun)
 CRUN_LICENSE_FILES = COPYING COPYING.libcrun
+CRUN_CPE_ID_VENDOR = crun_project
 
 CRUN_AUTORECONF = YES
 CRUN_CONF_OPTS = --disable-embedded-yajl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
