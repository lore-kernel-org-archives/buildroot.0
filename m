Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D7D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCC34169F;
	Wed,  7 Jan 2026 18:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EN6-PJV1MuDt; Wed,  7 Jan 2026 18:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EAB9416A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809008;
	bh=Zz0Lr0VMVhHP4IrIcNMOjlPFaB5v6FfYF5YttPgA4Uw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qn8rDeDxweyJ1GKfOEKxq0hlf5Ar2lrsh8ws5dluIk+Yde9SDxITF+tFoGfv9ADtI
	 pAsUO00+/QeiRYZ7ONt8aVFmynRqeCa2WG26EsLuAv/PxoritmY+dPanaxf+AYU01p
	 2JiuXUvMz5xzNCLxkfGaXQBPKlcjboTegCmDZm6FpVcwVqbQNyBsVOVdTc76+0pWyF
	 Z733FMsssNdYsrVu8KAwpCKwBzpAWLLrH41IfTfZRYQT4xSe9tSDJaXXNJins9gXn5
	 adsRIwoUaxfFXAoiyFMQDeH0UUZ7X2kkeAu6Xb3Id35DXLpvEIERDIslaO1f3aelDl
	 PitO//4ux6zDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EAB9416A2;
	Wed,  7 Jan 2026 18:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15229A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BA3740DED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n61btPASkpz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 952B740A06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 952B740A06
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94059811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: eaae745b402dac7404411de617f363baad6f8e36
X-Git-Newrev: e0fd58288c6d506c119c8e689cbdb85fa3e8e8ef
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.94059811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/python-ipython-genutils: update tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0fd58288c6d506c119c8e689cbdb85fa3e8e8ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84536c14986ab9f2de93d76a220a06d962134552)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-ipython-genutils/python-ipython-genutils.hash | 4 ++--
 package/python-ipython-genutils/python-ipython-genutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
index fd719c93a0..c368272f07 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.hash
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipython_genutils/json
+# md5, sha256 from https://pypi.org/pypi/ipython-genutils/json
 md5  5a4f9781f78466da0ea1a648f3e1f79f  ipython_genutils-0.2.0.tar.gz
-# Locally computed
 sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
+# Locally computed
 sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
index 08a0b8ba9a..847279b6b4 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.mk
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
 PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
-PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_SITE = https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
 PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
 PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
