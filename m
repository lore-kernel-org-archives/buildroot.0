Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F0CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D704088F;
	Sun,  9 Jan 2022 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdjiytIcAM0a; Sun,  9 Jan 2022 21:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF104088A;
	Sun,  9 Jan 2022 21:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91BFE1BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BAD54058E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zB3Rsac-Uz-N for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC729404D4
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:06:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso6186431wme.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 13:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYIdmuKx70gzPINgcxfBAib5RPSeg/pst+4oP02LNsM=;
 b=Q5sI3bqJXpNQGntjYG0wPSakJgols3k193WOCB6pvkeLmpU9baLNqhcWzXh+esoAI+
 pEpBHINQDWdXC51l5A0xbf3xghqmI/bNtZ5uuooFbSnWyAdg3MrGLASZqDdLLkZGe5Yu
 NCT7O/qze3adCLnHhD45B7okBTpGTuPx49ZUP9Va1GqHrLWlcvX21/hMfs+Jmd9w4J8W
 Y5vRCVSof61CJtdGXZ+NjF7+aUFjySl4jsVFvACuR3DkqSCPA4CJWQGKErP4fUJps97o
 Fwj15u0KoOcvq507vYeJe7zulry/wYx4iNvYxzO20KYTttK4Dj+cLNEn6HodHphf1E2e
 xOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYIdmuKx70gzPINgcxfBAib5RPSeg/pst+4oP02LNsM=;
 b=4C7dTgzfD2CqnFBQBFTJ7it3k3PNuiOe/lPmg8CYgBHp8MOQN7KXBYTeSB9EFtCpyB
 XYe2TI4X1esL6m48jnrIbaf+c3HF5w9iDaYGjLvfOt2swPLJBtg98G22iowYlsmOrf9/
 rqughKGl/hXAU6jE96AY+x0YYktffW4RxECo3C+W/deKg+qx7LAGM/tcCNwenqr8L/sU
 JJvt3UfC3lg0gXPc++a9x7m/ZlxwQ/tV+dqfM9pV9TjKokNQ7T5nVKeJIBF2sfAk8srv
 dyYJYbf6728McIw1GZOp2pwq7GTf8uME2rAuC8NCTiSHop8tl025nxJ4uRiGlw1hi3BY
 c5BA==
X-Gm-Message-State: AOAM532WTfdc6Sc89709vZz5VeA1tY5l2NGyt8PENe5xL1pkrCy7CPLn
 n3Kg+261EsujivJyB7fVj2njTeF1jgf61w==
X-Google-Smtp-Source: ABdhPJxSVT9pyq3/DBXr+OJs6te3mI+K1yI0rd522K2LvjqBcCIe9sh1IdA+HqgJK9fjEY377gKxoQ==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr19981640wmq.158.1641762370964; 
 Sun, 09 Jan 2022 13:06:10 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id o11sm5232219wmq.15.2022.01.09.13.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 13:06:10 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 22:06:07 +0100
Message-Id: <20220109210607.2270978-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/moby-buildkit: new package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Stewart <christian@paral.in>

Signed-off-by: Christian Stewart <christian@paral.in>
[Romain:
  - remove host-pkgconf dependency
  - Add the license file hash
  - Fix the check-package warning in Config.in]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---

The license file hash was a copy past error.
The 7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8 belong to
balena-engine package from [1]

[1] https://git.buildroot.net/buildroot/commit/?id=cb0d87004c824dc6bb421fe8316428d51e1335bd
---
 package/Config.in                        |  1 +
 package/moby-buildkit/Config.in          | 19 +++++++++++++++++++
 package/moby-buildkit/moby-buildkit.hash |  3 +++
 package/moby-buildkit/moby-buildkit.mk   | 22 ++++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/moby-buildkit/Config.in
 create mode 100644 package/moby-buildkit/moby-buildkit.hash
 create mode 100644 package/moby-buildkit/moby-buildkit.mk

diff --git a/package/Config.in b/package/Config.in
index edae7e4f62..7bf17f486e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2554,6 +2554,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
+	source "package/moby-buildkit/Config.in"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
new file mode 100644
index 0000000000..93c852bcdb
--- /dev/null
+++ b/package/moby-buildkit/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MOBY_BUILDKIT
+	bool "moby-buildkit"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	help
+	  BuildKit is a toolkit for converting source code to build
+	  artifacts in an efficient, expressive and repeatable manner.
+
+	  https://github.com/moby/buildkit
+
+comment "moby-buildkit needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
new file mode 100644
index 0000000000..3015e479f6
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
new file mode 100644
index 0000000000..3f0df351ef
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# moby-buildkit
+#
+################################################################################
+
+MOBY_BUILDKIT_VERSION = 0.8.1
+MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
+MOBY_BUILDKIT_LICENSE = Apache-2.0
+MOBY_BUILDKIT_LICENSE_FILES = LICENSE
+
+MOBY_BUILDKIT_GOMOD = github.com/moby/buildkit
+
+MOBY_BUILDKIT_TAGS = cgo
+MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
+
+MOBY_BUILDKIT_LDFLAGS = \
+	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
+
+MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
+
+$(eval $(golang-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
