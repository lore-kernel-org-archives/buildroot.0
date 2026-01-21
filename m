Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B7C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED3260B53;
	Wed, 21 Jan 2026 20:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IV2erK_28VnF; Wed, 21 Jan 2026 20:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D2B60B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028292;
	bh=4LU1jQkte5P4xk/g/32xl4xiQbBp2wlzxsMfusqbCa8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oiISqesZprPLxQwoTYUiLtRD1uieC/AzU1zAHDeSijp2d30Uv81LAPzQr6d2ZPMzp
	 QGkpKia9IVVcUObdCELp51GxuZshsy+F/gTpWLPMTOVXyW8cStA8CHLWniiAaHxhHo
	 0kNxFW9qC/ITBBcmRw/imOyYXvDcSoKHAkkuGMRbJg6kHt0wzgw6MRAv+z3H2i887v
	 AdMZn4O+jm4lZ6jB3c69E3xGBRWmKnld5WL/EiridoDXH7kwXwpB+Q7i5WSfCfG3XH
	 ItX/9vG1NLx0dZFsrYVvUJuDN6sZZ2GtIFRAN2gH9o9gSjuUtrOlvVXC/SnyLSnzTm
	 D5ekJUEjxF8ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D2B60B60;
	Wed, 21 Jan 2026 20:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACADB158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 901B5811C3
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr6E4HV3sJ2k for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA24D81068
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA24D81068
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37BA874AA; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:05:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56db14b886f4a673e6a94136238b9d648c883e54
X-Git-Newrev: 29e962d87b924d3ef49444321f9e0c675c6f15ad
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.B37BA874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-web2py: bump version to
 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=29e962d87b924d3ef49444321f9e0c675c6f15ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 098f8dc490..b100a1fec8 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..5b473698a6 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION = v3.1.1
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
