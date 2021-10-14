Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC2FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713DD61053
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 713DD61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 476E9401B7;
	Thu, 14 Oct 2021 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4g41yp0P13g; Thu, 14 Oct 2021 21:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28DD40177;
	Thu, 14 Oct 2021 21:08:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3E81BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D56583AC7
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1VPagsevUtI for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C231F83AC4
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 92B6294EA3; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:22:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a5ad252f0354dbe342b814bb4d72336be109bbb
X-Git-Newrev: 12e87224328bf10a2852ac753b178c1de8f70cd7
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.92B6294EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-decorator: python3 is also
 needed for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=12e87224328bf10a2852ac753b178c1de8f70cd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7bfe142e0d84400e386286347afd6e26f90b8aae forgot to set
HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON

Fixes:
 - http://autobuild.buildroot.org/results/d11433a8076798d6088f92716608ebbe1c6aee9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-decorator/python-decorator.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index a61f045e2a..a7e338bdc0 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -12,6 +12,7 @@ PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
 PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
+HOST_PYTHON_DECORATOR_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
