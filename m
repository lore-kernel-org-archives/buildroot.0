Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B67C624A4
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 07:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7823608AA;
	Thu,  3 Sep 2026 07:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpEKtnK5F-0N; Thu,  3 Sep 2026 07:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 204CD60633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788420822;
	b=oNJuBrPsyb+PdAGPjZHCFoSIHY2/mivSn+9LV3hVyW6XBXLL9poRHmRVDCop+zA3xzUk
	 padH2Y+xErh3ah1owlt7/oDM9DRhJvOU9aZaEPbGfV27aKeGfJC6z/MVJTjdbqaghpySE
	 8I9XfpO6K7xF//q2lbZX4SJbRlEWfNOucO41BlN2PFmPZqzCtIBwYbzuOVL1hrQEZ6X6v
	 gJPiUTSCBscSf3P03OlSywqdPxag6ickLlQWInrfqbRqqIZ4CoDHwTyk1lR+mNqZHQmdN
	 iPUOJHC5N/BBChAyfQuF0HhwB2Tj/9ju21n/7bIAMg2mC3k6BllyLYvz9z34/e64txA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788420822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o1CEkwOJzI0HPsMGBsOtgVWjYeA43EMiXAoOcMbyRZA=;
	b=AtHv5oPXT0ZbC3tZ1VWrGF+044cG8vWdur+h38V4jhPnEjcCLj7HDZY5oghtVsD2A28C
	 VDSNhJsOAvoBEE6QZxpI6IPMrhHgogyFk54pRbkSagidVdtnta7kDcuBRiaLGxlHKxsH6
	 7cCfn5q4MUgw3WmnHWyufCr0JXvrlbZBCmCmkb4XXhjuR6TzqPkIV+dTzN+ajoQktNnb2
	 GkD00JN/7JqEbmzjml62NfPTMq3pBzqtckBwiqgz/Yu7mXK+s8JnOuP3ZtZyZ9Dnh1PFu
	 r8HN74ZbKBgkchcAbC3FrXjjtbwIOq+XvmCmlCn6pLAO5jFtUFkBqEt6btXBGvRwOjA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788420822;
	bh=o1CEkwOJzI0HPsMGBsOtgVWjYeA43EMiXAoOcMbyRZA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Wu8lx+IpoLve6Qr0fA1+RWUmH6Tq3p1Yi0YrJEBns33dGy88FSyZT9l2x3mCrTJbZ
	 N273d9PuVh9cfgLyfOnMO65p6gymzI3YdfErMrjuQGSOXB+wtciRCs91sC/SP+4kJ4
	 KyGRVKwwT5f/B2J7vmTWcstgbUvpyJk4NEIdw4tIIAjOTLkH1UZMTJ2fmn186majOH
	 urcswkARXSiJsGh0MjkzoPMnvd2e88J1aALI66WA/0DljzNM2qLDFhaJGiEOooEIFo
	 ZUpT903zuuPn3OdldniCmcvCB0hw61U0oFZCSIFg5E7eYQ1bZ1IwRcN/jk/eo7FAbP
	 8+BKMBcoiJ8nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204CD60633;
	Thu,  3 Sep 2026 07:33:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7653234E
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 07:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C36860633
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 07:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrFxtk8uicQv for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 07:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3BA7A605DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788420820;
 b=dCrn5XXjoLoilqCJTZOrhg75wC/gzZDlFhIesEPopWXn5jPoFYp0LHk3Gx94dESiaCFl
 vYm1eaqyNKPmxoMdIUGMhFlAa5sCvpPMudrpzNkCW73wvEF/nL3jfFYbkTGDGpe6lWdzD
 P4QHK0WudGftLcsH49s91CwEeEgSdVtsoQm1d3/XbtcOd8RsQ9QdITi1HQvahbVVCjLvo
 dv48xgxi6jTznTHsWQ+sOTKSspUShQWa0s23ULmcLsCGKDurmfwrDB75fFS+23P79TMO6
 vSDrrDMhu/VA+CVPiAxVK1zxZlKjM0nF070alnIWJw3kHU2U+EBYblp+K5GadR+BYUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788420820;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=1ly+6eDaUFIn0DHBP+N/B8AClZ3j3Ykhd8Q17PVLhjU=;
 b=mAY2EsmZy9zH3+aJC8ByMMvhFrLtMiUjwZfODIHaXgELGUAc0v6IRhM2DTEHZDF+qB8o
 iKxCzV1L+Ud5nptkRejdvo5oKjmngLezhBC1E7enmZIhen3AbS6x/UpU1aXUcrndidwud
 PZP7QmHfkrvuxiFAmwssYrwtMaxuTCxLE32pEZg5fIVPxHgacPAFu0RwGhF/48xqtgSE4
 4lWss7+aOwz/r4QHvzvByItLUnct7kM8usYss8v/GGHggp6fPqTKM70hBb+qfIVcbJh3U
 QUrJ18Eg7QkjxP1PWeFDPGLbPjgbyDGxnZ4MQG3Ptv3Wazc2qf/fxzJ8GcYvrOJsZLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=D2ERCC11; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA7A605DA
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 07:33:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF93D1814BC; Thu, 03 Sep 2026 09:24:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  3 Sep 2026 09:24:42 +0200
Message-ID: <20260903072446.554946-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 36.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v36.1
https://github.com/protocolbuffers/protobuf/releases/tag/v36.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index aaf5d77095..17d42534a6 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  f0b6838e7522a8da96126d487068c959bc624926368f3024ac8fd03abd0a1ac4  protobuf-35.1.tar.gz
+sha256  dc74fa582f559cbd31614ddfefb4868f43c919d7184bde514bb47f90c6025eb8  protobuf-36.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index d4d0e3e0d0..c4ffbe9eca 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 35.1
+PROTOBUF_VERSION = 36.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 714e2cf49b..469ca3e6bd 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  e9074f4f40672c900f878be049f86cb8  protobuf-7.35.1.tar.gz
-sha256  ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a  protobuf-7.35.1.tar.gz
+md5  5cef553eb5bceb0d5a57610f1aa3c40c  protobuf-7.36.1.tar.gz
+sha256  d0f6470f0ce2b84e3feaea2d4b816378b37ba4d4aa08a274305373de93e2d524  protobuf-7.36.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 17369d1462..d73c265302 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/86/73/f66c748df06e7fe24e658eddd600d19c4b40bad836c97ce2d0ad9851fb6b
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
