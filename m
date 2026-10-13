Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A430CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430E180C9F;
	Tue, 13 Oct 2026 09:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZAGXkPkbKjB; Tue, 13 Oct 2026 09:50:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 471DC80C73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885049;
	b=NE5cozIgc3z9GgWdydzMSYxyPPYctXxHCQI8wR1IZ6WZ930LlECnelWbqmhsv1Xj0EcS
	 ig41VmkZF8YZbGu1TtJ7BlZkSI3mBqSN+tnJ9+RNWI+Nt/P2hAa4CED0a7e2c++WR5yen
	 FwC9iAe/rJGbrbzVUhfz1z1gPpPTgA/HB2nXE+4BVnVd0XZ1dTUEp8EdN//0/UVBZ1osK
	 5n3FRetDJDrJspN5FAq/WGe8NeJWsA36PEStKcCmNrNpERAa/OIZF8hmV99UvR/slD5fa
	 BYHXbRP0RKEsdVQDiPuhwEt5RywiV5bB+MR9N/VzvOUkXEvg9Hzq0hD7cPR0yWMp3/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JFlss2EcgASt6AhopS+1TqEIMYflzMUoavQluq+XkjM=;
	b=nNRI9/j4XD7NmWpm48UNchh5Jt0Obd4Br/OyjomV/HyyF790DiEQlC+M3aU1NwRuDHjg
	 N/HzfDx6cElPYrTrMK5j5XHVz32631WPWBFilNSPtK+q591I8PfhSqHdJUfw1LJ7dmLg6
	 arMJ++HdpD9Q0isUYyXajNmhRbYmjaU880U00XJ/ZXZbnTRmVoLM38xZxBHLw/r/hAG1l
	 jHzvJW2kns2E1kE1ht37fIao3779AX4TLxpF4tXnRpOC+pnYtY/AmTsyhcapqST5KgL+D
	 SBV9oItn4I96KrRwbqq8XLp8V9qddPINCYca+OcQHOH/Ywae+h84p73MCFA4QFHvxJQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885049;
	bh=JFlss2EcgASt6AhopS+1TqEIMYflzMUoavQluq+XkjM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NUvZNBxtVoVaUCFbxzovEqTuz+Cf/aUWBjivvWR/BhRFAGXhBdc9L68Ob1kKoXq44
	 rs08VuUxCBPvLON27Mj1uvyr7lS2tkBKfhb/u+v7VNqo2bf6V37a1xFxEJDWqRZXoC
	 vcgisDR4gSfIc+4oMvkyFUl0WivTK0bRPQZbLcGY7ZxUfsGvvXsfqL2CllA1VXkjrg
	 p3xKvCaOtkTGWrwbfyKgupnntjR2X6kIAtVWy32DCuKx/piXxY7gvYDSMQQJ5mBoeK
	 V8GZF/8ST+wqbddBSOuSkmVjVpj634TXunk1VdxHmcYx7TbGfkxAsAhHfbDTqGPj9u
	 sC/l3gIxYIz5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471DC80C73;
	Tue, 13 Oct 2026 09:50:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A42B3362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D8B80C73
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTVDnajKKzoA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:50:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2BB580C46
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791885046;
 b=fY0X5LWFJGG1tiM3psBFqT8pyoy2dpfeM6YQXWv7mHf9phlhYNy4BdzB0DW6ilqeVyGr
 gHG+jIg9MKeIaM6TQzI9BXZnQKBaLyNVQn0SiiHrBbgtVe0odmteCZuuGwkEqJfd8AFux
 dv0/fwao0mGYgsfhC0IC+dDW5diKnvJjgbvPujtga9U+Bjv56XfYd629XC9FVYDXeyTeF
 EMB28esUCA7vre3dyKmiSdX3wOvtI83EZ+2cvK2AwysH7jn7w82TySiSQ4/TDP9uQYxAH
 1Qk7zT17gC6D2g/vONCC68VHM+rRS+ZgvhbTAwOaVaH7tpDC3VgyivRUksgtD4nmlRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885046;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DcJiW+ybqPiJKY8V4nElH02RA8hiE+YK0O60R3NY5po=;
 b=OvZDw7YHr0Pf7bRXZLYj+gPtNh7yXiBccd+zwGhvS8Dsddh2JrGYJo2Ymf7nUjvE7xUn
 UwPGuSgcZ/foXI4tPzhmMh9hRMcY1SuIhwGTfAx3vNmewAvbPp1ciW2noNv+ai/TULKhF
 ZB83/M5bCSfPZyEza+BVXSz7+FteYK4/bnTrPpik4F8MQHUv7GzDQ4Ti14IlxXleUw23t
 f6jBG1rKszLgbWrHZb0R27++jQpXv05x50g5fw3Q2e8mvIsd5kpZ5fJpYq7ZdLpgY6vAV
 KFWFkqgRe0UTW/N43PYMZzNL6CtoqycOo+x7kcXXLLfEvboblzDSasazI9XQMh8WSQw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BB580C46
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2908D584; Tue, 13 Oct 2026 09:49:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:21:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a1b2030c73a4576097b3179d2d8664d1fda4291
X-Git-Newrev: ed97dccd60a964cf437e7acbff5d869000beaaf8
X-Patchwork-Hint: ignore
Message-Id: <20261013094927.4D2908D584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtty: bump to version 9.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed97dccd60a964cf437e7acbff5d869000beaaf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release adds support for Mbed TLS 4.x and OpenSSL 4.0 and fixes
several memory-safety issues in the command handling.

rtty now requires libinih (found via pkg-config) for its new INI config
file support, and no longer links against libcrypt.

Release notes: https://github.com/zhaojh329/rtty/releases/tag/v9.2.1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/Config.in |  2 +-
 package/rtty/rtty.hash |  4 ++--
 package/rtty/rtty.mk   | 10 +++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index da5afb8364..a66bd20987 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_RTTY
 	bool "rtty"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_INIH
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Access your device's terminal from anywhere via the web.
 
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index 95b7a6bcfa..7d941bc47a 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,4 +1,4 @@
-# From https://github.com/zhaojh329/rtty/releases/tag/v9.0.4
-sha256  3bfc5db341c40e451544a218b7ef2cc59329ce04c50824b8ce6e5b805504c9bd  rtty-9.0.4.tar.gz
+# From https://github.com/zhaojh329/rtty/releases/tag/v9.2.1
+sha256  3764ec2537a5ae2b3a93853dda13fc20b0c0a57184cac30ed2ac1317312c3e2a  rtty-9.2.1.tar.gz
 # Locally computed
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 4dbebdf12d..1d7311e06d 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-RTTY_VERSION = 9.0.4
+RTTY_VERSION = 9.2.1
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
-RTTY_DEPENDENCIES = libev
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-RTTY_DEPENDENCIES += libxcrypt
-endif
+RTTY_DEPENDENCIES = host-pkgconf inih libev
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
@@ -22,7 +18,7 @@ RTTY_CONF_OPTS += \
 	-DUSE_OPENSSL=OFF \
 	-DUSE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RTTY_DEPENDENCIES += host-pkgconf openssl
+RTTY_DEPENDENCIES += openssl
 RTTY_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
 	-DUSE_MBEDTLS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
