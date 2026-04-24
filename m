Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADEFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892B784E11;
	Fri, 24 Apr 2026 16:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIGQJHUF53Xj; Fri, 24 Apr 2026 16:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337D384E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047972;
	bh=OwRyVdaAPAtH62u78Hj3sfZFc14od6eBLloAFv+fV74=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ANzq+7DDNRSWqMyG15qGHpTJBW3SmBc+50VmHjIEYfHGYDCXGbcUxJdASigJhA9KG
	 6ylAXCJXpfM+2r+SrxmZnFyM6x4Spho2tLBBFUW1w1+NUZd+y4AxumFExR6+g8RyDx
	 PQoxgyDw+GmRZFpGkS3JQMUwuhQ3V0DcMxR4i5e+pa4ohd7rw53EsfDI/WS46iDdG+
	 BhOmxJQZAie2dH46fcwyMkc99WkqV+5aUY7jZ7xkkJMsUuDKRpkal2QBdeAphfofAU
	 wqsq4dTzfS1y0Y4n+ZTg6l4AyVMg1rDCXr7EEQqGDw06unGwt5B1ld04aL+TdzNXs3
	 tijOtPH78MifA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337D384E03;
	Fri, 24 Apr 2026 16:26:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DAB194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E6B42837
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YD_8LTBo2EK9 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1097242960
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1097242960
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCAF182AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:21:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55e8d6f420c1bb1f56c84925932b9fc8111e1c46
X-Git-Newrev: 290f86e05e2d3a9da7561b3972f6c0b382ea99bf
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.BCAF182AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/systemd: add
 patch for CVE-2026-40226
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/290f86e05e2d3a9da7561b3972f6c0b382ea99bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This backports the fix for the following vulnerability:
- CVE-2026-40226:
    In nspawn in systemd 233 through 259 before 260, an escape-to-host
    action can occur via a crafted optional config file.
    https://www.cve.org/CVERecord?id=CVE-2026-40226

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit f6e0ad3858687d5a0194a3abb4171770fd49be35)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/systemd/0001-Fix-CVE-2026-40226.patch | 90 +++++++++++++++++++++++++++
 package/systemd/systemd.mk                    |  3 +
 2 files changed, 93 insertions(+)

diff --git a/package/systemd/0001-Fix-CVE-2026-40226.patch b/package/systemd/0001-Fix-CVE-2026-40226.patch
new file mode 100644
index 0000000000..250b6aff33
--- /dev/null
+++ b/package/systemd/0001-Fix-CVE-2026-40226.patch
@@ -0,0 +1,90 @@
+From b3131f63747db53ad76a9aab2d21da1ce9d59b9d Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Mon, 20 Apr 2026 12:04:45 +0200
+Subject: [PATCH] Fix CVE-2026-40226
+
+This is the concatenation of the 2 upstream commits:
+
+===============================================================================
+[1/2] nspawn: apply BindUser/Ephemeral from settings file only if trusted
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for 2f8930449079403b26c9164b8eeac78d5af2c8df
+Follow-up for a2f577fca0be79b23f61f033229b64884e7d840a
+
+Upstream: https://github.com/systemd/systemd/commit/61bceb1bff4b1f9c126b18dc971ca3e6d8c71c40
+===============================================================================
+[2/2] nspawn: normalize pivot_root paths
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for b53ede699cdc5233041a22591f18863fb3fe2672
+
+Upstream: https://github.com/systemd/systemd/commit/7b85f5498a958e5bb660c703b8f4a71cceed3373
+===============================================================================
+
+CVE: CVE-2026-34155
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/nspawn/nspawn-mount.c |  4 +++-
+ src/nspawn/nspawn.c       | 18 ++++++++++++++----
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 874d54e734..cba69cf0a9 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -1311,7 +1311,9 @@ int pivot_root_parse(char **pivot_root_new, char **pivot_root_old, const char *s
+ 
+         if (!path_is_absolute(root_new))
+                 return -EINVAL;
+-        if (root_old && !path_is_absolute(root_old))
++        if (!path_is_normalized(root_new))
++                return -EINVAL;
++        if (root_old && (!path_is_absolute(root_old) || !path_is_normalized(root_old)))
+                 return -EINVAL;
+ 
+         free_and_replace(*pivot_root_new, root_new);
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 459caa7c58..8692c771ba 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4626,8 +4626,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_EPHEMERAL) == 0 &&
+-            settings->ephemeral >= 0)
+-                arg_ephemeral = settings->ephemeral;
++            settings->ephemeral >= 0) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring ephemeral setting, file %s is not trusted.", path);
++                else
++                        arg_ephemeral = settings->ephemeral;
++        }
+ 
+         if ((arg_settings_mask & SETTING_DIRECTORY) == 0 &&
+             settings->root) {
+@@ -4795,8 +4800,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_BIND_USER) == 0 &&
+-            !strv_isempty(settings->bind_user))
+-                strv_free_and_replace(arg_bind_user, settings->bind_user);
++            !strv_isempty(settings->bind_user)) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring bind user setting, file %s is not trusted.", path);
++                else
++                        strv_free_and_replace(arg_bind_user, settings->bind_user);
++        }
+ 
+         if ((arg_settings_mask & SETTING_NOTIFY_READY) == 0 &&
+             settings->notify_ready >= 0)
+-- 
+2.53.0
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 126ce7716f..a322635c5f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -63,6 +63,9 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = udev
 
+# 0001-Fix-CVE-2026-40226.patch
+SYSTEMD_IGNORE_CVES += CVE-2026-34155
+
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
 	-Ddbus=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
