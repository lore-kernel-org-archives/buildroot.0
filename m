Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39460A3814
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MzLXD5wW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD34E81661;
	Fri,  6 Nov 2026 16:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWLiQh8vnjVo; Fri,  6 Nov 2026 16:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6045A8162E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981336;
	b=ethKGmeKAdeHOBlLZG32kYDvv9b9CXD2KZ9koTX1xih9JsVxtpwyu5M+WDcAst2+O5tA
	 akMZlE634YUpl1EBBtEfM+ipHttBIEmcOIYngRpNM1IhYdvgGSJVj3U3boX8+8IOHHP5E
	 /F+lYC7aBpPt+6r3HQeowhowzbsTdEM7DooAsiNR91tqczTsXu/4ACkj2vlCydaHnTYZE
	 qodeiA0eEDnRvzhm+AXtnuzMUt8erns5IYh8CnyE8cBgl8taM21EWKfvba9gKMZe593cd
	 6KF/7TMoo7tO61NjBWlNyMtnwcf681dVIHXF0LxVAwl07pXekMT3G91/a1g6wa8rlcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oTruqJwGuSJURPorgTP1VcT419pl9qcf53kAzJhroAk=;
	b=PYQpyBvliejgnyZRFCs8pKOym60dEAHb6bjdlAjnR/lST5RUF8/hDDHotEjeZg/CwjMj
	 d/pfsnLFuKrG6Y8UtHi0sy+m0u2KNl/M3mRyTuDyJ1UdCFxOWpYrkLI0o9f/NcqEitkOb
	 IZCz0Ysw5mBOCRNLFg7NfoowHGz/zii1+pC7Yk5r1Wth21DBA31+9WeFKOI6WoOfUVy5Y
	 5Msit3Z7Nm+b4uuwWdRwF2yLQ6MbeN4Fa/XWi+IpKgdR1dWS3W6dwXBnH5V1qCkrm86nT
	 jWLA+V0P5nO1TKo4zzrOdPlyKxPJ6gu78o7aEAAZFPV2BAM2ENBGyn+khnjPU5cPknw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981336;
	bh=oTruqJwGuSJURPorgTP1VcT419pl9qcf53kAzJhroAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MzLXD5wWDaTPTQdclaauvCttHaRCi9HVH1sdTsGJwtaT/L+FrY+zN6jhMWhgsIjFm
	 KBxdPOL7fkbkQKsZJlq1c1SK2beniMUA/EXWJbbhBYw3As/7Be6E3mhrpifF+Hrzl8
	 OrftYlgRNtXQ2vPHtEeVKYCgO4gRwGnezll59uu/xOm4kOwUws1LnS7hMsR6N8Vm+D
	 0l1z4ov9W2tZW9y/ut7B+GRWRROZqHA1wKiWeOWjqIwqIOCmZr0mrHQov23Atqzfmt
	 n1fpbOZ8FZbV2BlwO8e0834kxbEnrjO2UgAeufo9QM9w7ztXRLq/5+rbHFqJWtHAAo
	 bqyK97H5rrJ2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6045A8162E;
	Fri,  6 Nov 2026 16:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B91DD4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C92681403
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZIV5IMDvnZ3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F9BE8126A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F9BE8126A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CD989E09B; Fri,  6 Nov 2026 16:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 879799cb6ade4c00752b6733f4c2c92e3ad6c96b
X-Git-Newrev: 0338bf84c6ffa98b6df14137332ea2c3287afe98
X-Patchwork-Hint: ignore
Message-Id: <20261106160659.9CD989E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-oauthlib:
 bump to version 4.0.0
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
Content-Type: multipart/mixed; boundary="===============4871679175756400039=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4871679175756400039==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0338bf84c6ffa98b6df14137332ea2c3287afe98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2cb9f457c96fa6d093339411aa8c16f59643b84)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5ee9a0ce05..5540760118 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  856bc51662afb26ac58b1d7742606b2e  oauthlib-3.3.1.tar.gz
-sha256  0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9  oauthlib-3.3.1.tar.gz
+md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
+sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index bbf59acedb..d001fcd071 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.3.1
+PYTHON_OAUTHLIB_VERSION = 4.0.0
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE

--===============4871679175756400039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4871679175756400039==--
