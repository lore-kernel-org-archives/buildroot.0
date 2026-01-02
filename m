Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E15FC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2225680DCE;
	Fri,  2 Jan 2026 22:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBie-NcqV1Nq; Fri,  2 Jan 2026 22:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CCBE80ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391268;
	bh=VU0np3KjxSggZuc6MD1ACoKGP4WWR5fymfLK2puZs+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WGcAU1gEjcDpbvH+mWnTv5Hqqih8q8fkO9MOyW26X/AN5qjDE+1T5mOoWTFvKzpHv
	 3JLpiCSl2DC0+tKKneoEFCiUlk5MK5WEgGA5tc2WJJT7gBjAq6NJN+X8sekOvL+Ohr
	 hwVp7ar2ijoTynZAyG9qaHq1R3uwPgxwCGI/dFOb2jsoXgay5Us/nYZhf6lPozlP0b
	 1Dwxe9NAbU7KeDqFDidvDezu3tcX/4NRobIZ1wQy+YL7xdhaZ04wS3z6M3b1TmdcrU
	 r/TvpPbG9JXt/tAvL4wejmaPCxcRlbR/8WSzHpRqPdtJILw+Nvj2jkKFcFnHeEOisD
	 Em7QXXUBXrG+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CCBE80ACA;
	Fri,  2 Jan 2026 22:01:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE6B5972
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC87C80A8C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGDofviUlVsZ for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D3880A88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14D3880A88
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 003B780E31; Fri,  2 Jan 2026 22:01:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:59:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f16475f3773dbb910356c1b9dbb8a663266a55b0
X-Git-Newrev: 1033e83bb79f13c52164b60f8dbfb8d3bf28d521
X-Patchwork-Hint: ignore
Message-Id: <20260102220105.003B780E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-path: bump to version 17.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1033e83bb79f13c52164b60f8dbfb8d3bf28d521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/path/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/path/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-path/python-path.hash | 6 +++---
 package/python-path/python-path.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
index 117d225e75..9418d9e6d9 100644
--- a/package/python-path/python-path.hash
+++ b/package/python-path/python-path.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/path/json
-md5  3f03cdccfa0fdd9dee34c445701d4a31  path-17.1.0.tar.gz
-sha256  d41e05ed4fa1d4f6d702df3c1e0a1a255d7b544287432456455dc7c51e5f98e9  path-17.1.0.tar.gz
+md5  c7ab103cb96b36758daeccd1ed52b587  path-17.1.1.tar.gz
+sha256  2dfcbfec8b4d960f3469c52acf133113c2a8bf12ac7b98d629fa91af87248d42  path-17.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
index 1ebaccd099..8d287772d0 100644
--- a/package/python-path/python-path.mk
+++ b/package/python-path/python-path.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PATH_VERSION = 17.1.0
+PYTHON_PATH_VERSION = 17.1.1
 PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
-PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ed/51/127cd9fa2baae5715e24839d6fb73c6fa6eca7b84a52fc7ce8195d830802
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/dd/52/a7bdd5ef8488977d354b7915d1e75009bebbd04f73eff14e52372d5e9435
 PYTHON_PATH_SETUP_TYPE = setuptools
 PYTHON_PATH_LICENSE = MIT
 PYTHON_PATH_LICENSE_FILES = LICENSE
-PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_PATH_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
