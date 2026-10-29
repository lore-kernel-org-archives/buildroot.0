Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3892606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CJ+08D61
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B3B7813EC;
	Fri, 30 Oct 2026 14:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OE7VBIW6TC2; Fri, 30 Oct 2026 14:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92137812D8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369289;
	b=rrNccoyrVOqaBxCkBqpKQ+UakcyCe8TP1BgxafoeDENoIXewaE99awIQydj3MbuGcMDP
	 6op0Vi4Jryk2Yd8qbkyvYHJYm8U+Gj8kn+RmZWFAq/w2WRRbKWwPtqLp0TQcCtq3bwTxP
	 bU+7ahMc/pYyeMyxK3JUMDIvfrJRpWFC81u1gQ7xfCvnVqqNoLqw3SqwVlVxcytH9n2ec
	 N333w73ntFnWL2zbDwXwEyuiuMkVvF99I1vNaJ5gQyNc7A3y7oB29LWc6RFyDX4tklzgd
	 CBMjnAuc9IObs8anmqEqZuWaCg3ULbkjm22zRFd8iCeapYg/aOXK9Jue1jDbQ6Tl0Mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=19ntf01o/BW7Uj7TPoFgmDGnMwXwPx9bxZ7xXuPQbeU=;
	b=rOVnksSU9tNfigAhkfrylVEjtg9E3GNXrWZrGPiI2ZAzniA4TjsJBnLYuZfjg+YJ3PAp
	 9PdxNtVPpmPciGdYLDv6MeV7Kh1xz46bs/qQOtsTRdotexSRootLEXB/g9F0UXVk/sq8z
	 +2iyzxHxcSTTtmCXhE+r/qt+8Q6phSd3oXioT8ybJ3n+ZP6qPqYVy3RfDFCbiaLr4Exbs
	 r3NzSMt/En8vDsc7x/dce1izJqvBj7HJ3oAW5HiJ5UxNnbfUFdsocaO0booPkg/UliBmD
	 g/mTRkxR9xYtDflaAVy0GyNCY0rddY9Lvq8D/G+dc183n3VkZE8I2RzXgy0ybuE63rQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369289;
	bh=19ntf01o/BW7Uj7TPoFgmDGnMwXwPx9bxZ7xXuPQbeU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CJ+08D61yK+FBw69/tbz6InvxhxIjOD2lHf7AtyMo2DBrl9HYRng0385ZVL51YlZ9
	 jNHJEMD1c5fZpOs3g5MNYT4xt8fzgy/jI9KufsxvAj6KB531205iDtRnMYDmOQVXiy
	 SYXQrHEthJ/3qSasSYsYKHNTspOc6eShueCLNicUqLlK8Zx4cvPvePQzCmV5FxN5B7
	 seRzRVDPOSGqVvqyaQtiJTOL/uGUQV6Nu4AJDnD1OSO2y7VRroUYznKQBeqd8ffpNm
	 +uwEqxGAgk/Xjc8TY0KX8haWk/ikD5FGRpZwC5fEDBSOsPWfj5/70+2h4GMQ2n/4Vj
	 zdiEg3M90W+QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92137812D8;
	Fri, 30 Oct 2026 14:08:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDDD8362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F2881180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlRmfIIeblyM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F02AB81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=WYgiwb6yH4dBlOCHXBudkCDcGdBf/b4veEGO7n/Wc1LNmnCZ3gPIXZp9j7CwsBjlF4lc
 ba6wk6URhuwI6jESyrh0uC0P59pUhrFwSytAwNV/t/n+4yJmb3l16ozQmygP/Fc4DNUuO
 GwLFmXRYG+rPsFABDR9YPHtWbnrM+CZFd82PJwPSx62W2ETDVyiL3U52jZcMWaRdM9K50
 UjaeeGzmusjFgD0BSZGo4dV8osItNkpRQRWft8Vr9Ha+6woEYRSrFGjDWf5AOFWV37TQ+
 vE7/qMhdQe4Iup4/Uw0lfw8JOBzPSn188JsJ7VSSaZqgaXGnlPCQIcSgRor7PW12jHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a5oXcichHeQifJ121oJlD5gCUCvLzn439G4Y+G11pBg=;
 b=pa7i72+ZR0olyfg8ENq48Dmow36vhUyG5CC3d1p5OjY78MOu6WFK3Wkfpx9W4U1IXymb
 /efdOEVgGyi5pVl4fR4f5TdrSL3CjzVePCASsdwncv3asBNkfh5EnJYNs76mMPci8/euM
 qhU01qAnH32gH7XOmRJaz3b/8ljQfEJAzfKhvbWBGEGUbsq3ySYdF+gUSg6YxlESpXqfT
 EgiAF9mu3LBOcPtScC2uQk9k1m6q4XfQweYOigmsgnMfFnIP/C0Wsafqoj0jTRFAAkfF8
 c2VLiooWG7Wi+97VlsP0r3TiRTahU0EjPjtwF4YciNdG6BXitMy3FElYj9nU6CW0TtQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F02AB81172
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EFD99D388; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5e7ed9819755d07ea00989e8dbdcd23f96fe4cf8
X-Git-Newrev: 631ecdb4e16784744ad1e3a9934705d01b918365
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.0EFD99D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-brotli:
 security bump to version 1.2.1
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
Content-Type: multipart/mixed; boundary="===============1199203981646843344=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1199203981646843344==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/631ecdb4e16784744ad1e3a9934705d01b918365
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For change log, see:
https://github.com/google/brotli/releases/tag/v1.2.1

This release includes the upstream commit:
https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6
which fixes CVE-2026-111497.

Fixes:
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: mark commit as "security" and add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f904d35dce2f40226a115cb0e440bc486a7ae48f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index ed8eea72eb..da2d58aa44 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
-sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
+md5  ac1e85a7466ee46d0ca594e041d7ca78  brotli-1.2.1.tar.gz
+sha256  02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de  brotli-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index e2343a24b2..6f5e966a05 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_VERSION = 1.2.1
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE

--===============1199203981646843344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1199203981646843344==--
