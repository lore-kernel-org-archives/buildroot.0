Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405BDCD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC67B61349;
	Sun,  3 May 2026 14:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7Ryzrm82Hww; Sun,  3 May 2026 14:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0912615DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819905;
	bh=zoA348XH8/U8bySvRyVYJTe/n8nUJ5Z8lLji5o8lwog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sbFdFhMCtG5EhOmADjpBieafZZQcKHiWtGjy/MiKRD4hlUgd+XjzMHsLhiPIQ9EBO
	 DmD1Nxm7jJT/H34k+IGCUlTZWbIpMmdFK2MCUJnqr2qcweVZoCIl3nvJvjUERZYIyh
	 oC3Qo3TJFK1CXhkk8lL3QUFDuTbsVYp8bmJy6Z6+c8/ja0DWh+3bj9UVQhcTPvS0VZ
	 Wh4XC2AGtZVHH2BeyPvCAQbBRW6g661gILOS1nH5so1r0qocq/+HycmFl0UKOc46MF
	 KPU0tMvq1Gz6DODEDG+Jd8cpmiEe6eYuWcIscSZL6MuLwfwleF7DngPK3sv5GZCjyI
	 lTteIm8DqFvUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0912615DD;
	Sun,  3 May 2026 14:51:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 235D3190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09C3B40C85
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6BNSDGmaic4 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA3D40D99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FA3D40D99
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18F6683FAE; Sun,  3 May 2026 14:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e084b53658295a5d9f1f93b17d3461f872540e6
X-Git-Newrev: 9803d9bf75a2153232acaae96719c5572cbcba5e
X-Patchwork-Hint: ignore
Message-Id: <20260503145053.18F6683FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zope-interface: bump
 version to 8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9803d9bf75a2153232acaae96719c5572cbcba5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/zopefoundation/zope.interface/blob/8.4/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index e1e234a035..910373899c 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  4da21b3cf474a9de4ed6776cb4821cef  zope_interface-8.2.tar.gz
-sha256  afb20c371a601d261b4f6edb53c3c418c249db1a9717b0baafc9a9bb39ba1224  zope_interface-8.2.tar.gz
+md5  e2886da91bf03fdebc437cfc8b029b60  zope_interface-8.4.tar.gz
+sha256  9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8  zope_interface-8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index bb3f82fc79..1f2535324a 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.2
+PYTHON_ZOPE_INTERFACE_VERSION = 8.4
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/86/a4/77daa5ba398996d16bb43fc721599d27d03eae68fe3c799de1963c72e228
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/9f/65/34a6e6e4dfa260c4c55ee02bb2fc53625e126ff0181485286cf0c9d453d6
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
