Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDD8606A32C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N+dej2xy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D91240B87;
	Fri, 30 Oct 2026 14:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCYUhTpvqVQq; Fri, 30 Oct 2026 14:06:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4007040B71
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369205;
	b=k/KDW6bvMIZ61iFW91VAX9w8da8HLzkRmughtiGr2rnVg+w56GrgWwBP2zSHqDzaoy8J
	 53lIwKz3aOVFwhbB2jaekT6PrSrVB9wgXtTsZmG6duLgsQq8QrvRT6kuYXLJ5VV+wEAOf
	 cjATS1FJzGMCNK9rp76nyOGThLgrt0pJpJxIiUsTDbOiTsmPI8BVkGgz01tD54E0K8TW/
	 jSWpvERQ3N+IuoSSP6sRVXB+Vgv0VGxyCm2fDPZTQNxcxPgYiuyBEAcCIdoWUbS8Z+XaH
	 2IsWMEyDMhgilkT9PkmmHWyk+CNfVLq1VHEarqObyTXY6fX5MP+bGzVaJOPPiKoOzWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YQBaD0UGKJ2fA8Av4MQMJn2QG4XpcKFYr/J19qU0PpM=;
	b=E9ser7zrED4XNK1+h3dOag01yM/pf1FUtMky4kRilTdhEF4kKBV5/gAz2K40k43c1A25
	 N3H/RuUco7DAvLLG2WWkuz+XFpkYfiN884fIzRQ04N/eLR9DtueET0uNQmGx2qlErlLt6
	 xIFdsS1mgnlHZpZp8i5LOXkkHoU3137c544mavJA/KnLesM7sUt5JDDYUzDuf1L0Mulnq
	 VxcO+smqVpi0ripkQfiCIwx0C7pePHGEjiuudca5ph5K9771fW6Bc79MbHda8so5r+I1a
	 WVw8ZXidtVYpgAHFpU8/S73QNjUK7qHtblpECLEAd9tvvZ4F0ux2SYMc7U4kOKIxBkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369205;
	bh=YQBaD0UGKJ2fA8Av4MQMJn2QG4XpcKFYr/J19qU0PpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N+dej2xy/53jhU1JtMMhjRhPzZGy+kxW9eBlQS2zbXs7wYlS2u24GPBk1eZbB0jjm
	 y/bVKsZ7ijzwD9KkjmOk4u44sS95RXkEjDCMShbPXU6sUFTygd6S7rhV5RsRaE0HA9
	 t5peUFbs9XPbZMXMDfBNyixnRrdTcr/SJk+OhhomzjzHVvac+aUF/kSaONk7lBmhGz
	 5GqKrfXAE5mW1ORfxFIrukAC5lx2Hsxx5C4nfVz3gimDTcaG+y4a3iZU+72V5Q6cS/
	 j5k4A1ZaxUWYAV7INpBfMhxaKTrmnvT6t6CI7d0NUHvqcoYO3VYdvdfr6Bw/kz17Yv
	 GD5Krwmou7nxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4007040B71;
	Fri, 30 Oct 2026 14:06:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0453BD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E70B5607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvFBY-zQPpVe for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 181D4607A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369159;
 b=NoUE5M50eFCdalUp/8akQlgYbWhW0gufKXNbN+GvnbfaK+hRhqWpN+RTyvrVAuOFxNQu
 Iyx/daei+oPhEme2/c4Z9bwOC8iM8W7m3jjQLwV6Fsrv8WRgI00tRddVlfRhOl0xol6Tg
 jNLhV7sEjpt6PubcFv1lsOCTCZHRZTzgl/ZhVTsl+nbb9//IZwnzpI2gSUc+ELwgjsBHN
 qc31UjYueNsTL5ETbbq9eTm0IvWMEstcusKVho0pY7o052DbQ1dO/wwskW2Y9WPfcAsBu
 tq33lrX+c+/m7A9RnA/3A00MkmU/Kpai7c9dKdgdVhtZlX/mDAEWdkxxelnvd75xJ3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zAn4jrHHyG/4OoCTYYjSf9T9O/OfPxJ1nLeGAj9oC+o=;
 b=XIZ3VOrkxxCFGlhAu7RNY8tUQar89t7siMrs5e4KjvUwGT8Dp0yu1+odOzfxccEi3p9F
 Xm1W9ZtFpB69jcI3zKmPCZNxnxsY1Ujk7g+cJcMEP/98hbiLsqHZ0bMMnVEyCK7X8sm8r
 pE3CDpl4xJqyotbjSXcErJYswvsOtCBM1lWLHMVjdwJWgAO2vuaymccSvCW1OgBdKxnZo
 h9fpn1+0mZl16csiO/FoRSJxDYCF3P4F7R1ZHXSsMV5RLzGHAg9RXKyMBW8yEUMkiCJcH
 To/iLZc4Wxt66tnkmg7KMGyJrzh8L1N2BWxJsFSeAwcrLnBHGGgOn1HbYff8e1RjUzQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181D4607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 379DE9D389; Fri, 30 Oct 2026 14:04:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 973fb2ead89f9bbf24ea7b7ff79039716db71488
X-Git-Newrev: 8a3c5a3afb3be53c95331cbdaa4ed5ef11007803
X-Patchwork-Hint: ignore
Message-Id: <20261030140431.379DE9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-certifi:
 bump version to 2026.10.19
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
Content-Type: multipart/mixed; boundary="===============4558029930227574649=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4558029930227574649==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a3c5a3afb3be53c95331cbdaa4ed5ef11007803
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5676346fd77e3ce5e672e94732b2d098dda2da55)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index c6e0206ea8..a583c17bae 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
-sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
+md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
+sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 5430596350..bdfb8ed12a 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.18
+PYTHON_CERTIFI_VERSION = 2026.10.19
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE

--===============4558029930227574649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4558029930227574649==--
