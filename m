Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C501E8B36D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5956064F;
	Tue,  3 Feb 2026 22:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ghz-sC17ncWb; Tue,  3 Feb 2026 22:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7B960752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156777;
	bh=GZwUnfuLxZCbAtN8Ff5GDgoWPKCMcgE5eT7DDYfjwZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mm+DeSc4w/4S9kfMwE8Qa2BkgfjPZp94Pb3z9HCbbcMDTIWBBz5wVhdm01hbWD/vZ
	 dugbnThlNlZl3mfXGJCLtSFiwLZtlalAzEmul/NaWWdoW5vwkUXZwl8JkPcDCTC4i3
	 zpWEZYLJm843xMzjpMjDu2F26xhU67Uanr89NYQS2O+R6EeIL6Wn7B3ALQaoh1f8ac
	 lza9ThvIH1+ZuvD+bQ4L0bkGEk2ip8dPCZooJOkOr4gbjG+ihmayfMm341Tix5uyLD
	 +km3/X7e2PRs4uAn8F7egB7S/MWcVrvl3TGqmFL0+/NY1uZQZaGCMTGddbnl6sZCa9
	 CpSho9bm1rr4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7B960752;
	Tue,  3 Feb 2026 22:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 724B613D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 594744084A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4s_Gsn0CgTXe for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72FE340807
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72FE340807
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548DF86782; Tue,  3 Feb 2026 22:12:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 23:12:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6eaaccf7587b2dcbc78fab0e69042307543bc3d0
X-Git-Newrev: 0821508c4c9eb30cf8e18d19ccfec1a01a80b90a
X-Patchwork-Hint: ignore
Message-Id: <20260203221254.548DF86782@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix compilation
 against >=2023/06/02 spandsp
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

