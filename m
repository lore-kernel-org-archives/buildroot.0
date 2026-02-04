Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F13E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B837A610F1;
	Wed,  4 Feb 2026 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIt5YB4SN5ZB; Wed,  4 Feb 2026 17:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC9061102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224826;
	bh=Y4ir+zZYC3IzEDG8twlFA2MKNgwFWzBBseX8FQixr94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hm0BglY7zlN0T4lfRgeuOaQlkmcilKBX6JVkCP4x6kedQusqkJKk+dKsAXNWdLuDt
	 kgQFBz5ePYOKxiIXRG8NLw0FvUyHrD2VszwJ/pK9A5PV/u8emQ4mpPFmYbhGOZictE
	 2MSkiP3d1pBuMqnfKa5bKNdOhjjOnUfhREq/DD/Qp6jxah7tu74otFWtAOoVkLJnn+
	 qUV/HMtPJKdeqNF8ovC8RZsuJIwEJRqoYCYIFbZwv0LGi8v+ClyNXNL64T2HeFQ1aD
	 TtspiwPksOZU7vVRkWiSnQ6SzLJJB64C9v4Ur57lBwr3pFQKzpSgts6QWJKs3ve8QM
	 /x7g5DF0yIN/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC9061102;
	Wed,  4 Feb 2026 17:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB1D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 864C583F41
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f06w2AmlNkt0 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A9E83C9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98A9E83C9A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69CEB8696B; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6adc876f41e720a9d917e2514eeb6f2603e7d9be
X-Git-Newrev: 438c811740e2cf7514e5e41828412f6e99e9752a
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.69CEB8696B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_python.py: disable interpreter colors
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/438c811740e2cf7514e5e41828412f6e99e9752a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Python 3.14 (not yet in Buildroot) introduced colors, enabled by
default, when the output is a terminal. This behavior can make the
pexpect pattern matching more difficult in some cases. See:
https://docs.python.org/3.14/using/cmdline.html#controlling-color

This commit globally disables the Python interpreter colors in the base
runtime Python test, by setting the NO_COLOR=1 environment variable.

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
