Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD4CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 19:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB3441516;
	Sun, 24 Apr 2022 19:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cnxi0EmHhKBH; Sun, 24 Apr 2022 19:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B516F40880;
	Sun, 24 Apr 2022 19:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCF51BF348
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79FCC40880
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ51gZS3eG-Q for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 19:12:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33C1940873
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 19:12:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x18so18087484wrc.0
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 12:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAuklGnp104mK0eftFjD4r5SdQ+sYDHH2wRl2jDDACc=;
 b=dotNJxC284TQU7XQl/7LghpzUZcWnVnLhVtuzzMAnAgNfQEMh5esCb8MU3xyXX/BoW
 x9bqHm1l5JAuMniRP5MB12LiS+ERCd+HyegcqPW5KfRZ7mrMhPZw4H5FeVXVzKaCMVNP
 ZT/Xhacpk18nrAN7Pryozf5mMOK14pawH1T2XyjzdY3crbXr0Xpj0L8Aia5Eov/3vGJh
 53GW6XRlHOzxJ3Blir4TxsFdVj9cAdgfcVmurCArqiO1Gkvz/p+MOyG3kSP3thGqdv1O
 Nj5zXz2Xx6JwsNVTLk9G3xDWBjoInDYGnX19qk76HPh9mM0ZMZsuIrDfNgaFXeWo3/T1
 bxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAuklGnp104mK0eftFjD4r5SdQ+sYDHH2wRl2jDDACc=;
 b=GWLYdfxAd5hyu68iN52vQbp2iPP0iswmQ8W/J7PsgejUA838YKIxxEL6kf56sJ9AA8
 U20ZqGegLWZkBJFWesHwRJK8aBgPqiYCXIBceNjgBJbvCM/m8XfUW5NfCMTWr6LlZyhB
 EyU02Fu9C6kAsK5hSSegAbcFGLtHSKGg7wlqfjQavYDgyKuaFLDKxnf73fpfJ8dWNeUT
 wr+CGxvZ+YSiJSRglydBWwLpR8Mdi7T+bKTBWemsrSwgUd1H9VRqyihl0Rxsy2ItId+m
 xeqw3ltUrxt375AZNLzz/GKbEgNbvkaYA0vb1gnz6s/Wo1TeSbBVt+hlQYdjRDZOQZPn
 /c9Q==
X-Gm-Message-State: AOAM533H/LKX5uKepDLuyVY0BUxjIAjuQKOULIsGhzqYI+o8b/p68vfs
 mz49ZQlwhdIiwyIa/2C+bidjGByuLCI=
X-Google-Smtp-Source: ABdhPJw1Tudaj/SFHCuBkVDDi4PFnknkb5AmhlHQhcjeJiEp63lQxToOgvIo/5rOBQbp5ixzRAoaJw==
X-Received: by 2002:a05:6000:86:b0:20a:d7be:e09b with SMTP id
 m6-20020a056000008600b0020ad7bee09bmr3680560wrx.398.1650827558057; 
 Sun, 24 Apr 2022 12:12:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm9905215wmp.5.2022.04.24.12.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 12:12:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 21:10:32 +0200
Message-Id: <20220424191032.3222587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build with
 argp-standalone
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of argp-standalone to
version 1.4.1 in commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'

Fixes:
 - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfigure.ac-replace-argp_usage-check.patch | 40 +++++++++++++++++++
 package/cryptsetup/cryptsetup.mk              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch

diff --git a/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
new file mode 100644
index 0000000000..66e3be350c
--- /dev/null
+++ b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
@@ -0,0 +1,40 @@
+From 21515ad7a3b000ee6038f82bbb428ab527002bbd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Apr 2022 19:47:53 +0200
+Subject: [PATCH] configure.ac: replace argp_usage check
+
+Replace check for argp_usage by argp_parse as argp_usage is not used by
+cryptsetup. Moreover, this will fix the following build failure raised
+with argp-standalone in version 1.4.0 and
+https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
+
+/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
+cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
+/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
+cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.com/cryptsetup/cryptsetup/-/issues/737]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d31fb0a7..e47179f2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -413,7 +413,7 @@ if test "x$enable_ssh_token" = "xyes"; then
+ 	AC_CHECK_DECLS([ssh_session_is_known_server], [], [], [#include <libssh/libssh.h>])
+ 	AC_CHECK_HEADER([argp.h], [], AC_MSG_ERROR([You need argp library.]))
+ 	saved_LIBS=$LIBS
+-	AC_SEARCH_LIBS([argp_usage],[argp])
++	AC_SEARCH_LIBS([argp_parse],[argp])
+ 	AC_SUBST(ARGP_LIBS, $LIBS)
+ 	LIBS=$saved_LIBS
+ fi
+-- 
+2.35.1
+
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index ddb10f1da3..20cf5d6346 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
 
 # 0001-Add-check-program-for-symver-attribute.patch
+# 0002-configure.ac-replace-argp_usage-check.patch
 CRYPTSETUP_AUTORECONF = YES
 
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
