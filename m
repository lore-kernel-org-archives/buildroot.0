Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A2C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0968760AD6;
	Mon,  8 Aug 2022 21:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0968760AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awc_9mnwkYF3; Mon,  8 Aug 2022 21:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E47F60ACC;
	Mon,  8 Aug 2022 21:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E47F60ACC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFBDD1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B212781467
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B212781467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzUceEkmpTQZ for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0735681466
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0735681466
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B7115868A9; Mon,  8 Aug 2022 20:53:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 23:07:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da40cddfbf6b89cbc16f0ee7ac4e0c57400a0d02
X-Git-Newrev: 4b291f1bace77b0f462d663b16fab719187dab88
X-Patchwork-Hint: ignore
Message-Id: <20220808205319.B7115868A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: octave: increase test
 timeout
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b291f1bace77b0f462d663b16fab719187dab88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Octave package test can occasionally fail due to timeout while testing
some octave modules. This commit slightly increase the timeout value
to reduce those failures.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_octave.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 82a70e09c2..cdbe2688df 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -76,4 +76,4 @@ class TestOctave(infra.basetest.BRTest):
 
         for mod in octave_modules:
             cmd = self.octave_cmd('assert(test(\"{}\"),true)'.format(mod))
-            self.assertRunOk(cmd)
+            self.assertRunOk(cmd, timeout=10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
