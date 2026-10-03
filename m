Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2E3CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D8740F2E;
	Sat,  3 Oct 2026 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E3vQ7bC3y-G; Sat,  3 Oct 2026 10:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DAA8F40EB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022042;
	b=K1xjz1E9FIZfjkfe/mcLlVvqDbIjgUCUtpLtt2S97LlSjKWTzzUKLzdO2dDiONQYDC0X
	 id2qolxbxUZFQJ4Ab9NbXKns8tN6e3APnONNtOpZxETHuIrwRHCUUChBhzYNN7l2y2LUs
	 MOowod61ALhI504n4tVrr2Ch+Xc+Sy+hGT78w/1DMo2HJxNATTIB/DYiGcz5CSR7pGTTM
	 aPk18vvKIlO1I7nwiDGJW2GXvaixBW5wlRVoRb+ui/OrNOz/2v+JyO1r+JWW3fk26Cxvy
	 yMrL5tZCrE945wDsOHixnt9ymogFzAVpu8vtkpqMwSGgOn9uvXtzTGMx9UenhAL4IZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IcBj0ywDDs+I/ZvAYbf0b6HyPIZ4Akp5g7u0jLloAUQ=;
	b=YG5rmSwgW5j4aWbEHWQGu7lxg2Psj/UGBUeGYY+P9YmUqFceZ6u+xNsALQQ+k0y5uMII
	 Ndmhrmb/7zeUyqqRnXCwXKkRTk2atf+v/k6qKHd8IEEoZ0EBcaMgQ5yds1TZsWEwG1s9H
	 svgvrNCjpzWz+YANWNtB0df7Mt+LCo0Ry75BjSrecqZoSNe4tOWuDOr5PsLneMYPLagou
	 o6kJAJsIzigICrhfuAPPiOWAOA7aj5E50WjE3GkR0qrk5KYfuKHuI2GUWSjpwjvCB/bId
	 9+BV1RzOyUega+Ocpt2zRJdqfK/U2tbmtLIxq/6FyUjKePWzgUXxDpFj7xKPfHJsIjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022042;
	bh=IcBj0ywDDs+I/ZvAYbf0b6HyPIZ4Akp5g7u0jLloAUQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VTBgR7Walcrx7EU30kVsqVMMfu7BfCvbIXL1VXWzrnG8Ui8tbVe9xBfplyEivalG0
	 Nyb0RaH0ncnyo/hxm2bMNXFm7TnZMT+YLkTWMGfpJY87hBOEIZVvB3C5sSvK4K9HLD
	 iEK3IEvMq0bf/Kt+UH95rqFKCofVVEoxNFYyv7hgmoMgY9ZJ1/KLq5I3BGL3uP6xN/
	 AmzdY3UiVipbCqAv/rDlWPOqmttZjq4KyrPjnIdpL5mdWIkmXPR4kIT/pThyE3S4Hf
	 xADWKrdKKsqNu1lxi1/EDhDl26T6IVs0BBvKhDskkLoijINfaLne6NkawV67ULcCmf
	 pJYs7IELTtAPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA8F40EB8;
	Sat,  3 Oct 2026 10:07:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B2E8476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ACC860E9B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VBI8imhCHPG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 92B0A60E81
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=U/37TIL3LvQC/zjhK/EKXwyzBonF55x5WMJIMDfFWt5re50Cu+k15LFU/hkCj2jj5F5H
 JJD+gFKY2+XIuJ1fw7rYCXxQOuih+KAeBcJp2jW2a+Qa4m0ewYKIE1b4eoBj9qLZMTBE/
 E+Dt6mXZw1ZW5uNPjx/lWGoqmPU3qBBUNWSX8PASmWbveid0nJ8Tewo1yIxG9a7CYyI2Y
 o97kUEIGrCxBzOB5E5hUQ68aeVzKrjLh2aBgVB6WQ1zlzF6XoduXT1Vx9Db0wYJHOlWGY
 8V5CCzCYmv5N9K5YCw9stbhdxwFE0X+4cIsT8Hf8DNA7bgTi5fy5MnIu1sRyjSRsw7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Suu48LdJafKhaTQDg3wnO9xMeGNKbHlgHx8RapZHcHQ=;
 b=DG3wkD1Gd3p3Wp+ZEgoy0JcucIudOXpr/TqzNlQG4mOIsY4O8AkWz4QNqa1ddRJjq+EE
 57RG7CBVCPhmi5LYY7mykd8+kGF1/sTj+Z5TP8HxDVN1bkN6FVxzKy5mRipHKtUzQkF1f
 IoIoG3BpD74LKBTAvXBft1xqI5z2VAKgstN6KQm+qSXQKz20ErqHJeuutisj1OApQs6YB
 pPQXKL2m4WfgqDBfj91nUYHy5YNEGGksTpEVDPp4LNzV8teCWE+ge4Je4DyeIxLsZfhy9
 nqphXhemT7WpQ0ME0Q+QaAmbMpih6QlcrtA7Hy93YooUAa3R2HxXQ0xMkxfgm84hoZQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B0A60E81
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F05C0886EB; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6d8479db6fa72308dacab4e19f00cdc5e1ba84e
X-Git-Newrev: ca05d08240534037abae328ed33256a394304997
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.F05C0886EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ecdsa: bump to version
 0.19.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca05d08240534037abae328ed33256a394304997
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 85ba70bc6f..97503f5529 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  f23885cc901dfeb73d3eb56ebc80dd56  ecdsa-0.19.1.tar.gz
-sha256  478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61  ecdsa-0.19.1.tar.gz
+md5  8071b518f3f3235e5ecb9b710314e592  ecdsa-0.19.2.tar.gz
+sha256  62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda28e4f3455a2bf930  ecdsa-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index b1ac6fe1b8..ed6b9b0ea0 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.19.1
+PYTHON_ECDSA_VERSION = 0.19.2
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f471eae4b26bd13b698f6af2c44279f67af317439c2f4c46a
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/25/ca/8de7744cb3bc966c85430ca2d0fcaeea872507c6a4cf6e007f7fe269ed9d
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
