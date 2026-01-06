Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1623D0D154
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7235C40B2D;
	Wed,  7 Jan 2026 17:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5sH_yMzkXZH; Wed,  7 Jan 2026 17:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE83240B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808076;
	bh=egonmH7lqDXZsKSTKWv9MA/s3z4W2Vf5KGOsNpBp3H4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZ/BPRVto9YrSbSiylJ2bEzwwPIXjibpdKb9NPH/0WjJmPlGtaCAXCXcC5KEAu3X4
	 JMHToXzSOveaqR4woxWeoK+TEAezvOjjSIqSNzY0Wa5gY6lDdBGBUA1Dk+J9ocgMMb
	 IRLrpcWCoXYzV6WS4VRfwDm226x+RbPkEpLrtsL6lsqMbyHHws9JCI7vl2dWOZ08Qd
	 /eSbeN/Dwuiu9tP6pt63pjm+NXootUt01xPr7qqpb+ZYlG4B5I0RDq/t9FSNRai1YY
	 LUq8+pY6OK+EzPzfWyFH3JtOJh4r0TaoR7EV3Uitovo0HsvJM6XDtxkjtN1WohNo/G
	 l2JFdVUu0XkZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE83240B26;
	Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEC625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FC0F80BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKW5BX30Pj7y for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C0280BAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26C0280BAC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2582F81917; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:33 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 951530dae057a00478b366c981eeed4bee66ae6d
X-Git-Newrev: 6b51371d1161df9423e090d7b5605fc067ab45aa
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.2582F81917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-crcmod:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b51371d1161df9423e090d7b5605fc067ab45aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
