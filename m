Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52487606A33A
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CAGmI/6T
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF1C40944;
	Fri,  6 Nov 2026 17:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRtJx4QwXRWe; Fri,  6 Nov 2026 17:43:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 325F3408FC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793986998;
	b=p7GmhwDrgsiOoKB15oh4FhOGes2+3nB3Qk9kzqlLnQtXyrfQHgEi3y5na7Dq/N17ukXl
	 s6PKNA4rm88tJVbEo0JcGYwi3oZ4kmpI24PHJWFqm3+mvt0pDjZtMGEyFNVQJ+ewv7HWP
	 qp7p3sysKWjq8CC50HO+4EdjMy062SAjY7zo6jAa4B7m/bGrVb8NaB6KXLxFWgYHm24p+
	 sO11sRtNJ3pH18O/2n3iW9bY6mOHzHAdS4YKH/BxuPVmUUyHGtlVOO4cgiOGuGZKveWKt
	 fcCIJQBXC5usf4ulLUR9A/ZTcHW7GZSgdDMa7bkN7JnCr2dYDsEL2M/bR/LFdDT544Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793986998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DdbxxOj4J/s8ZLn8uolhXB0oSj9JJM4VMQVUkGbwfaA=;
	b=T9zxz4WSNtPxybcgaT7//temz7Cl8CZuA87B5JMvG/SGUORTNJdLN45nWwVkGMK3FLBz
	 elqw4sGEqEH13SuNRyl9e/t53VA+9Q0aR4EcM1gOC6yzp9q++UbKCbtOsTpLFvM13Kc+Q
	 2UAuPQOfyW6j/XQ8z5NDoB9w++AzQpmhi67g6XiRYRtXrL7m2ITlGCAY03pa4oeZdXRva
	 ABekD+DaYC61VM1PXFfzXyuqWO3tw2oTzu+HL81Nau4tckHCK2Tl43lgltYs/4XbV5Sm1
	 3LS/UV6Wgv+wWk+koIupsAIFouU72hsfHEaf4SBIvZcYbrA1xHgzQGAz+RZT6N72HPw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793986998;
	bh=DdbxxOj4J/s8ZLn8uolhXB0oSj9JJM4VMQVUkGbwfaA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CAGmI/6T8Y+KLv2XNyyV7XOsiZC2R6pMsfhkfV96F2Y2rwyxsmrvxETB4JdnDswLN
	 z253t+6row+hpfZ/OU12Kr5ScXzu6YESblQ0Az5C9D2Ly/ApiBVewT+tIaMI4EQCm4
	 /ZKoNuYGJuwyRizdhFZyz96aP0u2kE2ugCmCDUyQAdrBMFddmALKeYYFGZ6ekLs4w4
	 7Q0g+K+1b1ruyAGDxIL6CoRh5gmksFAa8gFg9VbScx3ZmFA3dO2lXDRwMZKjX5Fn08
	 v7t7kmLdWY4MxJZteOiwXKnSBQ63oF6fDHcKZtZM5AVMVaKI2rYuOj58EPt+gX6XEN
	 BCzFXLVORgUmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325F3408FC;
	Fri,  6 Nov 2026 17:43:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1982AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00374403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnzzswJHZJ6j for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 50D56401EC
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50D56401EC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:43:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BFF29E0C3; Fri,  6 Nov 2026 17:41:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:35:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f37bf98264c6a448e937c8ba7571a9cb72964ef9
X-Git-Newrev: b48ba5298d455a39587ba87a6762e26144db2f81
X-Patchwork-Hint: ignore
Message-Id: <20261106174144.5BFF29E0C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to version
 2026-09-11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b48ba5298d455a39587ba87a6762e26144db2f81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With this version we can build with Linux up to 7.3.
Fix build failure due to GCC version >= 14 by passing -Wno-error to CFLAGS.

Fixes:
https://autobuild.buildroot.net/results/8c7/8c7196cbc64dc9eacd2c4b663e66be6e0da6c8f1/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index d5bd34ac1e..db4001989a 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4d8495b1b5a0c42ff0df775b16abd38103ad8532c53c0527f416484f8c2d477f  rtl8189fs-876e627a5b6a8021700391b4249a4a31edfebe5c.tar.gz
+sha256  491dcdf85f1050fc75cf33058f5636bdf6d259852f8bd4c564aa7475cc207aea  rtl8189fs-13bbdbc750bfaa37ff47dff063edcc857fad0584.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 45ad24e392..b68dba4c83 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 876e627a5b6a8021700391b4249a4a31edfebe5c
+RTL8189FS_VERSION = 13bbdbc750bfaa37ff47dff063edcc857fad0584
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
 RTL8189FS_USER_EXTRA_CFLAGS = \
 	-UCONFIG_LITTLE_ENDIAN \
-	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-Wno-error
 
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
