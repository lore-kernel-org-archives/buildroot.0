Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FAD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B4D7834EF;
	Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc5mx8XHkCaJ; Wed,  7 Jan 2026 18:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 498BA826A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808989;
	bh=rxf1tnz8ibBihHQWFTN50G2OBD50BKP9SuKyRNTBZLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gSf2z7+hq8z8S7QjlGDb2JJzi+Vbcp8bYA4CzuOUZ0RRznQlqJ/qDC1yydv01hWMh
	 8/28iHMo8XwmryLRpPypg0uFTg3yKVdCta5RAHsoDQ+mykwZFJVevnVtbvv6KyiGF4
	 473Z8FMNa83cO6bxzrAgTN8OkO9uhIGx38pa49OPe6hD3YCYsUw4IGyFQOs/6HcuDI
	 uQctkZ9Hl3fSYdiyvlg+6U/lBeHMU3fhplHwcRswQM7r+PvZ5ZVu6UCHBFj32tdmrK
	 GQVe4cvzndngfOyxnNl3880vtyX09yEv2yhtm8C9FzPU5my40i3rxMLBPlMbWl4hy8
	 sgorUuXgJ2eNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498BA826A8;
	Wed,  7 Jan 2026 18:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10CFBA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFDE040DEA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vvL4u20NH-y for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A9D40BB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A9D40BB8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C523B811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:00:12 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4fa742eb869431781a9c04a1964e422a2a443e39
X-Git-Newrev: 9461acbe5d753c241e3de06a66b31c8f24cf4ca0
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.C523B811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-mpmath:
 update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=9461acbe5d753c241e3de06a66b31c8f24cf4ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15e91103837567245b3486de404a2a2c456a27f6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-mpmath/python-mpmath.hash | 4 +++-
 package/python-mpmath/python-mpmath.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index 1b263c925f..e402647a59 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,3 +1,5 @@
-# Locally computed sha256 checksums
+# md5, sha256 from https://pypi.org/pypi/mpmath/json
+md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
 sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index cd19dd52be..86a3562d04 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MPMATH_VERSION = 1.3.0
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
