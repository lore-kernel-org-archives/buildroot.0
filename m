Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331CB606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JDVDx3se
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F1680BFB;
	Sun,  1 Nov 2026 16:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOSzrY1g2lxP; Sun,  1 Nov 2026 16:04:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D05880C1C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793549059;
	b=FGLve/TddfgJV9K7a4/i1NUD8ZNNk1FoL/P5r17lSukdsYIFvtoz0uJzYRzcTMqUL8Qs
	 oHxsR+6OpQcsXvyHvYmE2vv3nYDDxxoXJQsYDgJ485uqJiTttF9cl52x03Y1wJ6lobFUc
	 aQVGYr5Qi9QCp0JAyy1H5OBhwcMMsfp8TntClLKmVakW152cn9ZyEfT0vY2ES12EUUNZv
	 0G+rhniSh3xmvmVV7/L+FhJVeuiFwRJ695EIA0IL7aa/Mfx8hQ0wzyHmMutcGZ4V1q7xS
	 dlaanygXd1xMpLtyC/1YwMdAm2+bQMaWgRt/Cuj/EFD/FGxSZyGd5QXRJLQsD/Pl4jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793549059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Otn+oOpCK3SWccXreRyykx/Xq/BQ0VZ9IQbVhafpBzA=;
	b=RXrZvy/aA2tsPdD9Uevr+iGLThGANlmsGy2bjto0Vk75OnyvQte7OmTJkzw+i/1bOKfu
	 GjDGUMp3DwhnAWS+m5YOZ0erhBfobKIWwNmjW8rcA3+tFHXcPbse/0GFH9u6/tdxH28ut
	 cydG/6MD0nao1dU51mTsZpmynQzxHQZ8qmpCxcpYZiBVfWJWvwCPSgm8EWBo4FKtW3r0b
	 Kpx8CdlVR9qGCyFZ+9K6LF9uWGC/z9FhCO4X5N/EHnySRq0nmC0Tc4Bc+2fJhFgAYz9w8
	 wOXHyBvM1Rd/io/nQxG7DrpjAJaSBikLQcojPtmyuNMApyS875C6S56RID5Co0vlyVA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793549059;
	bh=Otn+oOpCK3SWccXreRyykx/Xq/BQ0VZ9IQbVhafpBzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JDVDx3seEMdR7WhFG7MrlAzFs3nuNqIUy4eHESUCvgj9lR2Q8sqfF2CFC2kaWnHgS
	 /nwgWjuIuBtTRZ2J9GdWCrtwAF4qEQOUtwF70mJKWBS1z0bVrRWyqt7h4Fj9kliT4C
	 QbwUDI0b0R87jpEHwxHCTyhxv8B/hcpXvMgNr4tn/C3T5K/FtpCE/nzFCWA1kfNKiq
	 dXAOuPUbfxT79CTxdv4T3cyPfDv2D3Olp3UKKmqzFTd8CfReE2wgihqDT0ys0JrAnN
	 4rxsAiO4rcfPvDzLbZVGjblBJWIB9jiE45/yLR9aYVYkXcrotarpsWN0S/CDRxRjop
	 55HwlrvVgY1aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D05880C1C;
	Sun,  1 Nov 2026 16:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5493A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0FDA4009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BAkwTyqbpjz for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DC46B4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793549056;
 b=ta+T7MSEtHo6s7cAFF5TZC1Ax5lPWyTmErP5QekkbSFOgt1ICCPpzn+RU+ypmc22K9L1
 SRWV0A6qq2REue2oS8tZTMR3bPUJaOLBT5PhL5jHAVw7hkEL3DbU7ERViRL0o3WvkdRiz
 ibcQTWt5Bx92oyux36IwvsanjxWcNSngHCs+6ncmzZ0QNlW1MJExecbGogxEx+HqccMwQ
 D70REZbRqcCEAkSUGgyS6WMur7OCHxQfBXHaxLenJjeRhBGiKCi6l+GcGjhjWpYMz23pI
 6lUQ3nz94eNJcvkXWwEDsQb8LrfmsXCOctvK1yp3HKRXmRHj/n8OLarbpzJDTN8VaPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793549056;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a4NOxvFHfuurTBdULUPP1WGIOCxlaOUL2j2z74XXeUs=;
 b=IIuhAQHeN8ue0VBT206VtsEVHrUg9y2HATlB6jVp8UJExLuJHUiSuugOBifUXRAWHpLZ
 2vXeT3fKYHTPoiTq5YWikRIiulfnHZf97tuFgeVuMZ3RLAb/fcyITLErBhpxK6DQw7i4h
 BkNE/YZEQGqY/cS05zGWe28eMjVRiZV6hN01RCsIORLr8X5jbc6nNgXrrkZ1nGpXTJfqs
 VQn6gs6Hn2VJv44iC5jKIarHBipGAt0gDhTDT++4b46fecYIj/JtHZD8Q8hubXw/jpUif
 3FLVNhKLpvyj0exnK/k/RTPIuWJHXg5vydCgwp1yd60rlxUywexWEQnHs0B+sldT/sA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC46B4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ABAF9D4AE; Sun,  1 Nov 2026 16:02:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 16:49:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ebe90bafdabf8c444d7a9a90bd592631614c58c
X-Git-Newrev: b44f6a27ecf86bff4b137efe6648a32fe91464e1
X-Patchwork-Hint: ignore
Message-Id: <20261101160247.8ABAF9D4AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.43.123
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b44f6a27ecf86bff4b137efe6648a32fe91464e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 4165d4cfde..bb6a31f622 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  3d48f43d16ae64ec8af669c35f938b20  botocore-1.43.118.tar.gz
-sha256  7f3f9d88cc9e847587690f82a42e3c3c292c3026c92c1e60d68a9310018e003f  botocore-1.43.118.tar.gz
+md5  2a0f0c5b960417f5942dee41def3e83d  botocore-1.43.123.tar.gz
+sha256  80948cb9b1cdf1a1a25809089a42e3a1bc4af0258d198222db6e97dcc660dd0c  botocore-1.43.123.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3aee2d8f30..de4d459434 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.118
+PYTHON_BOTOCORE_VERSION = 1.43.123
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/d4/b8/3e55154ddaf1a6d1d4ddda85c0e5983205a3b7657edacd8ebba8c6fd774c
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/e0/de/011fc2a47fb066c47064b122498d2fd21f55bc90ea514acbddc37ca0f8c1
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
