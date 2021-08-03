Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B561C4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF21460F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF21460F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A279E60A85;
	Thu,  5 Aug 2021 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fpU75XtIy297; Thu,  5 Aug 2021 19:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0139F60A6C;
	Thu,  5 Aug 2021 19:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8A21C1148
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E82F40287
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbeYpq_ze689 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3345E4052D
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E4A6487DA7; Thu,  5 Aug 2021 19:49:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:26:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0aea8427108bef1610cfd4dcf6241959b207adaa
X-Git-Newrev: f299fbd955344fe86e60a8dac6c9cb0fda22da6e
X-Patchwork-Hint: ignore
Message-Id: <20210805194938.E4A6487DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/s390-tools: fix build
 with binutils 2.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=f299fbd955344fe86e60a8dac6c9cb0fda22da6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with binutils 2.36:

/tmp/instance-16/output-1/host/bin/s390x-buildroot-linux-gnu-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
make[3]: *** [Makefile:113: data.o] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/90100519d696c49441669117276fb8084796544b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ot-Makefile-no-pie-is-not-a-valid-ld-flag.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
new file mode 100644
index 0000000000..fcdf06088a
--- /dev/null
+++ b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
@@ -0,0 +1,29 @@
+From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
+Date: Thu, 7 Jan 2021 12:46:22 +0100
+Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
+
+The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
+See:
+https://sourceware.org/bugzilla/show_bug.cgi?id=27050
+https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
+
+[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zipl/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
+index a2e5f190..b81df778 100644
+--- a/zipl/boot/Makefile
++++ b/zipl/boot/Makefile
+@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
+ 		$< $@
+ 
+ data.o: $(FILES)
+-	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
++	$(LD) -r -b binary -o data.o $(FILES)
+ 
+ data.h: data.o
+ 	rm -f data.h
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
