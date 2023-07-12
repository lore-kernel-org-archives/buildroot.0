Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5699EEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 22:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F5F822D5;
	Wed, 12 Jul 2023 22:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F5F822D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SM2WgFLIcpT; Wed, 12 Jul 2023 22:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D1C82295;
	Wed, 12 Jul 2023 22:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D1C82295
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A71061BF48B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 22:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D53561267
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 22:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D53561267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clc33suSIzy8 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 22:15:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51377611FB
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 22:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51377611FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3991186F55; Wed, 12 Jul 2023 22:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 00:14:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5444dd5e0f0a672d164f9d7362a949c103620a6d
X-Git-Newrev: 587d392df7d1f5251ca4cfdb6f37888c55f18376
X-Patchwork-Hint: ignore
Message-Id: <20230712221512.3991186F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_shadow:
 fix flake8 warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=587d392df7d1f5251ca4cfdb6f37888c55f18376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

support/testing/tests/package/test_shadow.py:3:1: F401 'infra.basetest.BASIC_TOOLCHAIN_CONFIG' imported but unused

Reported by https://gitlab.com/buildroot.org/buildroot/-/jobs/4643484762.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_shadow.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_shadow.py b/support/testing/tests/package/test_shadow.py
index 3352d454a5..9991a57d1d 100644
--- a/support/testing/tests/package/test_shadow.py
+++ b/support/testing/tests/package/test_shadow.py
@@ -1,6 +1,6 @@
 import os
 
-from infra.basetest import BRTest, BASIC_TOOLCHAIN_CONFIG
+from infra.basetest import BRTest
 
 
 class TestShadow(BRTest):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
