Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D79CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:37:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D796103D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 15:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87D796103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525D640512;
	Sun, 12 Sep 2021 15:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xpn2iPIi1Znb; Sun, 12 Sep 2021 15:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE77A4050D;
	Sun, 12 Sep 2021 15:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 417FB1BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B499606EE
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 15:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QQw_GLS41lO for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 15:37:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02A5260692
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 15:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74B3B1814BD; Sun, 12 Sep 2021 17:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1631461021; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=3157zHHSs4Kh5EJlNsfB4ZcULMFs9t53V2Kg1RCOAIA=;
 b=o7i6Uhkxif3ojFHddoYDEmYvn7b4USesvOCb6s4bae0oBRqUc7eSYTMLzE5c7yc2RJ4q1a
 JYfpoM0+i3VmuZcudVbtBj2+6AG8Yu1vUZI5mpwtQuvjCT26taFA7mWnoRfXtJnipAzZK0
 ofdhEr5tY7ZSPh29cObohuTeG1D13y4=
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 17:36:30 +0200
Message-Id: <20210912153632.84285-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.2
Subject: [Buildroot] [PATCH] package/boost: anotate patches
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

* add changelog and Signed-off-by to patches
* use correct name for patch 0002

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...n-of-boost_math_no_atomic_int-on-the-command-line.patch} | 6 ++++++
 ...no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch | 5 +++++
 2 files changed, 11 insertions(+)
 rename package/boost/{0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch => 0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch} (91%)

diff --git a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
similarity index 91%
rename from package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
rename to package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
index 121355d71e..d7cbf7b95f 100644
--- a/package/boost/0002-math-provide-graceful-failure-for-bernoulli-code-on-platforms-with-no-atomics.patch
+++ b/package/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
@@ -4,6 +4,12 @@ Date: Wed, 1 Sep 2021 18:54:54 +0100
 Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the command
  line. Allows us to test/emulate platforms with no atomic integers.
 
+[buildroot@heine.tech:
+  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
 ---
  boost/math/tools/atomic.hpp | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
diff --git a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
index 77f1217a3a..7e324e310c 100644
--- a/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
+++ b/package/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
@@ -6,6 +6,11 @@ Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.hpp.
  bernoulli features are to be used in a no-atomics environment. Fixes
  https://github.com/boostorg/math/issues/673.
 
+[buildroot@heine.tech:
+  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
+  - alter path to match boost release
+]
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 ---
  .../detail/bernoulli_details.hpp                 | 10 +++++++---
  libs/math/test/Jamfile.v2                        |  3 +++
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
