Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63061C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:32:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2599A61052
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2599A61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F405A84024;
	Wed,  6 Oct 2021 15:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fESB1s3t9Yci; Wed,  6 Oct 2021 15:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613B284005;
	Wed,  6 Oct 2021 15:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1C9A1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC4E60EB9
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6QEDHX0Dy0J for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:31:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C5A6066F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:31:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BA8049247A; Wed,  6 Oct 2021 15:28:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:19:09 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 31e008e74de37605df03b1f49c2205d004a74322
X-Git-Newrev: 3fc7a0c529b8f84864f2e6f6226a069d178a8115
X-Patchwork-Hint: ignore
Message-Id: <20211006152853.BA8049247A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/ripgrep: ignore
 CVE-2021-3013 as Windows only
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fc7a0c529b8f84864f2e6f6226a069d178a8115
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

CVE-2021-3013 does not impact any buildroot versions of ripgrep as it is
a Windows-only exploit targeting ripgrep versions earlier than 13. It
can be safely ignored on our LTS branches.

    https://nvd.nist.gov/vuln/detail/CVE-2021-3013

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 641beb3217ce1686772c80ac9e2cf815d72f1624)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ripgrep/ripgrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 450bb020e3..8d0185595d 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -10,6 +10,9 @@ RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
+# CVE only impacts ripgrep on Windows
+RIPGREP_IGNORE_CVES += CVE-2021-3013
+
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
