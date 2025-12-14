Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A07D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE6440921;
	Sun, 14 Dec 2025 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJzwgyzJzWTu; Sun, 14 Dec 2025 17:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB7B40598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734472;
	bh=Z+9sXUTMKXlQtEr7m5t4YRRrFT48j4vpro/9BofF1Tc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EkfIdFXVTrx3rXn5//XGBK2eLgS1Szd3igoqybjH8IUnloWxiF7kx54eU3krToU2c
	 rB4MXpGCj5sYc37LXnDb3e0oq0UrF0SOEEqJXR7p49xD3S1Ey9XbCGNmqH6cFCQnEQ
	 GW/eV8SsPXXgEbbMWsr0Fgi77YF2iT0j8kSiZXXYjVCKfU9Waw96bQinEjtgTBzm6Y
	 NwPi/Yw6X3nB3aUTLy5MThk+VeZ23psjHewl9+3chb/YW3Oopat+Ko5zQguCc8Zjh9
	 P8nbh8v3Xi86PYnpECy4QRySN0rHjwXZbfOIVg9NXA0r4R4B/k4IHMofs4mWksoqvD
	 IYCI+DtkpQYVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB7B40598;
	Sun, 14 Dec 2025 17:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5342117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87581404E8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJxxORYjzY-J for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CB9404F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0CB9404F4
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3ADB86E96; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 976d69f6cdb306b88b64eeb883165c763c876a78
X-Git-Newrev: 3da98857225b4f36db70f7cb4f745a746ed96189
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.C3ADB86E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asttokens: bump version to
 3.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3da98857225b4f36db70f7cb4f745a746ed96189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash:
https://github.com/gristlabs/asttokens/commit/9db9335648659520c7c8453bc39550fa4f95d539

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asttokens/python-asttokens.hash | 6 +++---
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index a8b552913b..ef108bd0d6 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  7d99c4c80190c3ba64839138ea827970  asttokens-3.0.0.tar.gz
-sha256  0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7  asttokens-3.0.0.tar.gz
+md5  50670141dde921f807d8257be4a5df9c  asttokens-3.0.1.tar.gz
+sha256  71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7  asttokens-3.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 327ee6af91..4040a7bb73 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 3.0.0
+PYTHON_ASTTOKENS_VERSION = 3.0.1
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/4a/e7/82da0a03e7ba5141f05cce0d302e6eed121ae055e0456ca228bf693984bc
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
