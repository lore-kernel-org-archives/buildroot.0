Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E42E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE2EF4072B;
	Sun, 28 Dec 2025 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vq31IuPCgnOT; Sun, 28 Dec 2025 22:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FBE94073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959622;
	bh=uPvJscsmn5KH5MJn5J3Kd7pQOdUkwsJwTUoItSF4Pg8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiYArG8viv7IkR76wr7T09cqO78Q0KJG/ex5GUlPWr4rcOqtCle5tQpe13aGbT6qi
	 ipZKUyjrHafpI8iLojqsN9j58Oi6Skc7osYdpsdqvkYUqASAJoDyiCOY2p2hRL4gNr
	 ewP/S8HERW8SKidXpwMJ3PFVknCtKzol248ZHmtVoCP4qwCLiGO8ztB3wcruhWxEhZ
	 Qt3SQ/wmG0ERfsolE3ZO2JyuEsJpdv5RZn4keu9Gmy53/yEsUO3ZI16CeyCJYbR/iG
	 jNgqQqIml1cnnt8by2N3AT4oA+RX9f49i4s0A5XdvrBXzz5VCQudSVFmvQ9nFF40Bw
	 gqAwZkOCZjeDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FBE94073A;
	Sun, 28 Dec 2025 22:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E34D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB0BE80DEA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTQmXK0DByao for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACEB280DEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACEB280DEB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB2C48781C; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8132e84e0491da912df51e18c35d5fab981a2bce
X-Git-Newrev: 15e91103837567245b3486de404a2a2c456a27f6
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.AB2C48781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpmath: update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=15e91103837567245b3486de404a2a2c456a27f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mpmath/python-mpmath.hash | 4 +++-
 package/python-mpmath/python-mpmath.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
index 1b263c925f..e402647a59 100644
--- a/package/python-mpmath/python-mpmath.hash
+++ b/package/python-mpmath/python-mpmath.hash
@@ -1,3 +1,5 @@
-# Locally computed sha256 checksums
+# md5, sha256 from https://pypi.org/pypi/mpmath/json
+md5  d5d17bbefea73eeb959967351d905306  mpmath-1.3.0.tar.gz
 sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
index cd19dd52be..86a3562d04 100644
--- a/package/python-mpmath/python-mpmath.mk
+++ b/package/python-mpmath/python-mpmath.mk
@@ -6,7 +6,7 @@
 
 PYTHON_MPMATH_VERSION = 1.3.0
 PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
-PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SITE = https://files.pythonhosted.org/packages/e0/47/dd32fa426cc72114383ac549964eecb20ecfd886d1e5ccf5340b55b02f57
 PYTHON_MPMATH_SETUP_TYPE = setuptools
 PYTHON_MPMATH_LICENSE = BSD-3-Clause
 PYTHON_MPMATH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
