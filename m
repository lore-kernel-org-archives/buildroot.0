Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B28EEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB8C4818C0;
	Thu,  1 Jan 2026 09:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lbUKk2QsVCW; Thu,  1 Jan 2026 09:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF37581A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260567;
	bh=kRGvAmWXxB/zbFsxXgVehWp3ext/naSnmIf4UqtnFyc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bC+cqv7AR0vAY/nfj48oOv82dPJG0dbVpAj9ylb1RD378sNaBmiOk9b5ZI5ngKE6s
	 BMUxLVJdE0XvmCmFPrkrrOFVLpNBHkMKWbudU75+Rkc1PXfQAOG77u+2g1/UjqjuvO
	 zJk3QIG85w4sH/s61wzPwa64N9vkFHM1BNo71DsujRRnRdS1J0py872u8Kwr8MegA2
	 IPUmB+1VTIAd2llj02K7ldaQCbBGuFlLMKA64ZYCCfdN5ZTK/ltVI2d5s3j1tUJ2/m
	 LYV/c40oYRyXWhoHS9W6am3IZzaC0xQ3y0cp4cOZdPWRijAfKUmsFMsBzaVCQeIJLq
	 U4bVxnpI4XifA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF37581A6A;
	Thu,  1 Jan 2026 09:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9F1206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAF3A814D6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6q4ckp2dO6xb for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E2C81447
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E2C81447
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B63878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab2b94b2224db945d6f849b02fe0002a53218cea
X-Git-Newrev: 2e16d67445fc12267f8e1634320998586a449eeb
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.65B63878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tempora: bump to version
 5.8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e16d67445fc12267f8e1634320998586a449eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license generator migration:
https://github.com/jaraco/tempora/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/tempora/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new host-python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index 15bdaaf783..71c42cd298 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  ca7fb7c9523fb5232b734a19dae05c6a  tempora-5.8.0.tar.gz
-sha256  1e9606e65a3f2063460961d68515dee07bdaca0859305a8d3e6604168175fef1  tempora-5.8.0.tar.gz
+md5  208d59bfe14a913199d3e284c56f195c  tempora-5.8.1.tar.gz
+sha256  abb5d9ec790cc5e4f9431778029ba3e3d9ba9bd50cb306dad824824b2b362dcd  tempora-5.8.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 3b6c644b53..facd72a999 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.8.0
+PYTHON_TEMPORA_VERSION = 5.8.1
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c3/f2/bbd6d2178791eaf8bac06857cb0ee39840e69f7b64ecb0c414bf8f46daff
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/24/64/a255efe5edd367d12b770b3514194efdc1c97e5ed6ce6e8105d834750dfc
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-PYTHON_TEMPORA_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_TEMPORA_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
