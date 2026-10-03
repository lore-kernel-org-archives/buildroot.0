Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A601CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F71816FF;
	Sat,  3 Oct 2026 13:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZpfefr97yug; Sat,  3 Oct 2026 13:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA869816FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035871;
	b=J3moZfTjgnt50Edxh97SAnLz1YDul+UpplhhN6A7ik/lZt8LvqqB5qos9Dgcis77DYzx
	 3MF10N6fCkAPYhbU0mzDwoCTRl8aai0HIDCpD1Iuyc7Fq58fbBuaODs2sggK2HyHx102L
	 fkhqgqRtmIFVhMqJ/kUn0MjJ9oAGbzATuR14IUu0ooMGg7E4siDJwu2HrPOcXt44L5nmo
	 Vy4EP4DQVqcES0UOatexhOqkc6HpAL1aTTqN8CgjBgQ5p4ciaT3PHDk+icTAy4q6FH7kb
	 ngiWW4VskwobDRgUsAXUchVU++LjR9VGHJ5ke9/kJv1uNN1wGLFsqgnkRGcOdG43s1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=acYALEArpEnxpqaV9n4fes/ILf/YFgECkAA8gML+6ug=;
	b=KpRSdwQsUA/418CIzBc2EUO7MoeEYGMA20qjHcv/4tSiODdiKusFvB/G/7G85sW+Bnt+
	 O65a3HIhnOghATpTIA9GbwfP97q8j/bjqngO1VTgqtnbkCPH09KZYSi3FpfG9nFm77gTk
	 UIWtDC1mtSEBDbA7HdyZYeawOif98vbel9zwPnSrubXhEkw4IZs09qcjQ49bTcoYMJRn+
	 y9nCXR14KXBEZ41h51XANT5dAUqTkYXdUAMb015UVENCI26ooFT4x+cu6AQHWjKp7+gWQ
	 9Iwa6pPr/FobtSTsRQODQzw6NNa7bqGBrYBbf4DLG7wuTLZrEld1wLh885MxKTrl7tQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035871;
	bh=acYALEArpEnxpqaV9n4fes/ILf/YFgECkAA8gML+6ug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n3LZbrJwlGRnjk5XTlkX1+fDdVqlxgQQW9P9FubI1qntcOYwxIFXxWE3OMOVGxR5I
	 wrTZNEHzrCVcyOH4oeZpe9Rtxgoc0bZlOEZ/1C2CyVSoHQrIIBYufssDAV+zsUW7Rk
	 kO2WgF/Eb4oJ5yXKYc3fMTwCIu20idqPqSu4WA8ooXatWUWhwXMJ/ALv/NKdn5yc0A
	 m/IRWWRe4AeNc2QSh+mzRqmP4XSNALeyY48DR+hjAXbUofFZ1k4pOF0PgC6Rc9nGoj
	 pkFaVjPQYrRMU1rpG4hJ7ai6u892dnDxn2P+hO1GvXoIKkCS6izisP4gYqTq4jepJP
	 pwDPyNB6oF6jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA869816FB;
	Sat,  3 Oct 2026 13:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 321E5A13
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC719414FB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbLu2RK1KiQG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61F3A414EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=d4QIgIc6prJab+KRoZbxCVQo8lPr3X73pCivtT5GCHEHyZGym/e/6bBAQaUGFV2DvUml
 UdCBZ+PuEB97+9ro5SKtLsrJLEnAhP+pztSVU2GYY3TDnJM1UBNbVDLO+VFjtaiXI261F
 wT+IN1IclXaaCKR3Ez0WZxyhq8nE3uOz4enwoTO2JMt2Kp73IocMPliGOTsoFx7ORLwnd
 3SgMqX+P9dyCNyAnux5BYLxP9O5SsmPWDbjorIBNQm8BWGBinpyAxaYxX5lkKYzPH2kTY
 IVkMi5ftbZZHm7DWVeLA+lVl7nneYfyOr43SkcKR6n7a/yiHuJsRV4Dfo2zB8bglQ/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wfO+evVKHdxQOtnE9d7++TPcTVou+MaQpmmdngl4Vko=;
 b=eM0hbLTc+vrPUPm+IWOM9e7MZgFe4udVc3OGWlRx1XUq894s/X0jlObG5Q2XAtbBBrH4
 pdEfwTJACoEDKIpmUr4PmLII6du2rmehIIN4HQ8ynmww31K9tjsZU5yIUujPq5IPZKq4t
 C202wzbqTdjUBcgX031BJI1DQZOGCuKHtNG3uu5HuldNOKC6k7UFapODkBBfmyYvZ9Y4l
 WX5bXzBtj4iBe2Rm8oNxnnC2OqkaPa0Ck3pMVHx7raIQF8OZ8tbCb4k0DPb09ULPqPmAx
 GY46BevE/LVqkvefHJatfOUtdM34hImQCRP69yML+605B0gg15Esm1OPw3ZruRCSEfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F3A414EF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACD5088699; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a199cf5594d67cd91fcfbb5408530bf7afaa2ee7
X-Git-Newrev: 58ba800c62ce183eadfe216a25826d0efe3f2673
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.ACD5088699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspection: bump to
 version 0.4.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58ba800c62ce183eadfe216a25826d0efe3f2673
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typing-inspection/python-typing-inspection.hash | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index 71ee5943a8..ba13d7b128 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  9271faadd8476a3600e9cf9d428d812c  typing_inspection-0.4.2.tar.gz
-sha256  ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464  typing_inspection-0.4.2.tar.gz
+md5  9eb41f5bca1969b126f61febeb516a51  typing_inspection-0.4.4.tar.gz
+sha256  547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47  typing_inspection-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index c0af54056d..74db189565 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.2
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.4
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/a3/26/b09b8010994eccc3c09092e6b34058f36a460eea2d4c3e8b910c695975a0
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
