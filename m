Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653CAD0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECE180FB2;
	Wed,  7 Jan 2026 18:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUzSb9L-Hhpa; Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78306810AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808886;
	bh=AyQVdMqeCAj2dYDeAtZ1rLSs1MmKAenY3D5JDGrnEw8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LcXMmMFOZ3TIKbabXm3iHhbt8fLU0/mD6zBZIiqF3FbWxvyM1sQTMUEUH3ifQ6O2T
	 r/0SF/kPA114+jwBSLBn+/7W+AwH+nfsJQwqA8UPsu6+uevPIxqqNMKkum2Vh+j0tQ
	 JfnPNBrSV8nyyNReCRX1h2GT0ywbe77autvjKE0Zlx0IK3ncF7JgzU2xB8hCBHR38h
	 zU6zksL1IgqpJV8M20dQQsefjyqTZ6RP7Up2Eal9aJkc/20JyuA8VmXBQXMm9A624J
	 TSNBjiy0ZhjZmwQOMvoWPVKyuWXrl7PpzjtK0QhfsBG463fQfNMvGSHhgmWgmuqRR0
	 9FyVprsmBbq+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78306810AA;
	Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA439ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D01624090F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlRMIWTlFl0E for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6174099A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A6174099A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2872687C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 18:53:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6406861a56fb5d86418d719d42abee031186ffa7
X-Git-Newrev: cdadcf814a85e558bd1c59b954d5ceac18605825
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.2872687C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: infra:
 add host bin dir to PATH when running host command
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdadcf814a85e558bd1c59b954d5ceac18605825
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Some host commands need to call other host commands: For example,
"mkimage" from host-uboot-tools needs to run "dtc". This would fail or
call system commands without adding the host bin dir to PATH.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: use python functions/constants to build path]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit befb6ae81d274342d316061a648c2f276e44db23)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
