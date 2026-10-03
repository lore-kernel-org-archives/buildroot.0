Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89C1CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E17411D5;
	Sat,  3 Oct 2026 10:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRB73NQxvct7; Sat,  3 Oct 2026 10:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA1F3411C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022064;
	b=TccLA0AWAE3/hhE6Fva77SP5LgBOl5LE25/8SkI6OvN0BfDJuvDujBQSHnpRqu28KvAt
	 xGmUtSV0PO5EdQeorQ35yjeO35m1oAwkTqYaHYtYGgxlaekEZVNEtox9xu6bRTsJvQfoK
	 l5jqn39omgwsCHvNqoPGnrMEVUwXdXhiagPRHh5zTwqz0ke2C3U4MUhhI7w3P2p2lZDyd
	 /zuMDJasV1g8RNrprVZWbV5t9u+triBzwkTZx/4UpvFioTSTM/lkEUVxL4/jpVZbrflZZ
	 fDH1JUKzaju/UPTnHFHAxoNDpekQYmlB2AX3RVJx5cNXgbrICHFFB/+Ua6hiI2jhnxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8YksoTFjpi+iDdAwIOvhd0/XE45svS8vJvXkqDJHzHw=;
	b=n2q+Wt/hROI9awTlJnqOqqMeCrbmQ57Me2PKNB6wIjecs89AwbZOBfw5dyn29Kxm69pU
	 rBd8qATA9vaPEnZ4qVFQ8Wj5aBwWZhfHYjF335aP6FTWcwlGQcE8JPN5q0xPPc4Tvp+DL
	 hYFy1nrKRPvO0mVZLGJ1dk2uCj/qqpRYbeKSPOGuOi12YbNFzi0n2i6FLmCrKTOWH9bDk
	 ahDO+yuNSh7wIysw35P+eL/CSnOzf1+HhdwhXFxgu9mxLwsWpasLgvw3FI6ZwlM6EG+cJ
	 7jgT3i0FC/Mipa5LqzRkuuKQUznHC4vunWdtupwJLzOrJDaDD/+UPFq9VEMm26s/KqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022064;
	bh=8YksoTFjpi+iDdAwIOvhd0/XE45svS8vJvXkqDJHzHw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dqcZcvowsIvgn1zw3+8MyZopXeKZiUd0uXPOAepug+iMKBjriRDxFPHEHLCcV/j4l
	 CdR+daoDrHC94GteDjv3DLd8zdFkMPtGe0RN7hSoU6MM5yGD6TuCyRXJLAqbrhf7rg
	 Jy1E6e60Moj0PN2elHEfBimFDByApPUx6BHw651K/deWMc81n3V3F8dAR5KYaK7s6p
	 iVHoCQi5TZ/zRvFBdFUft+hpyn2PTGDxInexnub8XOA8oWZ/t/ZAJZpUGMuejjAdUY
	 zj1Y2mLdZktiLstEkssA92VVjQMuwgBpd2xAo4Fo2DOb5Y3HLuLuWFCdBe5pD5npAa
	 bJ3X83VhkBjEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1F3411C1;
	Sat,  3 Oct 2026 10:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 133714B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC4CA60E81
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJqe558R-ssj for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DAAE960E88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=JCE1tDQJi7aXKPvepgVeGiGikcjAtQBxz+bRvxBzHPnTH3RklljfXmxr7REK4e85bRUh
 o8PE5dSxS42GGYBxeTsDVeG+OjQ5LsBslm5F1vfI6ssQE53WzTSZ0ypd0xu26nuLUPs0h
 MVU4TpHtShyvHNDabS+NeDNlY0QO4WmJfhO7HDmQ4fdXyAcOnNFcgERpnaTxWE24QoMaF
 8B8JGu2n8Lg7lD8Vause0zUDpVRKxgai3jzIjwTRBGRooPUD9vwE4WyDN8q2CgriOB/Km
 pQ+mq6mL6zTAYGruefLssK26PJxq+f+q1Vd0qw3jVbu2mE9WOm8SG8zQYK3Fw/xbJOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vwWq5ipfmOPxgPVLE/YEvNV6J8IIgk2uJ474j19Fwys=;
 b=Ej9GrQfcW8HsD7gy7R/IKyliTy/yprbG0t7d4v22xR4KXyASr0aWPdQ97mNZHbr7Ty//
 v/zPtwZPL/Byv83359kr47Ph7LeDWzZ7m3HOtJLjb5QQTwDDVs7mlfi+mxB1KRpdwTHVe
 Kvj3L2VtPtiytpWdR99a6vJZ+h+C0cvYaIPB1L3tPPTPoboqbMAL5ryaAmaZLjuWnpLj7
 500FfCZacEHkkFkKJIJad6O7oymzU2m1Q0LQBCyazbWZSL9WaYZdwpNbAnVwnaT+tyKUS
 WWnAqFrk7h+OMtjLrntNJdmCL4bsriXbQ8/QMBZdXkKgzBPdXIqbC43IKecWX9r6Isg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAE960E88
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44C8188762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca1487188857755f87caf47d039b2763d8fa2a3a
X-Git-Newrev: 0cf65733de8fcf9f267725c7c64c8996261effc9
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.44C8188762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 9.17.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0cf65733de8fcf9f267725c7c64c8996261effc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to whitespace cleanup:
https://github.com/ipython/ipython/commit/97d75a9a25acabdd463e279fcc0d32fd8711e311

Add the python-psutil runtime dependency.

Drop the no longer required python-decorator runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/Config.in           | 2 +-
 package/python-ipython/python-ipython.hash | 6 +++---
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 32c1f9a64e..02623e844e 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 022975d976..69db31319f 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  777fdd0c2ec7b2fd1062071056cda377  ipython-9.8.0.tar.gz
-sha256  8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83  ipython-9.8.0.tar.gz
+md5  4f33ddba6d57ba2a760d2f3436ff3006  ipython-9.17.1.tar.gz
+sha256  8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529  ipython-9.17.1.tar.gz
 # Locally computed sha256 checksums
-sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
+sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 8af5b3c312..1c8682cf36 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.8.0
+PYTHON_IPYTHON_VERSION = 9.17.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/12/51/a703c030f4928646d390b4971af4938a1b10c9dfce694f0d99a0bb073cb2
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/b9/32/99451b1283ec5d92ad77073f12e1c667dc10775384d8f15c2914207149dd
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
