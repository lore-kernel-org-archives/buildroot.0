Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QvOpoF8U
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDDA60A78;
	Fri,  6 Nov 2026 21:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iL44HtboahS; Fri,  6 Nov 2026 21:14:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0F6A460A5E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999691;
	b=IkA8Hb2o7QSpM8cEQOuzp1oBPJzM39m/a2GUCiwjGZD90qq8OmjD9Fjakn+9nrh+60pi
	 F+WpkoTY5ksL3tnC30djArPfbs0WTp0dvb351CZVVfclrc9NQumIaqATASwdcTR5C6PxR
	 A6GvENKS1QLkgPH9opcUj2WMypiEQEbFbtfokqUtlWcqMC3U7wGc4f0qXZo/m8eeEggOZ
	 UlYpaPc4AAyMOWNEQQpTvlk905lYktwmOvSzekVznkJZstZTZjnOiTtEvPFZ962KJvlYT
	 2J7dRZI9B/WLKYS6JX5Pbz0ikVec4pNYj1YZIO+8WUmRjywvei4WRFpoXJNegHyWF3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ecbhYrDMBaapVAWDjfVwkHX9JYI2xRVsETNLZ8SHDyk=;
	b=RFXtGAcnjU8AiU4LU6XRwc9MFEyPytyjHWzkH5MbfzcrJp/DAf7xaNw2QEeVr8wcDAr2
	 Li2nkUBJ9JPtZ8EmZWeWySgwtNgSph2CiANNLnrVNcWwr3wCgoJZm0MOKmycNFNCNMfJc
	 no4nqwBHa5fIJSWlySPpc1bc1fdz9Um3AOA/3eo9gmISUPVa8xBqA4unYjnYutmRDIdm3
	 9LP/OeIgaRq+tSJIdHkQuTgFoD2UIPrYlQL/KLJ5h74/rPlAqIr23R3Vacnewd2Eq7D0S
	 9zqriqBhdA4TQyfqf9Ayz/hd7eDIbxjh+z6ufWzTGyBm44R3QgSmx0QHcnnI5XWfRXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999691;
	bh=ecbhYrDMBaapVAWDjfVwkHX9JYI2xRVsETNLZ8SHDyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QvOpoF8UXlO6DlGCLOEoAaGHwwzpeGBPKu/KIn9tk9zQGFGqYoBkAt+23pDi1++DF
	 I6ohn6qOiGZCHRpbcozi/btQP6OxJ4KyAPwRszf7N2ow++RoxORbVP0Yd71FqIdBvo
	 fbKGiqqQruX0LK7UAiy4+fQwvl4QZKsmRXWRSzaGmE7drUDTpjasN1sQMXmKNSOE+X
	 lXpnACQeTKwz7MF2KtrPnmcPl0RQGxVHDxCCctwYnphDp4su8NTkYwMQt7XfPYNg9w
	 MPVByStyynqPdllk+Nz2edokxW3YegAAPHgoX7sz2eHXZm5ABf+ffBIV3CoYVPXyXC
	 DqF4eLxWJJZgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6A460A5E;
	Fri,  6 Nov 2026 21:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC41DD36
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92EF240400
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c23iz9uuWit for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D3B8F40403
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B8F40403
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F099B9E0B2; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4727f34237304223f93c145a20cc359e357a05e
X-Git-Newrev: 3d01b689f39d8a432366701c966e41c30297ee53
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.F099B9E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump to version
 3.11.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d01b689f39d8a432366701c966e41c30297ee53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index c24d190e7e..7ac545718d 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  80c89f34ab5bce047528900335301408  markdown-3.11.2.tar.gz
-sha256  87bf5d90f2d2882e2c02fcda182c2800456b985bff38913867c49706481514b0  markdown-3.11.2.tar.gz
+md5  e3cc9d462a4eace02b6336dbab97308b  markdown-3.11.3.tar.gz
+sha256  81eb91631dc97ad1efbc76019ef0f80fe90ca49ddf81546752d79989c3bfff3e  markdown-3.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index fb5926f13d..1aecbba812 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.11.2
+PYTHON_MARKDOWN_VERSION = 3.11.3
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f4/32/0b4d0297064244f04af4331b65de16237cc3cce07474171ee14222a28981
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/ca/eb/dc0fd6eff604bfb870b7fb68b90985a32caaf3c76f67736bbf7f438acd59
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
