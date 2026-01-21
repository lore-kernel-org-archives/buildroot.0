Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E82C44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9027760B55;
	Wed, 21 Jan 2026 20:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImS89RYx5mYE; Wed, 21 Jan 2026 20:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 837F160B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028288;
	bh=1TvLTRzUU1CPYVOPU3HXanRF3xeA1VN0Efsr71FT22g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JRt8IvPDd1oktfhyRH05I8t1E4qgPCVCnj4uVKnbTEGhrewVIi+wl05Z7ktxaV7Wy
	 YS7rdgeuVqzDvBq4P6qOu1OQWCGrxsVrMBjyHU7Qbp7wzK7pymDdcftga3eyL4KKju
	 enwvldt8DrBnRszqHTclrO7kA5PgiOKWsMJFlH+J0d5bfVTLT5T5/0cfrplAjLY/Ut
	 jArAhr3EAC1vgQNXCUXn/8b/YyvuGdW7dzTtqwa5SeVeKrDEIeaTYtBFCrri4ssyNd
	 iaIKVyZv4wjbidZDbqBkelEttZCFdQaA8a52aqion2iW1mQiL65g62eXsPfDSB35Ib
	 fUIzZnXfqLvkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 837F160B52;
	Wed, 21 Jan 2026 20:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AC2158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63DF640C70
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIDOyqB_0Mn8 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00CF40C6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A00CF40C6A
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EE03874AC; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:04:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7a3621c0b45cd76255f018a2ab3718a14f0dadb
X-Git-Newrev: 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.8EE03874AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_python.py: disable
 interpreter colors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 3.14 (not yet in Buildroot) introduced colors, enabled by
default, when the output is a terminal. This behavior can make the
pexpect pattern matching more difficult in some cases. See:
https://docs.python.org/3.14/using/cmdline.html#controlling-color

This commit globally disables the Python interpreter colors in the base
runtime Python test, by setting the NO_COLOR=1 environment variable.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c9ecf9acda..e815376d21 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -17,6 +17,9 @@ class TestPythonBase(infra.basetest.BRTest):
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
+        # Disable Python colors for all Python tests, to make pexpect
+        # pattern matching easier.
+        self.assertRunOk("export NO_COLOR=1")
 
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
