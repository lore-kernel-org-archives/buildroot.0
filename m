Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898ABEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49CD341EF3;
	Fri, 13 Feb 2026 19:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85b_WAeIQxIl; Fri, 13 Feb 2026 19:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440F841EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011397;
	bh=C2VDt9KVSnLVNXkR7+jJZgHTvvGMKXdHSHhsyZh3x78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o6xzN7XE7D+o2Ip9JClrWg3r5SsFFZg9fZVaZgeMgp15vLDFBs6NZE6D0sHPSTdl6
	 1a97rT4vIv1UV2QGs8rqf0qPm9bvQ4b6jGGse2CobSvj/UjfX1rQY+PevY1qN4Gg8n
	 C+AK8yHbAHOYr44t0nGM4FnGZOSU+aeb71Qde7Xz78x/4uXLOYcmyanrUExFXhYPpx
	 +e90RwuucrZoMsFI/STpHUpA9wNuG7H/l5ZF+FsVcsPFMHOfC+LLRovPfBECjtAX+U
	 eKR2mewZhTtjAv4cNd8fo1bPtVeBxjmwafl3q4eYi/L7oXAU/WVGUL1EXzza3ugrSy
	 8IbrcUBVT9ccg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440F841EF4;
	Fri, 13 Feb 2026 19:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E09283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D7384536
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9o07IUwsBeAg for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86440844EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86440844EA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ADC683545; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3811f091f2e8d613a232500a3feb4541dfaeb0c9
X-Git-Newrev: af865daee0daab23f0ee96c2291093a4c9823d0b
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.7ADC683545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/asterisk: add
 workaround to fix build issues
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af865daee0daab23f0ee96c2291093a4c9823d0b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Sometimes asterisk buildsystem decides to remove our own
build menuselect stuff for the host. And then fails to
run the cross-compiled binary.

Add a patch to avoid removal of the menuselect stuff.

Fixes:
 - https://autobuild.buildroot.net/results/5f7/5f76f032ee596e928089b064b01f08adacade47a/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4e71c6c83924716b826a4eb1096eefbfcaecd5f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0005-Makefile-don-t-clean-menuselect.patch     | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
new file mode 100644
index 0000000000..79c3174853
--- /dev/null
+++ b/package/asterisk/0005-Makefile-don-t-clean-menuselect.patch
@@ -0,0 +1,26 @@
+From 844c1cddf38fd91e15a93eef96c67a5834fc9a78 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 10 Jan 2026 12:25:30 +0100
+Subject: [PATCH] Makefile: don't clean menuselect
+
+Upstream: not applicable
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b57f77477f..80035a09e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -436,7 +436,6 @@ _clean:
+ 	rm -f doxygen.log
+ 	rm -rf latex
+ 	rm -f rest-api-templates/*.pyc
+-	@$(MAKE) -C menuselect clean
+ 	cp -f .cleancount .lastclean
+ 
+ dist-clean: distclean
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
