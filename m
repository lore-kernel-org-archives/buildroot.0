Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1052C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 23:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A48A361CE0;
	Wed,  1 Dec 2021 23:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hydb5cwwVej; Wed,  1 Dec 2021 23:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF90F61CCB;
	Wed,  1 Dec 2021 23:15:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F14A1BF2BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4B66073D
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 23:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4dWWil-l8pM for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 23:15:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from secvs04.rockwellcollins.com (secvs04.rockwellcollins.com
 [205.175.225.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8DE9607BC
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 23:15:38 +0000 (UTC)
IronPort-SDR: nrDUlnBH/eCM8OdpwcxM5451D17N7erj1AwJUfDUUzSpSEo40tE7FOzhjE561iMo5tsIGaihIR
 TZvznr3ynRXaBRYjtcMVqYY53DfPyZzLdVCgPZF3x7FnJcvGlNOvLqktOilIRfMyxJcRN0HSoX
 6NQEb9RBGRI+pmHRGnDFXQ2KXKbfjcj9ZbCZyHs0QN9iZvchCll4AyLVq12nlVbXXVoEMI8Xzl
 fH2iJNxeMOM7ltkfPkwaui1+JwFGDi7brcnllYT7py+07/q2fQ6qHuA9okptMqU+dkKKnTpGmU
 Jbs=
Received: from ofwgwc03.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.225.12])
 by secvs04.rockwellcollins.com with ESMTP; 01 Dec 2021 17:08:29 -0600
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id C8FC2603ED;
 Wed,  1 Dec 2021 17:08:28 -0600 (CST)
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 17:08:27 -0600
Message-Id: <20211201230827.35080-3-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211201230827.35080-1-matthew.weber@collins.com>
References: <20211201230827.35080-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH 3/3] docs/manual: add section describing testing
 external applications
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot-provided utilities can easily be leveraged to improve the
testing of applications across multiple toolchains. Add section which
describes considerations to take about reducing false positives if this
approach is taken in your br2-external.

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 docs/manual/customize-outside-br.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 348f2b089c..e7aeeed8c1 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -228,6 +228,21 @@ Additional Linux kernel extensions (see xref:linux-kernel-ext[]) can
 be added by storing them in the `linux/` directory at the root of a
 br2-external tree.
 
+===== Leveraging test infrastructure for your packages
+
+Buildroot provides utilities for testing packages across multiple toolchain
+conditions, as described in xref:testing-package[] below. Packages that live
+exclusively in an external environment may not be candidates for upstream and
+only have specific toolchain targets due to being internal by nature.
+Leveraging these utilities with a list of toolchains you wish to guarantee
+support (instead of depending on the utility picking toolchains for you
+randomly) is an easy way to improve the test surface of your application.
+
+In this configuration, ideally, false positives should be minimized, and
++utils/test-pkg+ should be run with the +--fail-on-skip+ flag. This option
+covers the case of a configuration dependency change (for example, between
+Buildroot versions).
+
 ===== Example layout
 
 Here is an example layout using all features of br2-external (the sample
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
