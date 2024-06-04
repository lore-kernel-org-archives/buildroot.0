Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E60C27C52
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 17:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E94A407B7;
	Tue,  4 Jun 2024 17:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4pYmLtMMPoy; Tue,  4 Jun 2024 17:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9431F4094A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9431F4094A;
	Tue,  4 Jun 2024 17:09:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 478261BF292
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 17:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41BD861055
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 17:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLFK6e7pxG12 for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 17:09:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 541FD6105B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541FD6105B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 541FD6105B
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 17:09:20 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 875E8B00579;
 Tue,  4 Jun 2024 19:09:16 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  4 Jun 2024 19:09:11 +0200
Message-ID: <20240604170911.2406346-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717520957;
 bh=aGO2QtLcczMfUd/u6yYpPaZNz8mhvr5skNWe7IS6Hss=;
 h=From:To:Cc:Subject:Date:From;
 b=QkxdCNpCk4LDFL3QeWuXczJBFd3bgoF+JFhpkoFxa8RQ3HsHid4Ipc8lO84U9/OuL
 lp64tyuPb4wu4qDOcNg0YoDzmL0/Hu8iyTNmc5eKDUWSTNT/LZQrjS688y6fqbfjjI
 j6dTtYskoAEvIch58WvjF2DuejsXjDqtaTaxNURxJEhFYvRnuuTGlxNxeCK3Pa9c0N
 Ic1C416UaIOXvsrl/xdvjpnWGxaAlU4YHSvs89kg97WRzTheFIw4TOYgWF5nHoEUcO
 KzR03RFClVEQY18fjEFTRnl66/bQqTraWtjW51y+e7uiedETVD7Xs5urcqbz575kGW
 a1i3uN5oN9kHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QkxdCNpC
Subject: [Buildroot] [PATCH next 1/1] package/pinentry: bump to version 1.3.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1]

License file hash changed, after updating the FSF address in [2].

The sha256 hash is moved out the "Locally computed" section in the hash
file, since it is now published on [3].

pinentry 1.3.0 updated its gpg-error.m4 macro file in [4] to detect
gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
will work in all host environments. See the log entry of commit
d7f2d8403e "package/gnupg2: fix build failure when host provides an
old gpgrt-config" [5] for a complete explanation.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=1ea7e76f836fe15fe7c59b954d7aab768bd090e6
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=66abf7cb1e1bde1ec71e13690dc6d6944c89cae9
[3] https://www.gnupg.org/download/integrity_check.html
[4] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=21e85333f9669ef369376e83eb80ccd7a8933842
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit c489ac4 with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p pinentry
    ...
    41 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/pinentry/pinentry.hash | 6 +++---
 package/pinentry/pinentry.mk   | 6 +++++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 187c86f9bd7..9c54520da6c 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  29daaf45f15cb5b8ec9b4a06284343f7a87082fb  pinentry-1.2.1.tar.bz2
+sha1  28effa1722865786cb984f3099a32db40f96ea26  pinentry-1.3.0.tar.bz2
+sha256  9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de  pinentry-1.3.0.tar.bz2
 # Locally computed
-sha256  457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067  pinentry-1.2.1.tar.bz2
-sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 338d61af2d7..b49037c91be 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.2.1
+PINENTRY_VERSION = 1.3.0
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
@@ -18,6 +18,10 @@ PINENTRY_CONF_OPTS += \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--without-libcap       # requires PAM
 
+# Force the path to "gpgrt-config" (from the libgpg-error package) to
+# avoid using the one on host, if present.
+PINENTRY_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PINENTRY_CONF_ENV += LIBS=-latomic
 endif
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
