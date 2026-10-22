Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306C606A333
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OI+3Bs/3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B642381493;
	Fri, 23 Oct 2026 12:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qov_a33APLvg; Fri, 23 Oct 2026 12:32:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A3D781495
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758741;
	b=orXATNbB+O8JoQ8cofAdKf9IQoP4mXWSuL8xwKrS4ReGlJsyxaOd+E6hsvi/BV2x+hkc
	 LxjP1TL4KgcD835Ypjnk6Ai65AtQrrT13WVSBSdKg7kKiG4xyrS1fPOjHS2+jbu3Boeqo
	 tvymrwVWCaeOUG/RnVRprwHjrKlPHr3doB3jftnr49OKQcncReVM53J2MDVAeRnS7a0yH
	 csOA9GtP4E8iBciKrdwc9/n7jOLsXG3iF4dsNJoIs0V/HnVglqii18pFMARTEL6aEvggX
	 FrWbfU/rmWcJSyBELZkOXbfsmPNxIl6A6j9X/RHVMoI+L2dgdtZe7zt04f5fibnZ09A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=83DS2GI36z0rA0Yr6cmnZaeO4ifXk1IeZtSg+v+bgpg=;
	b=II/am1Uy+4sbWzklwp33yPWFiON+HeTXc1Ab/XXSFJajEzv8S898ffv1QbxJFNwtg5Pn
	 25tOL/YtlI1w+adpCQzDpd6S7ZsUq28lbBdrmy2q5+A7cPCtp+nLNVcTCb6z01ITZej/l
	 Lmbhghdne4zRhA9T+xQcJ2m3L0siULh0GvANQC4JEoHK0gO+/YYnJupm2mRZrwqpiM2mu
	 JR800+rSXVXRP3or3/96qiVR2ohCZgxGBgV/GslMp/kPO/Z7QdUfxBfwIxEqR0ZcRwc6R
	 Oc5lWD1lzi6qFE/Ln5q3PnK7eRW7JD4WqO8SEviWdaOdLkYvr14GGNJEIWMD1FbHkYQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758741;
	bh=83DS2GI36z0rA0Yr6cmnZaeO4ifXk1IeZtSg+v+bgpg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OI+3Bs/3Dl938eWXipTQuaJDRYiO10fqB7I95t2J8drFWZEIQCUdDFPj5CDII7r6X
	 PbUGRxBlhCp793imctLpzTrr0Vbu22mOyBQs9LKsZV+O0m5aXVpCanRvfYWbEpQBPN
	 5H5VDy1Aqcyg1XtsFCfY0434HIhPFrY5dXlB8BzD/gVDl3FqndmrBaj5ezEbvnkSyE
	 xXYS/Z9A1vTMQ8iKWqRepeYGnxxaRguFSRswQQUy55MJWuC/9i7g7SNdd699ZHbKDO
	 fecbOXZA4O7Pgh+3NGEkZCqJxYmQe4/kLGE8E25uemlc8jR4FPF/j/Fw7c4hhFuCaW
	 XkPfPB2KlpLcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3D781495;
	Fri, 23 Oct 2026 12:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A69812C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37B2401D6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRh86Li_Y_oQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 56587401CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=j0nG1g9jFdtPjiHettsFV6u9+d5HvHvyUYT50ZyG099OTjoe/J5zEHc/TrSECzHtVJb+
 brIaafkhA8FlmpkN04sS3ewJUnAxg3wXSSo7mo6eS/j2QbvP9JNuFPgCw6nu/UTVgUuBz
 hkogXlipH6nMvHj+bkJbR7varO0j1YXRCVQ4zQDKvIndc1q+jSVFLEdT9FO7Cn6Wqj9zA
 9WdDp1pG7sbmtypu0hdeDzOsuKRWHGX4ayghq4nnMLK4NRCPIXmlggKlcILy5liCCLqMc
 k31BZcLqa3bvvxgNWYyKsqm4GjPDVlDJ0UceR9QOzsdaLcltMpQF59v2557DPNFgRsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XPGdwr7hHLfjiasN86J9K/AA0524Ugg1Wc98bvv3K2Q=;
 b=c0xvslg8BB/9h5UDdWxffVnWXrD9MRQy4kBCCG+u0WF9PVsugDCCw8Q72Q9BDWDEVmFM
 npfg0FiIYH7pwuqWRzhquhh/1cec4m6RdfG1MgjJnamSfRgf7deiupI4ojtQQcgqm9Ih2
 iNB/ZrLk1kSnBX/3so9QQW3skQIckBFAoYMu0rINNJwT131hmA9wsGw3Vwn8VuzL0IAcT
 epRxje2Wi2j1IXdewjl1XbruzbkvIX9HdhDovt4vE/QuL5OA8yVHVgXLm/opkc1MqFzX4
 Mr5eiMwKMDgOfwRILThR8NApi7vMFjIQFS1FXm9glZoaP+1fTA6q8PH4Vn4icwcHqpg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56587401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C866F9C669; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:24 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 57968f8678452280c038dd84e3fb0dfe7309782c
X-Git-Newrev: 3d84c56479b9388a97b20f5c43ae2ce59853b8c6
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.C866F9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libglib2:
 security bump to version 2.88.4
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
Content-Type: multipart/mixed; boundary="===============5351172646841970963=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5351172646841970963==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d84c56479b9388a97b20f5c43ae2ce59853b8c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

No CVEs specified, but NEWS states:

!5394 Backport various security fixes to glib-2-88
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5394

And a number of other bugfixes:

* Bugs fixed:
  - #4011 gio/tests/services: Installed service file contains build path after
    !5259 (Jaipaul Cheernam)
  - #4020 ‘TLS callback not invoked’ error on msys2-clang64 CI job (Luca Bacci)
  - !5262 Backport !5261 “gio/tests/services: Fix installed service file
    containing build path” to glib-2-88
  - !5273 Backport !5266 “docs: Fix gio gi-docgen docs_url” to glib-2-88
  - !5285 Backport !5283 “gconstructor: Reference _tls_used also on GCC, CLang”
    to glib-2-88
  - !5323 Backport !5311 “fix: handle long filenames in trash by truncating from
    front” to glib-2-88
  - !5379 Update Norwegian Nynorsk translation
  - !5394 Backport various security fixes to glib-2-88

* Translation updates:
  - Norwegian Nynorsk (Roy-Magne Mo)

https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.4/NEWS?ref_type=tags

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Fiona: fix typo in upstream NEWS link]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit db192575e0fc2c9e155477b1cbb6d6001d0b0a83)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 8970ef74e3..95bf4d3179 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.88/glib-2.88.3.sha256sum
-sha256  ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b  glib-2.88.3.tar.xz
+# https://download.gnome.org/sources/glib/2.88/glib-2.88.4.sha256sum
+sha256  25fd169f3b2f91fe2391ad297883ce0fcf30c69fc789ffd1c9672d1332b1c5a8  glib-2.88.4.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index bfe4920291..45aa894b81 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.88
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+

--===============5351172646841970963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5351172646841970963==--
