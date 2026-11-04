Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1854606A326
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jIl/zb6C
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89A2080BCF;
	Wed,  4 Nov 2026 17:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuo8HIuKDmrm; Wed,  4 Nov 2026 17:19:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B518A80BCA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812790;
	b=XcMWj5Jq5g2T0hvyTkRRb0WHO2DfnIsmF4A74vbcZNXzeM+Izv+B+OLSsrMMGqeSSghc
	 Wnsr/8+iSxrgUAdc65bMRnZQSE7rLS8q3oZvnmHRIlYUcJ5+iLggaD1s1HbjM6WPU0ytf
	 g+DSFsAW6jNWHypf3igbE95Zg8oqwqP+ET6vVQVcOKICBmq6RwAk5PPZ1Ep454SlYkPdO
	 GKDS6eJImZQCy59y54Etu0IlzrUk9cWlCiXaTAWuQFlClVQFXFLLLjXkSg2qvuPsDob4t
	 PJ0LXQb/HwkEVnu/OVh0ouqhFYrJf5FqFbWtNowKW8JssqtfAMGZ+v2nbqPPO4UN7sQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XyBfYePXFuAbCUlRIb+o+iU5vIIseCl7JI0xVh30+dA=;
	b=e2jM6VfytVbj6mtBZY68cPtt0YewSsyBjxZ7TJUgrPwR3wowQ60eyvzL53aoVh8kBv3h
	 Oy9Efv2NP1LBV+KMPWQkSyFjBD6cpjIMfheagbWUU0MhBFqSru9ScjwIH+tKYWRXe7t3F
	 zXSps7DMFMsO8JzEQNvxn1aDRWqCrqs3W2IEZK24rt7FgpF/zYWSgnWC+h/SGvS5RnfvC
	 RfMAL3oybtdyKnPR1zsubLu1ZXEZJmeIAbo50UT8RheVx0Rb5/Zb9brRpt9CRqcD6ZdCI
	 TBCUVtnVN94E0Phyw8ZwuRtgua+mbfLUoNjW5/9uaLDGWVRCUCGgkKl+5XTUNINKq7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812790;
	bh=XyBfYePXFuAbCUlRIb+o+iU5vIIseCl7JI0xVh30+dA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jIl/zb6CHm6UIFId81c9XCqYdPh5gYPoD1p15RF6Zn7bW9rwzeU48XnkPciXJmG+4
	 HSmjSRdPv+guPBTEtusKbfGuh9TgCWcmFakLg9m+3J473cSOwYh85t3Lx4xNjBIRTZ
	 g3/RL0YpwdOaypRgqgda6UOBHl20mpPLgjbJIy34/QIOHE0xyFEXigEJS83Uz1EV+G
	 bfIKPOISxhWrZwpx2eyL/BE+0fUvYz2HxIQkySul2c/IY0kRX8NX16QRf2D5YSNyny
	 ZMzrifNLgKE2ulEXdd1C6hDGXIpv1QDEHqUZVNQ3my8SmjvUPTz/J70KStG90qLLPy
	 S02HGqz8gp5Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B518A80BCA;
	Wed,  4 Nov 2026 17:19:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A0DB411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BB6C60642
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjiK9xDD88Dj for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6CC43605F7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CC43605F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:19:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A99E9DCF7; Wed,  4 Nov 2026 17:18:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:18:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8099cdcbdf4d3927de1df95b99df9e495f546599
X-Git-Newrev: 0ccb6c7977ab3294e1a32c1d9a010ff6fd9b10a3
X-Patchwork-Hint: ignore
Message-Id: <20261104171818.9A99E9DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlparse: security bump to
 version 0.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ccb6c7977ab3294e1a32c1d9a010ff6fd9b10a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix CVE-2026-112307: unescaped dollar signs in generated PHP snippets
allow code injection through interpolation:
https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-xmww-55xg-h3vc

Also fix quadratic CPU consumption when formatting statements with
unterminated quotes:
https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-3r5h-5jcg-gmgg

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index b0bb518e72..1b8d4f4f81 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  900c83341958cb0a16380b204f2fd748  sqlparse-0.6.0.tar.gz
-sha256  113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9  sqlparse-0.6.0.tar.gz
+md5  8e1d392847417849baa6b533b608bee2  sqlparse-0.6.1.tar.gz
+sha256  ca722573f848ff2d30e40ea30f53a104b7dea7635ea9285891263eb2c58fb6e7  sqlparse-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 6dc7b59a96..a6ec641188 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.6.0
+PYTHON_SQLPARSE_VERSION = 0.6.1
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/5f/d3/3f06a1006f2261d1342aefb3c71eed02f5d4ca5bdbecd86ebc12ad38306e
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/7e/e0/361c764ea58cc1a75f7b4b424a74b08449db8bfa5e9199c7275999fdd1b9
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
