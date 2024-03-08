Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8667C54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A9E83227;
	Fri,  8 Mar 2024 11:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbptVt8ScqG2; Fri,  8 Mar 2024 11:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A58A7833CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58A7833CD;
	Fri,  8 Mar 2024 11:31:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 611C91BF317
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 605D7610EF
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peDAua_M0vgt for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D20610F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94D20610F6
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D3C087EBE; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:30:03 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 42407025489ed415d061d7bdc1b569eb8dcb2318
X-Git-Newrev: 0f77312f94c7672a2e66e2ffe53b23036efefc97
X-Patchwork-Hint: ignore
Message-Id: <20240308113130.7D3C087EBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/testing: gnupg2:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f77312f94c7672a2e66e2ffe53b23036efefc97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
