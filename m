Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FC4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0949A613AD
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0949A613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EFF403C7;
	Sun,  3 Oct 2021 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykFkCysnZD6K; Sun,  3 Oct 2021 20:18:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA58403D6;
	Sun,  3 Oct 2021 20:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1733A1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02CE584563
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1U8QBHUOuoj for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:18:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D088455C
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:18:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B8DA588098; Sun,  3 Oct 2021 20:16:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4ef8fdda012547bba53f584ca6b3b0d58399e08
X-Git-Newrev: 641beb3217ce1686772c80ac9e2cf815d72f1624
X-Patchwork-Hint: ignore
Message-Id: <20211003201618.B8DA588098@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ripgrep: ignore CVE-2021-3013 as
 Windows only
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

commit: https://git.buildroot.net/buildroot/commit/?id=641beb3217ce1686772c80ac9e2cf815d72f1624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2021-3013 does not impact any buildroot versions of ripgrep as it is
a Windows-only exploit targeting ripgrep versions earlier than 13. It
can be safely ignored on our LTS branches.

    https://nvd.nist.gov/vuln/detail/CVE-2021-3013

Signed-off-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ripgrep/ripgrep.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 2d9dd3ee2f..7c2b79a4a7 100644
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
