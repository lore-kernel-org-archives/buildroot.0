Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76937C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 07:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C126A60908;
	Sat, 10 May 2025 07:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2b62Y6T8mGz; Sat, 10 May 2025 07:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C469F6080B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C469F6080B;
	Sat, 10 May 2025 07:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA99E0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 07:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF5DD83760
 for <buildroot@buildroot.org>; Sat, 10 May 2025 07:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZjTt3SHjrmI for <buildroot@buildroot.org>;
 Sat, 10 May 2025 07:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A35983716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A35983716
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A35983716
 for <buildroot@buildroot.org>; Sat, 10 May 2025 07:58:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id DC317439A9;
 Sat, 10 May 2025 07:58:27 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 10 May 2025 09:58:25 +0200
Message-ID: <20250510075826.781184-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleegleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeltefhvdeuteegvddvjeejteffgefgvdeigeeuvedvueevtdeluedvgfeuuedtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgedphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehpvghtrhdrvhhorhgvlhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746863908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vu7gSG5DOXfQmK5nG+nB33yvMEgVQ2+8MdxgST4n0O4=;
 b=fEbaZo81GsIt2srNHUbrXlYQPlHSfi2AbeT2PqJxdjSUBS5OgaI4ZRDoGmNledCgsXKXrG
 60EkfoyAui2TLXSKrIMzhZCpgcjchYsDGpU2MnV3gIwqnwEHgUOLUFv8AI1HNm/M2b5ZwL
 Z5AgBUOb1GUrvfn8e/Z9/c3r9fi17s2/YGngDUNlvhkpW8yVcHmRZ9vsDireHFo1PGDSgd
 Bpe1xeH6JmkVEmKJyXr3UnoFB8yutbWUraAbXjLRm9vmYQUf/riuSyMsTIGeZ1+w+2J35d
 NigURZ6A8T0VwDS7ghuVxmN4w2fBLpR6U5Utl3/+S5nYhFtD1lr0zA2cuVQsnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fEbaZo81
Subject: [Buildroot] [PATCH] package/libtirpc: backport upstream fixes for
 GCC 15.x issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports two upstream commits that address GCC 15.x build
issues.

Fixes:

  https://autobuild.buildroot.org/results/abca98bc69ac51af3652ab2d0d187d1461f83515/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rations-to-allow-compile-with-gcc-15.patch | 67 +++++++++++++++++++
 ...d-key_call-declarations-to-allow-com.patch | 63 +++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 package/libtirpc/0001-Update-declarations-to-allow-compile-with-gcc-15.patch
 create mode 100644 package/libtirpc/0002-update-signal-and-key_call-declarations-to-allow-com.patch

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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
