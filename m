Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B3A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fKPPEWPN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E4B60612;
	Sun,  1 Nov 2026 22:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F13o4WKtVa_P; Sun,  1 Nov 2026 22:41:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA91160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572918;
	b=fazf9oL3eMat+S6SMIHuYbxrTmE4RQ0FwZhUVMVH+1Gcd1sc4zlMN6SufCBLpm3bRTXX
	 BSdR4v1bpTb61+dwK5pZBVYNEaucfvoNoKgn0pDS6W0SdTtVdVQO3FdCjm/Y/jT4+eII2
	 Fw7MFYrkY8LDYKR/McqLtF3biNvZghv7EqPqPWfSddnbHCOFSvrAIx4jrJ1dvA7m2I2YK
	 fWtJiWi2n50OAzK7Wd4k1wO10P/8nK9ZE4+Wn8fHATkEjcvBeXn5dWfC3tuNYeVCLoE8p
	 cCjmiObi8IWRA7plBubuKBg5Pba8UpHjJMFgxtsNqIv9hLC6bO4bJpbYyovxkb+ZX1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HabA7JSUSvNk6cRhOEcHKQPoJ1/VVLwIpJoiwGtc0KE=;
	b=h52mp5UPlDG3Cxc3c3cjYtkz7qbpP9fSeWiEIJ7HAsgb7z8IJBc5bGuTkapIzI4u2nAu
	 EwHL5MlEksJ3kVFlHjdJRgQuSSF7ZklRC5Sx3LhEd8HW2AmZQ4i1YgN88cpm8Vqz9sKnF
	 QeP+uNZUfwbDMVHGOgxjx7PZpkoyRMjeDsHyE7J1d3P0SFNsgqW1p4ExrVogT6cW6MLv+
	 TDKSgfZzNpSMaTBSq/vGkgysUVb2xmDf9eeTOCMDHSEKqFCaF5Ja/jvLRdXsRF9YDnlmJ
	 +nisbYiskFAOcfqtZrddHtU39nz17eoLYg6fC5aZJXj5OlGK+kujb4nfQuqHzjT6LMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572918;
	bh=HabA7JSUSvNk6cRhOEcHKQPoJ1/VVLwIpJoiwGtc0KE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fKPPEWPNWmw77HshpaQ61zr+J2ydpddlTpfOhtI1T00XFnn67owA4MwCg7nTm1JLm
	 Vm5z3WLjOD6tsoMe7X3AaAHxvQopwonWOZ4UpL0GeJ8wImxEZSftTFhY29m8PHeTeC
	 VCBGJqOTYFCjqrURZ96edCJ3Ky0VXmm3GrO60cIVeFvoIK4RrhX5hYbNFbryvV6E00
	 a3yLvm3TYeQrWUbgHaEQ4Wd2GBTuGoAra7BiIONmtKU03i0eShIaP7akDbkxTaalYZ
	 CmD75ArctWoyg/mXwiANCurGV4ExYhzRZD1Q/fJajNO0bEp5eqRORqL0gDv4GtpaYX
	 ht6IenOIi44WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA91160616;
	Sun,  1 Nov 2026 22:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6548B156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C37960616
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo5vU6oRldxN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:41:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9951B60612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572916;
 b=QylcTs4pjV/P5OJadYUo2eyqz6AaCpYV2QzTXKjE2P2n6MN4jrNQA5EUyQk4dH+QiG/b
 NQNkoWAimaBtzrZMRSAEXsb5ZwXMg8p8YBLhVr9vTSQhl0OAdqtXIxwRC6DvxvB3Ksjhb
 gdTtNYN5FJWgRJMGvCgEJVcq5MWi26pv4NcK+4tET7QKjQOzGpgI5oLe4PjtX59/Qf3O6
 F1czds/h7YQwhw8seuHctQcCL5AfRVJMIKYWcc36EzhjmxQEJ/sR+9cyiTTaJNqqUw+GJ
 3lbcO7v8MxgiUABJ5dVXuLMWynnteywyGU4v5qcBP5/UMzjH0vqqaozmr1mFC3rh3yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572916;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HvmukjtYlicEUl3I36HSW6ON8ueXWJ28njFFtTvHKmo=;
 b=sToqYh/Wsgw+oKGo1KIKnY36a/f3yKibdUYbTJ3UiGtRMaEEKwPGP9Nlwj7jbN0ibpZJ
 j/CpL2HdwQ26nwRlpP59SfM/WUOxYxxRy26r3fdPWNyUvWECwNme3TYJRGWX/MqvJ6V9I
 gNFNpmhHTTeACV7cbZwrtdK21NO6vN4bIVR0JA812VE0bCWKuVCR6KwCgGPS4XscbAwc8
 O1wR42sL9IOZ25BscumYvmR6gnfYuDYtOqUpwtDs5xzqNAhj6m1O+FDvNRQHfBP/uzzds
 Ce3jffZMrspxXACRU27sIc5fRC6pOVK1IsrRBqgro8CHkL5XpFGQtaMFqwnJUmONmnA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9951B60612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:41:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A6AE9D5BB; Sun,  1 Nov 2026 22:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 23:33:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84ab6812ac661e0f4aaf0a2ab00b54ea8f50ae40
