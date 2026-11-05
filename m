Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TJlf7tuZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB8781300;
	Fri,  6 Nov 2026 15:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GztLjjnvgZ9X; Fri,  6 Nov 2026 15:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A882581184
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980763;
	b=MQW3HK47cWwxKaMSuchCw5KvTxuIKMIj6q1Dy8410Lkb6M/DtdNvEDeteVWyFd/SFRlO
	 Js1S1EE/k+3r0g1GTtg6QRm2y4pWbvwO4f2WwPFm/r1X/4z1gxeVDBcxl5aWJzg7dYziu
	 55WDSggYQrRGBrqpSU2lOTQzIk2pDZAr4Ahsh2O63LA3y585eqpYcepKdUwuBkm8Tibtl
	 QfIt6/msA/iQpQ+LtSvYyo946rcYEbDgCRVCZfM39u0qU+ds6qCXqZZ0hMhHWBbGUYMHj
	 AE8rZXuYrpDl+rbUoXq3ozjtijfiCUlc0OBHclznZtoGUlf8itcvts/GeZiJIpjMoMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PPp+jtxK1UFtSyVxpz0nKUEiqEEryVXi677xAq3mlm4=;
	b=Rv8mz8uMSqjg8rXJMBY5a+et4BnJTJ9b8SCo7HQDlsDw32JnODguj/brb13s7AMR6vva
	 HKKOZxtCDSfw5Ycj2c9ZMGVYLJBcDse297YI3LHQiGrV440DpjYODOJONyYeGasGU8R+s
	 11tXzaXKnl2tFPmfW4JDpnjStAFN9RTV6PknnfmGrbrS123T31GZcSkw9oY0x+BtuFCuG
	 zo19VG+1+rle9WE2J9Pt0K9xgTHmKDx101HmC554avbI1IJ7t1Vg+eBytY1UrJ+hm0MgT
	 B5N5rcPLGaRVHWyPFt2ohAyVNwfsSFcc2iemdn07xiOrZtN+JeAjUb2WcRrU69qqIzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980763;
	bh=PPp+jtxK1UFtSyVxpz0nKUEiqEEryVXi677xAq3mlm4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TJlf7tuZ2Pol3XYSVhWkkZ020DvNvb/++uSEG8TPT2jdZ4oCHj7XDGQyAXyVpYK/b
	 E9bKa24YGuPhX0lXXcNieQrGcckd1Js6NdvuRB9Z6CU30KxB1h5LeGfVKVQ00qNGYe
	 lM7wqKBNsfY5w1MkUMCcRQ8S1ngn7Ydyo0h/lmMppIqk6He/nBWmN8m+Do3AQLuDbp
	 eYhBakP8ikbAJjiNM8xMs2Ddbf4MW5YSYjhOakHsDegrci7iQkZRHWxLmFzaM5VQwz
	 dMJVaDk7G/lX2hYu3fH7+yBFYS18fPfdJq1T82RWNPSwMy1Yxm9B9ffHczE7Z0oakd
	 rt7dpKMXy7QyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A882581184;
	Fri,  6 Nov 2026 15:59:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E5832A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D94408FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELDtxelcoVmY for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 02D7840911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02D7840911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B47C9E0A8; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3113e844bd35bf36ffbfafd4ec7836826fc51ec7
X-Git-Newrev: 9236d34291b0c59335970698e90d9bd3956a6230
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.3B47C9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/newt: fetch from
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
Content-Type: multipart/mixed; boundary="===============6194407751442170857=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6194407751442170857==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9236d34291b0c59335970698e90d9bd3956a6230
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[Raphaël: keep version 0.52.23, drop the Fedora sources reference
from the hash file comment as it applies to 0.52.25 only]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/newt/Config.in | 2 +-
 package/newt/newt.hash | 2 +-
 package/newt/newt.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
index 6d5f7c3dca..d53ea7aa15 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,4 +1,4 @@
-# From https://releases.pagure.org/newt/CHECKSUMS
+# From https://releases.pagure.org/newt/CHECKSUMS (no longer available)
 sha256  caa372907b14ececfe298f0d512a62f41d33b290610244a58aed07bbc5ada12a  newt-0.52.23.tar.gz
 sha512  c845d03946f72a6b46301152d7dc308f71d17b03d255d73d02ea7deb5392e22522dc8504f941fcffe5309c6c10f1b56742dac8585a16b0dc7e0c463f18871dda  newt-0.52.23.tar.gz
 # Locally calculated
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 652520abc6..c80f7fc0fe 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION = 0.52.23
-NEWT_SITE = https://releases.pagure.org/newt
+NEWT_SITE = https://gitlab.com/newt-ui/newt/-/releases/$(NEWT_VERSION)/downloads
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
 # Force to use libintl, otherwise it finds gettext functions in the C

--===============6194407751442170857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6194407751442170857==--
