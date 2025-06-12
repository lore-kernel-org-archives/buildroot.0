Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A94EC71149
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F64340A6A;
	Thu, 12 Jun 2025 20:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN5Vns5IYO04; Thu, 12 Jun 2025 20:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8299F40978
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8299F40978;
	Thu, 12 Jun 2025 20:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E46927A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A12983BEC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6txQZYhfACAY for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF9483BF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF9483BF4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E07B83563; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cd567301def1b48dbc0d9c51b7b693ffe13906bf
X-Git-Newrev: 190426a830ca0c9bc15dd4dce2772483a058c1fd
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.8E07B83563@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] testing: drop unneeded
 vga/vnc stanzas from QEMU invocation
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
Content-Type: multipart/mixed; boundary="===============6276590306927901687=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6276590306927901687==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=190426a830ca0c9bc15dd4dce2772483a058c1fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The aarch64 virt platform doesn't have any default VGA devices so we
don't need to configure them here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b877b8379fd3569dce94d0b0248cd2591ce4a71c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_flutter.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index 08aa497417..e359a472ef 100644
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
 

--===============6276590306927901687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6276590306927901687==--
