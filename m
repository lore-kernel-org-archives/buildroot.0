Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2317C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBE784F29;
	Sun,  4 Feb 2024 10:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBE784F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzlCRqOEW-Ei; Sun,  4 Feb 2024 10:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55CF84F4F;
	Sun,  4 Feb 2024 10:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55CF84F4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E31F1BF947
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F92641960
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F92641960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bN7qEbEGSUE1 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0939410AC
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0939410AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB1BC868D8; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed40db6dfba553df8571fcb96c29b8f20dc43dca
X-Git-Newrev: 92f3f04146654f77add9fc14c18d054783006108
X-Patchwork-Hint: ignore
Message-Id: <20240204101728.BB1BC868D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wheel: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f3f04146654f77add9fc14c18d054783006108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:wheel_project:wheel is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/402C4B59-237A-4399-8189-CC9FC1B4BF39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-wheel/python-wheel.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 159598fd1e..320995521e 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -10,5 +10,7 @@ PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+PYTHON_WHEEL_CPE_ID_VENDOR = wheel_project
+PYTHON_WHEEL_CPE_ID_PRODUCT = wheel
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
