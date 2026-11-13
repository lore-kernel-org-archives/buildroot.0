Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78D606A32E
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NDYAPoEu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nxcCeK4R
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C18D60D80;
	Fri, 13 Nov 2026 22:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYAcAJWJQF4J; Fri, 13 Nov 2026 22:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CA6660D91
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794610450;
	b=eBI5poXxWufgtZyRVQwKeutAlLu0tlAiBZG3c+ndSY6hyQ6piNrDuVrU014NqZxsJ5Aq
	 vVXKZRZyY2gTwZQQqd1slKUhCfje7EUa68cqfQpr2H1WEHbbaXjq9BChZpzX53/L9yEdI
	 G5GkD93oPKWc1eAibtcg+oFV666b5wqZ60/TqvgTAn0qqibymBQvGJ46YTfKw/mJ6tWMb
	 NzZQbrWCg0NXibSEk0CrBmTSohrYwu9eRFk78+FRWpKw+RC0PM2UdAs7mpHgYq79uvfUx
	 kY5mop7TAI02WoWI7ypCl0Gg0VoWXKpd9uu5DDYwoVaX1J92qK/WQpO+AtUL8n09oew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794610450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p1XWt1DmoZYBkiZAKttAzjzewjkLUd4DRZm0rM/QvTI=;
	b=JQVtFXD/8TeHkRUksnZntmWntqLS19D0hFwwevH04P5L7XvxQrNDnu5tuHUBx8bhZa0m
	 Tnxj0cRaYsqZEEtmpZ5ai43+udAw8bWkmgyJclD7rEBXe5PBpjE80lmk+Cr21F8QJxp/u
	 FgFWMpVbWycEfMvEzscBNrhVFd4HAtwuHiZfovtswbyl3nOrZT43gCnft8tE7BZzjRoeF
	 EE1Lk4w6EczVH8U54fdQPODcv15e5an1c9fZYQ2B/9mvr6dVUG8pyToH1l2SXCpKjfnSP
	 hvj/RcrmnFO57GDmLOLCRjpO1XJykIN08poaoOg/dLb4tOIev8r7bFoAFzfVT0zHpng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nxcCeK4R;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794610450;
	bh=p1XWt1DmoZYBkiZAKttAzjzewjkLUd4DRZm0rM/QvTI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NDYAPoEuQ/5d7THgF/gZXzD2BWSVJwyDshkDYQR1X3oOozX0/jtQmu5USaCrdVX9v
	 qJFOgn9a75PkPyXjdTWgrmInamHCgwRneqHWt9PnoLd2deyUmlA7Xag3bz3YfBXrfn
	 VDg9pUKk8k86xEL7bBLAxrdzss33THmnjxbn/Vmyzpu1mYSy23GO8kHJ9MukZcN9cY
	 k87lRVmHlx9pg5P2/YdY9f24pES2iE9BI0w4/8ee5hmZZfWZV2z8BMWBO8JzPin6xL
	 4E1jYe3MExrIcotriu76hIVK5r0EbPEvY+IhJcl6jyLRt7ZMuIWTzJf5vFos6ATcTD
	 1P/y2EMtZbOSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA6660D91;
	Fri, 13 Nov 2026 22:54:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7C31E7
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 22:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3913D60D91
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 22:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlhwcBUVJZHO for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 22:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CAD6060D80
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nxcCeK4R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAD6060D80
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794610441;
 bh=JZsh6453jOCU255Q9u+kssL7QvI5TZaxNzk6vxQtslo=;
 h=From:To:Cc:Subject:Date:From;
 b=nxcCeK4Rhmbhh8Xu+naI9J5NKZWDwMhd+pPiQK9GgeJC81ahz2Gk20RZcgp9S0VWd
 7FPLCFbHPwZGg3r3rQgtdWyT8Yl/G1zIRCQ7vnPjXq7e2mOg2BeSgVEtxSYGVGMEQi
 VOdDXSqUv/aDoM0DEq3nGdmBTBRJe0ijMMZMCSzSxFmJURCCHMywzq/3Yvu1TWDXnt
 40hEvk5HYX3Q5FsDTMPUw8VuD5dniuA3RSQphZoS9NuC2DFaPuJAdfGezSUJeC5grN
 SozlpfGO6W2UUI5x9OayGZODtIZX2gRf0OjQPQl7AJUH+iBp9/qxbSKWRDRXeJquiV
 whKqlTAUujRJg==
