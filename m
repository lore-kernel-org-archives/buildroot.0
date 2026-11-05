Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B279E606A336
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=shkQehd5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617DC81852;
	Fri,  6 Nov 2026 16:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVIaO5CYmeOT; Fri,  6 Nov 2026 16:09:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 22F89817F5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981373;
	b=VqtaOLx0wM6crbRB88dTeb7x2zf1v8uIbsJ+d6PBwjCm8yPxUdh8pX/NAntH6aAuJIHu
	 Xvfjq8U14WjYQQQfMwEH/2sdkzjAmjFKEy/OsgoL6jsbLsPnphtgur1CU7MxsTMYcedi2
	 RP51y+/V8Gpn7YRGbxHhY2u9G1BegvRMBtDQEoebL20qgd+c3qUE5c/PcFqA5hyBGZw0g
	 oIsK/dYqEaESx+dv1l3DJ++8Ve3JIunGl73phgA3h96CKIdoyAug7kyYr9BAQCOrP8fnA
	 zEsCNY/8IWdjwl9nld7pIJQfviAlEttqoFP4+/9LbZ+3L9eyH2LYAFZWSWeKmq7lFXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981373;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oIDtf4iiIwgcu1u1iz0A1zr4YAHbHOoldkDWCjNegMY=;
	b=PnhoLbmtE0qr5YMmmlezyKDHYo0+eINQCSgYCLskhyEs0Lej02DIip6Quzh1FtiUQczd
	 sFylHiLCBwY7byn0BdUifHrSgECgvU7XyTPGpTFAg4OHc+YEe2oV/dnDLT5HhrLRKdVc8
	 WQFpaMy10XsAm0A4VBVYXo7U1yvcEyvbGcwr2yviWsb2CPfFD5RrfXl+c9hY9Rfha59nb
	 TAFPMz/nVxu5OKuCtmHpd0deN1LJ2NK+KfFGUWX5PCF+qN1zZDd/SlZHNiaLFmZ0oSRqv
	 x5sbVue9gm6V3Ys+E972Awcp4X1HWw/i5j+UHHrZbGHkk0F0mi5i/BjVebFbYkS2J7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981373;
	bh=oIDtf4iiIwgcu1u1iz0A1zr4YAHbHOoldkDWCjNegMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=shkQehd5cDdSEMLIYMw9hjZ9GmENA8ENg5hDJqItG0Tw5jRmTevmAbIy/x2gL/fQG
	 pZgGGx9hgNnjBLjyvlZmO/a38L421srbu+c5Yauy87onAmRkq7md0iVmt8zRnd+oRx
	 UJM7hEz3q36/vXLmCvC5SBe3TM41d1XM8vTAF6SSSnuNVPOaMtnGSxVl9bvCdbbuXq
	 Rg8T4Ri9m6uE6Rh40S8H2+D7iU1mjS0eqhcaIbi+DBUNFAikVQpEUcvniL9xxkuuWG
	 wRWSgMl4ODG6+meJ6PSD2ozjN0EGIaNe2cqlGhR6bBK+SmNlY183kY/xB43J+CBflR
	 krBal4qilSFNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F89817F5;
	Fri,  6 Nov 2026 16:09:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2EF2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FFC160909
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqLm819o22Gb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B5042608F5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5042608F5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF4369E0B1; Fri,  6 Nov 2026 16:07:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:59 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4f3ae18c6b56e83be34c50bdb009957884bc7f1c
X-Git-Newrev: 9f07c04c767c45f9a243c21870538d07115a1f55
X-Patchwork-Hint: ignore
Message-Id: <20261106160711.DF4369E0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/newt: fetch from
 GitLab
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
Content-Type: multipart/mixed; boundary="===============3441273116250800233=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3441273116250800233==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f07c04c767c45f9a243c21870538d07115a1f55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit c3860ebe69fbd053ba89b8b679eb986a62bfbc50)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============3441273116250800233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3441273116250800233==--
