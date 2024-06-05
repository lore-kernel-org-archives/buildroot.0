Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB18C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A773A844F8;
	Wed,  5 Jun 2024 20:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPe1j7hM4XB0; Wed,  5 Jun 2024 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4C6484539
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C6484539;
	Wed,  5 Jun 2024 20:35:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85D121BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DA1844F8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPjPyz-g9r76 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA3184539
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA3184539
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8BD187AD6; Wed,  5 Jun 2024 20:35:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 22:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90167378de35a640ed07f18ded1e0a88aba11396
X-Git-Newrev: ed9288505caa4c3d1c30d5d73ef3189a40ae243a
X-Patchwork-Hint: ignore
Message-Id: <20240605203555.A8BD187AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: sample_python_pybind.py:
 use python3 shebang
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed9288505caa4c3d1c30d5d73ef3189a40ae243a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change as we install a python symlink, but use python3 for
consistency with the other scripts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/sample_python_pybind.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_pybind.py b/support/testing/tests/package/sample_python_pybind.py
index 605c0bab15..9c605caf61 100644
--- a/support/testing/tests/package/sample_python_pybind.py
+++ b/support/testing/tests/package/sample_python_pybind.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 import example
 print(example.add(1, 2))
 print(example.says)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
