Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05983606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qcxr51Ej
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D83E460BBA;
	Fri, 30 Oct 2026 14:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCifjUN4kI97; Fri, 30 Oct 2026 14:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1140F60C17
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369989;
	b=enKwdU3nVIB9WN765GhxsEG1kf0Tn5FBITgPKs6EK8mlXG50IrJbioAj0J5U9URM56mQ
	 h4OE4XYqmKega3o1Vto81z2g6gzL5/oYvqUryS364ZDv1cx9dmHEAMW0gu7+MH2kzj/bq
	 ja9gW9r30HSwYYnCLAtOLCIRr0sRgGCW/ZeMtdHPvxn5fYnIIN03QxK3zK/0QbUuLsTPZ
	 MbpwS5rRlZMAbD0ZJp5OOq4SBq1RZixnm7fqSohekD1B6F2laALk+L4CXlEP+Zn9vBrsl
	 9FLM3lrEYPlrdK+HrF0qAuN+Sgx8dXmays72rmX8Po9Ka287uOdKnaPQOi8VM3j8YxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=p5OP0kmwoRzs4oRumEeg7xNZzsN0zBbLRa+v7iBdESE=;
	b=LjRTZvFBZcS3417hFRY3CIxYtCwMNSGQOCaSjHS/hs1DJDUfA4aLV5Os8csrU0BDojBe
	 KgNIntPX4IlXXLDxK7LNdYQAotncf4fVJxa0x6KbVZKaKIRLG8E5pqe7t96Z2hqRySAYG
	 jyEGkJnjnuB1Y50/mCYaZf6LABRhmPN+waDQq5RRFVwfklerOji7YWHlNwCoNrSKnyWzN
	 nRgltl/u/IVY6BHgKHvV66+jNSgIOC1cjosuWupYNLa/SK2m1ppsqYMM5/zNF4i1AgC1m
	 38OxLfVozjRj3RC/5qCp1edQASmv8X0XT/NUbx64k8BJOIvVhHbOkC5cscFXJbC87sg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369989;
	bh=p5OP0kmwoRzs4oRumEeg7xNZzsN0zBbLRa+v7iBdESE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qcxr51Ejlohycm2I6bxpEBya1/nf+O4YNSZiqiD9OGyEAIHFcG+sRDFkY4jageyxo
	 ylnRycXzt0zMMbdn07UlBp6IwkvCTQaV0UNKQsyrL5+Cjyhlgo8oHNjJ7gTBRnZkjL
	 pzlsqp1jgDE0H/qQokLvv5VOA37/865JeoYOHfy/bp5dNMP6t2jMQRWwKKIwT2dp9u
	 s/u9W4LNj6VPAY70k/oG95IvIcJCrbB2GYeoIsz8MtQA/umrHpBoIR6+Z+fI5PBETy
	 EoAWhUCie06/gZPUG6Q/rGTc2+J2+cB6uWAmEVGLO/DX8pGeyZhZycdoYcKO03jV4u
	 PQfckMyTc8jMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1140F60C17;
	Fri, 30 Oct 2026 14:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 933C4362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903704053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bp-SQZUBnxnH for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B6D4D400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369893;
 b=bng3NljNIYfOOhAWLSZ+pA+Du3UGuBy1LZ4Tzq3MHyMLGeC8hSpXltFYUBvfCA0z7C25
 cnaFBKeqmwDAd/KYeRycJo3fKY7WlphHqgOmBT1ARrx4W3FJexzgmcK4fhlw0/SmFWgs8
 Zc21NTyDe4B3Rk+8VfQLkr+Qxi22Z3FEUnOc7X3wIXCzBzd/sIIHzKfxVbxCWoxiV/pi/
 HZrLIQw9pnRNaFW4TULXxZHck0vUXTgkdclWUjPXq07nad624lsWnDJvp90UwSfz+8Icc
 2/p8Wqwp+xo2n+mMW8/EvkpdqSyzNVM/LF6//arKgWOxVgpalOM5Mh1oZbVMorZbW1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W4Dno5NI1e1CbncF3NB5WBoPnOorwG2tjM8GJaXCaL4=;
 b=GN9E47kJ7nzxHHpkNz6wvjRwATfoZK9C82ds1GKxaS2xP0GQchhxLwN79ju8LknlC6UV
 boKsp6I3UyWCPlAq0hIeFYVSKy3g6NV/PkU1aCrKwFAyN9runJ7jAUxfmaFyWrfDYInXJ
 XyMRZeF8p01JisMWyClXC6MCQp0YGuui9+2NDJDUy7QDabigHHOW+J6YLQS0WjEZPk9t5
 I5YPytQEW0hmt16SbqOGBMRJ7auaD4X0ehg5D7ZkcQ/kyyUytWat9yxDd02Ec2Di8sfok
 1Pl9I4eI6COBzkKe23pjwJuytRauhMBk9YCHDmABiHyA7aOP4EfMHVg29Hj+eCOMW/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D4D400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9F1D9D389; Fri, 30 Oct 2026 14:16:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dbc9c7e2d46beefbd8bb0f70486fb9fa5deb8252
X-Git-Newrev: f00633f3d9655f0fcfab5a70c55ac47d33a03423
X-Patchwork-Hint: ignore
Message-Id: <20261030141645.C9F1D9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/nghttp2: security
 bump version to 1.70.0
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
Content-Type: multipart/mixed; boundary="===============0393756336825112253=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0393756336825112253==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f00633f3d9655f0fcfab5a70c55ac47d33a03423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

CVE-2026-58055 [1]: nghttp2's nghttpx proxy through 1.69.0 forwards an
HTTP/1.1 Upgrade request that also carries a Content-Length header and
body onto reusable keep-alive backend connections, re-adding the
Upgrade and Connection headers while passing Content-Length
verbatim. A backend that resolves the resulting ambiguous message in
the attacker's favor enables HTTP request/response smuggling and
cross-client response-queue poisoning.

Upstream changelogs (no specific mentions of security):
https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0

[1] https://nvd.nist.gov/vuln/detail/cve-2026-58055

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 15c73cbb31768c24849333f2a793ac712e89bf26)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 6af7b3eecb..f77eb6a67a 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2  nghttp2-1.68.1.tar.xz
+sha256  e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2  nghttp2-1.70.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 50b94582e1..7d02877561 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.68.1
+NGHTTP2_VERSION = 1.70.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT

--===============0393756336825112253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0393756336825112253==--
