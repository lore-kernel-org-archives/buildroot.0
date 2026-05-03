Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0072DCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDFE6137E;
	Sun,  3 May 2026 14:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P1X9OEulnt2; Sun,  3 May 2026 14:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3FB161610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819909;
	bh=UvefvMSohcMuXzTENlErxlJ4AzESGZbVBEfhn2/+fVM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OMO96beXxVYYBHCy5stehYl7lY2rxbmCi3z3AquwUxcJOj/Wjmv8lcAZwyz/25BV3
	 0alGSLK5Vf37jrXq/HnNffzWTTcI7m87DV1I/khbXFMPTcwjfVBAq6GKrBvXlF7bBN
	 SDcNnt4J5WbaCdP2fC1zOmu+0IFqjppaXsWUqYt0ygvZSH+LKAWsMZmwV8go2El4t4
	 CYK1Ev/6OvbfK5xJDWxT9CTdEyK69stkAiZaAJQWCL0oKpGN/1eXLREyPoPT46I/d7
	 a6evVaV7DrXDxiJ9pyY5HxR0sEPa5/B28vNu383ArJlE3F18JNXH3zXeRf7724Mu07
	 in9RrHpSVnp4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3FB161610;
	Sun,  3 May 2026 14:51:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CC83190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 076AD4074E
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KPNeOcRVGsn for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEED4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEED4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E959883FAE; Sun,  3 May 2026 14:50:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddfaea33a84f3569d63bca600e8a332e9dc08b2d
X-Git-Newrev: 4271a270fb2defc3c2728d9c22b94bd6ff3e95e3
X-Patchwork-Hint: ignore
Message-Id: <20260503145052.E959883FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wheel: bump version to
 0.47.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4271a270fb2defc3c2728d9c22b94bd6ff3e95e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/wheel/blob/0.47.0/docs/news.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove "security" from commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 7ec38ec86b..4f0640bcd8 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  61fb0c9633fe7492933a8f338db23508  wheel-0.46.3.tar.gz
-sha256  e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803  wheel-0.46.3.tar.gz
+md5  3e73dfac6b3b47a7d1cd52e81885618f  wheel-0.47.0.tar.gz
+sha256  cc72bd1009ba0cf63922e28f94d9d83b920aa2bb28f798a31d0691b02fa3c9b3  wheel-0.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index b68a1c102b..ae379b7ed6 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.46.3
+PYTHON_WHEEL_VERSION = 0.47.0
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/39/62/75f18a0f03b4219c456652c7780e4d749b929eb605c098ce3a5b6b6bc081
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
