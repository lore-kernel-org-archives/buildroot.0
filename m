Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D3CD37AC
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB736077D;
	Wed, 13 May 2026 19:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZWZ0gyxQsoV; Wed, 13 May 2026 19:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79FE160780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778699300;
	bh=d+7QMlF7n423S1vC1lfV/NScZ3ck1p9VVfvWosqBUms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNH+uk3Tb7/88rdiWl0HsVk16fjMT9/DXZbrmZ+3LfUAAdfzf+PavWfGMEuKPu7Pu
	 kDOibzhzfpjtreDFuKkwt/4+gG0aSASzBIkJylTr2Kf3ERzztvToWbUVuzyzwHcsrP
	 3ZbhbsNofaTnlyRcp533/nEKCa0gVMZcw+2eFQi01Hd6Z7/WBboRFyEA21Al6iVffe
	 pdqJRtXQJzJImQ6MQLyN+FOJvCzaCTU678XjyLW2Opw89fuKI8tjW5qkRuLo7jFawD
	 ElwDju7hMVnLyo03wtvpAjnT7R4jnNfZONNdeVtpw8Cq2g2axsZYifInpVelXpNkHF
	 qKN+bKnKyiNOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FE160780;
	Wed, 13 May 2026 19:08:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 147BF270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF0960780
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i23QQYlrACpk for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEC16077D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DEC16077D
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:08:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E1B186143; Wed, 13 May 2026 19:08:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 21:07:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de4044a0c9854c761b42c45923a07eef9978a2b1
X-Git-Newrev: 140d618567404950951afd0d26d4321c2247ed74
X-Patchwork-Hint: ignore
Message-Id: <20260513190813.3E1B186143@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: add CPE ID
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/140d618567404950951afd0d26d4321c2247ed74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The "cpe:2.3:a:agronholm:cbor2:*:*:*:*:*:python:*:*" is a valid CPE
[1][2] for this package.

[1] https://nvd.nist.gov/products/cpe/detail/C9CB66BA-6D92-430D-B3A8-D20C43E0655C
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-26209

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cbor2/python-cbor2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 859ee4a1b5..bb8944f861 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -10,6 +10,8 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
+PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
