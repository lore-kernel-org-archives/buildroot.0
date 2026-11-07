Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA2606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IR4GfXVN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26AD181244;
	Sat,  7 Nov 2026 10:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TttAO7DXZkOA; Sat,  7 Nov 2026 10:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 420338122C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047409;
	b=VE0IS2D8obp6UidHZll6ts59l/D+FiVPDlVGgvBqKsQj2TRYttaeP7FH+PflwBytmhnT
	 EqPhxSdOvtMRxBp4FOGaBjb2W9BGSZfOozGDjXBmFzS9sMkkhDNKJVXRDVtBgYdQuD3yG
	 MUPN1tC1lFq5BlObY0GEnYfx85BA+3ErXq86OVfBk6869V5MK8dtPPRNnKNuKK4MiJznE
	 QKc9Cj1De3wEgrRGg7kWF+GLuTUsdztTXUE8BsxGnrjC+tb5inff0A/J7rU2AJMCq4UIB
	 lAaT3A4neJGZCHbGNG2AyAoIoX7qiCmBOol5SJHaErs2SA05baHCWsmiaL3j5QXcwpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=njY5swwHg/Evj5snTPnTd8jyLg6vjugDtksSYaV5hSs=;
	b=WFxNkBymdI5HH6aIloSPWN947zRhi7HJwVOF8lgiATZQCGcSmiGHIN17ROSNO1/no2uJ
	 Pe3BymgfiVYr9xWaetXPBvkt5Pp7jiU84HndjNjcsEOtbYPHiBDMGvDWi/6rnbYdizeuw
	 2qQBFvplbp7eFF/Ixles9IKFJ4MmPJvYsGR1bVEZC7LNfamgS46ybVE48hE4cOt9iJnZQ
	 CKoFCDGYNixxTHlQ0sEIi/V3FEVVYKUDG5IxNm7ht3dfyBtCfHKtcKSAnHQtURNpLJ4Ea
	 23p3X6Mpo7ErT8+eKBEXeyhH5T/+LoqJ469hR33UQjzWlfIXYotP6aqWv8eXSjeSvvQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047409;
	bh=njY5swwHg/Evj5snTPnTd8jyLg6vjugDtksSYaV5hSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IR4GfXVNcP6WwCcLARKGwOGWDsTJPzQAeLMAg+jmt8/dFJLE9f7+gUKV+z49MB2sX
	 qXDiXdcjRFW6TG+m3NesYWHz3q3yfqWd950AicpQtqqc5GEuCFBGQlW6kEel97ZbzP
	 45V+BHbfdkVGlwOnitZCEB4EWK6yEXGggE4B7O5es+V5hE0M19Y/IQmQo6t0P/wIHG
	 6Vpozr4Zv8VBrnTEoIXsavc9q3gF6tk52J+VR71rH6WdvI4rMW8ge0HycioDOupc+/
	 uf3atxNlARosB/pwwD8p0srwl9T2w5bLN9JO+qGvtpkZM/yUEguDcqAteW5Hotm/1j
	 Y7in0hDE5V13w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420338122C;
	Sat,  7 Nov 2026 10:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7E40A64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95833606CF
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DY79lTKR6Uc4 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EDFE606C0
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EDFE606C0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 619F08B568; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd7cf9c5e4650b4199d81bbd1093072aff0d8491
X-Git-Newrev: 8f0e8d3d5955a6e806984498a5cce9be46a9a0c5
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.619F08B568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: bump to version
 2026.11.7
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f0e8d3d5955a6e806984498a5cce9be46a9a0c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 6c762af95a..15b6be7949 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  118d130c65d0c98c7dc183433362ce75  regex-2026.9.29.tar.gz
-sha256  8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb  regex-2026.9.29.tar.gz
+md5  808b0decf8105ed89a5863dd3fbcb966  regex-2026.11.7.tar.gz
+sha256  8eedab0d8ac69b0602628bc59ab559d09007ff3bcd92aa740e62b10315403007  regex-2026.11.7.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 713f81a306..d82fb551c8 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.9.29
+PYTHON_REGEX_VERSION = 2026.11.7
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/fc/f2/af1da9d3ceed77bfcdce40427d49ba0be94e4fe84245e3bfef68c10e75b6
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/f1/54/e3bf7a314a5e5d0bab5455cfcfc7634ca136fc8b249a7c15c829e88b00f2
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
