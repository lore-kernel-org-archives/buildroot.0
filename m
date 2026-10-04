Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B585CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A6C80AF5;
	Sun,  4 Oct 2026 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7F2DKNjDq-1; Sun,  4 Oct 2026 15:59:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3925080AEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129578;
	b=SjHCJxI9GsUo2dYFIB9JzesB5ONpEEYdX4Ch7s9thsIaOrG5GRptVFsVrDGujkqXddSo
	 0AveDAfodSyE/9KkKrB0IJiw8R/Ncq3Wkrdf7dmW/QvRazufzqokJqXlm5qJ9YIOkU5wK
	 00XTq7EN1WWBI1n7c5n7jJznkH+t9oBN23DYAn518SaVV715tjeOFA3iWQ0tc7uZDWupe
	 nzD6HBktgh46cPb0jvMRN2AMtFaKzIbf2bs6DTDPt2Yx6LwWscggf9+Aq14HhacVQ3gn8
	 2QSpExQTNq0sz6qoveYgo+q15XaMP0TotNN/rdFyuGl5mH+IBy+H1QjeYYxPAEDLiGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FXVEIyZ7clBV1/Q+woLs+4cAl6/hOEHOvKgbfcNsUF8=;
	b=EBGF8iU75kmbZPDYo/F3a+lNh99kfAWbcRurYpoQfo+HlEgjNutxYUg9xFSoG/AOTdAN
	 Ou0efYT9fyOcytZgfoOWBiiyUOy+V4rMG20MtbnROBvvKS4raIoKzURj83axPxlcJsW8y
	 +7ggQkY5W7WQXCiCdyWbt4ahwCxoM2SP2lH5DcBH5YvET5BswB05SGaMIyefi5MK/b7J5
	 A6Ztcd3BUDWMsktM/+uEbzpClUaOIGVtOM8oZeZnTjYhwc0KB1T70zXozYvO9JF9j8BBc
	 fXIEZw6tUNAPujHy5ZqNFvGyH6L1hhQ0ODHFyI6PDFUXztFoBqGNfLjQKSkEgD3z+JA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129578;
	bh=FXVEIyZ7clBV1/Q+woLs+4cAl6/hOEHOvKgbfcNsUF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SSgSJrJ26IIMJjrphjNhQRqPOz69knROn9buAZdOxgpMF19NUoU+3Hryi6qmyrORm
	 Hm/3HPkFfD8gtfoiIHKZquKQQ8H2tPqNYEhbvgfrIqyp1k8vlaxo7r0O39j0eCapW0
	 lfPX1mcu583WTmpT0SwM3u1+4uJhvyw4XoBcMHlsW0Iw7VyaHmYkXd2juS/bW45BOQ
	 yF2XnQp3lPKsQcOeV7N8TZ5hrEqR35FurG7SF1V9/t9PrRUws1tI/R9l7AY0Tki9Pg
	 uO9VlTdDlAnL7WR77NzOWH9WDrUdm9aRHO0oZM4k6BIHpen06Tel7OZ28B0rCYkqf0
	 k4h/PgEozn9zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3925080AEA;
	Sun,  4 Oct 2026 15:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3021E435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2217540068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTWfb3olV6ep for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6CE8E40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=NF9NhSnS3McRrDbKd0comV/SD7MJsFoq+J9yyXrsBkfe26n7hs3Nm4is/jMZt45qismd
 F+XygnKx9M7rj9u8EntiNWNXFbi7K4iJH76UyypfG8gR0WBdcRxjMKqq8u2VUbpHukXAr
 MjLePKhfTmqJUXT3a+D7dZIB095Tds1/LccmSQE1B7eehVaTa3lDh1ShMViL4BRmN4uqr
 vh+bkTV6djreVsMJr3AZJikUcOAr1eh9qNP3AB8Rd8Mt1Ptp9oozYy2cS8viKHVlq65EJ
 ryAcFWRuAvAAqIFNLkHKqwguOsjJ21L6Zx3HkzjT4HPTtqHyF4ZcLNCIlbVo8CtVHUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B6DIziVTW8Hl/KgENQGJ6D0lgI/P0OKS19lqfJJNz3k=;
 b=oMcolPg0D/RUT9co3Yv5iHM4q/dDsFuTBp/rSk0HF/zn8IxY40+eL97+ZS5/d49WDtLo
 9NeqczWNVsV4i5nbq5QL8WGDasKgKfkdSZ6bxMocWKvHwjTmkOf4uNbDY+Vx99dVTp8md
 pfEbbr644+B5h+fm/h1oS5ReC5GrQeEGxakBZHc9QnePHSHZbBKaLFOkztvrunLLM+r8b
 7DWH9YIljIrAfirs+1U+NuhbEgTuBzTVk1wTKDHBRtABbpWN4aUm0g/w8yRD/kS/UdVRq
 fWdFoNEbfJgVSxhH/2a+j2awRd1rI6ILvR+LS+h2HSc6Sy8jMj9lNW5UH7wr9OZvInw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CE8E40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 307F58C99D; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 906b5bd589a3bb8664a36eda5357176d392eb3b7
X-Git-Newrev: 86b7c0c0a619edde1a1ec76c105b7d83add61610
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.307F58C99D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.0.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86b7c0c0a619edde1a1ec76c105b7d83add61610
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 302664deb8..6547677538 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  7ad81dd59ab8b9af8af536bce90b37e3  filelock-4.0.4.tar.gz
-sha256  90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5  filelock-4.0.4.tar.gz
+md5  0bd500192b983fb9bafd2e5a7b4e02f0  filelock-4.0.9.tar.gz
+sha256  635e7d67fa92654eed444e75e9ca18426d34e77ad9c469bf4373f75a932f7b22  filelock-4.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 97d0cc96dd..fa06e5f7c7 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.4
+PYTHON_FILELOCK_VERSION = 4.0.9
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c8/d7/37691dc5063438a448b646f6f2442b4beebf16cc0e18d8cdfa7aeec60b8c
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/51/2bc9e529f154fad99b6cd0073e609291eb32fd23581b32362d33d164d316
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
