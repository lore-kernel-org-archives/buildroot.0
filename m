Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66788CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F51641142;
	Sat,  3 Oct 2026 10:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2Yl6CQa49rm; Sat,  3 Oct 2026 10:07:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33D724115B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022047;
	b=ThmDCLvV94aEabRy3+pSIFfgmMJu2ZjE0DYpglM10Ry96X7JLx8fJJmexrXT5/2tamIL
	 FqUHTvts/ADaiONUNOn9oD0zhs+k8EXjUtVQS3CH5qAxtDp5JKbGRuv0eTiTsHakjNTv2
	 D5fKGwYGhaA35ERWNAYHPR1TqbVOk0IT/ZZtd60DcoO55uw1/ew11gOXEw0k2aoSLtkqq
	 gydPDkrhjx8fTdWCIqQE10+rpW8Hz+wXzZiWGOt7+LfhKoKeaUtTv/IuvJLct1Qpwci38
	 MYxymAL5woCfSgFv/h2WJQOeyP+536CZVDxPiVjon6UksKKaguuneBeBKJtR0XbhfWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3nAKFgTu+xYEjEnKEFT8+BxRK4tZgi+i75Z6Rth4mNE=;
	b=YFvONnXlaTvZWIb2/B/aab6fOS/WrNMsRKy590Uc/YbAmHxhthYNePA2LKW6Bv44+1S/
	 SZ8vZ22RpqhDwi+pN5aZwmonDk2ug3Nvw9av+lbde9dTkHAQQx+jTi53mQS/n1D8Gbw+q
	 h8TEN0InLFcYG39n/SYozk9JefblUwWN60Rewjp4+OWnLF//6xeaYfI/M/9SeJNZ+NFef
	 rAU1epMh8xRLWj0oKdS/nrBLb/DcFicCOSv8aowZTeannnw4HeT2Gj3A25aJ/Oxi8F0h2
	 1lFGi4UujZfskx9vV6U4c9+ja7PudasOejW1fH97TxrTyjZiX1isYWDYMadzzIuIFtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022047;
	bh=3nAKFgTu+xYEjEnKEFT8+BxRK4tZgi+i75Z6Rth4mNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mNXMIlCJ17mNb4ssDIPh0aN9cpw4BKp77JdPvSAd25sxpJxzhPHsmOibtmnQlCWAk
	 g5IxQNGlHnjgcga832PjpSeXltmDSIXPO9itQrAGF01XyK+FLHdLI7vD1OhdGmPnyX
	 93Kp6K5vvZxjfQsv3sCSxhMFvrrs33M8TolTphb8DHK3cxovgGq/LLZeZstUu0jvnW
	 fKF18b7fVBLPdWZk2C1lNF1p0/kHnXAOS59MRdVrBhI8lr4KYfFnIvr3kfyeEhyA++
	 ZeOuFuNOSFBuimgZWa2O88bhhwlX5czgNL/02K9vZ7m5DuZqWYeo+UPN3riiXV6kte
	 5xUoOznE/Uaxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D724115B;
	Sat,  3 Oct 2026 10:07:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF979DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 127618122B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzqAgUrx1PYq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5FEE78122F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=oBP89MOYJkFyQ8/4bDbfcKwIKM9mxunp+e2dYLELsk0kbfCVYL/HjHi9wTM87hdli2Jo
 7VXHHsE2s50gpMiI4J6YeR53gjCx65JWC5+pz0cBNVdGkysZMGShHl/EbKIGrmIw5nDmC
 n1nA+DDwgOtRNs7XrPCfB4P+XXITgW3W5+eAvu6tOPe+wnA/7uELChXRS0SLFEBLTyTRM
 Y1Hz0RXmbf9X2w4DwQH1CfFYcnB4O6Bg1amtl1h83qPMQEeYoATYjlnK5iraNyQvZb6hB
 5n3UbmyVrFZnuZ7BV6B7bcTGryg2yf0yTnRQWIWnld/5YU/gW6V5dI6nai05rDOmxug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EWY/ixh8bcGXeXqkMZOUTBAivZUVPmTeFzL4M7ejLJY=;
 b=XNvk9FYsbp1oB3f4PBzd8MpDgvieY/DN6NOGSxZT6U2d72uyzoohLHIz7rFR+8SJGxYH
 kx8u1lvsJENDn1wZmTl46YfQyCL/N6XQ/ng0h/IIRl1Cn4sumS6tjSRYdkzAX8rcfTpYm
 yLmHAi3Jx2tSyeURYB5Si/5qC949uIvLhW3fRkmvzoiwXzYnnJV13fL3MJV0J1VRqbYCy
 XxEbLlpCENVmMF7hb3wNDGuzHV5UwmbWb52ElhAYH7hZVDjFe1NlRHKsqRG2CNDRiexuE
 v7IQnlVjFZzdim3EIXZK8IQDbaBJ9XktM8eigyW+GGMCcKlizbcpJ98b8G3/2YxNBGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FEE78122F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BECA188801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c57957318c33414228ce7c46c3dea1e31f184dd
X-Git-Newrev: 93faa571dca6d169d36a0f89cf55908fde55f79a
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.BECA188801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psycopg2: bump to version
 2.9.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93faa571dca6d169d36a0f89cf55908fde55f79a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index c72759f43f..20c3abc170 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  ea0f76b3d0358db5d8ff84e18c4a7252  psycopg2-2.9.11.tar.gz
-sha256  964d31caf728e217c697ff77ea69c2ba0865fa41ec20bb00f0977e62fdcc52e3  psycopg2-2.9.11.tar.gz
+md5  aea3199952c6dea47c1e2fee7341554a  psycopg2-2.9.13.tar.gz
+sha256  d36784fc2dae69523ba4b79c7d1d1b4d6e83e87836874f111262f4db940b16a6  psycopg2-2.9.13.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 689788c2c0..d597f5dd7e 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.11
+PYTHON_PSYCOPG2_VERSION = 2.9.13
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/8d/9d12bc8677c24dad342ec777529bce705b3e785fa05d85122b5502b9ab55
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/91/81/6ea19b8b28feb9405c8c87a307776614d6e404bdb98467d1ce10a39d2c1d
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
