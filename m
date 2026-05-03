Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51E6CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB7984292;
	Sun,  3 May 2026 14:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKOQMUwqqzgp; Sun,  3 May 2026 14:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2432842A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819873;
	bh=asPW0G4coxEvi8Z8MMvHV1QEYn5hkWTgbQclViIm9BA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TUGUcE3yzmp2AmoNv6NP/G/iDaKdgMVyJdk+SENCuL5TWr9s0t40W9Wu5wIRNM08V
	 GEd6ArKZJ9HCtYcwHlOskCXFRIc2O/ty2ruZ1OgkosiM1d1WF/NHN6T1McoFWr08q6
	 k4kc2Cu9AR/t8WGIT96RLTMS03MyLRh64vD1r3HwIEvaHm3tt1zsh/6uyXqWrnPuEy
	 rsNSQz9Qz5uRvvTgO/q7vrosgF85W3dt8nWJS//mK1n/M/DC162zbuI72o0WKGVaMe
	 oEBkhzNGx8B3HCb7XjBbEV51Z0Q9BH/2+AnLSAVZLZbW6g9gqq8Ywl921ajTlYvJgn
	 4ot5CVwllo8EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2432842A4;
	Sun,  3 May 2026 14:51:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19876127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8084A4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk-N0pvPgzmK for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C340E406FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C340E406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 754EC83E54; Sun,  3 May 2026 14:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dddd5de2b6bb0504b90b56ff4a469dac2be6be6d
X-Git-Newrev: 9df1d5653007ad0e24306860f3856930e293bf2c
X-Patchwork-Hint: ignore
Message-Id: <20260503145041.754EC83E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyicu: bump version to
 2.16.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9df1d5653007ad0e24306860f3856930e293bf2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16.2/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index ffb89bdd84..3483408051 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  1e2e506ece8f1343cb5174cfb94003a0  pyicu-2.16.1.tar.gz
-sha256  cafdc2bc6cfbb4b6e511dedeff37316f902af900993b576116b8243f4ad6478c  pyicu-2.16.1.tar.gz
+md5  a554ecf2b79134b0324fe82e29017c34  pyicu-2.16.2.tar.gz
+sha256  006d51e24b5ec76df6ec2130f3dde269c51db8b8cfebb7d45a427dde0d10aa52  pyicu-2.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 869f50dcd6..002f572b18 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.16.1
+PYTHON_PYICU_VERSION = 2.16.2
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/51/a9/b68d8fad5b830146c42f08b444c716ec50f576cbc8f01e26f4da6e89fc7a
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/b7/d5/354eb1bf84dcf4ab0bfa46f0620ecf68fe313bb082c26872ceb7a5021f94
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
