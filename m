Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B81606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=auCFHreV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56E04061D;
	Sun,  1 Nov 2026 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QC4zpAHtJxx2; Sun,  1 Nov 2026 14:50:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0012405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544650;
	b=U3CsvixXUmBZBhWcj1Z0pIq5TH/w2eBAwfB9l2JBidYqbINo1toJ/2G6XAkLn4OBqs9k
	 cKEIoLp48vcgn0G5lfAPp9ooyvph/lXqiseqOubIWQKde4jSn5TDPCWtE/5/fJ+jvjlBc
	 xOiZn6OZsqqRk//V/43r+Q7untdxUVvR20KIu0GpCoKx8cA9BJxo2VMgfRDdVFQ7LvsXB
	 RwfUL5TNRLxx/EXudAMI5YDVbmm+FSpHR5pifb7DD5VwunSXqMWYmk8TeH8+EuJVu4zye
	 U0uMywfVcmhb4gjuWeftaWLgRjw6ryOsyyWwsYQm6axXfaZSjiEaLN2s1fNwQ1sJH7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dMlcncuMMc3vAPHc+y0vlyNq+DdPE/wsVhSG1ar5Qgc=;
	b=eupc9xYA7xsTj4XupZTuET/pRYF0hPY34s6G0zOmpn7UDvhI1OJN3Xhkoywagi2GIGW0
	 jZS0aMMT/SFMh1RDIxyDH96s0sEqxXPc6YcNyjBDx1s4PVCvGiz5Kd1yrUy++FwcOl03a
	 fbt7KFzpU/hkJ0uwsg7s8uMYJcpCQK5Z9a2Vkzfe68K0MZOPGQKWU2Yz5oYOmV+J62NvM
	 dCCXZaa+Zm+jW9yL5o8Ik9vA7mv886Qi7HIowAyzFkZ8raBZyuJ25/f0a/XkWDO3dQvqH
	 c/CiJgz0Ngi/xoZ8Glrlmir5QlHEnfSN5Vtaikr9OaeXWrlHeDJA85mDlXS4C1gWyDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544650;
	bh=dMlcncuMMc3vAPHc+y0vlyNq+DdPE/wsVhSG1ar5Qgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=auCFHreVSWu+IJCJ1TUNnWHXfPq01PObFbAL5fo+/F+VionMsOdDLFsvi1eDjlga4
	 LLiVhzLgg8Vmv29GI7ZABMnjYq6edD5TX9ZVB+zo1DNcu6X+JpmfF1gNQ+lYC2+EXv
	 GM7YhsjMCQ3qlox3zCA1Jtim930vE0g7RjLV8cMjBg/CO3O2LbVQsKxwdHgKlEy7MU
	 Ip2c02Q31wMHBxNbF5PQeyO+W1s/QDxYz5+Gw/x3goSKaTzd2ayzXSJMN+wE8RDgLh
	 gduOu+r+2fYfkyrpScprEi6+pJWi2TYrJ45S4WgtVNdine05K716jvaErvPpP+xDfM
	 pna0EH7F4HWRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0012405F6;
	Sun,  1 Nov 2026 14:50:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D0CEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7CE6060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TuYde__zDp3 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5C6456060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=UOufbBo9qMON0+CA72pPxulxFxMoIWGgPxnSBEY71YD8ykX9uC73wU2knubp5wHs9gxy
 RnKk6Qif+FrU3DgYCQ/v377iPtAld+4Yi9sJiLvmps28P0Umi6FCfxtpr/twi5u/6yN2i
 Afw2osPcYUpn1DogwL9mNw+gGl3rPRE7jNPAibm99uqSFa4R62Fay2buv9bxo1E1bc4cf
 gOHpsOIPMZZKaR+WtVT87CieFvSJhADqYFZ9ivll8EUzSVGlq/6y9KDEqQ0ttA3AfPgNZ
 hFUZUBntwSY0ndGqdr1XLZO7zZKcOaDpnNNj3qwRoQrBPLgDSfT3gOF+QZd13PR2r8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZzKx5lrEo2NT9oNsBIQpy0Bme9CZ8MB9I1NDfuTnAfY=;
 b=KfhNX+zA8pNwDN4kadtT2uJIEYaA3AcdK/j3LjFoqhpc+AwHTtlQNHGgrHCHQAaua+k3
 TE3PpLX91ttbbWJRMCIuXSKbmlrk10CBb0AWcS/swgP15Yz9qQOSi9YWEUd/g90+EJ49p
 NB/SoLje894npAdrSQ3co1q4cMrHeh4SWideDw8oxOMAgyUewPkHTOLj4xre1jPE6UH59
 q+Qaq83cZHO50leTtkVgVHuAAnnt8SpWTHW3uA+o1GfJXMk+1gzq8//x6KQaSU+k4YqrN
 XrBa+eVEPy0Qx4NYpbC6nNG2cysttJxSJ3iml6HrEezwVwIKIg/F+m5by5ZM+ua5twg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C6456060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 309C89D490; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8828cca1d64615cc8b74f24aef8add8e3d3d5572
X-Git-Newrev: 9ddb57b60e500076b79b123dc12503a78c8288a3
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.309C89D490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-oauthlib: security bump to
 version 4.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ddb57b60e500076b79b123dc12503a78c8288a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-49272: missing device code validation could allow a
client to obtain a bearer token with an invalid device code.

https://github.com/oauthlib/oauthlib/security/advisories/GHSA-3jp2-3mrg-2vxc

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5540760118..e001a8baa7 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
-sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
+md5  52700d6336f3766bd05d98b3696bec88  oauthlib-4.0.1.tar.gz
+sha256  3d73febdb6faa00f277c81fb04be7b7586fb96fc3b7f0b9c772dada69a25ede7  oauthlib-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index d001fcd071..7a2e66c22e 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 4.0.0
+PYTHON_OAUTHLIB_VERSION = 4.0.1
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/33/17/2bb072de0b990303c985f26869fd47bb179024a051f47e7f9d208eb92f8e
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