X-Git-Newrev: c3860ebe69fbd053ba89b8b679eb986a62bfbc50
X-Patchwork-Hint: ignore
Message-Id: <20261101224027.3A6AE9D5BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newt: fetch from GitLab
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3860ebe69fbd053ba89b8b679eb986a62bfbc50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pagure.io was shut down in 2026 and is now a read-only snapshot that
no longer serves release tarballs, so the download fails:

  --2026-10-29 19:13:23--  https://releases.pagure.org/newt/newt-0.52.25.tar.gz
  HTTP request sent, awaiting response... 404 Not Found

newt moved to https://gitlab.com/newt-ui/newt, which hosts the
releases, and Fedora also fetches it from there now. The tarball is
identical: it matches both existing hashes. As the CHECKSUMS file on
pagure.io is gone, note that the sha512 also matches Fedora's sources
file, and update the homepage.

This is not caused by a Buildroot commit: newt has been fetched from
pagure.io since 2016.11, and all maintenance branches are affected,
whether they use https://releases.pagure.org/newt (2025.02.x, 2026.05.x,
2026.08.x) or https://pagure.io/releases/newt (2025.11.x, 2026.02.x).

Fixes:
https://autobuild.buildroot.org/results/929378a23fb9a936487332a6c92aef78ee64d96f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/newt/Config.in | 2 +-
 package/newt/newt.hash | 3 ++-
 package/newt/newt.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index 42a9eca729..b1d2d382d6 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NEWT
 	  Programming library for color text mode, widget based user
 	  interfaces.
 
-	  http://www.redhat.com/
+	  https://gitlab.com/newt-ui/newt
 
 comment "newt needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index e8c945e4fe..ea76730335 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,4 +1,5 @@
-# From https://releases.pagure.org/newt/CHECKSUMS
+# From https://releases.pagure.org/newt/CHECKSUMS (no longer available),
+# sha512 matches https://src.fedoraproject.org/rpms/newt/blob/rawhide/f/sources
 sha256  ef0ca9ee27850d1a5c863bb7ff9aa08096c9ed312ece9087b30f3a426828de82  newt-0.52.25.tar.gz
 sha512  23f239ff599f63fdfec83ba32256a4b4e081d84fe7844a32a9770a0776df7e200315f794d031bca0f7c3526a9730fb3f62973bad40bf96618de6e336e97a8096  newt-0.52.25.tar.gz
 # Locally calculated
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index e74f87d01c..78620b5cc2 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION = 0.52.25
-NEWT_SITE = https://releases.pagure.org/newt
+NEWT_SITE = https://gitlab.com/newt-ui/newt/-/releases/$(NEWT_VERSION)/downloads
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
 # Force to use libintl, otherwise it finds gettext functions in the C
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
