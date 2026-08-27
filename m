Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8528C61DCB
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B570809CA;
	Thu, 27 Aug 2026 19:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzLllEPsjJb5; Thu, 27 Aug 2026 19:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858518;
	bh=beyxZ3QCZP94G8r3fZyyrSMLwfyvefqjWTt6AaTgEBI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=War7k6/fhZS0SLVRp8sM27m8sK5mnOpEb8kxovpwIHxA1rdyW+8wWAdPnhrjd2JGm
	 /NI0rMOeV3traphBQCrZ2hkeG32YFHxJS81ExH1dDak0RG0X6Dq4p9LTMw4vHHSTXG
	 CXZP/EqtyosNvJkpR/i4902zb1dZhUQQIFOwWekXQPyFvOvhj2qxF5FzdgVPvKlbyC
	 +RFjA6nMkyvySvD/T4jlTgj4DDudtEss8/qsOv4erOIgvUu9IDqHxF94kGBvOStRI+
	 /DeCV4gH3580drXqmJMM2ol17ze4W+YYd492IdQ5GmI/0EnparBWqb4Nov0o1WGCc6
	 7tiye+RVx8MuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4A31809CF;
	Thu, 27 Aug 2026 19:21:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4103ED26
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D7F80EC3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wvVBoBJZ0M5 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AE7480EC2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8908792012; Thu, 27 Aug 2026 19:20:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:55:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4b1de1f7f1865af25f5dc47beac06a37b929c4a
X-Git-Newrev: 3bd3d5004df09ccb13e54d7fcb2719c629602c40
X-Patchwork-Hint: ignore
Message-Id: <20260827192057.8908792012@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3Gobject:
 test glib 2.88 regression
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3bd3d5004df09ccb13e54d7fcb2719c629602c40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In Glib >= 2.88, GLib.unix_signal_add has been moved to a separate
platform-specific library. This break backward compatibility from
GLib-2.0. A workaround has been applied to pygobject >= 3.55.3
https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310

This issue currently break TestFirewalldSysVInit and
TestFirewalldSystemd runtime tests since the bump to glib 2.88.3 [1]:

https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 (TestFirewalldSysVInit)
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 (TestFirewalldSystemd)

Break the test TestPythonPy3Gobject now in order to reproduce the same
issue than for Firewalld test.

[1] e313a2d2590af689eb1f79e55b5a488154400da1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/sample_python_gobject.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
index 4490a73613..1c2b327206 100644
--- a/support/testing/tests/package/sample_python_gobject.py
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -4,6 +4,12 @@ from gi.repository import GLib
 
 
 def main():
+    # In Glib >= 2.88, GLib.unix_signal_add has been moved to a
+    # separate platform-specific library. This break backward
+    # compatibility from GLib-2.0.
+    # A workaround has been applied to pygobject >= 3.55.3
+    # https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
+    unix_signal_add = GLib.unix_signal_add_full  # noqa
     sh_path = GLib.find_program_in_path('sh')
     if sh_path == "/bin/sh":
         return True
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
