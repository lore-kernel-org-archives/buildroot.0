Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42142C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 13:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B37E940C00;
	Wed,  8 Mar 2023 13:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B37E940C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-iP_uUwCMY2; Wed,  8 Mar 2023 13:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3C5B404F7;
	Wed,  8 Mar 2023 13:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C5B404F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4CE1BF3EA
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A69840292
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A69840292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ANEi8IkC0rn for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 13:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D0FB400DD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D0FB400DD
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 13:16:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id az36so9794930wmb.1
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 05:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678281362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OsVU/Zk1CqKLWTrgJveU1yFf4S5KqM0w+6eacVZFoWc=;
 b=eMXuk4JwE1PDy0r2qSePB7GQhpne94NDlUHQQYeYOWVdJiH6LHEmITmKpyJ24uvL46
 Y+p9rQX7Lo3KEsMpAPWXoIbt6P4jKtSUqhM1NkXFh3HrOh2o2KkpqUFe6uRbmzEnPxPm
 CcZs+dI3DAarWvV0dApeynaOpEZhCCgpZfDufVQF/AGoU1CG7MNl0QkNxcKR21FjHryr
 pE5GcewYGhmDTjhaopSpagB+o6M9EQWkAmkKtkSclY4QL1KehqX0jV1B0CaRy/9qrYAL
 1xXVs6n8oYXvKkZUWdMHmGSXtcw0t8b3jXwYZXHN/pOKk5ceeWy6WlLWdMQ6vI15N/u+
 viUg==
X-Gm-Message-State: AO0yUKUWazMFC8BS4xEQU9gQ2ajEwwQX8eQ6Qur3sinmq8pqAXpDrsFJ
 w3IjlbwTZuoCxOh76f9X5oxBKj+sOA4u5H4LhQo=
X-Google-Smtp-Source: AK7set+nbkOjPQKbQTXRFJKe73JJK+lL2fDQv5s3ex1oQeD8REmUEuP5HwwGAc/1MpZZX46QKt+Yzg==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id
 k30-20020a05600c1c9e00b003eaf8830180mr16024713wms.7.1678281362353; 
 Wed, 08 Mar 2023 05:16:02 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm19677624wmb.36.2023.03.08.05.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 05:16:02 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 14:15:51 +0100
Message-Id: <20230308131554.642965-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678281362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OsVU/Zk1CqKLWTrgJveU1yFf4S5KqM0w+6eacVZFoWc=;
 b=1qIPVpmEwvTl8ao/21AvlRSzsd1OUkLYFpSvl0UmRsfxZK/jeu4Cau+3d5g9FSxORq
 gUsg6SOOYEqZkS0OWHkvndQ8MHbopR8vNSmBShw+txE9FKzm977+YMyhdWgdWMpNMRJ4
 sL0rKNyd2P2/rDeTuayOjMTXF9WgkTTsEifqS8Ol8gC6bsVIl5VFnditB+4apmSZRJCH
 L3JZDnyuUWNjb8sDtwRc7LxTye5bMpKPTRPbLF/kV9Nu3MKOkBTSbxZuG/fjAJ9KPCMW
 Gf1eqfibiP98PcaaQ1v80GtjqqsWEOA9lfScC3CpDDU+XRy+p5/i6zudQhlym5QTSJno
 hYXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1qIPVpmE
Subject: [Buildroot] [PATCH v6 1/3] package/nushell: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============4751895873928711472=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4751895873928711472==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Nushell is a shell - written in Rust - that makes use of the nushell
language to interact with the operating system

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
This new version adds ncurses-target-progs as a dependency which is a
hidden dependency of nushell. With this option enabled, nushell is also
usable without specifically replacing getty by agetty.

Nushell is not POSIX compliant and therefore should not be used as login
shell since some programs might assume a POSIX-compliant shell and
therefore break the system.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/nushell/Config.in    | 12 ++++++++++++
 package/nushell/nushell.hash |  3 +++
 package/nushell/nushell.mk   | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/nushell/Config.in
 create mode 100644 package/nushell/nushell.hash
 create mode 100644 package/nushell/nushell.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..9e3855423e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2550,6 +2550,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/nushell/
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 3ace25c665..7fca46afb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2577,6 +2577,7 @@ comment "Shells"
 	source "package/bash/Config.in"
 	source "package/dash/Config.in"
 	source "package/mksh/Config.in"
+	source "package/nushell/Config.in"
 	source "package/zsh/Config.in"
 comment "Utilities"
 	source "package/apg/Config.in"
diff --git a/package/nushell/Config.in b/package/nushell/Config.in
new file mode 100644
index 0000000000..edb01d2f72
--- /dev/null
+++ b/package/nushell/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NUSHELL
+	bool "nushell"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_HOST_PKGCONF
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PROGS
+	help
+	  A new type of shell.
+
+	  https://github.com/nushell/nushell
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
new file mode 100644
index 0000000000..b553a6c2bc
--- /dev/null
+++ b/package/nushell/nushell.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
+sha256  e189616e535e9f7bf410a72e6fc51ad1e0ae461c58d592e186c2669daa5d1e5d  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
new file mode 100644
index 0000000000..b9c1ee6434
--- /dev/null
+++ b/package/nushell/nushell.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# nushell
+#
+################################################################################
+
+NUSHELL_VERSION = 0.76.0
+NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
+NUSHELL_LICENSE = MIT
+NUSHELL_LICENSE_FILES = LICENSE
+NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
+
+# Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
+define NUSHELL_ADD_NU_TO_SHELLS
+	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
+		|| echo "/usr/bin/nu" >> $(TARGET_DIR)/etc/shells
+endef
+NUSHELL_TARGET_FINALIZE_HOOKS += NUSHELL_ADD_NU_TO_SHELLS
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============4751895873928711472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4751895873928711472==--
