Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879EFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976D681D11;
	Fri,  2 Jan 2026 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpnXT65DZ1fQ; Fri,  2 Jan 2026 20:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C920818C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387309;
	bh=LDV17YYf2/68voSQzkfrxdKN/S+54uNOE56XHZUgRwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WDicZdqroN0qes79Hork9xxKgkUpqViOCGR3ETwlveo3Xf1UgYVANtcP897ZCSQpH
	 QLiBdAqePVtwrpO87dyZ4G2c4i0//4rqqOjy2cykXrIllFF670ZxxBISc1qMSiqU6B
	 fAzJ+MjKk0/deNgCS/EFzr1VDx5v3QubHB9gADHjPO+clck3wB2YmPJPpFtjBjydHU
	 cfiKQ3ViMgZRLDQjkDt9jhi92tnsAcprmxAV09pXFQkcU+KLoeeg2tQIHnK43AZHv1
	 WgZ4FtZQjWRwMrCQFuwtmV9ajoKwQPfxCzt8s14hEBsF9+GklbIJ9dIFE5hFQbrHGP
	 HTJwsaJkHZr9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C920818C0;
	Fri,  2 Jan 2026 20:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE29202
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F2D4088A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEKD4H3HFBVu for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59FF4068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A59FF4068F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE598804F; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:52:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce8409fda58d7799463645b981043adccf4ec7a6
X-Git-Newrev: 26f07744752f027e6eb7a1734ceca03ae8ea8587
X-Patchwork-Hint: ignore
Message-Id: <20260102205504.8CE598804F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=26f07744752f027e6eb7a1734ceca03ae8ea8587
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index c77915987b..321434e299 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  577c064ebf4b84fbd53890b4c0f86f5a  pycares-5.0.0.tar.gz
-sha256  62e38a6cce0f3dbfe6dfcccba10526255b3823a2a040b313afef7aa9b039ce03  pycares-5.0.0.tar.gz
+md5  36560432e7ebf6e9746080ca2ca7cf0f  pycares-5.0.1.tar.gz
+sha256  5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081  pycares-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 0cb1eeda6f..cb645e60f0 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.0.0
+PYTHON_PYCARES_VERSION = 5.0.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/59/5d/b50bdc30026f350f1c4b0c4fb6b7543598f2bcc370308c5148c7019d9886
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/df/a0/9c823651872e6a0face3f0311de2a40c8bbcb9c8dcb15680bd019ac56ac7
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
