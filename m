Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757DDC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7356125F
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F7356125F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A814040B;
	Wed,  6 Oct 2021 05:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgeTmaIYwOkH; Wed,  6 Oct 2021 05:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30032403E0;
	Wed,  6 Oct 2021 05:33:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EEE11BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B73740428
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCvSRDwKHA8j for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 05:32:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0CD340421
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 05:32:46 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.42.49]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1n0AY61pOA-00haR7; Wed, 06 Oct 2021 07:27:32 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mXzSk-0005bg-At; Wed, 06 Oct 2021 07:27:31 +0200
Received: (nullmailer pid 7393 invoked by uid 2001);
 Wed, 06 Oct 2021 05:27:28 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 07:27:17 +0200
Message-Id: <20211006052717.7328-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211006052717.7328-1-post@lespocky.de>
References: <20211006052717.7328-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 2824e010e3240a148eb131b95b7d18ee
X-Provags-ID: V03:K1:z/Ym5hh/rl8e5FaTIGBZJan5FT/zoNjOx54sdyGDm7lP8B3Y9Gz
 lEyq8WR+PENKUQlB/fJ0riSbDqNnjIyOQVyEIc1NXQwNOjihJwvmBfH8HlqEzQa7KhWPlkD
 G57nWMzPebnnMhQGSrK+dLgFZyXNeHO7l58Wyj1FBquewKp7xJ3fau/utah7nhM/E8F3oC9
 dF9otcmPc30tERnVXMTPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5XtxxwLBTeY=:CuHtvyapaM6GGBD7E87KeM
 vinYCG3aeygfgjymth/wabgVCMUidFaVRfp9TEdgVro1LsrOjl4LsUe9e/Dpt6K9tBHGK7MZf
 2Zb7PT4Z38m+7BOLreK7+QyLr+36iSVALNq+kf9s55flYnZYgYXHbJzuwNnL0Ltw42prcvHKK
 ukiJNh3QqUkQbpsNtcyKG4Y+rMUNG5BOM4hEk15HWuORPNOPZCqCmeynUY9s8Di6S40C4ooUM
 zXRXFFXbP/5h2YFpRYqPDumlWrJEMA/4/JsQbFFb7qe5OQlE5rVO9pkQjobHsSgcntbJKDs3o
 /f0ZHknzQ2BfdnBzVp9fv5Kl6wA4pQea7Pn1Q7YzNT6p8rf/CVJuqa6r0lQrfaMjdwREkcwFP
 HKKGz1aseDacT9oM5GH2uburwxweA9w2K97Q9LjZG90UqvzI/1K9VrAKoh20aTakEmQv5Dh/m
 0kf3XsbeVoZPURIG04WwdElnWq0MdTUSQizBNrNGBXOPV6iIlOyJDf8DcfnmfHtc2fqkVztXq
 Yhg2KLISsNVdr2+yT/sbEH6/bP2IlNYt9oqnQdnuf0iZ9qeKcIfvD1PfHsB5ZexlrQ2KnAPgQ
 xTBxG9SFxvoHYeHqrwnTfnDDB3Sp7IiOY5NWwC//fF3thfsgzURBeQUPzYpEoppPv5ampOuu8
 ewHaZx3ROldGX2zK4gBTwmYC0N/wjDkFqoS323T1k621hKDmqknvIEUyzhkj5titdCX9FG/rW
 er97ror+XuwH0E/JVPwiBdNKT2cD3VbjmPc9aQ==
Subject: [Buildroot] [PATCH 3/3] package/dfu-util: bump version to 0.11
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the ChangeLog (see git history for full details):
- Fix suffix check regression on Windows with Large File Support
- Skip setting alternate interface when not needed
- Only clamp transfer size on Linux
- Quirk for GD32 leave request
- Improve status and error messages and exit codes
- dfuse: Process all alternate interfaces in a DfuSe file
- dfuse-pack.py: Fix alternate settings if first is 0

Link: https://lists.osmocom.org/pipermail/dfu-util/2021-September/000014.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/dfu-util/dfu-util.hash | 6 +++---
 package/dfu-util/dfu-util.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
index a99e67565d..4ca28a26c9 100644
--- a/package/dfu-util/dfu-util.hash
+++ b/package/dfu-util/dfu-util.hash
@@ -1,6 +1,6 @@
-# From http://dfu-util.sourceforge.net/releases/dfu-util-0.10.tar.gz.md5
-md5  8cf55663703cdc6b40f377f999eb8d3d  dfu-util-0.10.tar.gz
+# From http://dfu-util.sourceforge.net/releases/dfu-util-0.11.tar.gz.md5
+md5  31c983543a1fe8f03260ca4d56ad4f43  dfu-util-0.11.tar.gz
 
 # Locally computed
-sha256  a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42  dfu-util-0.10.tar.gz
+sha256  b4b53ba21a82ef7e3d4c47df2952adf5fa494f499b6b0b57c58c5d04ae8ff19e  dfu-util-0.11.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 4c9c9662c6..638cb32f37 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DFU_UTIL_VERSION = 0.10
+DFU_UTIL_VERSION = 0.11
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPL-2.0+, LGPL-3.0
 DFU_UTIL_LICENSE_FILES = COPYING
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
