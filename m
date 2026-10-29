Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DA606A31E
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OgC2ZS/5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B7860A77;
	Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evMFhh4LF8GD; Thu, 29 Oct 2026 20:23:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 309DB60A72
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305404;
	b=hYiutsW7LixteQNbJXwpUI8yUTASBlzVjMiCUD0voqGePpjnsnDBQp8ETGw3A6ivIlpu
	 rN3HSvsYDwRsNllnrtPi+t+TKXwHK/4ggVyzXcPonQ2QVWkemNVf9k8N/DYVtXwH8jP0m
	 mDMSDyK0VW1QHVcyef6gYW47QsglC+LIYKu21g7l4bGpBObW3n2ufHxVtZJ6LbcNEVTBV
	 xtTVY+QIK6BUBv4BO0ESyMY7IH0y3hVWpiB2Pmx5hKr6VkO9Yf/KURmQjQWiLHRlR+l0H
	 mXw46CDq/w4vxOyGoGvHe5VnYHpzVjuyvnGRqtLZeOfB+ZOBOZ8R64c9Q9/8VQT0q1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rECQgBVrv5eeRFMNp8e9V1IyUEmTDCYI5IN8fzWgm8I=;
	b=BZYa2Hta6G/KzkdW51MEUlFYcHl0airWY2MEO4ftLsoH839UkzXKFSNm5bTvbli4+1Ql
	 fz00NzrFAZLtr5/U/FXMYNfgT61/236uJXqJSfB68YLjpFGyg+Tltfs5PKFW2y+MF4cjK
	 M3krqVcbG6og8KOTs+F6zTG4e7aJZgrtDamEjPhJ4vM4Q48gZb1uIHfiAiBCfSVhguLqu
	 WiztxGq68ZTzmxC3XMnyMXvztWhrkZFDkg2jn6g7lry5jX6WXnuduYOz75fK+jndrzNsn
	 b+pkQWhPKcfif6rInzxTPOMpyKZy11Jp0yP4402WYFY9I6/bECjaK1u9hwh/Mo6aa/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305404;
	bh=rECQgBVrv5eeRFMNp8e9V1IyUEmTDCYI5IN8fzWgm8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OgC2ZS/5tF+ZTVgiMzGtbPUv+UUB/ObA5KB3rHLtP98i3k46MnpkREC7w4R4iCHM/
	 ijwF1r05lfoSI5VwUV1qiGeUiY07z9iQtyW/ZGjDnnp0b1tejZ1yYyueeFWrA7CPkj
	 FD7DzNte1RtaXO9D5CX3Ij6CUIBcXt6JqbXPhz8ot6coh2BDGXOZh9Mr+mjfoGMXyN
	 Ay5PMwIMu+6LxJB9ScnCOsKtPY4Q+T4TtcaSuCyTWk+vUwvKadLe4NUt9eErY7Df2C
	 qd2NQayFCaQUS/bMlSq90gfCrS4WQETM2ss0gqjmsYIhzaEx+hfsav1Fsqi0P6LbCp
	 kn+GmmRQciSBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309DB60A72;
	Thu, 29 Oct 2026 20:23:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7610F2E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D2981004
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1cqOFkVYYsH for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B17081010
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=aDOVF7wxUI5/TZ0NbV1FB8/FOQmCo4JcTsXBxHWtd/uLqK9FK81y/xF9n82yDuyeEYLH
 XTcfUZ1Ggs50PV94W3jBJWM/oJRZcWZJYZSDOhftejfHxuwybIIypNPIOY0BAEkFjcD2/
 ZUtroKzZdXKJMKcaiArtkXpPBi6NsYHtETryT3SiHkwslQ9g+243wyHxCF/T7aMhB16uI
 LV6BPALk3OVciTnD6ztmke2ZMvdlEDnBCRXy5sA6XTyeeIUUSQ4bEKXLA4VQGk1Nw8g7/
 H2s/UKfV0iDIDWyqzqvunf4NyLHfpDs5/bbA+A32MfMYku/VyLwP8PBh+kDwkNpWFwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Exhmn5YY25bpLV3LP4fEXhDbG9fgQTa5/1EJq1nrN2Q=;
 b=Tw4I2tvoErundYwFoIDnsACw8FILCG62wY0UCqOMhYfDyMgA6b4kfWRSCSfQefqWKeVg
 tZ+onP++bADSjQjtwdOEF8IiaqaaN1yypS4AyupVpxwdq3Anc8TKPyHqxVufxQnV+TdAS
 +vwIKhial+qP9In0E6Ou4tkbPzNfHFfq+cHeca1kT8UOnBjev6/z3cqrHPpSGdk096rzR
 rRGAFBxXbJ90MfN8LoisoseLWX7v4ZNaqHaFJBVy8MBjRpH7hQ8xGZLFIzmbPKgSTUxp/
 DX/6D5P9ogUbcJw3UxC/h+5+LUuyMUfNWes9HcgwFQoa4N/51gvXWVQ+H2+xVnkQV+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B17081010
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F35699D2EF; Thu, 29 Oct 2026 20:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9b7b190bd9bc17c4cb13fb80a3255e75e5b72ce
X-Git-Newrev: 9b1b56ec06386720963bb8529d21c701830570ee
X-Patchwork-Hint: ignore
Message-Id: <20261029202152.F35699D2EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-*: mass version
 bump to Piers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b1b56ec06386720963bb8529d21c701830570ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index f8bd74d0b2..9c821cd331 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4502522c6e71439114a57cf51f444e38b32c7f786636ca6c361c94aaf5ffe066  kodi-imagedecoder-heif-21.0.3-Omega.tar.gz
+sha256  186539681e6067fa24ed3c0f526301224de30edbbda24e347af3d79569603cdd  kodi-imagedecoder-heif-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 5114dad72b..66bbdb832b 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 21.0.3-Omega
+KODI_IMAGEDECODER_HEIF_VERSION = 22.1.3-Piers
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 98adf46a9b..0b724e9383 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
+sha256  ee4692563acff8fce4d77ffd629778d9df3cb516825b7a74ffc80f25d902f419  kodi-imagedecoder-raw-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 989742a901..ce5514cfcd 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
+KODI_IMAGEDECODER_RAW_VERSION = 22.1.1-Piers
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
