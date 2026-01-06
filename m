Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ADDD0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590C98209B;
	Wed,  7 Jan 2026 18:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0LP8NhcShUc; Wed,  7 Jan 2026 18:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B259B82371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808917;
	bh=2vrgLDKdYTVDeclBbDMxZN96dCQtW+X2bnJ4SFXnEvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a6gnmDHfIyQwzl9Zx82lN5c/I+yTA50/uAPO/3PUuPTa3twv9NyCHpZM7PwG95et8
	 oXf6q1rSsgAdAzj2dseeh/lL5qhxblio64g4YJQNIYCNmnFjF2nXji3hZs+5lzj6TJ
	 xxjtt0cGWZimgqtjH82dOY5SKhZm29S0rSFMygjeM6jCAiDPXvKwB3s7LM1rCJblnD
	 hK2z9LBPydPEcn5Fs1er6P1RO4KYZ5o6IZyqUOojW5+KYStbYJxJTDAzCmCOQqBcSM
	 vaEGRMJ2ozq/ppZpFexmUvFyEJiVnmFQIbHJ3ECD4NQ653YXvUrptNi3S7qTJ0GmlE
	 dH/d3iAi+z3eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B259B82371;
	Wed,  7 Jan 2026 18:01:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7F49ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F276D6087C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtS6x-Th4aQX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534E860859
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 534E860859
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52EC8875A1; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:37 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 21c7f13b6bd1f41c28e6d0193371871687a2a940
X-Git-Newrev: 7d33e2668b443a0efc56062705dd2d269c54d71b
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.52EC8875A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-crcmod:
 update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d33e2668b443a0efc56062705dd2d269c54d71b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 00c12275b9a25d8c56e0cafcbd8af0690792a5e2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-crcmod/python-crcmod.hash | 4 ++--
 package/python-crcmod/python-crcmod.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
index 43ef7dd8e7..81a7f34614 100644
--- a/package/python-crcmod/python-crcmod.hash
+++ b/package/python-crcmod/python-crcmod.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/crcmod/json
+# md5, sha256 from https://pypi.org/pypi/crcmod/json
 md5  2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
-# Locally computed
 sha256  dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
+# Locally computed sha256 checksums
 sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
diff --git a/package/python-crcmod/python-crcmod.mk b/package/python-crcmod/python-crcmod.mk
index c97f8808c1..a8f2e86be6 100644
--- a/package/python-crcmod/python-crcmod.mk
+++ b/package/python-crcmod/python-crcmod.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CRCMOD_VERSION = 1.7
 PYTHON_CRCMOD_SOURCE = crcmod-$(PYTHON_CRCMOD_VERSION).tar.gz
-PYTHON_CRCMOD_SITE = https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
+PYTHON_CRCMOD_SITE = https://files.pythonhosted.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b
 PYTHON_CRCMOD_SETUP_TYPE = setuptools
 PYTHON_CRCMOD_LICENSE = MIT
 PYTHON_CRCMOD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
