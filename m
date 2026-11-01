Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF1606A332
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sukgjF2f
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD1260711;
	Sun,  1 Nov 2026 17:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ7U6LSi-UoQ; Sun,  1 Nov 2026 17:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79186606F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552860;
	b=QfTofP8WoZlUwKq/IxMljmp8vL7Y2xM+fZUMz+oI0/St1wwfoj9ImYokn6AvCnW0t1ce
	 ia1BAMgjj8tQuVn0Yh1CTtYT/6IHhim+H69e9XV2Jwj1DkUJymEt7R8eegk19N/emvmEG
	 AxIUX16SZTCd1I8Aqz1Md7LIAkgALLia4guBXfHYjAfzH3/pUYHEo2CWySd0YIEanbLjx
	 T4rDf3wCHkFyJVzeuvn3uS57+SMzTiWYP1hky6AG2f5VnfImdLVBzN+5EPglWeGKSdrKP
	 NMTHIz0xoz7+e8smWBRtYih531h1cqGb5xFMf1zTUNdKdEPTcN/5jCrOrDCPAfgQZGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=agvQKFBoggm8PO/kUegw6wVxD+SnpRE7yKWuNaXaNUA=;
	b=U9k39nT5pPSeDxeSoWVUz62Cd2ty4fOGHGbFVHHGN5LcUuQNLN7Ly3Xus3GpL8Wbi8XB
	 O7MWI/gvu1Gd82zuDSX8zqhkUSvC0//V6O5E+Vc1rQZo1G2rIGdyszh4FbQDMj+xH2dJX
	 J+hr0KuY2Eul+L7KWeKGGsyeurMqiM4X6L0toUIvYMkoB1Ph4Y52ivG/UU4Qq1gGmyQmf
	 s4jI4MTHntuizBTFgyNnlyROtIcPf6JexxWM4RZkpOS/sFGxCAlNSXO+yWqkwSzJzH+Ct
	 j2O1zz+CiHb9Bu9ZdfOsv3aPlxpMeO90iF68njwJGtFFdxYqq1okfvsdbU6klfV0gJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552860;
	bh=agvQKFBoggm8PO/kUegw6wVxD+SnpRE7yKWuNaXaNUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sukgjF2fT2A9YkGA5CqF76tCeqvTnE2dkAeceKU/Q+buoQMWD7a4RY5UxK09E3zLg
	 EhHTUqOzxTpgsPZiEEVIZBI+xqXReAn4G48AyVgwBWHwJpfX11Yenfuzrp3vnzcbfa
	 50LgvT+KEfz+Fy8/rfWmAgoTdvfGVplXtqLZDgMC05forot4LMzaMcEkL2Q/9h06F7
	 hrYD8GVl43XDbTqeRkr9VZbhDGUmBN2zUEkhbJbdNsCTw6OzleiZqZez2IqQN7rUKf
	 1YQrbf87F0ti7KUvOh9kjmCFogZ5JeuDmsszFIqBrIe2T4ev+kNq0s0I82nBwYT9rw
	 If/noKDy1QsXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79186606F5;
	Sun,  1 Nov 2026 17:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C2C2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EEA405CB
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZCGAcAO5vF9 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41A8F405CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552838;
 b=KabaDKQFm1RPIALX/7iHJwdp0qXCU7hCqufNjmII75Xg6NRuhkMJ30TIIosBB977ssqb
 4SSrIz//UvKZDloznDBIUqRXR5f4wmKG0qhW8WPFXtONpIfl9oQA2zB+YgHpe0uV92BUS
 xnmlZ5IZIYTCZLX2Nnje5/eNH9OZHlDsZ53b4ZGVP/DRQhKZVD0QtRJoOiluE6U1jw2RT
 7N8SlLRWoF2srkV8G+11+nIusmD3XUzKoiUKyFleYj5pG7dNYXIiFQaiFA/SCFYoQEkl5
 ZGSRrbfcZZt4+Bi36lDTvOIP84gUZmKt+WWk0iIBoQhpxv0+zOKJsvsRt2YmJ5w8FKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W5zDiTqd2obuxl+qitWqzxgIkjxqk1q/pzgLoAWgWRs=;
 b=O84xkipx9oi78vIwTPTPVjNNgwqkyF2cqRplq6m/X63eqLAxPSj+yQRQY4PReIsKNA04
 Xw1GLKPdZN8U4t2QB8KsfwQKX5XSKAwCt9XeH41Ta4utUeMq/xbjMqf7riKCLLU7prauK
 L0Yhf65rqxwU0WYm3b4ZqCHVWhmCjmxSdFZZIqsPFMoiM5tCmOkfzoYPPYPVg/6d0vlI+
 6clCN2TqK08XrbuYnqbs/FtZORO9LD+Lot1Rq8+sfK5jywojpidMG7XczP8buvbK1IBS3
 Si6KPMtsj63q45Qv06of9cWWVGRDv1Qb1kEaLItzboxFYzWpi6EB/a8DOWMmiwauzBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41A8F405CC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02B859D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29b8164302bf2f65624b7b1530b326b678e4f356
X-Git-Newrev: c9b2f15d406b4c78a266e7f9be7014c3c397995b
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.02B859D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 9.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9b2f15d406b4c78a266e7f9be7014c3c397995b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index b1cb9d8cfe..d803261d18 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  31f635913c0b1bce9438be52d44398a8  pytest-9.1.1.tar.gz
-sha256  1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313  pytest-9.1.1.tar.gz
+md5  5a576b1720677d76c1974ab13242416d  pytest-9.2.0.tar.gz
+sha256  97c4f3b1f3c7414aa36465e09b8220f1d03627993bd51b1282e193753c80557b  pytest-9.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 6de425cd23..ac5a538979 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.1.1
+PYTHON_PYTEST_VERSION = 9.2.0
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e4/47/b9efed96c114afcfa3c9d3fe98a76a1d14c74a9e266d397cf6eb64be5e01
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/79/42/bb4641652e58dedeac2ec51abc1f8cae4fee4ec63899a0999016229a0f2a
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
