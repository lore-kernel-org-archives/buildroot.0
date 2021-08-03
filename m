Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3CBC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800F0610FB
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 800F0610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F56C40442;
	Tue,  3 Aug 2021 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98iviexm4HaM; Tue,  3 Aug 2021 20:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05EF7400E7;
	Tue,  3 Aug 2021 20:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1BB81BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D90C8400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyM0LrfjraEy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:34:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9B040001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:34:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DA4098B3A4; Tue,  3 Aug 2021 20:34:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:32:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3ac2a0f5d6313065b254f9c008feb68425dfa26
X-Git-Newrev: b8f52c1974266fb27abeef0caffe22034ee571f4
X-Patchwork-Hint: ignore
Message-Id: <20210803203416.DA4098B3A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: force Release build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b8f52c1974266fb27abeef0caffe22034ee571f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force Release build to avoid the following build failure which is raised
since the addition of the package in commit
4634e84978a3e64e9050021d209a41cd88a1ad16:

/tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lasan
/tmp/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: cannot find -lubsan

Fixes:
 - http://autobuild.buildroot.org/results/83274082879f9599bc106e12a253f4b9229ea00b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl_433/rtl_433.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index e6d28721fa..df00c09518 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -9,7 +9,9 @@ RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 
+# Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
+	-DCMAKE_BUILD_TYPE=Release \
 	-DBUILD_DOCUMENTATION=OFF \
 	-DBUILD_TESTING=OFF \
 	-DBUILD_TESTING_ANALYZER=OFF \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
