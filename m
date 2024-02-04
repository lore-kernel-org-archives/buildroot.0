Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F9C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 098A740420;
	Sun,  4 Feb 2024 21:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 098A740420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEL02pk4GzXW; Sun,  4 Feb 2024 21:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B534055F;
	Sun,  4 Feb 2024 21:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B534055F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56CA11BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC604055F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC604055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgJWq9p0SnMJ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:14:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D56F40420
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D56F40420
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08D4E8690E; Sun,  4 Feb 2024 21:14:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:13:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 302175353a920402d27d4f7cf23dd78c5a792428
X-Git-Newrev: 17dac57e3ebfe8e2371100a632cca4fb11ed9bac
X-Patchwork-Hint: ignore
Message-Id: <20240204211424.08D4E8690E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yasm: add YASM_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=17dac57e3ebfe8e2371100a632cca4fb11ed9bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tortall:yasm is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/2E6C9C2F-A057-4083-BC90-095403EF138E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/yasm/yasm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index b294bd3aee..cdb8e15bee 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -8,6 +8,7 @@ YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
 YASM_LICENSE = BSD-2-Clause, BSD-3-Clause, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
+YASM_CPE_ID_VENDOR = tortall
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
 # that are only of use on Microsoft Windows.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
