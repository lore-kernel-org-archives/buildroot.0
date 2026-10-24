Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47284606A322
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lRbGEMdP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB02E60639;
	Sat, 24 Oct 2026 20:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsAE-OopjIH9; Sat, 24 Oct 2026 20:56:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDA6A60628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875369;
	b=rEnC3OgRRPBB6HvVW3v3sfKSgTQk1RYwPNs/pbgQDC3feUs/8rL1VNvFVyBRDVvvU8Rt
	 oDTSD/25+R/vKZ7g5HiNEF0WTvnhxrJsX5NJwkACJDys2/vBRvPf/KGEjEULQaeKifREF
	 NXKTvUjIBbpN7Rgcby8MiQVSE4zGtNdM/IYNjEqxXen2xoHdvV0LiWBqYETXx3h9PZN8D
	 W+Kwt5vIHwrUFsrXzo4KPclbdKzx9bKdoDN+DdSRpJwNAtO/ggerPw1Ww9SvKtcl332zJ
	 R0bjtabkT5lymaAKn06EKMvPVpY796bp415Rj5ZJOqzMzztxdUL2iUH2J7zwcBHAAXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RnX5VEZ1rMT4S1FHpjznEKmJZphsqG+euqBaYlzL7p4=;
	b=Z3exiyzLZwUKtuKt/w42gDjpYPTe2IjT28aUHeunFPTWDg6dyiwaedpbSp5H6BnRtUpv
	 UqhhJAsfVFBMCPbHdoKrpVAXxWKPS/FYpEYpDaw9fFXhtyD0meZZ1eDaxmQ21er8PAwda
	 3DqrWxHBlnlvk4bj9UBFOkE12NGI0BKHs1FoWbpovmsdaYvzL8DP5QmUtr6X4jfzG0o8U
	 RTCBTH0tO8/BjWDfbuGm+54Q0MAeLRDeh9F5Xao7jGW4dy6BflsExIuULMbkn6emDrelR
	 HUs1D6bZUlXD0g9cOlUn/KmwPl9jbyoWnKd7PVqJcOu0TvIVyfcqYasj+81oYF4e6JQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875369;
	bh=RnX5VEZ1rMT4S1FHpjznEKmJZphsqG+euqBaYlzL7p4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRbGEMdPLJr2hXwhtFmhOqi0XyFQUTjY/9c2Ordf5k/z0C5B7cqGX4NUJxIDet8gp
	 yMCSiUPMZzXo7OSvidnH96SkR7A38LpglK+CsLiqhugogW7FkhoM2EF1JnIuQHNzy/
	 ChVkv9BFRIP/U24MqQqnHlTZC3DyjIutjSq8nK+Df0jNSzOk9xZYmdZi7YRsD22dcR
	 jfuSQJ+onASVXs+tKFfgRzd47gOF0UOlOxOpihAtAqsic7ltWQOgFZBhIMt219EdcV
	 BujXtNDa4KAE85KPz7ieOxKwQWzmC75C/BtlCFBtx5+svd20RJFxmvRL2Dt2A9OkqE
	 gOusUMprwEhfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA6A60628;
	Sat, 24 Oct 2026 20:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A2A3356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD8460626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWJdtYH2bysm for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CC71260628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875363;
 b=GngcywOm0w6BYbS60nDziW07gkEQ/yqzAMh1G4uOs7Tsie9eb8Qg/8aWo9w1cEVJGZMB
 oqjYFTz4b8Tbiq4EWQeBwnquMA3pKbl+Y/YdVWU6oPBK89wqjWc1NVaGtfAoGV9ma3HSl
 JNzYB64EHV+Q/P5gPrhHIxNVxenFt8s0zbIesENwvW7KDWbqeRLKI0OXWAumaQtWa2+1b
 2+Y8PhVhdsHAqzCyzjxicuDA0puA/mlkuu/kb78kcRkes0SlO3uhsrcZTHxQgnAeH157W
 ABg5V5b6UmQD4FLmiCjvOGMi1Kb3L6h16wBL4Mp5YDD6uxPBnDJZ8LwAxOeTXXxj87A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875363;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LU65AgUccu/obKR0Y2lWPzmC8AqL95LH1NXMceLKYQ8=;
 b=ISpFVSUFMQ6CUgm/AtcOy5ashq/KY0W5CQ+/c2M9HEikHWCv+ZmsAyKroxTZKJiNdAAj
 lC4OPMJdhaseqrlTJQIxi5jhii7x7ss5E9UDiRbc/pVqRPK06vrYHkibqpceIzV1C8qRY
 lngzuZjyC5Kz+j5BksvEiC4umuV9wx+H4HE0uTtPyR2Y5I4rEuNPlVDF+j9mcdkgeHF7x
 6IhPdX4X/eAwoS3xqanoHI6wRCQrxZQzpRKGQZbUR4dn7yTzwqjM0DFp+5THcHEP+Pcv4
 TQEpaKbFQVIKEehPBjOef+3hsiIaA7+VqWPtyHy42QvMAAkYtq/AucCQrIGxW0aFvIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC71260628
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5E3A9CC9B; Sat, 24 Oct 2026 20:54:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:45:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66f318bff6b691f468d762177907b63be1b2b1b7
X-Git-Newrev: 1889206b35aa8e272e5a325cb037fd9d0982ae45
X-Patchwork-Hint: ignore
Message-Id: <20261024205438.A5E3A9CC9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1889206b35aa8e272e5a325cb037fd9d0982ae45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.10
"Libarchive 3.8.10 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index acd4b9ef22..cd5943ebb2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.10
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
-sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.10.tar.xz.asc
+sha256  56cad765459d5ee25a3b761f90c47d99379d28297fbfb72d908880d6b875fb96  libarchive-3.8.10.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 88dbf2a48e..75cc034f6d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.9
+LIBARCHIVE_VERSION = 3.8.10
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
