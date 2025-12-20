Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACE9E6748A
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 22:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A449608B4;
	Sat, 20 Dec 2025 22:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x63j4KDn6xno; Sat, 20 Dec 2025 22:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01E2608D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766270185;
	bh=OqcQ4NxKhsvfdwJph+I/SXtefvyvDhDwmkYYe97wQW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QhK0uQNfDa49BTosLlWzZLZRsmai4VSyRLbJopRVLoXmqc4tVsMe7Vz6pBbywrnX3
	 wocAVNF5EPvHqL4EA4njKi4tdUuR5k/qTtbJaz0oB2sOfXsXZODkAy2FVfO0H/rxqy
	 3Nv/I9/jzkWvOUAytOPtNCGWjy7knrFveF1wbYCINbXoaZ86G+VA7nKfQi7xs3tsCl
	 WqkB04XBut0PL7CYJPrNW6uVMExg34NWeNOaTk64WfgSv00e/HSirphbNi7l24NQbo
	 TUV3533dIfc+i/RjstbLcB83UcL2/T1sysraQ6JbS8ib2+mtx0yBR8PV1YPA4dmAuq
	 8gRF+YcBUiqtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A01E2608D7;
	Sat, 20 Dec 2025 22:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F02293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3953C80E16
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-dmhfO4ku2q for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3263C80E0F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3263C80E0F
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D23986E19; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 23:15:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39b925a0a6d80b2f347abad1fd75742c8d51a458
X-Git-Newrev: befb6ae81d274342d316061a648c2f276e44db23
X-Patchwork-Hint: ignore
Message-Id: <20251220223622.2D23986E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: infra: add host bin dir
 to PATH when running host command
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

commit: https://git.buildroot.net/buildroot/commit/?id=befb6ae81d274342d316061a648c2f276e44db23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some host commands need to call other host commands: For example,
"mkimage" from host-uboot-tools needs to run "dtc". This would fail or
call system commands without adding the host bin dir to PATH.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: use python functions/constants to build path]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 52308395a3..be61d8cc4f 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -60,9 +60,14 @@ def download(dldir, filename):
 def run_cmd_on_host(builddir, cmd):
     """Call subprocess.check_output and return the text output."""
     try:
+        host_bin = os.path.join(builddir, "host", "bin")
+        br_path = host_bin + os.pathsep + os.environ["PATH"]
         out = subprocess.check_output(cmd,
                                       cwd=builddir,
-                                      env={"LANG": "C"},
+                                      env={
+                                          "LANG": "C",
+                                          "PATH": br_path
+                                      },
                                       stderr=subprocess.STDOUT,
                                       text=True,
                                       universal_newlines=True)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
