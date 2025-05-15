Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E74C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D96E612DE;
	Fri, 16 May 2025 11:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKRaEs7rXqeW; Fri, 16 May 2025 11:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BE4612D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BE4612D7;
	Fri, 16 May 2025 11:22:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E89A1C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C71360B0B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42Wi-KSt3k5o for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2B5C61263
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2B5C61263
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABC8B86A00; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:08:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f6eaa0389bb21d5fdb1f417dbd237b46e5b5858
X-Git-Newrev: 4776614f2fccce12a24a422477e734e06eb85204
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.ABC8B86A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtirpc:
 backport upstream fixes for GCC 15.x issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=4776614f2fccce12a24a422477e734e06eb85204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This commit backports two upstream commits that address GCC 15.x build
issues.

Fixes:

  https://autobuild.buildroot.org/results/abca98bc69ac51af3652ab2d0d187d1461f83515/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4745bad303d64c31f5422839c7d494ea2d20e2d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...declarations-to-allow-compile-with-gcc-15.patch | 67 ++++++++++++++++++++++
 ...al-and-key_call-declarations-to-allow-com.patch | 63 ++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch b/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
new file mode 100644
index 0000000000..f94be6f39a
--- /dev/null
+++ b/package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
@@ -0,0 +1,67 @@
+From 45c1eade8fa7ca62c53e80450b315ccae6db55ea Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 12 Dec 2024 04:16:02 -0500
+Subject: [PATCH] Update declarations to allow compile with gcc-15
+
+This patch fixes some of the compile errors with gcc 15-20241117.
+
+In addition the follow declarations need to be fixed:
+  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
+  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+  des_block *(*__key_gendes_LOCAL)() = 0;
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: d473f1e1f6ba80bfaee4daa058da159305167323
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/auth_none.c     | 2 +-
+ src/getpublickey.c  | 2 +-
+ src/svc_auth_none.c | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/auth_none.c b/src/auth_none.c
+index 0b0bbd1..aca6e71 100644
+--- a/src/auth_none.c
++++ b/src/auth_none.c
+@@ -62,7 +62,7 @@ static bool_t authnone_validate (AUTH *, struct opaque_auth *);
+ static bool_t authnone_refresh (AUTH *, void *);
+ static void authnone_destroy (AUTH *);
+ 
+-extern bool_t xdr_opaque_auth();
++extern bool_t xdr_opaque_auth(XDR *, struct opaque_auth *);
+ 
+ static struct auth_ops *authnone_ops();
+ 
+diff --git a/src/getpublickey.c b/src/getpublickey.c
+index be37a24..4e96c7c 100644
+--- a/src/getpublickey.c
++++ b/src/getpublickey.c
+@@ -52,7 +52,7 @@
+ /*
+  * Hack to let ypserv/rpc.nisd use AUTH_DES.
+  */
+-int (*__getpublickey_LOCAL)() = 0;
++int (*__getpublickey_LOCAL)(const char *, char *) = 0;
+ 
+ /*
+  * Get somebody's public key
+diff --git a/src/svc_auth_none.c b/src/svc_auth_none.c
+index 887e809..5ca98e9 100644
+--- a/src/svc_auth_none.c
++++ b/src/svc_auth_none.c
+@@ -37,8 +37,8 @@
+ 
+ #include <rpc/rpc.h>
+ 
+-static bool_t	svcauth_none_destroy();
+-static bool_t   svcauth_none_wrap();
++static bool_t	svcauth_none_destroy(SVCAUTH *);
++static bool_t   svcauth_none_wrap(SVCAUTH *, XDR *, bool_t (*)(XDR *, ...), char *);
+ 
+ struct svc_auth_ops svc_auth_none_ops = {
+ 	svcauth_none_wrap,
+-- 
+2.49.0
+
diff --git a/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch b/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
new file mode 100644
index 0000000000..7bd8098bbd
--- /dev/null
+++ b/package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch
@@ -0,0 +1,63 @@
+From 09d506d24abb9ce506d7a4a4201deff017018779 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Thu, 2 Jan 2025 08:46:24 -0500
+Subject: [PATCH] update signal and key_call declarations to allow compile with
+ gcc-15
+
+Follow up patch addressing the following declarations:
+  sed -n 75,77p libtirpc-1.3.6/src/key_call.c
+  cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+  cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+  des_block *(*__key_gendes_LOCAL)() = 0;
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Upstream: 240ee6c774729c9c24812aa8912f1fcf8996b162
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/auth_time.c | 4 ++--
+ src/key_call.c  | 6 +++---
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 936dd76..c21b1df 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -248,7 +248,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
+ 	char			ut[64], ipuaddr[64];
+ 	endpoint		teps[32];
+ 	nis_server		tsrv;
+-	void			(*oldsig)() = NULL; /* old alarm handler */
++	void			(*oldsig)(int) = NULL; /* old alarm handler */
+ 	struct sockaddr_in	sin;
+ 	int			s = RPC_ANYSOCK;
+ 	socklen_t len;
+@@ -417,7 +417,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
+ 		} else {
+ 			int res;
+ 
+-			oldsig = (void (*)())signal(SIGALRM, alarm_hndler);
++			oldsig = (void (*)(int))signal(SIGALRM, alarm_hndler);
+ 			saw_alarm = 0; /* global tracking the alarm */
+ 			alarm(20); /* only wait 20 seconds */
+ 			res = connect(s, (struct sockaddr *)&sin, sizeof(sin));
+diff --git a/src/key_call.c b/src/key_call.c
+index 9f4b1d2..43f990e 100644
+--- a/src/key_call.c
++++ b/src/key_call.c
+@@ -72,9 +72,9 @@
+  * implementations of these functions, and to call those in key_call().
+  */
+ 
+-cryptkeyres *(*__key_encryptsession_pk_LOCAL)() = 0;
+-cryptkeyres *(*__key_decryptsession_pk_LOCAL)() = 0;
+-des_block *(*__key_gendes_LOCAL)() = 0;
++cryptkeyres *(*__key_encryptsession_pk_LOCAL)(uid_t, char *) = 0;
++cryptkeyres *(*__key_decryptsession_pk_LOCAL)(uid_t, char *) = 0;
++des_block *(*__key_gendes_LOCAL)(uid_t, char *) = 0;
+ 
+ static int key_call( u_long, xdrproc_t, void *, xdrproc_t, void *);
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
