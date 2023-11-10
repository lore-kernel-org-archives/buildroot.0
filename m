Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA117C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 11:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E3E8837C9;
	Fri, 10 Nov 2023 11:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3E8837C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9bUSgVW2qoP; Fri, 10 Nov 2023 11:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98D48382D;
	Fri, 10 Nov 2023 11:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98D48382D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87BB21BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60C8460AC0
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C8460AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP8hP65W_rRD for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2B260AB9
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2B260AB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69F7A86EE5; Fri, 10 Nov 2023 11:53:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 12:50:21 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 21f2727b4e0668e363192f438828a3fca38aa491
X-Git-Newrev: 6ff63490d1ca805250cb1ecd7ebfc359a19d9943
X-Patchwork-Hint: ignore
Message-Id: <20231110115336.69F7A86EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 support/testing/test/init/test_systemd_selinux.py: use timeout argument for
 emulator.login
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ff63490d1ca805250cb1ecd7ebfc359a19d9943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

self.emulator.timeout_multiplier *= 10 is equivilent to 60 * 10 or 600.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9316f21c7d07bfabccb1ab297773b7b83e217a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 73604cfc32..f95ac3a411 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -20,9 +20,9 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         """
 
     def wait_boot(self):
-        # The complete boot with systemd takes more time than what the default multipler permits
-        self.emulator.timeout_multiplier *= 10
-        self.emulator.login()
+        # The complete boot with systemd takes more time than what the
+        # default typically allows
+        self.emulator.login(timeout=600)
 
     def run_tests(self, fstype):
         kernel = os.path.join(self.builddir, "images", "bzImage")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
