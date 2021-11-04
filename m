Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079D3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:42:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2DD601FA
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D2DD601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16EB5405AF;
	Thu,  4 Nov 2021 20:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCRw08eb-Y70; Thu,  4 Nov 2021 20:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E126405AC;
	Thu,  4 Nov 2021 20:42:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABBE1BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E270660B8B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaXIyLSIf3U3 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:42:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F606075D
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:42:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4EE6C8A5A2; Thu,  4 Nov 2021 20:38:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 21:41:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b0ab090d357d5e83a400059ec9206d424d3fd38
X-Git-Newrev: d6d24f5ef80adcd4ea926f4ec64d19f7e73caa69
X-Patchwork-Hint: ignore
Message-Id: <20211104203816.4EE6C8A5A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/python-cryptography: add
 host-python-six dependency"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6d24f5ef80adcd4ea926f4ec64d19f7e73caa69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9b0ab090d357d5e83a400059ec9206d424d3fd38.
---
 package/python-cryptography/python-cryptography.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index acc21c1227..e21b9db042 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python-six host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
