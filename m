Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD280606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tIBxp8I1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8873440DDF;
	Fri, 30 Oct 2026 14:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJD1tXhVGzl3; Fri, 30 Oct 2026 14:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8813140DF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370025;
	b=D0IcrHEKzFz6vy+Lk3L2jt2hTgi4Y+RfYVkSeAkrziOxH80gbMweNdMbZeu27vu0ftvP
	 tVi9pe5dvr22x5kbTJZh9nPQHyHm+5sVmgy6F/S+Mgb5lhb+DrdEFclw/kh1NLeUVnGo1
	 pu3fhfBlXO/gLJd0xAEIVPC+F2BlOD2X7wYIQaZLn5oO8yBkGao7/lb5QhebaXj7ahtZh
	 ZPhIdVNCCrMCfxGstz9dzp6THmZrD4TW/qvGpAvFAri2xZXXxxl8eAm9CuwPMP/WJdjKh
	 NlfFP6KOBdbrX4w3cVnqU502ZPRV90dNjWH/rARV/B52UUb0+ptZi2XDeXpLhQBniZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VSTnKtRfGA71WnR5AjOg/ntUXPlreSeh+XBMfXvH56Q=;
	b=NoKw3vR+d3uK96XTtVKDnQdrVbxaPSlwOrcQSdNPznODq7C2PEO77QwzrzLNXX3iVc3t
	 NG8ufwSO8vjEZNjGMLoBO+0tgWkQL3Lh/RhYxUdQUEmexjvQjWRo8DJdmAFalQ9uuB/TD
	 0m3L1i5Om5iv8jSifaO5GenP/aFjyUkDe4Llpv6g9t2FOz7Jsxg+57buFEmHb22sPWZ5D
	 we2XgFtlO+mmZOekF7PTfKWrTa3eyYLOTVCSRV260uAVlnqeypFbhx3kAcaaE1FQRDQAe
	 8SKy4bZc1s59gZNGcuWVRbwfGmN8XLrYnFDzHz5zgu+AvYOZeyXxa6vJ46g8PJLNYEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370025;
	bh=VSTnKtRfGA71WnR5AjOg/ntUXPlreSeh+XBMfXvH56Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tIBxp8I1xDlXzrk2l6/RvtTSfLEH2qQM3w0BpYxZg9k0qu/2yEDHYiJ3x2ZTKzK4c
	 CJK8ECLnxBTAjtQ7iyqybkSaVt74K8YEc78THfTWVp5uqcRCe/eRyz5PHyAgRjVCSe
	 klgivifGT4Z4YlU8yAE2h3Xgybod5eC1GgEy/LpMCuv7jWew8D6YmV3VyAA1hvbtvT
	 u4dwes5gRtIQQD0nu2JgM4MpqVVud8tKVv6Cz2mNMztdxOa4YnRQt4vxqRnY5NN5Jw
	 hERaYBWFHdWPFjwXARIgTsn4u4RFkguVqp6g4Hij/A8EJj+oCvYORiBEkjNFFqgyQF
	 G5NoLIJ8Af1Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8813140DF0;
	Fri, 30 Oct 2026 14:20:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEEF6362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9524840535
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPBmPpFCyiG1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DA15540243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=TpRdLOuI2TwVF1fpfbG8e9SHvxrcuoJgZZpIdKJiyU5H5v2IQgK13BfEcDcOFsRa089m
 4TFFBuebs04gfbTuiECoWU1Q7TuLXfQJX0LScXMkuGjscrphum3ckB87NFLEtN3lfvf0B
 +4WcggrUSLYpOyOVIyEyzRvie6cG8Crb2v7DhHNYKQsP9tLBqgod4Typ3nXX1q+3pLIRx
 HIXHTW8SSKC6S0Ukxj3Vkte3Zem7q5xLKdj4JcsltnkUB2/ZE8rC8HpWGoZeKtqgnJtEl
 pcPby1cp/ADrygVvFtV3gINcS38srYvAt91LmUS/1Ha1ASHsLJrXFidW1nhzLFjKC3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hSuHYsYSvkqk/3iUqbBpZPnZz41xDD73obt3hvU0PqE=;
 b=rPpk3Phx9uOQQfjQ8jaHcf7lAp1XiQgu6KAHvBV8njIxNy6Rt1RDffVBg9hQ1pBFQjFq
 XvTTkdT3PNddkLHOWV5OdTmUyG8W02aeVtILDo3JefkK5cV5ha3ObI5lEbrFVFqNIR5zc
 44ub3ZH2jxjsKGsagQZojd+uXUl8PikvZz7aLcwfSHO3eqnkDUC1CKjEBy9NsI6pfjSLL
 vXNdfAc0oFYgMPURCJRpnXk9KJCsMfADZETLc5qBVVFOeY+i7/b7c3I/zwQhGLokT6ocl
 WvKGRxxItupjjf+MNjBWODEp1nh8OzIrrCN03NyUvVAB4zXgdflSYAsQ3K/X6PTeq/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA15540243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0537A9D38A; Fri, 30 Oct 2026 14:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 45b51c9d7a6528b82b3228cf1a41c2e1806d9b2a
X-Git-Newrev: ab3fa77c4ff9c69bed2a5424dad4ebff0dc6b916
X-Patchwork-Hint: ignore
Message-Id: <20261030141648.0537A9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-grpcio:
 security bump to version 1.84.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1344657681012318014=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1344657681012318014==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab3fa77c4ff9c69bed2a5424dad4ebff0dc6b916
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

For release notes, see [1].

This version contains a fix [2] for the eMudhra intermediate CAs [3].

[1] https://github.com/grpc/grpc/releases/tag/v1.84.1
[2] https://github.com/grpc/grpc/commit/405e6a1c30024ffd688c38f784c34f57e36c4304
[3] https://emudhra.we-have-a-problem.com/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: mark commit as "security" and add commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 309c48bb224d8d403590fd1cc64c6ed927602872)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index e533bc1bfb..c230f68918 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  f217241814a3d2f9bfd0fdc00a5d419c  grpcio-1.84.0.tar.gz
-sha256  19aaf172fc2edbefccce3f6e92c5150975dbe56c45744e9e87cf72ebdf85bfbe  grpcio-1.84.0.tar.gz
+md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
+sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index bf32da46a2..fcd6503199 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.84.0
+PYTHON_GRPCIO_VERSION = 1.84.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/3f/4f/4435c0aae54657258d9cfcba78598f3d9e5fe4c82ff18d78558567b90faf
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE

--===============1344657681012318014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1344657681012318014==--
