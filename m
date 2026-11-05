Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1E606A33D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pQqOnk8q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDF0814C6;
	Fri,  6 Nov 2026 16:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubB2w1Yb5kso; Fri,  6 Nov 2026 16:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C8B69816D4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981350;
	b=kOIF/2n0FUzW0PJsS1HWwgWFYX1y5666rGvJymOHUeRu+asYG2nyDLJOckFWXMlELFBU
	 5M2QgbjwBOaoqT+riwuTz6xOcPBNz+0xTDm6x6Vw+ZvESmNe3RHjJmIPWfvnxbkOBLgry
	 /dfr4jouosz2jb6wRUzua51fNI4txmsFH5awZQ6STW3hhv90oYVIyCcU1ojCGqa/8366U
	 MOpMsaIKTL+wzLVizrS04Y79NYE0wqnThHK+cDM2u1VJzgHUaIwS/mkjdmgxRvWT0d9YV
	 uvlqYxvXMMHOncipdJU6ctwd2VxrTQr+Jz8et2ei6NJr7PrdztSjpqcR3runHhdRjJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981350;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gwSJNI7st/J3YVYCjOKtXGRy1ueU6TakHlJJnv5VuIU=;
	b=B8Q9ESCPEEOPsppvWI2T6u+Lw5Cu2/JN+jjokNdc4VZhMLH5nRuHOuLhfEB5SuWErRgu
	 t5fll3tH+sBv4FL09aH+xArLFr9OoLhweRGMq7BrZyoMfpjVP8zvrxQJdGGrMkY8Ah0p+
	 7CcvA/3MYj6lwMg8beGoAhOohGFya+VVbPrgfMkOQRDQlWKm6ZGZgwmkBktd3kbOT1kwp
	 yuTFNxeD4evAcK7SI757v485xQ0ijtcfnwC00sviD8W25WD8jW03ex8He+XI67Ezt+aXR
	 ZnyNGbZSM3sQqpgvh+GGcCfDZKx24aUjFY87wi4tWtIlsKtLDutPZLONymmNATOnzYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981350;
	bh=gwSJNI7st/J3YVYCjOKtXGRy1ueU6TakHlJJnv5VuIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pQqOnk8qhsF9EUmVguTTk9dwPJzQaFvx2rX0hruZHc3IGY1jR6e+VRqTxrYe0EqsB
	 dyNbVhCeUCwJzTNt2miftnhX+gn5yGapjuukM4dHGgH/iD3nU1J4l/85FA86K3Vr9I
	 xRn5rvl450K4ZSFooOrroBkHShZZmXLbHImJUzZAlcetm306hZYQYloWCYRYNu2mGc
	 BvzQnqjw3c7/zk2EMbUof5h5HJ0bKwj+dfT/Ig6uxl1Cj0ik+EvmXwwBFbqgkf/axV
	 5OnV4h9uDuQpz5wOdTPiBVkIqLmIISY+kK7nDyi9GRBFSroXpTOqtAOgqMn2LsXKiw
	 yR9qoc8RQcsHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B69816D4;
	Fri,  6 Nov 2026 16:09:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBA82E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DE7B403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pG_HhhBAHYK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 00AF5400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AF5400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A1FE9E09B; Fri,  6 Nov 2026 16:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: effe3f0962db972eacc9be911eba28752d3113c4
X-Git-Newrev: 372a320424c5ae74aae568c030dc6d6a0a956632
X-Patchwork-Hint: ignore
Message-Id: <20261106160708.2A1FE9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: bump to version 4.13.5
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
Content-Type: multipart/mixed; boundary="===============2063736813279246322=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2063736813279246322==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/372a320424c5ae74aae568c030dc6d6a0a956632
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 83e29e2d24067fd67331650c25106defea108ea3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 4948b75cd2..641b1e62f9 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
-sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
+md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
+sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 2e543d68f7..55aae1e1af 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.4
+PYTHON_PLATFORMDIRS_VERSION = 4.13.5
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE

--===============2063736813279246322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2063736813279246322==--
