Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA8BCEFD18
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD27360C34;
	Tue,  6 Jan 2026 22:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67RrDXeda6D2; Tue,  6 Jan 2026 22:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE6160C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767736801;
	bh=243We6yHGW2wRLiybOhlt3ubC8wYeAT4YG2+EQ/jAOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oyzNI6+sszez5dcW/JPqfxE9b0DzdKUKZT598dlpbB0adPJJZvdw4oUhbxWHGetNZ
	 v39T9jOwnpTTA9l/FINup863Zl8/I2uwToklGUJjEvOVRKlN1gTd+LiDP9OnjqYA2m
	 KpZXVeLp4+Pe427x4a4R0j/+8FxmnODLLCwIHgYl8hdnol+wf907rpCvapCi6qDZcI
	 ZHEB+dUN3Wjxis8CtHMSS3gdTH08TxGB6HX/invgajef7pUJfpoXaJoI38LWb+p/ON
	 FmwUMQpAdTN95wKv196qFy7e9ilQl+P/zU9ZnvONu8jzP9bHBYjjYGrIFDnJg6oZYG
	 puvePwBD3CgRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BE6160C17;
	Tue,  6 Jan 2026 22:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62CF7249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EA481E3E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HToNfzKnvjTH for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D94D81E3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D94D81E3A
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C1AD8831F; Tue,  6 Jan 2026 21:59:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 22:53:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58a19f3240e765e4c8fc60d830fe67e48989c054
X-Git-Newrev: f38453f00e9f7852ad4132d2aff5a9f6f2fab684
X-Patchwork-Hint: ignore
Message-Id: <20260106215958.8C1AD8831F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: suppress S40iwd shellcheck
 warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=f38453f00e9f7852ad4132d2aff5a9f6f2fab684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .checkpackageignore | 1 -
 package/iwd/S40iwd  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 042a96a48f..99a864fd3f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -487,7 +487,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
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
