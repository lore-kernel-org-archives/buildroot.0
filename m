Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5750CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:11:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F03C60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F03C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF82A4250E;
	Wed,  4 Aug 2021 01:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3a2UDhbbcQi; Wed,  4 Aug 2021 01:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E2F424DC;
	Wed,  4 Aug 2021 01:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1631BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8608414B5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJKkQjlmdDEM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B5E641500
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F22E289015; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 22:07:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 321a850bc7347b1b40289ef5a79ca738d51c81c8
X-Git-Newrev: b9a9ce7119c67de4337b49554aa4a5552992d669
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.F22E289015@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-test: fix
 Config.in comment on dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9a9ce7119c67de4337b49554aa4a5552992d669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The comment did not take into account the dynamic library dependency,
fix that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-test/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 5d23885f45..cfcf74939d 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ threads and C++"
+comment "optee-test needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
