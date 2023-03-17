Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B13C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 09:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F0E4033D;
	Fri, 17 Mar 2023 09:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F0E4033D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXSQeaA7E80p; Fri, 17 Mar 2023 09:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118DF40348;
	Fri, 17 Mar 2023 09:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118DF40348
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDF351BF97F
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 09:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B5B408BB
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 09:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B5B408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGgaKHnl-QOQ for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6FAE408B0
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6FAE408B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4C6B874FB; Fri, 17 Mar 2023 09:20:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 10:17:45 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5ca621375ab5885ad3de1dfa6d88bbcd19bce0e5
X-Git-Newrev: 0fac4a91fb99abc7864567e1c67874442281a2be
X-Patchwork-Hint: ignore
Message-Id: <20230317092052.B4C6B874FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/go: security bump
 to version 1.19.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fac4a91fb99abc7864567e1c67874442281a2be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

go1.19.7 (released 2023-03-07) includes a security fix to the
crypto/elliptic package, as well as bug fixes to the linker, the runtime,
and the crypto/x509 and syscall packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e93f96b717f31ab26d047c8daac8ae55622396bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8254a91524..89e2fd952f 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  d7f0013f82e6d7f862cc6cb5c8cdb48eef5f2e239b35baa97e2f1a7466043767  go1.19.6.src.tar.gz
+sha256  775bdf285ceaba940da8a2fe20122500efd7a0b65dbcee85247854a8d7402633  go1.19.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a9056da47b..a94603f268 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.6
+GO_VERSION = 1.19.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
