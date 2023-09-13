Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A2CEE020C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9187A813B1;
	Wed, 13 Sep 2023 20:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9187A813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40Vi4XPEMXss; Wed, 13 Sep 2023 20:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48DD8139D;
	Wed, 13 Sep 2023 20:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48DD8139D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 546F11BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B5CE813B1
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5CE813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlF-7P2pOgqY for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632478139D
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632478139D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5193286E9E; Wed, 13 Sep 2023 20:14:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 22:05:32 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f77fa78b1bea52ae516a92531e490cf9568b5380
X-Git-Newrev: 7bc2b674e08f9ba133b9bfb1a9bc477125379f46
X-Patchwork-Hint: ignore
Message-Id: <20230913201426.5193286E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] .checkpackageignore:
 correct renamed path of openjdk 17.0.8+7 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bc2b674e08f9ba133b9bfb1a9bc477125379f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Commit c1038fe47c renamed the patch, but didn't update
.checkpackageignore, leading to two failures:

.checkpackageignore:1055: ignored file package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch is missing
package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Rename the file in .checkpackageignore as well.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6bee7c3eb2680022dc16994afe423ea819ea0c06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 32975009e3..1518b796ed 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1121,7 +1121,7 @@ package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/17.0.7+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
