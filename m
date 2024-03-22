Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BDCC47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBABB414CB;
	Fri, 22 Mar 2024 20:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62t6cosJO3oR; Fri, 22 Mar 2024 20:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDEF415A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDEF415A4;
	Fri, 22 Mar 2024 20:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C26361BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCDD260FFA
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W2lqHk65BYY for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 466D360FF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466D360FF6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 466D360FF6
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:10:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68C05E0004;
 Fri, 22 Mar 2024 20:10:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnlDq-006FRx-2B;
 Fri, 22 Mar 2024 21:10:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240319200646.45266-1-fontaine.fabrice@gmail.com>
 <2aeb2daf-fecd-4307-b46b-76ce2829a798@mind.be>
Date: Fri, 22 Mar 2024 21:10:38 +0100
In-Reply-To: <2aeb2daf-fecd-4307-b46b-76ce2829a798@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 20 Mar 2024 20:52:56
 +0100")
Message-ID: <87o7b610zl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: fix arm uclibc build
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
Cc: Alexander Dahl <post@lespocky.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 19/03/2024 21:06, Fabrice Fontaine wrote:
 >> Fix the following arm uclibc build failure raised since bump to version
 >> 0.78 in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4 which wrongly
 >> removed patch because file was renamed. Patch was sent upstream in 2021
 >> but rejected, even a second iteration defining AT_HWCAP2 to 26 if needed
 >> was also rejected.
 >> Fixes: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
 >> - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...-arm_arch_queries.h-fix-uclibc-build.patch | 40 +++++++++++++++++++
 >> 1 file changed, 40 insertions(+)
 >> create mode 100644 package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
 >> diff --git
 >> a/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
 >> b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
 >> new file mode 100644
 >> index 0000000000..f6b5fe6f91
 >> --- /dev/null
 >> +++ b/package/putty/0001-unix-utils-arm_arch_queries.h-fix-uclibc-build.patch
 >> @@ -0,0 +1,40 @@
 >> +From 2631c745f986b356fbe5e1d418cff63b46134df6 Mon Sep 17 00:00:00 2001
 >> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> +Date: Tue, 19 Mar 2024 20:37:33 +0100
 >> +Subject: [PATCH] unix/utils/arm_arch_queries.h: fix uclibc build
 >> +
 >> +Build on uclibc is broken since version 0.75 and commit
 >> +65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
 >> +even if <sys/auxv.h> is not available:
 >> +
 >> +/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c:
 >> In function 'platform_aes_neon_available':
 >> +/home/buildroot/autobuild/run/instance-3/output-1/build/putty-0.80/unix/utils/arm_arch_queries.c:18:22:
 >> error: 'AT_HWCAP2' undeclared (first use in this function)
 >> +   18 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
 >> +      |                      ^~~~~~~~~
 >> +
 >> +To fix this build failure, include <elf.h>
 >> +
 >> +Fixes:
 >> + - http://autobuild.buildroot.org/results/547d1c0e8a89e1e4b601aa756d26886bfc3d586f
 >> +
 >> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  There's no Upstream: tag, which makes check-package fail. Previously,
 >  the patch was simply ignored, but instead I added an Upstream: tag
 >  that says it was rejected.

 >  Applied to master with that fixed,thanks.

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
