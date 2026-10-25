Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DA606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CvTwm9CD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB12760F36;
	Sun, 25 Oct 2026 11:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPaw1JU__15e; Sun, 25 Oct 2026 11:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0F2D60F23
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929403;
	b=XvErViQJxalG07B64Nt0csFisNDHP3KRkUxtBVTMPAjPunXzgejzN110oZxaQuKKAfWN
	 1QbXeKZY5KCFFbg1M4/G1UXMYNTm8V3ZZNDkhT4A3yuB7rbncWp515ss+TuMkDav5EbV9
	 SyLDy0SnSPI5pwgFkZMYqr2HU53ExSEB67cjuM9XZiNTUun5qQ84NNlmxjcSSIjw8AWUu
	 rMvs9D+GD01XupekM471f+8fvXynrRfEN7/PLgUTeiz2E7OG4aXngYtj4Qok0Rvi4ONlq
	 XgHVduxy0VtV0ppA7JNHy+a7FBBq73wbpQ3mfZQkpGTum64750MuM63fnwECkGdCHgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MIHofcqoin7wqliCXCmyky4FlH+HjEtSVNB2XbuNfto=;
	b=B1IitvSLf4gHi8bnrDCkb9GB/brPW7BgYiFU2VwX8MnCugTPtpn1ctuxYvUTimaePUNG
	 joKslgCSE53Bkq+e5By4qENNDxUYGlApwP7+GTKr8Mrbim9HafnCNnfZc/90PzzF5PN48
	 8vZP8OVwCxOJipO372xkaEI9DXdQlvKiMIQRvQX7feHFeoBVzxUqwNbNwNu2wnYJ+KbRg
	 GYJROJ6A6LembOrG+ISOYC8dbPIjxDp/luAjcGwkMdsjHP/Qs3/XcZyaYDuXhP7bIwzd0
	 dPsGEpVOu2OaRG5La30lEOtfgVeh1os4qk622n41J5Pri5JrkPusucJ/F26ZXLdP3nw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929403;
	bh=MIHofcqoin7wqliCXCmyky4FlH+HjEtSVNB2XbuNfto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CvTwm9CDmTMauEziG9RklFDRCWbwZ+axuuEMg6q/wHB3A5IbH3qFxcive4WGs1Dur
	 t0+YPt+pNJ5OiJhxbH0QmIqvvEYsFsEl6dBvC7DfCS7WdhOfB+QwH5OIEWj22J0OZb
	 qcSQTOfbqqlckP2Vbyt/hSHfzmHgAUJF874IkU+mDkq2+/v33zWQWePW/XKq82gqfg
	 xvVD/PzexIGoUk6dXE/byO5tbaIDsZPsmkMr8O4AcEhK+ADiLLUva4v9bKNBzeHEEz
	 9+B4ghNzQE0fkkfVHqJ+nt46a5Itj+ffuwymZ0rJNW2aNQbuTLpjBIxRsjXTCNGGJQ
	 BiOFrIvbFwggg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F2D60F23;
	Sun, 25 Oct 2026 11:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 849393AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82450406CE
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVlGBwW5XU_V for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57F31406DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=JnUcX5PA/Ih1Ecc1yu2f3WQ0FGAP391Q6+VC5j20ltNKJbC9qDamwpdBRV9X2BmSmYBQ
 J1Ix3Rrel8mZWgIjSKHfZNZ9tYly3ITwDs88Tzq002VDQML3Y8WdMSjABrD8B7EapUiSN
 HEjcQhbTqjsK0QFDmZAs0xZ7v/3RvNiAM+1uxmURu834fmtlKkqmYKlp+jgLvL0FxMw+s
 L0JOquAhb1FtXOqOpdzF96c8UkrN35/SWpkFQfIKpzPKbKPo9lVLBfoccREen8Ni64Tsw
 OS026DVPxrnainbW2CvWKPvQk6YZgd4RHSVhdl1i+ZfxWI/RQni9zNAlTA7VI7DjeGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uQp8k6hsxXKTEOHLznAcy8RunfQmBii5RoarnjjNgFM=;
 b=pXNLrQnT8vSRHCwbJSyL/peSeEK/nnwDI20XcvsNJoQWBkhpFrhN/3fMRPDSn3VtaPuG
 PWoS/Ef7Lx8UrnPRsbeXEUhnM4xib2tXj4kfYFw1p1GYSXBleabgTGOQzJE0+BMr1OeBK
 rhg86XC5LL7YWKg2jFAT7KZV9dp5Yor/jWuNMTW+Z0GUJWAYkpq6DXSs5Y+YVdycgAYG2
 Se4UVfKPVh7sOnIPDwgHiWUlrdaQy8IJsGCoPG57U4seRWVWdsMS9mE/d4IzyqCZWuE/z
 STznLvukI6hvzQiun2xWlqn4LBoeR/jtG0D4qpaRAiKk5V5wbiG7Z7iruTpXWdbzqxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57F31406DA
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECB529CE83; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:26:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdf33193a96b6c2c7727c8ef96e4612467d19ce9
X-Git-Newrev: 44ed6fd12a207cf0d61e27460afdc9bc28001649
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.ECB529CE83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pybind: bump to version
 3.1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44ed6fd12a207cf0d61e27460afdc9bc28001649
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Refresh the STAGING_DIR patch for upstream import and helper changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-pybind11-commands.py-support-STAGING_DIR.patch          | 9 +++++----
 package/python-pybind/python-pybind.hash                         | 2 +-
 package/python-pybind/python-pybind.mk                           | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 255c484099..83892f1ddd 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -13,6 +13,7 @@ the current directory, if it is set.
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Upstream-Status: N/A, Buildroot specific
 Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 ---
  pybind11/commands.py | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -21,16 +22,16 @@ diff --git a/pybind11/commands.py b/pybind11/commands.py
 index a29c8ca..de8a27c 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -2,7 +2,8 @@ from __future__ import annotations
- 
- import os
+@@ -4,7 +4,8 @@ import os
+ import re
+ import sys
  
 -DIR = os.path.abspath(os.path.dirname(__file__))
 +DIR = os.environ.get('STAGING_DIR') or \
 +    os.path.abspath(os.path.dirname(__file__))
  
+ # shlex/sysconfig are imported lazily below to keep `import pybind11` light
  
- def get_include(user: bool = False) -> str:  # noqa: ARG001
 -- 
 2.31.1
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 1a54a89da0..b7f8025544 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  741633da746b7c738bb71f1854f957b9da660bcd2dce68d71949037f0969d0ca  python-pybind-3.0.1.tar.gz
+sha256  ef712655692a2e9bf7bb7874c022564a45f91d847ddee987e720cd9e28849665  python-pybind-3.1.0.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index cdafc9d4c0..4d3cde98a1 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 3.0.1
+PYTHON_PYBIND_VERSION = 3.1.0
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
