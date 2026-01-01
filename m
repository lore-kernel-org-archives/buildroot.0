Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE218EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A4C814BD;
	Thu,  1 Jan 2026 09:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1q7xtxSi6lje; Thu,  1 Jan 2026 09:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A7D6815DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260571;
	bh=bPm8brAvfjNg/B2DhH+ejx4Fin3JX946VZLVbJDS/UU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a5EGXjBm1lbcmku8NqYMTqB3EpMf3PHUd8aGgwlYtLviDCIfzWqyCVqgiHloGtpBs
	 F4VjnG7pQdp9ru1u1mjIhvw3r1fn4/id/rzkfGVLGukJ1CJD8d8Ve/bpVMQ0jlmmit
	 fLJbM4j74LxrBdf2ws+5Vr1YG/8q/HHxIC7nyWjT/z7iGpJO9dBJz/VMusCPEE0gwW
	 JK0FRXgS1i4cAF9GQVsGk5DOLAe197fmjFc7ZcZOXIrPLon3kZiVrNI9cytRfEun42
	 qi/82puFStXv6+dmI3eHE3sAGNKai5smmJQt2aKoI3X4YF5SuQDA+v+nb4WYECu7rm
	 Y35Q5OgcysHjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7D6815DC;
	Thu,  1 Jan 2026 09:42:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1058F351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D10E814DE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0feW94VcnDF for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2AD81412
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA2AD81412
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E81D086FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ccf809ee9dc176c9350c0a9406a8f9625e4bc6
X-Git-Newrev: e4a5d35a5f0b35b8f2dd11e5aa4de6411b414e77
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.E81D086FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmi: bump to version 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4a5d35a5f0b35b8f2dd11e5aa4de6411b414e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from poetry to flit build backend.

License hash changed due to year update:
https://github.com/lextudio/pysmi/commit/fdd7fe3d201b1d451eaecb858354a0e1bf9fd04f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 30043f1b95..856f59baaf 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  187efbaa8ebb5d6d880906bab0116ef8  pysmi-1.5.9.tar.gz
-sha256  f6dfda838e3cba133169f1ff57f71a2841815d43db2e5c619b6e5db3b8560707  pysmi-1.5.9.tar.gz
+md5  406818a9bb351e665e2eb9e9352a57fe  pysmi-1.6.2.tar.gz
+sha256  abed01673113886d10f0f336426859238fc13b5383c7e28e13dbcd5af0443ba1  pysmi-1.6.2.tar.gz
 # Locally computed sha256 checksums
-sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
+sha256  ba934e538c4116c2d9209c14256778b9a8a246234a3bd9256c62f396187e80d4  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 454cd11447..2288f04e88 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.9
+PYTHON_PYSMI_VERSION = 1.6.2
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/be/b0/19085322fc24f6b4a7bbc151643641c391b8b8d9aa4fd0e40d8178b2a5f5
-PYTHON_PYSMI_SETUP_TYPE = poetry
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a7/80/917111aaa4bf931bbd4d9a6c89864de2304b79cba8ce49639a6440ecd5ba
+PYTHON_PYSMI_SETUP_TYPE = flit
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
