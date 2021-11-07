Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC19C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1318360F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1318360F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCFDE40252;
	Sun,  7 Nov 2021 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFxAubXC__Qw; Sun,  7 Nov 2021 20:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BF040257;
	Sun,  7 Nov 2021 20:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 422301BF97C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EBBA40250
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNTBWlqg5IC4 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B8284024D
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:20:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A8C398B496; Sun,  7 Nov 2021 20:16:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:16:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 052cbfb0c70e22121312a086815c7f71b693c414
X-Git-Newrev: 839ae7519215e488f586ef6afac2b61e98734468
X-Patchwork-Hint: ignore
Message-Id: <20211107201628.A8C398B496@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: add
 SURICATA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=839ae7519215e488f586ef6afac2b61e98734468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:oisf:suricata is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoisf%3Asuricata

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index ebeaa68d34..e7067acdc1 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -8,6 +8,7 @@ SURICATA_VERSION = 6.0.3
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
+SURICATA_CPE_ID_VENDOR = oisf
 # 0001-python-ensure-proper-shabang-on-python-scripts.patch
 # 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 SURICATA_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
