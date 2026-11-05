Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC0606A9BA
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HdmYNktZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51480816D9;
	Fri,  6 Nov 2026 16:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q95y7ZpIRHGD; Fri,  6 Nov 2026 16:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 587668165C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981349;
	b=A2+vBgLAp+/BEhxFE6gQwNtm6dv/qi5x2NKQIvIkfCS1xV0ViWD6l1dF05ThGWQtuqte
	 BZYIOcyrSAjiRGsQM8WukZAQSbMbKX0Z0GHe91pGY5aqCE/PPqcCMvtckkLwpblU79g+8
	 Jp/HShkR6r2VcBzW+vWil1YPJV82JM3JzmCqvpvy8b8y4MD091enbCgFQ8BufvkUSpg0S
	 cJkURPic5At6QLOq88wXEjP7N7B23kDFHSIUTYDgZgQvnbVTEI0wBMXfUnWTDi0Ow+SDT
	 L5vjJiyvHnhuqDZK/fS5wj4MdDwdI5Tf+bsQn3DrNcIYjXFZBgvHcVvYsrjc7GPQiQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EZVjbZT41jTM45kax+dDtVfzioYAz38JABkCFELziGs=;
	b=BJdTiAjOqHxB3KZvP8Pi6eAblrF16gNFrt7HUI5Lvw95Xh32SRKtGWuLSedthwTBCOCX
	 zLTIfz6kXC4kO/Mt00dfF+k0a/HU/aN0gE3sCr5ftQvbA235RJgo7cU0qhd568MIjO1p7
	 x3dY1XXvODDlu2BeZBgD4GrYRP7BerdVTUecLmipWl/LlhiKIwY6XfGVizV4UypMtI9hd
	 rF6dSx80vTQC5b7NwD+HiQs00ohN1QxddX+fUsjGJe71R2F6nCWRVlPrvuos5DsGvZ1lF
	 ZmZe/R8/TqSoGGsFDR9QP5/Ose243C4m5dDd3o1/JBBKTR+1qUrQ93/cvuekwmo3blg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981349;
	bh=EZVjbZT41jTM45kax+dDtVfzioYAz38JABkCFELziGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HdmYNktZQLtLyagg/QaR3sqlBO9iJ/catCnux8roiAk54El1yQfCOJHtryxdCWyg7
	 uf+DS9X2+wzMy62Cl+k3sA+vidd5RJdqlOG7uJW5c9ufX6Rp55EILk4Y16fGMERU94
	 TwDjpb8XqeNFCD3dyKd8RCdNo2wLPmxDPeyrU3adx0zQcfGjNwqDLyknY8PsArEKWw
	 jvRaNciPBG7vxWgEWKkNYNY+e2AulL5VWpjakyhbMpqJEuP4J5G5LviSvIBjDo99rK
	 ePmI8KQ6Cp8odsb/xneqtS/cZm7AR10L1b4F5yNKhzqmtU5IR2ejNnpUnMiF5QFabT
	 n5xBRXoRci6Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587668165C;
	Fri,  6 Nov 2026 16:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 825CB2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6861A4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bB3tz_XkEbBP for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD69E40913
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD69E40913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2E019E09B; Fri,  6 Nov 2026 16:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6d6d6e9e5665ff9ee0ff89ec22ef228450b8ede2
X-Git-Newrev: effe3f0962db972eacc9be911eba28752d3113c4
X-Patchwork-Hint: ignore
Message-Id: <20261106160705.F2E019E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: bump to version 4.13.4
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
Content-Type: multipart/mixed; boundary="===============6090249360606139446=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6090249360606139446==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/effe3f0962db972eacc9be911eba28752d3113c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 8f2cab663b9ccd2c3b32a0bbe2c0749a3a82b73c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index b9051298de..4948b75cd2 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
-sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
+md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
+sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index dba59abfdd..2e543d68f7 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.0
+PYTHON_PLATFORMDIRS_VERSION = 4.13.4
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE

--===============6090249360606139446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6090249360606139446==--
