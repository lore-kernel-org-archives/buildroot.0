Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E84E6780F
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 20:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 835258117F;
	Sat,  2 Nov 2024 20:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOEVDOnf66vq; Sat,  2 Nov 2024 20:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B1281188
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8B1281188;
	Sat,  2 Nov 2024 20:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F5D723
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1380F81188
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYAIzZgyRlY0 for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 20:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 596948117F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 596948117F
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:40:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5045885162; Sat,  2 Nov 2024 20:40:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Nov 2024 21:38:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c0356877518af4b278513c4223d1ce5cd7b8b94
X-Git-Newrev: 9542e2904f8db68c5288ad6bdd8b0b1b209d214f
X-Patchwork-Hint: ignore
Message-Id: <20241102204018.5045885162@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3Incremental:
 update expected string
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9542e2904f8db68c5288ad6bdd8b0b1b209d214f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since python-incremental 24.7.0, there is no longer a dot before an rc
specifier [1].

Update TestPythonPy3Incremental expected result to
"[package, version 1.2.3rc4]".

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642

[1] https://github.com/twisted/incremental/commit/d482dfff3f1c18eed69372937958c3f2481f6252

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/sample_python_incremental.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_incremental.py b/support/testing/tests/package/sample_python_incremental.py
index efab8b2067..b6e2aa803c 100644
--- a/support/testing/tests/package/sample_python_incremental.py
+++ b/support/testing/tests/package/sample_python_incremental.py
@@ -1,3 +1,3 @@
 import incremental
 v = incremental.Version("package", 1, 2, 3, release_candidate=4)
-assert(str(v) == "[package, version 1.2.3.rc4]")
+assert(str(v) == "[package, version 1.2.3rc4]")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
