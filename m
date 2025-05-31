Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFC5C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 22:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8C94188A;
	Sat, 31 May 2025 22:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8wZTPlcTrax; Sat, 31 May 2025 22:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885AD411DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885AD411DF;
	Sat, 31 May 2025 22:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58AFE127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EFAA6081B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjB7zoBW1x7y for <buildroot@buildroot.org>;
 Sat, 31 May 2025 22:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C676607A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C676607A9
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AF4687818; Sat, 31 May 2025 22:40:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 23:52:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e7fc6a3e6e36d1cc5f2e8552b1c52a06cd9a061
X-Git-Newrev: b877b8379fd3569dce94d0b0248cd2591ce4a71c
X-Patchwork-Hint: ignore
Message-Id: <20250531224029.8AF4687818@busybox.osuosl.org>
Subject: [Buildroot] [git commit] testing: drop unneeded vga/vnc stanzas
 from QEMU invocation
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
Content-Type: multipart/mixed; boundary="===============0230842820064321415=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0230842820064321415==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b877b8379fd3569dce94d0b0248cd2591ce4a71c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The aarch64 virt platform doesn't have any default VGA devices so we
don't need to configure them here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_flutter.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index e4040ca7dc..19406b7cb1 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -48,8 +48,6 @@ class TestFlutter(infra.basetest.BRTest, GraphicsBase):
                      "-cpu", "cortex-a57",
                      "-m", "512M",
                      "-smp", "4",
-                     "-vga", "std",
-                     "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
 

--===============0230842820064321415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0230842820064321415==--
