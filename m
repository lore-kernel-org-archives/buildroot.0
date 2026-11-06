Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L/n9Xaag
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989B860A5B;
	Fri,  6 Nov 2026 21:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCDXFnr2YjmA; Fri,  6 Nov 2026 21:14:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11C0F608E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999684;
	b=n1M+icWwsrpjK1a+XLruXe2lJ8heH0x2j7HWqWplZROiTr/fpkqjmhjpra4CPWfEEsUd
	 FBl/qc8Nnm4BFnAvho8erBM6VypqBcSQbWXk6hlGpE3VxG1eabQw3iRZhQEL0LdVTMuM8
	 c9mCoowXD+V52GfNDag89pzPJdvBxouYxkIESSVcESz5gSP2Q8XWJ2RezPlMZryp7nrL9
	 Vj3vg2YL3KWh38YcVuacvhTESc658DcPIjxprh8Qwq7Gt3j/QDXuOSWutfsiSEmQ00MFB
	 IK38XpwzZ9mF8GL2odQQd4PHxpR2x1okWgidonY6qlW8PrsN39K43AgBqfoQbE8HnGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ma1NVhgU8PysInlECq83RUS4lubboyw5wuGGeYRoJmE=;
	b=Z3oUmwjl6L8j3BiJO5PtW7zRwpRGSqfaIu5Q6MKz7btKq4fOGQzQsp3W87FtBOHfru9f
	 7K97eJ8pms5/YkMpdkAoSwrOxQqZvCVS9mD1+4u9dr8gcv1AANwQj+cYyMbOJ9Emoi6ao
	 2rTr3NFi/1eEja7z+4LmIXo2oW+5aSo6oNhVHJojDqSip5Za2xLpO5eerb4n/oxo5vkNo
	 E3vvlTz7coBGfQtgr+ztCcpmjkoDVW82/mkBzxhP4h/iIIhCtazQLwjSQLlC4i5bu97K0
	 2dOd3vKvweE9Qfn3j+DPw0c8+jFezu63D2Np/ma5FI3937VFskM6/yKkm9LJzJCaBUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999684;
	bh=ma1NVhgU8PysInlECq83RUS4lubboyw5wuGGeYRoJmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L/n9Xaag8X28j6AWA5Qy4arYEFN8fsMw6rh4SSgToSrElHAwdt6RDrpoi+9ceKyku
	 VY9VJKZaCzaYzypGJOUkfutxAZm2pL2FC9/n+H+0i39ZPP8sM9+XWohydEVNdWdPR5
	 cCUeVVFlp3+51ovIHbNCfRTYZwqyEKrc4DTYoqmg8i61eq+zoUK1K1sj05ysOkHpOC
	 1tgqLUe5y1r7y7/AS6WtmfCNK4wrFjMkUNkxSAcvWRDuX1LnxD2MCHt7AtSo0pxoJx
	 1fgRm6IsXaD4B2hGKkB7Ffal+X+SZW14tYuOKZWNviDev/qI5hxKWMap9Ei7StW7bi
	 9lvWnzQQTX1Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C0F608E6;
	Fri,  6 Nov 2026 21:14:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AB97AFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7142B81289
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfQMrA1M5DSt for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA74081250
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA74081250
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C78139E0B2; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52d30f93fee0715ae43582cfc15b4242726c8f3c
X-Git-Newrev: 4e4b7fd380dacf830fa33dd36ea5793af4d6720c
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.C78139E0B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump to
 version 2.62.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e4b7fd380dacf830fa33dd36ea5793af4d6720c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 8ed03dd9e5..77e651c676 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  efa6eb1ad00dd54f257b745beb28c363  google_auth-2.62.0.tar.gz
-sha256  0bef0ce54bdf9ce226c5d66e4264413bd918141c31bbe49fb52eac882f513d69  google_auth-2.62.0.tar.gz
+md5  a0c81651e7aacabb9df4637c2b4a1cc4  google_auth-2.62.1.tar.gz
+sha256  3c8e1ce2553784ae17fd220e6f88df3281d86ab98019278f436d06dffab17a9e  google_auth-2.62.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 2ec4100fa9..c038af6f35 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.62.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.62.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/f5/b9/4b2528f30114b106e3c3a7298ba38d85e682fd1f83fe7c4a5b77c7677082
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/c4/38/d79ab09dcfc1e1638d887c8f65657619d3ebc454165c558ef79355971ce3
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
