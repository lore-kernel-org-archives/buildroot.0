Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A894C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C353381F76;
	Tue,  1 Aug 2023 20:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C353381F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCQ-EA8C1T7t; Tue,  1 Aug 2023 20:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B5381FB8;
	Tue,  1 Aug 2023 20:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B5381FB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1ACA1BF84C
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E8E86068A
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E8E86068A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYlt9DwdTH0n for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:41:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B19CB60597
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19CB60597
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B75883F10; Tue,  1 Aug 2023 20:41:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 22:20:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22e476d7886163484d233803b42a2a4c2b588a5b
X-Git-Newrev: bcc4f13857f77928b9197a4ca611784759925ea8
X-Patchwork-Hint: ignore
Message-Id: <20230801204138.9B75883F10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/compiler-rt: add CPE
 ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcc4f13857f77928b9197a4ca611784759925ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

llvm:compiler-rt is a valid CPE ID [0] for this package.

[0]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=compiler-rt

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 026650c7c8..03dc76eaea 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -9,6 +9,7 @@ COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
 COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang llvm
 
 COMPILER_RT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
