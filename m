Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD0CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0948240CE7;
	Mon, 19 Jan 2026 10:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sGLLhFT4lo3v; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F26940CFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816843;
	bh=pn3GYGfmFeQmdtZCdz81uDegXMi2q+WdAaN1rsnOdgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PXm6CqetIGSLY8F+KdmBBrKheVmOP+d+SSnaJAhFT3rkF4iWUPtmpbtkSTgPcesNx
	 isgtpyaWgp7MU9yycLC6ElmikasI9P3/FI55j6S0wjIekC+AEFRmZZuGxfe9BurlW+
	 f9AVKa4cKMYWQRY/7Jq5PA7g4NmXy4eziTI2NxFOfJ700gC8XXHfRwIzo0vR4Bv0Gr
	 fyNWVC8Kqa89Js0T6WbjiO80VebTMpPb9L/SapWbjegLec4hhRZiZz47OojWp0gbRa
	 Y0r2e2o2Oz6JjDKAOM6V+ewAKVcNLRsxM9QumyqLaMG6T9Qh8APaqX/3BcIqbSgDLZ
	 MhEpDZ7SK1cPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F26940CFD;
	Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F17347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A20640D00
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0NAM3I6IiX9 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D34A40CEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D34A40CEC
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F50D88587; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:13:12 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f7b4ef3d38731d6be933d16a61c11321f8cb2532
X-Git-Newrev: d0a755cfe210249e8ac086a86ae64b9dfe0c36e1
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.4F50D88587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/iwd: suppress
 S40iwd shellcheck warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0a755cfe210249e8ac086a86ae64b9dfe0c36e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

- suppress S40iwd shellcheck warnings:

  In package/iwd/S40iwd line 8:
  [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
                                     ^--------------------^ SC1090 (warning): ShellCheck can't follow non-constant source. Use a directive to specify location.

  In package/iwd/S40iwd line 15:
  		-- $IWD_ARGS
                     ^-------^ SC2086 (info): Double quote to prevent globbing and word splitting.

- remove package/iwd/S40iwd from .checkpackageignore

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f38453f00e9f7852ad4132d2aff5a9f6f2fab684)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore | 1 -
 package/iwd/S40iwd  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a9b561ae14..b0510f24fe 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -499,7 +499,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
-package/iwd/S40iwd Shellcheck
 package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index de5a1efb6f..1a2d0e9780 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -5,11 +5,13 @@ PIDFILE="/var/run/$DAEMON.pid"
 
 IWD_ARGS=""
 
+# shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	mkdir -p /tmp/iwd/hotspot
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon --start --background --make-pidfile \
 		--pidfile "$PIDFILE" --exec "/usr/libexec/$DAEMON" \
 		-- $IWD_ARGS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
