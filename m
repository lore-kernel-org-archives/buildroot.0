Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8764C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:31:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E3861040
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86E3861040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5561B60E84;
	Wed,  6 Oct 2021 15:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoN6YtnvjEcS; Wed,  6 Oct 2021 15:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4DC060EB3;
	Wed,  6 Oct 2021 15:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0039E1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E31554044D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KmIPzzbNvip for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:31:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A2EF4042A
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:31:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E595A923D3; Wed,  6 Oct 2021 15:28:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:19:14 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 541dc3fafdd421c09a38a78bf3b4ab270e4d5c09
X-Git-Newrev: 8dfae41d4c59260b7aec80cc1162124e1180b1e6
X-Patchwork-Hint: ignore
Message-Id: <20211006152839.E595A923D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ripgrep: ignore
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dfae41d4c59260b7aec80cc1162124e1180b1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
index 313f73624d..8bc80dd20f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -10,6 +10,9 @@ RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
+# CVE only impacts ripgrep on Windows
+RIPGREP_IGNORE_CVES += CVE-2021-3013
+
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
