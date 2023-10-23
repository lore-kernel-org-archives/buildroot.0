Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27FCC25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 18:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39BFB836CE;
	Mon, 23 Oct 2023 18:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39BFB836CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGUIamdmx-bP; Mon, 23 Oct 2023 18:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7305383089;
	Mon, 23 Oct 2023 18:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7305383089
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 307361BF2FF
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14AEE41DA1
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AEE41DA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iilvPgFqy4h for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 18:26:15 +0000 (UTC)
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FAA641FEF
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 18:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAA641FEF
Received: from localhost.localdomain ([146.241.116.60])
 by Aruba Outgoing Smtp  with ESMTPSA
 id uzcxqBc0Kzh8Auzcxq2l9B; Mon, 23 Oct 2023 20:26:11 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 20:26:10 +0200
Message-Id: <20231023182610.1400528-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNzxaDeeavH1QiEmF5mzI4YnYPAd0jO75pMJ1yB4A5y6XF2JZbJZ6nZ930zlj5af3de86QO+rIDUv3Y2u56PZ92e72Px4rACdgUr59/YwvQzwfstHLWj
 xw63EGc6ikxI5AUQzIRbHnp3ZLir2bEsbSLsPlDVXYaT114GMgYsGH1UFSf/ZWUthSkNx1fv44ySklulMBfoKg0OAYEo71/gtJLxErwVGrWDkaRh7MidLFFM
 2Xr3tlOXw+hTUvT4ceG1k9YNEI73dHsWvCa7mnBNHQbANQ48EM79OYEP5k4SCsXWmyEU4ShxMUvxjLq/dEqPiHxE7gFvblsCT8XDncFIU+duvlzWz0GePMJW
 avg8jYi+ioDievPTB1WWJ5yeDmi9TYxH0U0/VcUB4iLtVg46D/Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698085571; bh=FXkf1n71TJbPLuxSJyuj6jzgcQnR2u5YVh6aumplN80=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q8rI2audIvINSRzhD9vMcuYRRRCLWYpKA90bqYgf+KYhoHcNmOeuw4bqQMoNiELpf
 4dbeOfOOETsqP0eG/Vd95uO3MZRksqQA6v8Oc4QHIQuabMSEMeWe+O2k8nJVdl09na
 BjmgI79LlFTldEIADVTsXj5/fxgUI2qQuK9mJiYchNOor5oxXpQP9vJ+y/Y8sRhXoZ
 RVQhXmJca8royecRiyMLVu9suFDq1hOsfzx9s/4btB2ZIWrlSoMi4FpI2G9+rWP+JG
 WcUkuzhnMjJjZKXhpLwBEyb0tD9wR8P8b6q6oEbhej6vYf+xp5dAAwuBTNBYHmsSum
 RtBv3BUlLftfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q8rI2aud
Subject: [Buildroot] [PATCH] package/python-uvloop: bump version to 0.19.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 69834d5243..481dbd0569 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  bc5e841a1c3f6e8935eeaf9d82b5ee29  uvloop-0.17.0.tar.gz
-sha256  0ddf6baf9cf11a1a22c71487f39f15b2cf78eb5bde7e5b45fbb99e8a9d91b9e1  uvloop-0.17.0.tar.gz
+md5  0107f6e04c23bdcd93a0a712a0e52ffb  uvloop-0.19.0.tar.gz
+sha256  0246f4fd1bf2bf702e06b0d45ee91677ee5c31242f39aab4ea6fe0c51aedd0fd  uvloop-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 147062cf7b..285884a2bb 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.17.0
+PYTHON_UVLOOP_VERSION = 0.19.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/ba/86/6dda1760481abf244cbd3908b79a4520d757040ca9ec37a79fc0fd01e2a0
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/9c/16/728cc5dde368e6eddb299c5aec4d10eaf25335a5af04e8c0abd68e2e9d32
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
