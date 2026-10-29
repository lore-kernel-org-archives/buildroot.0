Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF38606A330
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NIigb+ez
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 757D980879;
	Fri, 30 Oct 2026 14:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iJdueXQfcqi; Fri, 30 Oct 2026 14:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D6B3814B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369311;
	b=rcdBA0ZhjGoaqGqC/K0XmRFP9rF3b4zkDr9vqbPE5lovt7xDAUreW5pwdjMF5izQe582
	 I88Zkc474EyuC4WgbLcHX1+HTkNTMxmcOFJaali1ux1B+hoU85Tt988XALxjQyM2G1Mnn
	 ExMiNePXCA0U5zlz6PXLVKpl7F22L4ZCzxKAk5b8SpqGFCZrWFknSDD83+aJn4AfQt1v+
	 W0q5DFKKVbAmPDdNR5K1Y9bZYvgFiNf9xkG0BeBbYjwRZjMIwxa91idK9xi8j60mpT69n
	 ey1BhV/ZrBFqivqNEQKHerspJEhhvOw3Tx16dANu2XXoN/1/Nr5r7lvhxKsh48DOz8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=yqcTDRLhS2nWFB0CjsUpWa9LqqDXM5suuY+vvPxsZ/M=;
	b=orfvRxtVp9uBG1nJwzziaKpgKS6eQKXSOKgCnqRCn2MXaHKBZhO8Y5GpLg2jKwVk/fyv
	 vjDX2Gm9ChDHC8tyV7/36eOTvRbhqM2OziN1eoIxEWZJkxsQVxjDF/cbyehhjRL+TzwDd
	 /6H0cNazJeRci6XIwo6rmmkxMa05wVazFB3clRongxqVsVhOVQiyvMaxtPPWuQex8xsT+
	 gKAZWbkLR38zjFrT9ASvi+TaubWtRhSY7gh0rwaSS4BoTxbWEk89VrFBZpJvdPuNcd2yC
	 X5DbAGpPwI5GrpCjAXZyRZsdQLPp64jmh516UV/l6JnyMGIjN2Ce9jhUH0eicsyo3sA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369311;
	bh=yqcTDRLhS2nWFB0CjsUpWa9LqqDXM5suuY+vvPxsZ/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NIigb+ezDtQ7vVUlClvkFQuYfryYvnQtGrxWsUaEGRhsOkpYMSSQXzF6lTTtdMmyQ
	 MgvA+GY19cgwPx3askcbSWRgbgLBsnxykJRJ+rMlq+6ebiGryC1NtVncsdwnYZ++u6
	 /Nk6O60+n/o25h0PebmC58QZvdPqNCsj99tY+qlU+O40Pynu3zSAz7fJ7Ioq4iH/um
	 j12O53H9wUMRncSnO6q9dIlpKMD0AfX8j2LUJpJxJL2IMblvV3BmcNfskXSCBEJNla
	 UM2AZCW+K01t0Gn3cNJ8SOG2G4kcGebeA1eqOAAWZdSa3oYG+qBVATCvLg1cRWCLzG
	 BFx1DViYHyYGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6B3814B1;
	Fri, 30 Oct 2026 14:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17693D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F24218118D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izNNozz-cHXe for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48D9981185
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=sqv7APXqcgkeKfB0YUJKk95PneuqVyRhl5y3ud1ttF5131v5Kn8J2K1K7JORSxwAT/fV
 GBuI6T19SbFCFo4oyWJ7X5glstOZJJhNfng8pkDlUOlgh2DeKjX7RGUUFWqtyleyWlg4S
 eGYthyU3l766oIQeBmo73pXuLTCpbHqWm0K5JgKh2x7sBrO+f9fbHRNanGbWvG4ZBUGig
 GuFLP8OUkdIGsbyrPpHLbb/M35SZmYzLqfAkC2a0yv9eHsI/dEyBXgDKo19in0RE98wUt
 pU7AiKJAmEgY0eqctcP3FM9s75DZ42I2UyUXPLYDPmgeEAA4wrIUrbqpZ+/OTln7SQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UBQClqTspB8VtgC2Gv/cD+a5R7jIwpkQFc/gzNaMy8E=;
 b=DnsMaCm9lfIXcpUzFlBZWYYhm2nIOf9wEcvRdfmBaQnO7EwfZD+n/Klal42tD+u3+j0u
 jka1KQXnH3l9A0qIgryxiEvArMCH2TzpzGF4Y1NhS0+Elt1B2G9CLGnl4KxHQSsfPzVEr
 F2s7Fq3cjScvfDDHmJl+0XdtH/1f34vZwj1lzSG0XoPQeTztsXI2KJeJPFrC+k9SFW/xP
 9ZMIR+e6Z9kyFvVjsD6Yw/0bBmGUlSvorZ8NNSQ+ZqzvDh58KnFTl+NX0f+fAmdtuHSM0
 WG11dxAcuJRlrae1FwKiyHgPioBTPmWP4OyLmtYYY9Pnj3vm/QLkZrBWaivTe0op0mw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D9981185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 687EF9D389; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d973a59edfb43820ec1a84d14a503bc0b15cdb2
X-Git-Newrev: 3a36492ccd7638793ff21928764474706f283f29
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.687EF9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.16
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
Content-Type: multipart/mixed; boundary="===============2863920793699023287=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2863920793699023287==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a36492ccd7638793ff21928764474706f283f29
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use. Normal uses of pip, including to upgrade
pip itself, are now safe from attacks based on those compromised keys,
even if pip hasn't been updated yet.

This fixes the following vulnerabilities:
- CVE-2026-115557: Distrust compromised eMudhra intermediate CA keys
- CVE-2026-77214 CVE-2026-102633: Update bundled Expat to 2.9.0
- CVE-2024-3220: Don't read mimetypes.knownfiles by default on Windows
- CVE-2026-114583: Reject links replacing the destination in tarfile.tar_filter

See the release notes: https://www.python.org/downloads/release/python-31216/

(alternative to commit 3736eda341337a2ddd824111a5f065c84d44c584)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 7949607fb7..0f456ccf94 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
-# From https://www.python.org/downloads/release/python-31215/
-sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
+# From https://www.python.org/downloads/release/python-31216/
+sha256  b5796915dc45ff745cfb4e990a7e7c93d6f546328a102ce31448d69ebc37575c  Python-3.12.16.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a2371b1a92..ed49fd6bb3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).16
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============2863920793699023287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2863920793699023287==--
