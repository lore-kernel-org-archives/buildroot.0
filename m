Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D93BCA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6928781509;
	Sat,  3 Oct 2026 13:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzpIAPpiI_SL; Sat,  3 Oct 2026 13:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9168280E87
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035840;
	b=JkkQYyPnMMIuajF81TdYpkYNRGJm0/TAwfxh9PSNGX3R0cRsQ9/WvxzI6o8e0dDrLl7k
	 gk6bWvyl5kGQ8ciCc2p69PGchTQ/Veep9ULzE/whR5+kuJasmWIHNmgS+TI3tZQwtdWo9
	 l7Af6hqbCu8rawxz4x4XMZ3XV/wJ6/is2j4g3LRirWxMrjhWOMkRBrmKg9+3cAUnNS217
	 tYvYMhosNI167vjJ3d8fPA/ukSM0jlYTnFUXGsaZLSbiNW0U6LDFDF7t22MNRGw3q+mtY
	 2Y/yydvLR6jUPrv3VvIxSN7c8pWHVBf0eyT5ARXbVSZ4etH6rBr9vzaTDlEZqcnwDag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ss+2vKiPPAmPB1tGpVGrpNNaRKcPUUDf98X2L6+2zDM=;
	b=Qyn1anGlhleF/OudIAj270CyJQ83FUkX3xG5CL58T74SaBufT/2qIBhrYQZ4V/iGDoO4
	 a/TBbggYW6y1dQ/9NmtubnTmaySov/ofMr9ntqkAYg/gUS48Kan3huEB50E0Uxnh9biHr
	 7ivEnWkcD9XaC+8NaMTR8ejrS+ea3coYjxztcp4S56CYI2bdh640HKytdj5JwxawhZ4Oy
	 GRhg1v8BDZU8Jtb1vB4x4xQV1LQt/UTFQkVMyIhWkfuX9nxxf2CRbef2Lix1C0c00HUtX
	 RG1tBXKswoiZfnf6o0Aq9pyOER7Btw5jVLO7P9sN/Ua5uFU67+O1KnculUEzYeGlwdQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035840;
	bh=ss+2vKiPPAmPB1tGpVGrpNNaRKcPUUDf98X2L6+2zDM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sb9HCbaGtbwNdud6OYgYxDFmmSm2BBqHuGXK+xFquYyocHZfehYDOPllo44ehWvS2
	 wnE5s5rDZwXStKI4V54eyRRcgjFkMrflxhC3yEMyvhlI2F6QVKHEDD5/DojZ+Kz/PC
	 U7L6Jn/Co6BwlJO5+CCQ50favI3uyQvYDDTmt/9kZNTZGoD+I1m+mloNZ5VAFpEhOC
	 YY3y1YmRImDMprww6BFF4aZpQLADD0agJ2NEO69gLoACOD5Q1v7/iq/Tb9HBLPksPz
	 13oCkfYC+FyCYmpRejlHqmC8EfsRmGQgqXAcWnM2KWJK2Cw8yVFpptTzqyOF81ra7g
	 aMLzQ/uhRkjlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9168280E87;
	Sat,  3 Oct 2026 13:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A2C32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1B41414F8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bea3aeT2sDf0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BFF95414C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=s9QkVC8jh25nEU8FLjM54Y6bsGodZ+BzWoepGMYgwCFvZ6x6qXS8EIC27htYRNUmXmkb
 QQ/vwQ7tTBKaENiqEVAoxtchwek+2fkVcxSWLm0S8MWXiyEJudznKvQtV6mU/icixxd5M
 DH9LgU3wLmx9eAWk2gjjGEPMPLmE4K5craE4NotEetyjMFZPAo1lXQF6+WaC2zkCPzKm7
 iq/gD50UoQ7MLwmONIxJL309xx0f3/CFH6Z5qqcnBAv1EST/e8P8QTc2Y6WbxkQ7JSVQq
 JCQCY2syT4Q+DqsWIhj4Gesm0yeMQ0Ee/2CrY0pZhteBCjoEnUhRK4g+lT/jX1dIoow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oGhoBVopRwyXlJmqNaToBoEHItSfREW4KSxxOxQ4svQ=;
 b=K5q4fe5Q+dNUVKkgYEAYdjyuMtm7rOgH0YRu0fDMEnY9kEX8dAy7ER4RYg8UFECYTL9d
 /9VXuWG61UA2/09tJvMvefvumDIQlJtMh1JsyBR6fhjp4swlVV+B4YvN7UmL7Ga3luq1q
 tN6Fu26jomgNs+pvCP9EdtwZU0Gh7evWlLCrult1v6QqfXn1KOgijnM7nvw2S0UVk81fO
 8QVvnYsoYo1E8EqdXYXYkwOcF+2h6Shw2Uf7xRNrjS6PXwJEyGSdHvUXAx7yslBClBL5/
 As3RhcKt0tiECB7H58EzSwVB8AaKg4sU1LB+8iDObdt4o3j7+FdEWU1pzjxOs8R7hCg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF95414C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17A1688FDB; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4335317229da13bdc6322b52e23bd91e56bb2f3
X-Git-Newrev: 6792e0671aa98585125ef3f9eb1f953887544f4d
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.17A1688FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyelftools: bump to version
 0.33
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6792e0671aa98585125ef3f9eb1f953887544f4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyelftools/python-pyelftools.hash | 4 ++--
 package/python-pyelftools/python-pyelftools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyelftools/python-pyelftools.hash b/package/python-pyelftools/python-pyelftools.hash
index 7c0867afbe..667b57da2a 100644
--- a/package/python-pyelftools/python-pyelftools.hash
+++ b/package/python-pyelftools/python-pyelftools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyelftools/json
-md5  240cf39dc5dad992f25cb5a4e4244f88  pyelftools-0.32.tar.gz
-sha256  6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5  pyelftools-0.32.tar.gz
+md5  fe803bd1cf061e5330660a103d9c82bb  pyelftools-0.33.tar.gz
+sha256  660d82dcbeb8e83d1702bd97f223f761625da06111c0cc988eac6b8ab0c1b61f  pyelftools-0.33.tar.gz
 # Locally computed sha256 checksums
 sha256  ae18bf4cb82f92af7547259177bc28bc48e4fc732518bcedfe690226288d3445  LICENSE
diff --git a/package/python-pyelftools/python-pyelftools.mk b/package/python-pyelftools/python-pyelftools.mk
index 19fef11515..e2d56991e1 100644
--- a/package/python-pyelftools/python-pyelftools.mk
+++ b/package/python-pyelftools/python-pyelftools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYELFTOOLS_VERSION = 0.32
+PYTHON_PYELFTOOLS_VERSION = 0.33
 PYTHON_PYELFTOOLS_SOURCE = pyelftools-$(PYTHON_PYELFTOOLS_VERSION).tar.gz
-PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/b9/ab/33968940b2deb3d92f5b146bc6d4009a5f95d1d06c148ea2f9ee965071af
+PYTHON_PYELFTOOLS_SITE = https://files.pythonhosted.org/packages/a3/11/767522582afab1b884d277de0e6e011640cb9d7292a38694b4b1a1df1ae8
 PYTHON_PYELFTOOLS_LICENSE = Public domain
 PYTHON_PYELFTOOLS_LICENSE_FILES = LICENSE
 PYTHON_PYELFTOOLS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
