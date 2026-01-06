Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA653D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE2948116E;
	Wed,  7 Jan 2026 18:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClD8gXBh4eyr; Wed,  7 Jan 2026 18:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE0182C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808926;
	bh=zELHXZmKc3KqXI5rAxC4LSgIidxfSMzi/MlL4mrrQEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GfE4jNbPmK0FbSCigJxY4EeJITPgmU4E1ktOQMNvkhp2dWnnOvryGqaZed1xd+l4b
	 jLz7a2cP/drAH4n3UMu9xvR7zJNLTA5ufboRSlG4zB7upoyVJ222IQuM7qDN+qyAUQ
	 ycyQd47679kDuXLve7POSZssG5B/JlWY0vdJsQNr/crsbp/0SBdPiJ3l2nCd4H/z+j
	 EOIu/z0bgXNPTKBB9WRm8hpGMYW+frZeSJexSI2K6y7O1xWbo9EzqqYtFCrW2ryS7H
	 u90ae2E0xXSKdQHuG1nSWm4DTg5X8/JyGvzag2db0Wthq0I3aoG/guohkrZBfu2YUn
	 0h76Ce1/xSN3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE0182C4D;
	Wed,  7 Jan 2026 18:02:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4344FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD7BE6089B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAOuuDL0gnrR for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF2C6087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF2C6087B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA1180333; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:01:09 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 094ed4d09e193f4f91688a969042225609a621fd
X-Git-Newrev: a00713b7736dfebe38da83e86b21afade89c684f
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.EEA1180333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-pynacl:
 fix sort order of dependencies in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=a00713b7736dfebe38da83e86b21afade89c684f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50922517f7c3f8c35f1683aab10c33e95f79fe29)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pynacl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 0553d82ce9..51623a0a70 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
-	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBSODIUM
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
 	  library.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
