Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F52CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1851E605E2;
	Sun,  7 Apr 2024 07:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnA09QpSAJMy; Sun,  7 Apr 2024 07:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0003060769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0003060769;
	Sun,  7 Apr 2024 07:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9D981BF21A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42F04037E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfOfb0GRUiBZ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902E740184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 902E740184
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CD5A84631; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 09:57:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a59e72946561b3a4b11aa8e51ee893852048b44
X-Git-Newrev: 516d57dc9c8dbcd991a4f7888556e28f838ac0ce
X-Patchwork-Hint: ignore
Message-Id: <20240407075910.7CD5A84631@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: bump version to 2024.84
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

commit: https://git.buildroot.net/buildroot/commit/?id=516d57dc9c8dbcd991a4f7888556e28f838ac0ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is included in this release.

Changelog: https://matt.ucc.asn.au/dropbear/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../dropbear/0001-Implement-Strict-KEX-mode.patch  | 232 ---------------------
 package/dropbear/dropbear.hash                     |   2 +-
 package/dropbear/dropbear.mk                       |   5 +-
 3 files changed, 2 insertions(+), 237 deletions(-)

diff --git a/package/dropbear/0001-Implement-Strict-KEX-mode.patch b/package/dropbear/0001-Implement-Strict-KEX-mode.patch
deleted file mode 100644
index ce7b84861c..0000000000
--- a/package/dropbear/0001-Implement-Strict-KEX-mode.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From 6e43be5c7b99dbee49dc72b6f989f29fdd7e9356 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Mon, 20 Nov 2023 14:02:47 +0800
-Subject: [PATCH] Implement Strict KEX mode
-
-As specified by OpenSSH with kex-strict-c-v00@openssh.com and
-kex-strict-s-v00@openssh.com.
-
-Upstream: https://github.com/mkj/dropbear/commit/6e43be5c7b99dbee49dc72b6f989f29fdd7e9356
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/cli-session.c    | 11 +++++++++++
- src/common-algo.c    |  6 ++++++
- src/common-kex.c     | 26 +++++++++++++++++++++++++-
- src/kex.h            |  3 +++
- src/process-packet.c | 34 +++++++++++++++++++---------------
- src/ssh.h            |  4 ++++
- src/svr-session.c    |  3 +++
- 7 files changed, 71 insertions(+), 16 deletions(-)
-
-diff --git a/cli-session.c b/cli-session.c
-index 5981b2470..d261c8f82 100644
---- a/cli-session.c
-+++ b/cli-session.c
-@@ -46,6 +46,7 @@ static void cli_finished(void) ATTRIB_NORETURN;
- static void recv_msg_service_accept(void);
- static void cli_session_cleanup(void);
- static void recv_msg_global_request_cli(void);
-+static void cli_algos_initialise(void);
- 
- struct clientsession cli_ses; /* GLOBAL */
- 
-@@ -117,6 +118,7 @@ void cli_session(int sock_in, int sock_out, struct dropbear_progress_connection
- 	}
- 
- 	chaninitialise(cli_chantypes);
-+	cli_algos_initialise();
- 
- 	/* Set up cli_ses vars */
- 	cli_session_init(proxy_cmd_pid);
-@@ -487,3 +489,12 @@ void cli_dropbear_log(int priority, const char* format, va_list param) {
- 	fflush(stderr);
- }
- 
-+static void cli_algos_initialise(void) {
-+	algo_type *algo;
-+	for (algo = sshkex; algo->name; algo++) {
-+		if (strcmp(algo->name, SSH_STRICT_KEX_S) == 0) {
-+			algo->usable = 0;
-+		}
-+	}
-+}
-+
-diff --git a/common-algo.c b/common-algo.c
-index 378f0ca8e..f9d46ebb6 100644
---- a/common-algo.c
-+++ b/common-algo.c
-@@ -307,6 +307,12 @@ algo_type sshkex[] = {
- 	/* Set unusable by svr_algos_initialise() */
- 	{SSH_EXT_INFO_C, 0, NULL, 1, NULL},
- #endif
-+#endif
-+#if DROPBEAR_CLIENT
-+	{SSH_STRICT_KEX_C, 0, NULL, 1, NULL},
-+#endif
-+#if DROPBEAR_SERVER
-+	{SSH_STRICT_KEX_S, 0, NULL, 1, NULL},
- #endif
- 	{NULL, 0, NULL, 0, NULL}
- };
-diff --git a/common-kex.c b/common-kex.c
-index ac8844246..8e33b12a6 100644
---- a/common-kex.c
-+++ b/common-kex.c
-@@ -183,6 +183,10 @@ void send_msg_newkeys() {
- 	gen_new_keys();
- 	switch_keys();
- 
-+	if (ses.kexstate.strict_kex) {
-+		ses.transseq = 0;
-+	}
-+
- 	TRACE(("leave send_msg_newkeys"))
- }
- 
-@@ -193,7 +197,11 @@ void recv_msg_newkeys() {
- 
- 	ses.kexstate.recvnewkeys = 1;
- 	switch_keys();
--	
-+
-+	if (ses.kexstate.strict_kex) {
-+		ses.recvseq = 0;
-+	}
-+
- 	TRACE(("leave recv_msg_newkeys"))
- }
- 
-@@ -550,6 +558,10 @@ void recv_msg_kexinit() {
- 
- 	ses.kexstate.recvkexinit = 1;
- 
-+	if (ses.kexstate.strict_kex && !ses.kexstate.donefirstkex && ses.recvseq != 1) {
-+		dropbear_exit("First packet wasn't kexinit");
-+	}
-+
- 	TRACE(("leave recv_msg_kexinit"))
- }
- 
-@@ -859,6 +871,18 @@ static void read_kex_algos() {
- 	}
- #endif
- 
-+	if (!ses.kexstate.donefirstkex) {
-+		const char* strict_name;
-+		if (IS_DROPBEAR_CLIENT) {
-+			strict_name = SSH_STRICT_KEX_S;
-+		} else {
-+			strict_name = SSH_STRICT_KEX_C;
-+		}
-+		if (buf_has_algo(ses.payload, strict_name) == DROPBEAR_SUCCESS) {
-+			ses.kexstate.strict_kex = 1;
-+		}
-+	}
-+
- 	algo = buf_match_algo(ses.payload, sshkex, kexguess2, &goodguess);
- 	allgood &= goodguess;
- 	if (algo == NULL || algo->data == NULL) {
-diff --git a/kex.h b/kex.h
-index 77cf21a37..7fcc3c252 100644
---- a/kex.h
-+++ b/kex.h
-@@ -83,6 +83,9 @@ struct KEXState {
- 
- 	unsigned our_first_follows_matches : 1;
- 
-+	/* Boolean indicating that strict kex mode is in use */
-+	unsigned int strict_kex;
-+
- 	time_t lastkextime; /* time of the last kex */
- 	unsigned int datatrans; /* data transmitted since last kex */
- 	unsigned int datarecv; /* data received since last kex */
-diff --git a/process-packet.c b/process-packet.c
-index 945416023..133a152d0 100644
---- a/process-packet.c
-+++ b/process-packet.c
-@@ -44,6 +44,7 @@ void process_packet() {
- 
- 	unsigned char type;
- 	unsigned int i;
-+	unsigned int first_strict_kex = ses.kexstate.strict_kex && !ses.kexstate.donefirstkex;
- 	time_t now;
- 
- 	TRACE2(("enter process_packet"))
-@@ -54,22 +55,24 @@ void process_packet() {
- 	now = monotonic_now();
- 	ses.last_packet_time_keepalive_recv = now;
- 
--	/* These packets we can receive at any time */
--	switch(type) {
- 
--		case SSH_MSG_IGNORE:
--			goto out;
--		case SSH_MSG_DEBUG:
--			goto out;
-+	if (type == SSH_MSG_DISCONNECT) {
-+		/* Allowed at any time */
-+		dropbear_close("Disconnect received");
-+	}
- 
--		case SSH_MSG_UNIMPLEMENTED:
--			/* debugging XXX */
--			TRACE(("SSH_MSG_UNIMPLEMENTED"))
--			goto out;
--			
--		case SSH_MSG_DISCONNECT:
--			/* TODO cleanup? */
--			dropbear_close("Disconnect received");
-+	/* These packets may be received at any time,
-+	   except during first kex with strict kex */
-+	if (!first_strict_kex) {
-+		switch(type) {
-+			case SSH_MSG_IGNORE:
-+				goto out;
-+			case SSH_MSG_DEBUG:
-+				goto out;
-+			case SSH_MSG_UNIMPLEMENTED:
-+				TRACE(("SSH_MSG_UNIMPLEMENTED"))
-+				goto out;
-+		}
- 	}
- 
- 	/* Ignore these packet types so that keepalives don't interfere with
-@@ -98,7 +101,8 @@ void process_packet() {
- 			if (type >= 1 && type <= 49
- 				&& type != SSH_MSG_SERVICE_REQUEST
- 				&& type != SSH_MSG_SERVICE_ACCEPT
--				&& type != SSH_MSG_KEXINIT)
-+				&& type != SSH_MSG_KEXINIT
-+				&& !first_strict_kex)
- 			{
- 				TRACE(("unknown allowed packet during kexinit"))
- 				recv_unimplemented();
-diff --git a/ssh.h b/ssh.h
-index 1b4fec65f..ef3efdca0 100644
---- a/ssh.h
-+++ b/ssh.h
-@@ -100,6 +100,10 @@
- #define SSH_EXT_INFO_C "ext-info-c"
- #define SSH_SERVER_SIG_ALGS "server-sig-algs"
- 
-+/* OpenSSH strict KEX feature */
-+#define SSH_STRICT_KEX_S "kex-strict-s-v00@openssh.com"
-+#define SSH_STRICT_KEX_C "kex-strict-c-v00@openssh.com"
-+
- /* service types */
- #define SSH_SERVICE_USERAUTH "ssh-userauth"
- #define SSH_SERVICE_USERAUTH_LEN 12
-diff --git a/svr-session.c b/svr-session.c
-index 769f0731d..a538e2c5c 100644
---- a/svr-session.c
-+++ b/svr-session.c
-@@ -370,6 +370,9 @@ static void svr_algos_initialise(void) {
- 			algo->usable = 0;
- 		}
- #endif
-+		if (strcmp(algo->name, SSH_STRICT_KEX_C) == 0) {
-+			algo->usable = 0;
-+		}
- 	}
- }
- 
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 8f6c49c62b..675715ddec 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b  dropbear-2022.83.tar.bz2
+sha256  16e22b66b333d6b7e504c43679d04ed6ca30f2838db40a21f935c850dfc01009  dropbear-2024.84.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7ac8a38559..440ebd44a2 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2022.83
+DROPBEAR_VERSION = 2024.84
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -14,9 +14,6 @@ DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
 DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
 
-# 0001-Implement-Strict-KEX-mode.patch
-DROPBEAR_IGNORE_CVES += CVE-2023-48795
-
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
 # prevents dropbear from using SSP support when not available.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
