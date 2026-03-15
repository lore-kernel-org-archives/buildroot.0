Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6DF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA1E415D8;
	Sun, 15 Mar 2026 22:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngq5Nej5TlMl; Sun, 15 Mar 2026 22:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E245415BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613175;
	bh=FXA3i218WD8lxegM/TSHSrDJ/MrNbKTdzpDppQJt8ik=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SlSw5mSWw1aGGYfHTzcz/jXXV00iuWDsH3vCKK3Ko7vNtqElPJ8swi7mW1IXgwbQV
	 F2dRXfYkDZ9dnqt6cIL8cTeCBWxdb5nxFVHu6feLnnqBSdfCRp8SoKnj2bf6/jlmof
	 yDRZP9Sbaf6n6vAsaVlJDbG/3UXcBaZb47uhGVL098xpG6/y7SK4cWrvQFFU0dDfel
	 Fatp+DuZ7W8Jk92cXDxoFY8pwE/aGT93bTae2pGm/aoof+sC2lL7Dv/nniUvm8gsbh
	 U63Jv7RA9rpFxlJoOQi/iBPyxWpdDg/0IRF6MZZWkFb03jQuh2TLSQcxlk4/hNVShu
	 aFEkjmE1PuGrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E245415BA;
	Sun, 15 Mar 2026 22:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9C5357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 673B0610A1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JN0gqrNCoZK1 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A896610BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A896610BE
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CDC885C3A; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a8be79402986d71bb917e7f486a6c863c27ef74
X-Git-Newrev: b1d10043435e21ea8132be3645ecbd6ec3eb1aee
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.6CDC885C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: bump version to
 3.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1d10043435e21ea8132be3645ecbd6ec3eb1aee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pyparsing/pyparsing/blob/3.3.2/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index b5cfebef68..509813d777 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  2b7937d58eb818a33687e3ddef860638  pyparsing-3.3.1.tar.gz
-sha256  47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c  pyparsing-3.3.1.tar.gz
+md5  ca3bea68cd1a84584b68cd7bed679464  pyparsing-3.3.2.tar.gz
+sha256  c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc  pyparsing-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a5425f9dc14ac74d4c5f0b679e941f2442e32cca7452a4418d5b1a49893ebe4e  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 743e361b59..316b864302 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.3.1
+PYTHON_PYPARSING_VERSION = 3.3.2
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/33/c1/1d9de9aeaa1b89b0186e5fe23294ff6517fce1bc69149185577cd31016b2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
