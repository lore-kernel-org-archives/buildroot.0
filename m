Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE26E95A63
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 14:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00BD64155E;
	Sat,  7 Oct 2023 14:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00BD64155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_4eGYrHYePz; Sat,  7 Oct 2023 14:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EAED4152A;
	Sat,  7 Oct 2023 14:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EAED4152A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 302611BF470
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AA4261042
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 14:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA4261042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb5nonuIAWb5 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 14:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90D3660E3B
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 14:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D3660E3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C3AC84138; Sat,  7 Oct 2023 14:18:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Oct 2023 16:17:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a1b68955cf06d7aaa32f02f324931ed30141068
X-Git-Newrev: 8cf183be9e660502af2ae7e3971ffc978cfec28b
X-Patchwork-Hint: ignore
Message-Id: <20231007141818.7C3AC84138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageingore: refresh
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cf183be9e660502af2ae7e3971ffc978cfec28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4cbc2af604e73780c0c6b5c093c55c2f7ee2c4e3 moved the nodejs patches
to the nodejs-src directory, but forgot to update .checkpackageignore
accordingly. Fix that, by running `make .checkpackageignore`.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 28de1745e4..539a571172 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -967,10 +967,10 @@ package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch Upstream
 package/ngrep/0003-fix-disable-tcpkill.patch Upstream
 package/nilfs-utils/0001-nilfs_cleanerd-link-dynamically.patch Upstream
 package/nmap/0001-libdnet-wrapper-configure.patch Upstream
-package/nodejs/0001-add-qemu-wrapper-support.patch Upstream
-package/nodejs/0002-check-if-uclibc-has-backtrace-support.patch Upstream
-package/nodejs/0003-include-obj-name-in-shared-intermediate.patch Upstream
-package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch Upstream
+package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch Upstream
+package/nodejs/nodejs-src/0002-check-if-uclibc-has-backtrace-support.patch Upstream
+package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch Upstream
+package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch Upstream
 package/nodm/S90nodm Indent Shellcheck Variables
 package/norm/0001-protolib-drop-linux-version-check.patch Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
