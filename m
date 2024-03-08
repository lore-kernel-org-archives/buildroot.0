Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BDEC54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102CB83145;
	Fri,  8 Mar 2024 11:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNP4NQVKVnUe; Fri,  8 Mar 2024 11:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 386B4831EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386B4831EF;
	Fri,  8 Mar 2024 11:32:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 237FA1BF317
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D9234148B
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbyKz1a3j9Hh for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F00141CA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F00141CA5
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 582988185A; Fri,  8 Mar 2024 11:32:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:30:12 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 4714693bebba23f8ccda810f5912b742840f7ade
X-Git-Newrev: 722c67da9654913fe577291e8fd9504bdb8bc5e1
X-Patchwork-Hint: ignore
Message-Id: <20240308113207.582988185A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] support/testing: gnupg2:
 increase a timeout
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

commit: https://git.buildroot.net/buildroot/commit/?id=722c67da9654913fe577291e8fd9504bdb8bc5e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The symmetric encryption test can sometimes take longer than the default
timeout. This commit increase the timeout to 10 seconds for that
command.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f44c0807c63f0bdd9640b7b29c131590f03be0ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 4505e1c339..2b18f54fa3 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -37,7 +37,7 @@ class TestGnupg2(infra.basetest.BRTest):
         # Test symmetric encrypt
         cmd = "gpg --batch --symmetric"
         cmd += " --passphrase '{}' {}".format(good_passphrase, plain_file)
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=10)
 
         # Test symmetric decrypt
         cmd = "gpg --batch --decrypt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