X-KAS-Sym: v3:f51bdf72230551df:g5znB4TUxnmbGBAKfrvJBW4ltNt/2m9ZMPQ+rdGA4IQpt
 3ZFwivr+1kMoiwKVvRYG39n6yUU8+qHeU7mVfRdxy1KT1vwwawDIDfdw3tR+wHQQuu9PXMfgK8X
 RHp3IZ/UiI7yf3aiIRoo9OiM7uBFieDb0k3Hc8ZRibgEdko6SypSW8/Yonx0vrhlu4LvW4HMHTc
 VPOY1zbYwVYUoWT7cZgyAhZsqZ6Fk0X/vg+GwfPCm6HAlz7ZvUykFFctydwkuHTqcpENxnD9zhB
 r6ilsqvB2PyLixMs/IoHvWCSCpGawKka9/Hc1FlFW7PElaYZ5PC15Eelhn9R4v02fkhCmurA==:
 270lV/iRfzP3rSprr3REdvQi6uOlIvrEVKOtsUZN/Cn8Z3plSSgNnsJ2y0EA585sISz2rdeY3r8
 drnO6VEAkgpBquG2vwP0JUHpElIaJ60VT/4YBtiVoTVW59kvsHo4mMiynTzkpj4tOaNiV6Q6pIw
 99ugApiyLKx6wuw5XfgUrQZIbBRNO/FmRIwvbHO0JWg+Qq230U4rrOBrmTTdDd025RBVYBXlrGw
 4+3rgzm1rgqgnodl4Cmu70p/TA3sjXCp4iX0TKOK2OvM0iMVjt+PIsITAhWeZcarH7dS0FZE7w3
 OfcVfKzYcaE6YP9aV3M7KiL9Acbv4pBOmW/r/MbDzAbfR6ys3UoJauIx7fYRjSot8uQRCVLs0ei
 6ooYC/aD1zX7YIRGr9+srzu+BH/epzIhqfdeQZNP85QsRrUdGepG1HZeeNPzbfVylXH09lsUJMg
 VvpfhCJF3zrAnxCfMDGB1d/Znf390n/TpRoZQHgqcQXmYgzzNM8UGmYsHyJiq4kE+kDwRkpx920
 BLA4QGhUiiuV7H/vVTS4HguJPlSNOIEWj3bgAnw02jol2eFNtpdxjOX8ZHe+8j4UZ+ZZo+2fZz/
 mWYAylYgxOkiglowdWrUskLmBui93eZqclzXz4lWqjDMYNrjygegNYz4MqkNGIs=
Received: from fli4l.lan.fli4l (p54a1be1d.dip0.t-ipconnect.de [84.161.190.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C13C4A4C4498;
 Fri, 13 Nov 2026 23:54:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59146)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xS09h-00000000695-07Ps;
 Fri, 13 Nov 2026 22:54:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Nov 2026 23:54:01 +0100
Message-ID: <20261113225401.2300017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-77-g438677ef4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes CVE-2026-84243:
https://gitlab.com/gnutools/glibc/-/commit/438677ef498552b28c2060060c9e3947373f1e2c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 9deb97a267..f76bdd3d02 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  5e09d1c1717d779862645ee5ad4a0a3665f2a185dc0832b1daa7b9f593f195e0  glibc-2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce-git4.tar.gz
+sha256  f262e6bd4c51015a2a3095f934cd6bfa8f0cfc46724be06a5d8a49cf2f6f8533  glibc-2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2c202b1ce8..3e4585d014 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
+GLIBC_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -49,6 +49,9 @@ GLIBC_IGNORE_CVES += CVE-2026-89092
 # Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 GLIBC_IGNORE_CVES += CVE-2026-97399
 
+# Fixed by 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
+GLIBC_IGNORE_CVES += CVE-2026-84243
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 8cef67f2c4..a4655da94f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
+LOCALEDEF_VERSION = 2.44-77-g438677ef498552b28c2060060c9e3947373f1e2c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
