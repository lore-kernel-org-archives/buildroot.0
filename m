Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCD1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA0F60F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DA0F60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230FE40518;
	Tue,  3 Aug 2021 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NB85e0Ok0Za; Tue,  3 Aug 2021 21:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CCC840435;
	Tue,  3 Aug 2021 21:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13D4A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D1B64046D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mN7Qa15GiUUk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85DD4401FA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CF3B08B43C; Tue,  3 Aug 2021 21:09:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 19:24:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04
X-Git-Newrev: 92177081223ec229fd50de50e8d76448ee80e5db
X-Patchwork-Hint: ignore
Message-Id: <20210803210935.CF3B08B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: remove
 TestPythonPy2Gpiozero
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=92177081223ec229fd50de50e8d76448ee80e5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python2 support has been removed since the python-colorzero bump version to 2.0.

Remove the gpiozero test with python2

[1] 73bf3292e16b9419c5c88d10e9755d7208ca3623

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_gpiozero.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
index 2498a55514..4fe155e6ce 100644
--- a/support/testing/tests/package/test_python_gpiozero.py
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -14,15 +14,6 @@ class TestPythonGpiozero(TestPythonPackageBase):
         self.assertRunOk(cmd)
 
 
-class TestPythonPy2Gpiozero(TestPythonGpiozero):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_GPIOZERO=y
-        """
-
-
 class TestPythonPy3Gpiozero(TestPythonGpiozero):
     __test__ = True
     config = TestPythonGpiozero.config + \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
