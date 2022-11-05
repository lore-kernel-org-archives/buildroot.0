Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC0DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C032C81E22;
	Sat,  5 Nov 2022 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C032C81E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfXyNw5ql3NS; Sat,  5 Nov 2022 21:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01CB81926;
	Sat,  5 Nov 2022 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E01CB81926
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 052251BF873
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0E8740393
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E8740393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zm1y231Z_DIN for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20AD74032A
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20AD74032A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E4CC87E7B; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:36:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 60e7460aa797b4b18f6fc589c4870ada51b100f2
X-Git-Newrev: a48664f5d02f220b863342ba67b52c99484d3f97
X-Patchwork-Hint: ignore
Message-Id: <20221105214007.0E4CC87E7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: security bump
 to version 1.18.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a48664f5d02f220b863342ba67b52c99484d3f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

go1.18.6 includes security fixes to the net/http package, as well as bug fixes
to the compiler, the go command, the pprof command, the runtime, and the
crypto/tls, encoding/xml, and net packages.

https://github.com/golang/go/issues?q=milestone%3AGo1.18.6+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d2141f65e4491d0123e504cc5adc17ce541b268f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2a0f02abfd..959387cb6a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
+sha256  a7f1d50424355dabce66d1112b1cae439b6ee5e4f15edba6f104c0a4b173e895  go1.18.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 83498823b1..f4025618c3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.5
+GO_VERSION = 1.18.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
