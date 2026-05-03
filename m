Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9208ACD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649618430B;
	Sun,  3 May 2026 14:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZi7vM9XckHJ; Sun,  3 May 2026 14:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A24F184308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819908;
	bh=xioXobZaRLOmRWHlK1/oxoDIfJTr+4ZdwvGrznifuwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tDFztr247tIYeP3nW5IOWkPXHzr03hPFcfK+ucUwT0irrqh+dEIofodYHwbPO/cX1
	 83I5WaS+9kocU8yKPwjlcVhWpyTtxdlNMDFT+mIMPQCqJnB+LNJVytHglucr4/d5sc
	 I4Qi93FWmfyOsTAiUIsTarqhbbUVG/BzXLVm5qZOXMLkX0XuiltpbcfnDYJqBCjsti
	 Jzis3OLKyDVOvsKCS1xVEoH/Q8FFqcH34EOBGTv2ZEReNq/uSd4au75MhkhJ8zxmFH
	 /3HC2Wm06/SE9m4tqPTReTQqNwKKR9NrXCWUbvPSaGf+ClYcJ7/uosSBQ/n4sVpPpE
	 oOLo3kyLeLXdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24F184308;
	Sun,  3 May 2026 14:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E50D190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D584074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdqG4_pAfnyD for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E8EE4074D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E8EE4074D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC31383FAE; Sun,  3 May 2026 14:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3982407cdff3c7314f58d4042dde6d9af246c1f
X-Git-Newrev: e204b6b73df6e59358f561d7dd9e84a5707dbb6d
X-Patchwork-Hint: ignore
Message-Id: <20260503145050.DC31383FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: bump version to
 0.46.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e204b6b73df6e59358f561d7dd9e84a5707dbb6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Kludex/uvicorn/blob/0.46.0/docs/release-notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 334a678c19..cab65882a9 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  e705ea164c44f6cbc5ea6edb47a8745b  uvicorn-0.41.0.tar.gz
-sha256  09d11cf7008da33113824ee5a1c6422d89fbc2ff476540d69a34c87fab8b571a  uvicorn-0.41.0.tar.gz
+md5  4179c72dbfcf49d1e6ce8e42e0195683  uvicorn-0.46.0.tar.gz
+sha256  fb9da0926999cc6cb22dc7cd71a94a632f078e6ae47ff683c5c420750fb7413d  uvicorn-0.46.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index bdcdb74bd4..66bbcd7253 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.41.0
+PYTHON_UVICORN_VERSION = 0.46.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/32/ce/eeb58ae4ac36fe09e3842eb02e0eb676bf2c53ae062b98f1b2531673efdd
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/1f/93/041fca8274050e40e6791f267d82e0e2e27dd165627bd640d3e0e378d877
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
