Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D51BEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B2E81D72;
	Thu,  1 Jan 2026 09:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niNRJNSe7oQ3; Thu,  1 Jan 2026 09:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E49814BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260570;
	bh=MwXbw48A07ApYZu/t5ZcaMlzP38uOC/o3O72wV2xfOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ERU+p5ibVjTPfFU+cpzlLRfkWQmpkrETkF7b5tiMhUAqug9CISnYl8F+H7KE4C4AW
	 7LBscG2U0uWU1BhUdXnhGHlts71ezFZGIn9/egZakeZzgiIGSR58QuNVVnj35aVbCL
	 1uMedYRGxB/miJBaIKm1+I+6T8rMRVA6zUIyfGCjweIgNF2WI9pX3ZPbLDRafn7Sx6
	 TJ8WDS6O9kAOwRAModSO+nf0gqJHpj8c0LiHGPKUnPjj9pvGTj36/kyw1ARa2Nonv9
	 /hjFeIv0W3MRMe0ltGvT8zjc5K/u/xspD+hXcuKr06QxwDhREBog5PO+XyHB3DzGVo
	 gwINFvL4D6zMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E49814BD;
	Thu,  1 Jan 2026 09:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E260351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558B9814D5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BibJKY7_V6sT for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C645F814DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C645F814DE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3FEB87CDE; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb17b7f665234cf112068d4dad88011d47844dbe
X-Git-Newrev: 020b8a7a5567b622481b2de473f9ad8ab6092eff
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.C3FEB87CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-reedsolo: bump to version
 2.0.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=020b8a7a5567b622481b2de473f9ad8ab6092eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable optimized cython build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-reedsolo/python-reedsolo.hash | 4 ++--
 package/python-reedsolo/python-reedsolo.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
index c1729f0aeb..61d435d4c0 100644
--- a/package/python-reedsolo/python-reedsolo.hash
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reedsolo/json
-md5  5bbd7741f915ad67b6d425f93ab9d103  reedsolo-1.7.0.tar.gz
-sha256  c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732  reedsolo-1.7.0.tar.gz
+md5  640de80afdaaf856eaaf31091e349a44  reedsolo-2.0.13.tar.gz
+sha256  71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717  reedsolo-2.0.13.tar.gz
 # Locally computed sha256 checksums
 sha256  2da9536c23b72bac15603bb1f8dbf269dc68ecfbc35a75f8d0aa9cb209ba0934  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
index 66e85fb40a..f5eea7eaa4 100644
--- a/package/python-reedsolo/python-reedsolo.mk
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_REEDSOLO_VERSION = 1.7.0
+PYTHON_REEDSOLO_VERSION = 2.0.13
 PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
-PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/f7/61/a67338cbecf370d464e71b10e9a31355f909d6937c3a8d6b17dd5d5beb5e
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/57/5b/ead15a5d182553f9d7832851a954b7f0d662d710972b0d1c479fd11a3ebd
 PYTHON_REEDSOLO_SETUP_TYPE = setuptools
 PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
 PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
+PYTHON_REEDSOLO_DEPENDENCIES = host-python-cython
+PYTHON_REEDSOLO_BUILD_OPTS = -C--build-option=--cythonize
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
