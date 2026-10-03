Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D991CCA5FF1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 930016068D;
	Sat,  3 Oct 2026 15:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRpOz8yP8wek; Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7BE62606DC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042877;
	b=MhiP+ABcyTwYn2Bq3b1FQDgev2VOF4Q3rOY6wsL9LdL+1ZMLX9HOh4qFtvP5RH2j91jx
	 OWlhGNnCr7DUdsu44QzstKv71Ud1fMz/vV2FT0UqlBhxrPxbE7KUnDveaU/OK9/gGPIWl
	 ORbjfttesqNZYm9cRLKVxpR9FwsWycKmT19/OLf9nbB9Is89i/FsDQXrTrym8yF5iqErK
	 cLAcu+w0DhsSRGZWQ/P7f/tFA80/+mPa4YxUJaPsc2PTiNtsc9QvRG7+vAHoj2ljrQOkt
	 mEk2yl7ok8RiK8oMR1Wo2D7gJZwC4nNssvujH+kmUAQYd/nAz8EVghPQ5S1pYPE9TXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KDZvUIWQuTFxQfNFgDi52dnSBn9AdEn4FNyuki4sS6w=;
	b=cMbRypMUzWzjAWByHCoF+/YEcRDzhClMhwhRMxhlHPNUZ1M+Cv4cN2GYvsEKGx5gGcc1
	 gdcoL1QLh2Aaqr6jhrcW3CwAPD/aSCmAl7yZiD/K2g2TSVyJEF8aEN6X4H1dcZcZYECll
	 cQBs1V4WFVN7SDpS3qFXRrpRg/HLvfK4PwPUDMziVew18egaMeWZZenIdERxtBvy9x8KO
	 0R/Y7SYQoXwgL8USNp1IiQbn8aJEg8CpF5zkxf+jmh1MOJW1NCgr65u9Pv8zlzqfNGrgW
	 i3+a3DBtGm2354BlK2OM7Z57WfpbbdNi5qCnqZ/FzSQrdG1xwzSW/VP1h4LYLoJIOqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042877;
	bh=KDZvUIWQuTFxQfNFgDi52dnSBn9AdEn4FNyuki4sS6w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=duNdNYcG7Vx/xHBWB17LzqNfkxDYNq/8YRcHB70ZiSkG1J/T/oiCArhuXUOXVn8fB
	 0XKGbMvjdUWVOk7yNttWgl06r6S8lYnB28juNpwNsTo1pYksyNdeEliVt51K/OctDO
	 sD5dHkDMyVeFCtLxNtDSdiqJ0YH3kTl3prGauFsxC9mw+m+v9mUiOnIWqtBaur2Rtr
	 89MGWu7cZDvNnV2KbonQBr4Rog5oE6rlRz67fOlCPVYYgNIiRp7rPhCVcH69/Nv2JE
	 XHphOoaIAXWnqp+ZAKliB3T/pqQk9UOqGSJWZkEMotenL5YZioClTYp+KDE+Qn8BfT
	 qpYBSF39w7GHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE62606DC;
	Sat,  3 Oct 2026 15:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4527A4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E4AD60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ELtyFdrTboB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FEC06064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=URWe46YMe3bASUN2bWchmo1wxKTcFFsSkFjM2QcOIKlmQrY7P7Vo9kkt/e1ZzLiCggHN
 QB3kNOJ91v+juJQugSqOp3JIHtCxdcb/MK3vkexVKG78t8Ee9YKKPkHt5M6EHpxlM/+1L
 5+PyetK/r03fpqzHvyGw+PKexEBdFryufZZv6IeWdSBstq0RZQEQffGXgRkh6Fo1mt5AT
 4seRVh6mIPphuqCrLOTxqhRjFDhYftEfufTYdVLY52TVWXBMO00tnQHOcCnDmseWIJN/6
 zTl5QFtIbr8Neb5L1k+WiYJDHBstKJSadimUeJcJrD3BiOa9FZWWDphzRvti773z4Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SCw+1BC0N7IgtF/K4I5MpYBiwb9iPB9QF+tUfUmKloM=;
 b=eHUHpm79E7rMhvmp49RRX4yKnCTAkVKKYtCxhykXh+mwFp8gwungmKndX0yVbae4E1SZ
 q3fbhh/MsvUXvSUCj0qIutqSjhrJtZLgwWBd1mIgmpztuoEZaONyDF9DbXvR+Sqbu6Qmr
 HThrFpjf9ow9ZyFae8YSUtuHAFEnVFpzo02AsFw0ChsbYwq2SNkxRRDGe7joFiwAfhD7c
 oeVHKTAWYaaVDas71679Zwq27Ug5I+8GexIjPPZrZM5xZ8AA2aR6W97mhx9SBOovTBLne
 5b9AETqucfso0DTJeZV1ebl4tanOlaDRR2LfAzgDhU/PiN+1MYblPRyVpJvEeLIpKWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FEC06064D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0B288A31E; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bea1d30aa7e0c26ddac1d17a03377f67f60de47
X-Git-Newrev: 57304dcfaba5778534a5d51a70b6d2a8e642fde2
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.E0B288A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zipstream-ng: bump version
 to 1.9.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57304dcfaba5778534a5d51a70b6d2a8e642fde2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pR0Ps/zipstream-ng/blob/v1.9.3/CHANGELOG.md

Upstream switched to hatch in version 1.9.1:
https://github.com/pR0Ps/zipstream-ng/commit/c85623da96430f46471cb052508a7bb2d08f8665

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zipstream-ng/python-zipstream-ng.hash | 4 ++--
 package/python-zipstream-ng/python-zipstream-ng.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
index 4360cd07b3..8457168cae 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.hash
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
-md5  eb08f32b64b28005d5d3846cf49aabd3  zipstream_ng-1.9.0.tar.gz
-sha256  a0d94030822d137efbf80dfdc680603c42f804696f41147bb3db895df667daea  zipstream_ng-1.9.0.tar.gz
+md5  c2cbad4c5fa2f803c5cfab86fae726b2  zipstream_ng-1.9.3.tar.gz
+sha256  6cebd055025699c0af594c76a9452cdf13f4be67ee005b6907f0d3c9c6f44ced  zipstream_ng-1.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 35e03d041b..beb17e0cbd 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ZIPSTREAM_NG_VERSION = 1.9.0
+PYTHON_ZIPSTREAM_NG_VERSION = 1.9.3
 PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/11/f2/690a35762cf8366ce6f3b644805de970bd6a897ca44ce74184c7b2bc94e7
-PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/f3/e0/76e5a674b0f6a6b7f90af9b87a92fbe1f2b97da447fb09078bcba6f6a28e
+PYTHON_ZIPSTREAM_NG_SETUP_TYPE = hatch
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