commit: https://git.buildroot.net/buildroot/commit/?id=0821508c4c9eb30cf8e18d19ccfec1a01a80b90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to fix build with upcoming bump of spandsp.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-compilation-against-2023-06-02-spand.patch | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch b/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch
new file mode 100644
index 0000000000..57211410ed
--- /dev/null
+++ b/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch
@@ -0,0 +1,150 @@
+From 76458fafc5a9cd0eebe94455ed39f41eac986c67 Mon Sep 17 00:00:00 2001
+From: Patrice Fournier <patrice.fournier@t38fax.com>
+Date: Tue, 4 Feb 2025 15:54:26 -0500
+Subject: [PATCH] [mod_spandsp] Fix compilation against >=2023/06/02 spandsp
+
+* [mod_spandsp] Fix compilation against >=2023/06/02 spandsp
+
+spandsp, beginning with commit d9681c37 and coinciding with the
+SPANDSP_RELEASE_DATE of 20230620, introduced the following changes to
+its V.18 protocol API, which FreeSWITCH is not able to compile against:
+- Certain V.18 constants were renamed.
+- The v18_init function now requires passing a third function, handling
+the V.18 modem's status changes.
+
+This patch allows FreeSWITCH to build against current versions of
+spandsp by:
+- Using the new V.18 constant names.
+- Implementing a simple status reporter callback function and passing it
+as the third function to v18_init.
+
+Additionally, it retains backward compatibility with prior versions of
+spandp through #if conditions checking the value of
+SPANDSP_RELEASE_DATE.
+
+Signed-off-by: Patrice Fournier <patrice.fournier@t38fax.com>
+
+* [mod_spandsp] Pass session to handle_v18_status.
+
+---------
+
+Signed-off-by: Patrice Fournier <patrice.fournier@t38fax.com>
+Co-authored-by: Morgan Scarafiotti <morgan.scarafiotti@t38fax.com>
+Co-authored-by: Andrey Volk <andywolk@gmail.com>
+
+Upstream: https://github.com/signalwire/freeswitch/commit/76458fafc5a9cd0eebe94455ed39f41eac986c67
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../applications/mod_spandsp/mod_spandsp.c    |  1 -
+ .../applications/mod_spandsp/mod_spandsp.h    |  6 ++++
+ .../mod_spandsp/mod_spandsp_dsp.c             | 32 ++++++++++++++++---
+ 3 files changed, 34 insertions(+), 5 deletions(-)
+
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp.c b/src/mod/applications/mod_spandsp/mod_spandsp.c
+index 3f69b9746a..50d03f93a3 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp.c
++++ b/src/mod/applications/mod_spandsp/mod_spandsp.c
+@@ -37,7 +37,6 @@
+ 
+ 
+ #include "mod_spandsp.h"
+-#include <spandsp/version.h>
+ #include "mod_spandsp_modem.h"
+ 
+ /* **************************************************************************
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp.h b/src/mod/applications/mod_spandsp/mod_spandsp.h
+index 01f79e254d..6a936eee18 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp.h
++++ b/src/mod/applications/mod_spandsp/mod_spandsp.h
+@@ -58,6 +58,12 @@ typedef int zap_socket_t;
+ #define SPANDSP_EVENT_TXFAXNEGOCIATERESULT "spandsp::txfaxnegociateresult"
+ #define SPANDSP_EVENT_RXFAXNEGOCIATERESULT "spandsp::rxfaxnegociateresult"
+ 
++#include <spandsp/version.h>
++
++#if SPANDSP_RELEASE_DATE < 20230620
++#define V18_MODE_WEITBRECHT_5BIT_4545 V18_MODE_5BIT_4545
++#define V18_MODE_WEITBRECHT_5BIT_50   V18_MODE_5BIT_50
++#endif
+ 
+ 
+ /* The global stuff */
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c b/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
+index 836808a48d..51ac2a0e63 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
++++ b/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
+@@ -152,17 +152,27 @@ static void put_text_msg(void *user_data, const uint8_t *msg, int len)
+ 
+ }
+ 
++#if SPANDSP_RELEASE_DATE >= 20230620
++static void handle_v18_status(void *user_data, int status)
++{
++	switch_core_session_t *session = (switch_core_session_t *) user_data;
++	switch_channel_t *channel = switch_core_session_get_channel(session);
++
++	switch_log_printf(SWITCH_CHANNEL_SESSION_LOG(session), SWITCH_LOG_INFO, "%s detected V.18 modem: %s\n", switch_channel_get_name(channel), v18_status_to_str(status));
++}
++#endif
++
+ static int get_v18_mode(switch_core_session_t *session)
+ {
+ 	switch_channel_t *channel = switch_core_session_get_channel(session);
+ 	const char *var;
+-	int r = V18_MODE_5BIT_4545;
++	int r = V18_MODE_WEITBRECHT_5BIT_4545;
+ 
+ 	if ((var = switch_channel_get_variable(channel, "v18_mode"))) {
+ 		if (!strcasecmp(var, "5BIT_45") || !strcasecmp(var, "baudot")) {
+-			r = V18_MODE_5BIT_4545;
++			r = V18_MODE_WEITBRECHT_5BIT_4545;
+ 		} else if (!strcasecmp(var, "5BIT_50")) {
+-			r = V18_MODE_5BIT_50;
++			r = V18_MODE_WEITBRECHT_5BIT_50;
+ 		} else if (!strcasecmp(var, "DTMF")) {
+ 			r = V18_MODE_DTMF;
+ 		} else if (!strcasecmp(var, "EDT")) {
+@@ -213,8 +223,11 @@ switch_status_t spandsp_tdd_send_session(switch_core_session_t *session, const c
+ 		return SWITCH_STATUS_FALSE;
+ 	}
+ 
++#if SPANDSP_RELEASE_DATE >= 20230620
++	tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL, handle_v18_status, session);
++#else
+ 	tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL);
+-
++#endif
+ 
+ 	v18_put(tdd_state, text, -1);
+ 
+@@ -260,7 +273,13 @@ switch_status_t spandsp_tdd_encode_session(switch_core_session_t *session, const
+ 	}
+ 
+ 	pvt->session = session;
++
++#if SPANDSP_RELEASE_DATE >= 20230620
++	pvt->tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL, handle_v18_status, session);
++#else
+ 	pvt->tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL);
++#endif
++
+ 	pvt->head_lead = TDD_LEAD;
+ 
+ 	v18_put(pvt->tdd_state, text, -1);
+@@ -338,7 +357,12 @@ switch_status_t spandsp_tdd_decode_session(switch_core_session_t *session)
+ 	}
+ 
+ 	pvt->session = session;
++
++#if SPANDSP_RELEASE_DATE >= 20230620
++	pvt->tdd_state = v18_init(NULL, FALSE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, pvt, handle_v18_status, session);
++#else
+ 	pvt->tdd_state = v18_init(NULL, FALSE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, pvt);
++#endif
+ 
+ 	if ((status = switch_core_media_bug_add(session, "spandsp_tdd_decode", NULL,
+ 						tdd_decode_callback, pvt, 0, SMBF_READ_REPLACE | SMBF_NO_PAUSE, &bug)) != SWITCH_STATUS_SUCCESS) {
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
