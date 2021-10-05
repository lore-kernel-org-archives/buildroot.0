Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B372AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 02:39:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4496613E6
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 02:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4496613E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DC96087F;
	Tue,  5 Oct 2021 02:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6XPM7u9rb0i; Tue,  5 Oct 2021 02:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB4A60888;
	Tue,  5 Oct 2021 02:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87E171BF34C
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 02:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7736F83C7F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 02:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=protonmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toKjVVxUtiyS for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 02:39:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 899A483299
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 02:39:34 +0000 (UTC)
Date: Tue, 05 Oct 2021 02:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1633401571;
 bh=O0HOfvL+T1tbvNRbP/2mHvcCa0+LmOoj7qEiIpVXB30=;
 h=Date:To:From:Reply-To:Subject:From;
 b=BqZNJ/SYb+7T4ZlhjbMHzp/CXsdDY7Ys7YtzLiabI5Ro9FmjphW1nY1+Svr8IaZpx
 /GGk5ht37t2cWiCdVMABwabw/d0CYv3HNEML4m0yzrQYn570k5ch3Fu/c/kG7Phi+V
 77qecXPJLNRt3sdm1oEN4vsZLi5XK1NEvob0mt7w=
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <Ikgah1V9oe_7PeeorzlpddD1VnOnWsFu_szZsuy7cWaHJVctqPB7gDEHv0BgLcpcgYPKxDX5KM_spye9wdQ6-3v0q9kPGzUvJ0k5yTC6fBE=@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] package/tpm2-pkcs11: bump version to 1.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 18a225d5a9..1d5bcc7a54 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  61e2849c07acb4acbf756bdd6a9fe44f9475343256fa0bdc966b77321169c125  tpm2-pkcs11-1.6.0.tar.gz
+sha256  078a445ed0e9f5009675a162b4b7b88f3520436cfbc791bb2249f37bd1f475bd  tpm2-pkcs11-1.7.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index b26ce374e8..adb5a46f56 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TPM2_PKCS11_VERSION = 1.6.0
+TPM2_PKCS11_VERSION = 1.7.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
--
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
