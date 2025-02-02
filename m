Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5ECC0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 20:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A1D812D3;
	Sun,  2 Feb 2025 20:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYWjLTl84W5E; Sun,  2 Feb 2025 20:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 103BC812FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103BC812FA;
	Sun,  2 Feb 2025 20:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69F2B198
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 584F5403F5
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRpkUtnPZ2jl for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 20:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.85.215.56;
 helo=mx1.ipacct.bg; envelope-from=bbonev@ipacct.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADDCB40282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDCB40282
Received: from mx1.ipacct.bg (mx1.bul.net [195.85.215.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADDCB40282
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:09:03 +0000 (UTC)
Received: from mx1.ipacct.bg (localhost [127.0.0.1])
 by mx1.ipacct.bg (Postfix) with ESMTP id 8212460026
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:09:00 +0200 (EET)
Received: by mx1.ipacct.bg (Postfix, from userid 1001)
 id 216B760251; Sun,  2 Feb 2025 22:08:59 +0200 (EET)
Received: from purple.bonev.com (purple.bonev.com [195.85.215.215])
 by mx1.ipacct.bg (Postfix) with ESMTP id BC09A60026
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:08:58 +0200 (EET)
Received: (qmail 17198 invoked by uid 64020); 2 Feb 2025 22:08:58 +0200
Received: from unknown (HELO localhost.localdomain) (195.85.215.8)
 by purple.bonev.com with SMTP; 2 Feb 2025 22:08:58 +0200
To: buildroot@buildroot.org
Cc: Boian Bonev <bbonev@ipacct.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Feb 2025 22:08:24 +0200
Message-Id: <20250202200824.2157-1-bbonev@ipacct.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738526940;
 bh=NYu36XS5tOGvQdn0ibmcZDYKOuRHKhJ1CpJh0aeUSKs=;
 h=From:To:Cc:Subject:Date:From;
 b=kVZplNSFhrO5FEniaaAG+vLSvYhSJnVQqanVUi0dLd0GS0fM/pF0UOfRiJRBHQxcQ
 ziXRjUIavRO8NNzgJl+4Osja+LD0G9hYso3CwwHqRXlH25k05aLrFjBERtcq3fq1lC
 4F0fZDuClrFvRKs9enubgXOirjDcK+Kw3WWKz/jaX/cTUVaaX+0OROEAtRJJTe7wL4
 2NxCaCSeoSSsLN8uCH+BNC+kd0npWQaDG2ZE2stRzycx+HrMGKwLTwcFwlKLzE7+B4
 95hvN3gEw046fzxA36mEcJiiEI18f4uz4STTf4IJpM7/cmOY3V4ELuNPkXAKrB0umg
 KhDB6wbStYj2A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738526940;
 bh=NYu36XS5tOGvQdn0ibmcZDYKOuRHKhJ1CpJh0aeUSKs=;
 h=From:To:Cc:Subject:Date:From;
 b=kVZplNSFhrO5FEniaaAG+vLSvYhSJnVQqanVUi0dLd0GS0fM/pF0UOfRiJRBHQxcQ
 ziXRjUIavRO8NNzgJl+4Osja+LD0G9hYso3CwwHqRXlH25k05aLrFjBERtcq3fq1lC
 4F0fZDuClrFvRKs9enubgXOirjDcK+Kw3WWKz/jaX/cTUVaaX+0OROEAtRJJTe7wL4
 2NxCaCSeoSSsLN8uCH+BNC+kd0npWQaDG2ZE2stRzycx+HrMGKwLTwcFwlKLzE7+B4
 95hvN3gEw046fzxA36mEcJiiEI18f4uz4STTf4IJpM7/cmOY3V4ELuNPkXAKrB0umg
 KhDB6wbStYj2A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738526938;
 bh=NYu36XS5tOGvQdn0ibmcZDYKOuRHKhJ1CpJh0aeUSKs=;
 h=From:To:Cc:Subject:Date:From;
 b=OJNljUkkAExCKQGtA1h2p863fBj6PiQ4b5saVVWPqlCuPm6uWxOFw1WqDSW7hBwcH
 4QjsYcxib4r5xs+uFPob7RJTqOX+Sy2raVHKGWDkpKYoXZGxyXHqCvQnV4+1EccHgm
 L5N9PC/cRnN2+Cyg06eittlldrElruJ2++d59tzy1EwPJp354mC33r59qxb1pZTVNW
 QISk4bSPkJioqQbjd3LkFJcmtoBs3vI9Fox2JrCzvKY1l1tW9aI+Xpq/Fc6F3gUvhm
 JUb+h8kc22ptGasfm5iESYNCfd+px8RfaeRfLItnm0hJ7CWV4gyPyy1M6T7kuBxINg
 sMC9MEfqlxH9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ipacct.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=kVZplNSF; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=kVZplNSF; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=OJNljUkk
Subject: [Buildroot] [PATCH] Add yascreen library
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
From: Boian Bonev via buildroot <buildroot@buildroot.org>
Reply-To: Boian Bonev <bbonev@ipacct.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

yascreen - Yet Another Screen Library (curses replacement for daemons and embedded apps)

    small footprint
    does not have external dependencies
    allows both internal and external event loop
    allows stdin/stdout or external input/output (can work over socket)
    supports basic set of telnet sequences, making it suitable for built-in terminal interfaces for daemons
    supports a limited set of input keystroke sequences
    fully unicode compatible (parts of this depend on wcwidth in libc)
    supports utf8 verification of input
    supports utf8 input and wide character input
    supports non-utf8 input mode
    relies only on a limited subset of ansi/xterm ESC sequences, making it compatible with mostly all modern terminals (inspired by linenoise)
    there is no curses API and ancient terminal compatibility, hence less bloat
    there is no autoconf - there is no need to have one
    clean API with opaque private data, usable from C/C++
    easy cross compilation setup (by setting CC, AR, STRIP and RANLIB)

Signed-off-by: Boian Bonev <bbonev@ipacct.com>
---
 package/Config.in              |  1 +
 package/yascreen/Config.in     | 21 ++++++++++++++++++++
 package/yascreen/yascreen.hash |  3 +++
 package/yascreen/yascreen.mk   | 35 ++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/yascreen/Config.in
 create mode 100644 package/yascreen/yascreen.hash
 create mode 100644 package/yascreen/yascreen.mk

diff --git a/package/Config.in b/package/Config.in
index 4a323d0908..aef90d54ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2365,6 +2365,7 @@ menu "Text and terminal handling"
 	source "package/tclap/Config.in"
 	source "package/termcolor/Config.in"
 	source "package/utf8proc/Config.in"
+	source "package/yascreen/Config.in"
 endmenu
 
 endmenu
diff --git a/package/yascreen/Config.in b/package/yascreen/Config.in
new file mode 100644
index 0000000000..2400bac848
--- /dev/null
+++ b/package/yascreen/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_YASCREEN
+	bool "yascreen"
+	help
+	  yascreen - Yet Another Screen Library (curses replacement for daemons and embedded apps)
+		small footprint
+		does not have external dependencies
+		allows both internal and external event loop
+		allows stdin/stdout or external input/output (can work over socket)
+		supports basic set of telnet sequences, making it suitable for built-in terminal interfaces for daemons
+		supports a limited set of input keystroke sequences
+		fully unicode compatible (parts of this depend on wcwidth in libc)
+		supports utf8 verification of input
+		supports utf8 input and wide character input
+		supports non-utf8 input mode
+		relies only on a limited subset of ansi/xterm ESC sequences, making it compatible with mostly all modern terminals (inspired by linenoise)
+		there is no curses API and ancient terminal compatibility, hence less bloat
+		there is no autoconf - there is no need to have one
+		clean API with opaque private data, usable from C/C++
+		easy cross compilation setup (by setting CC, AR, STRIP and RANLIB)
+
+	  https://github.com/bbonev/yascreen
diff --git a/package/yascreen/yascreen.hash b/package/yascreen/yascreen.hash
new file mode 100644
index 0000000000..d7e4ac505d
--- /dev/null
+++ b/package/yascreen/yascreen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4f69f7f13a8ef4076d499d798b6bddfc1800d30aa19b0354006a23754de54c64  yascreen-2.06.tar.xz
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/yascreen/yascreen.mk b/package/yascreen/yascreen.mk
new file mode 100644
index 0000000000..9e4e9db439
--- /dev/null
+++ b/package/yascreen/yascreen.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# yascreen
+#
+################################################################################
+
+YASCREEN_VERSION = 2.06
+YASCREEN_SOURCE = yascreen-$(YASCREEN_VERSION).tar.xz
+YASCREEN_SITE = https://github.com/bbonev/yascreen/releases/download/v$(YASCREEN_VERSION)
+YASCREEN_LICENSE = GPL-2.0+
+YASCREEN_LICENSE_FILES = LICENSE
+YASCREEN_INSTALL_STAGING = YES
+
+define YASCREEN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define HOST_YASCREEN_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
+endef
+
+define YASCREEN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
+endef
+
+define YASCREEN_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
+endef
+
+define HOST_YASCREEN_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
