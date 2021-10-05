Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86347C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205C3604AC
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 205C3604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0237400B9;
	Tue,  5 Oct 2021 06:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1qbUzX9iSNv; Tue,  5 Oct 2021 06:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09283401B3;
	Tue,  5 Oct 2021 06:29:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD081BF3C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBDF883B86
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RF_W6i0TXWeT for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 06:29:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DC183B89
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 06:29:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45A338F6EB; Tue,  5 Oct 2021 06:26:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 08:19:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7c392e2bfdc39c3c4f392418336966f2846bdb78
X-Git-Newrev: 7ae5a4a9d6280a571d5b4215ee6e2e6ac39bcabc
X-Patchwork-Hint: ignore
Message-Id: <20211005062636.45A338F6EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/scanpypi: remove
 python2 compatibility imports
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ae5a4a9d6280a571d5b4215ee6e2e6ac39bcabc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

ee8b680816 ("utils/scanpypi: use python3 explicitly") started to use python3,
thus compatibility can be removed:

from __future__ import print_function
from __future__ import absolute_import

Tested with python3 -m py_compile.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d50290764ea3fd7f7fafd1a10aedbe652689ac29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 9dede4e119..1f3326cf4d 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -6,8 +6,6 @@ Utility for building Buildroot packages for existing PyPI packages
 Any package built by scanpypi should be manually checked for
 errors.
 """
-from __future__ import print_function
-from __future__ import absolute_import
 import argparse
 import json
 import sys
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
