Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC647C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E115A60732;
	Sun, 14 Jul 2024 17:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjpHvfR8mzR8; Sun, 14 Jul 2024 17:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A426077A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A426077A;
	Sun, 14 Jul 2024 17:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 354091BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54A7960636
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqfC3KYX9KL1 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A80A6063E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A80A6063E
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 318F086908; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:31:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32e64bec304ce91454a2ca59110e309daedf5dc
X-Git-Newrev: d8e838fa3116ee5429c1f3a2a0ef17f5e3772e3e
X-Patchwork-Hint: ignore
Message-Id: <20240714173210.318F086908@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: describe relying on default
 options
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8e838fa3116ee5429c1f3a2a0ef17f5e3772e3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

People can assume that e.g. Busybox options enabled in the package are
enabled when writing code for Buildroot. Anyone who uses custom
configurations that disable default options needs to make sure
relevant scripts etc. still work for themselves.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/integration-configurable-packages.adoc | 20 ++++++++++++++++++++
 docs/manual/integration.adoc                       |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/docs/manual/integration-configurable-packages.adoc b/docs/manual/integration-configurable-packages.adoc
new file mode 100644
index 0000000000..5091cec961
--- /dev/null
+++ b/docs/manual/integration-configurable-packages.adoc
@@ -0,0 +1,20 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[configurable-packages]]
+=== Configurable packages
+
+Some foundational packages like Busybox and uClibc can be configured
+with or without certain features. When writing Buildroot code that
+uses such packages, contributors may assume that the options enabled
+in the Buildroot-provided configurations are enabled. For example,
++package/busybox/busybox.config+ sets
++CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y+, so init scripts
+meant for use with Busybox init may use +start-stop-daemon+ with long
+form options.
+
+People who use custom configurations that disable such default options
+are responsible for making sure that any relevant scripts/packages
+still work, and if not, adapting them accordingly. To follow the
+Busybox example above, disabling long form options will require
+replacing init scripts that use them (in an overlay).
diff --git a/docs/manual/integration.adoc b/docs/manual/integration.adoc
index 1626dd75dd..53305edc74 100644
--- a/docs/manual/integration.adoc
+++ b/docs/manual/integration.adoc
@@ -9,6 +9,8 @@ level. Buildroot is highly configurable, almost everything discussed
 here can be changed or overridden by xref:rootfs-custom[rootfs overlay
 or custom skeleton] configuration.
 
+include::integration-configurable-packages.adoc[]
+
 include::integration-systemd.adoc[]
 
 include::integration-selinux-support.adoc[]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
