Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9FA606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C+ETu2p9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E158119F;
	Fri,  6 Nov 2026 15:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vkSYHyPq68m; Fri,  6 Nov 2026 15:58:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 226C78128C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980737;
	b=YagVeCq48nkY02X5uNOEm+fjR5kUSx5cbDyGi4Q9m+oVxCyHjsLGTkQuLSOfWTMFALct
	 exORgfLv8/dywz+BeDCZBALWZvUylAG3FUiy8i+oWO7oHcXcB+wUOFgnWKAG65YuXDhxZ
	 q072ktP44aV3yqhGzo+ws1yk9fEJcouUg5r/8Kc0SvakIOs4E2A5Yp1/MxRD5vbfK3upS
	 WYDkL5T6UbyilguTVoEzyNyvKCcoDcjkCINw30tQPHQzXMWW9nfH3+dnhbcznsJFqqIuK
	 MHas5REKjyfSc2/2w+AJJWhu/R8MAeC4b1bAin4w5x+KFW+fPJ3hEVIyCPSGS3Uluow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qQRoKhJR4FStJ63VMedzRUt0Bcmtsxl/7FK1F/Ef22U=;
	b=YvXVvB35xeGmlJa8y1R15LwruCGFzWiZHCtw6F7LA6Pdpk+Zm4JczGYcTPCHnif+cq5S
	 9yrGFJBTIIo318IeqUHDnIDW/mk4se2VHJgS5tAixApjSUxAJDl/Luj7Q/EZvwpiFuEIm
	 cloMkyZGZsp4l+9wRLTlq+UaROAMpbh75cGs+b+kB41Acm0OsOi5/DYmQ6tnIcwUOdLqx
	 asUiITl12Fr3f5MMeYch9VWD2p31sOHt4RfUHJFCZw2JPzp5h3PQpvZKswy4i1Cj8/akD
	 QtzPMHoz5icx7i2A/XAwRnt2iGn+H/7RKg2In3tMMNlfRavub7p7qzRjeQGUYhAQoeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980737;
	bh=qQRoKhJR4FStJ63VMedzRUt0Bcmtsxl/7FK1F/Ef22U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C+ETu2p9EOr31lFLLs/k5154MvQkWqE+Qp1TquvLEmlHI9LaBzGOVnnEPVkJDwfgf
	 fNREOSDnCXfckcw9kJtCVd4SyN6VR0a7DYHkjGLyY9Gxadywl6w/i6xMfogjpEaAVy
	 6Obf6psnQq2B9u3XJJGvFfiWlSICRebpcy/xT+RrGwbJa2VoVdVXgTJBRT6LHdssmO
	 vHb9Mm2bdPrIkBmfV7sf/1MAPX4MiqjzvCK1Kv7yZtXEbYRDxhht0vbhMDbT1QcgcX
	 LTnI4ZMe6/9tfMYzJ5avjfOchKgRlR3n59mhHjXBO1vKS6MGaufKbEesRHDsh3Wy/m
	 c5+aqMIXXW5SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226C78128C;
	Fri,  6 Nov 2026 15:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E4D17AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FE6E4093B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HEtx_xgyDJc for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8727E40917
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8727E40917
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEF029E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 20f4955e1b93ccdc5114b2e70dc7123e6f8cadfd
X-Git-Newrev: fcf83bf91f75a68827410b45983d361fc166ffcf
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.BEF029E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swtpm: security
 bump to v0.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6799936708765095992=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6799936708765095992==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcf83bf91f75a68827410b45983d361fc166ffcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2026-75900: An out-of-bounds read vulnerability was found in swtpm's
                  SWTPM_NVRAM_CheckHeader() function

See the release notes:
https://github.com/stefanberger/swtpm/releases/tag/v0.8.3

(alternative to commit b6a653e5fc31ab9e0e0b105583a693938b59711a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swtpm/swtpm.hash | 4 +++-
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index 934d3b6ee0..8d723886c4 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,4 @@
-sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
+# Locally computed after verifying signature from
+# https://github.com/stefanberger/swtpm/releases/download/v0.8.3/v0.8.3.tar.gz.asc
+sha256  5c416e3a241d4adb61c66ac04ea46699885476c6c3aaa86011386e14fa4a67ea  swtpm-0.8.3.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 598d56cf1d..636a385db8 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.8.2
+SWTPM_VERSION = 0.8.3
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE

--===============6799936708765095992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6799936708765095992==--
