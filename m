Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD97606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MF9fhKMI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2311960739;
	Sat, 24 Oct 2026 11:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBp3QR7RoONd; Sat, 24 Oct 2026 11:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 091DA60A95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842839;
	b=hJ589WsoaDiU4cPIbL/rDYUY46OKg1DQfTgtZLz/+2MTIGegibMGd4QlhfIYUPLpi+oh
	 GkrNtdITdZxFfSRbdIx5JeEEyA+jYxHWUisn1vcsxH1eYbb6bAuVI14xcD1QJqQEWSZnF
	 ZaQvIsfWs6Go2vyPWog51pfVfCp6zoDHQXckTYIUe3Zx7sjMIe0f+gNSiUznkyhzh6G2N
	 GaR8Z4oTgJ4x6aCQyVm5gACcWLBNA352+wSWmJAGnH4esqQeE61kTPer3Th5kz8zZvp7J
	 Q65+nFSiSVdcmP9NNLWFi+UrjQRVZnKfjBQ6kDAb45xZhvT6CLH40cOiEFA1KFGZAbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z7RintAKeZkX8iEznQWQlCooJbT6ETiZs/6Ykb8u4k0=;
	b=WBOfNFslEYo/861ywEoqAmmBANPg4nMixDR7MHaVqJFKmmfFrrHkqabTaIZfgw2odge2
	 mDP416Yj/pAwBO1O6kwdRMnMZwfjWkneVIJ3TxT3d2A1kuNPdEYAuiTM/NiZXldAnaj7o
	 F4CyT+8PBYaukcBjpVdNrd7sSjUYxDoJ1dD6Tf08hEe4/sY3UWaga2eODQQftRHsudoo/
	 fPyNpln0B1sMgABU5QQ5PCysZwaxzQ0SPEnGo7YRab8KSpspCl6XiRsLzXNxT9VIO/Vah
	 A0nnC7Mc9Sq1p0683lTLNo9qRtX1agxdSZ6eWQ7e1qM0wHSTw+uqC3aDewRWakv+gLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842839;
	bh=Z7RintAKeZkX8iEznQWQlCooJbT6ETiZs/6Ykb8u4k0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MF9fhKMImVumRxHVtzjsUvYvAq7fYcN9mGiPvFFr/hRc5/TvjOwRr9SqBLmAmlbaf
	 vIQY3CCZNvLP9Gmqdv78rczBFFUKLyjTPOtdwW9vrKwh7jPvMAALpQTgyXIR8jTXhE
	 CPyTATPIEjM1ZB3A0ehklIkk5nahRLcWT+Kf7cZn9W+JTNx+bQYHIJWl0Nr25dcz4m
	 z6g4gHWixslnaKzSOpkvRBbfXCXdA2yB14LJtHHxOvvYp9eRWoPzepeOWtlMEArsqT
	 I0FJOEFBhHONyEWpDOq6dq4bl4U+KTaHsNcn8QeJ5pXcj9TLUmPZSIbjfQScvE8dEM
	 YRQTfU1tzAtZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091DA60A95;
	Sat, 24 Oct 2026 11:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC5B3D34
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D50034018B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZltNrT1G1MCu for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CEA2E4007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842831;
 b=eo7TtvfAbV+rP9MDwcVDVwHvlRkYlENomV4QVLQQZlA+dRz2QVSdEaLIMKg/fLN+7ieX
 SV0Ufkb1EwS5gtf/pEldgjDS6gQ2V5OfxC8aZI3mnCiLnHcovZ/K1+tIXhsD47XPOW7yG
 XcsyqQyL0EV/ZqeWCyQmMlVGqsTeSNSMEjnKvCiTn7igslwpMB6cs5loTEi+zryJRfn/Z
 YS3wU3DQ7cfOYKyXn0w/DFmYyCHusbnNvDDXFy+Nk8ggK1bCQKUewYrxk2xxlIJkEoEvk
 VCMEFU28vXjrCHeRfFF+xG3BtLhW+boha6GYOt0BWlS964a9Z5aKz3uSIlG/Ks9tORw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842831;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ce7vFSPijsjeymwL6wcfNqfiDGeM4d+SLnLGrqN6hYc=;
 b=MREaDv1A/oHKg7YpaAKJG6IicTAG4LjD55vmUYkRb4QX9AMhy5MHPB32JMxyEJdKA9Ts
 tSmSVqhdzgH1W5N11WbqaW7iRUF4SAkZJKKjoatGJDofPIU6LX2kuucpUHtb7a97v8oFQ
 nCN8YPifOYxd8+SBMS/2nukybmQU7gCPMQ7TrqiCWov5N3NGc2Vf66v1flTZRAxug+gfr
 wFXkjN9mnAKdEKMCkhnveSdW/HUuS/dleOzVq91KBXlxDfXU9aeJZvMMMSxcUUmqjwt2T
 +wiLnvEjfPQaXpJskKjAXeZ0beUdP0fxG56U/4pVKTSpnU9mBo0L2FWk4zwi5Dvm4Ww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEA2E4007B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBCAC9C7A4; Sat, 24 Oct 2026 11:52:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:02:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c5c826e5baae18c5dabdcc3eeaae495ee98fb36
X-Git-Newrev: 4a179b121b9985f9575365c8abfcc514172ad0f8
X-Patchwork-Hint: ignore
Message-Id: <20261024115226.DBCAC9C7A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-snappy: bump to version
 0.7.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a179b121b9985f9575365c8abfcc514172ad0f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index 2f40b6c531..d91c1eb89a 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  04a4e58b0a932403bb285900e67c778d  python_snappy-0.7.2.tar.gz
-sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python_snappy-0.7.2.tar.gz
+md5  78b6ad51849e18546f340ef0e1e49b33  python_snappy-0.7.3.tar.gz
+sha256  40216c1badfb2d38ac781ecb162a1d0ec40f8ee9747e610bcfefdfa79486cee3  python_snappy-0.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index 1b4b043f63..6e56609360 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_VERSION = 0.7.3
 PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/39/66/9185fbb6605ba92716d9f77fbb13c97eb671cd13c3ad56bd154016fbf08b
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
