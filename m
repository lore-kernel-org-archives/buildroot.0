Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817FBC369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C03461124;
	Tue, 15 Apr 2025 17:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_SaHBvLtFMO; Tue, 15 Apr 2025 17:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7E760BCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7E760BCD;
	Tue, 15 Apr 2025 17:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16811109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1387383B40
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1in3gu2wzwf3 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD50C83B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD50C83B26
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA08184849; Tue, 15 Apr 2025 17:22:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 19:16:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164c84ee9b820f5b21e79b4d52c07a613925d3f2
X-Git-Newrev: 5c87c9aa0a94a647a59b280682ac285d01857091
X-Patchwork-Hint: ignore
Message-Id: <20250415172201.BA08184849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: security bump to
 version 2.0.21
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c87c9aa0a94a647a59b280682ac285d01857091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- Fix leak on malicious SUBSCRIBE by authenticated client.
  Closes eclipse #248.
- Further fix for CVE-2023-28366.

Also drop the patch that was fixed in the v2.0.21, see the closed issues:
https://github.com/eclipse-mosquitto/mosquitto/issues/3183
https://github.com/eclipse-mosquitto/mosquitto/issues/3193

However, the new version introduced a new issue, when WITH_TLS is off, the
compilation will fail. It is already reported upstream with the issue:
https://github.com/eclipse-mosquitto/mosquitto/issues/3246

However, the upstream received two identical PRs, we quote the patch file
of the earlier PR (#3227) here.
https://github.com/eclipse-mosquitto/mosquitto/pull/3227
https://github.com/eclipse-mosquitto/mosquitto/pull/3252

For more details of v2.0.21, see the changelog:
https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.21/ChangeLog.txt

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[Julien: fix check-package error: add SoB lines in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../mosquitto/0001-Revert-Fix-NetBSD-build.patch   | 390 ---------------------
 ...1-fix-compile-failed-when-WITH_TLS-is-off.patch |  35 ++
 package/mosquitto/mosquitto.hash                   |   4 +-
 package/mosquitto/mosquitto.mk                     |   2 +-
 4 files changed, 38 insertions(+), 393 deletions(-)

diff --git a/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch b/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
deleted file mode 100644
index 180a23565c..0000000000
--- a/package/mosquitto/0001-Revert-Fix-NetBSD-build.patch
+++ /dev/null
@@ -1,390 +0,0 @@
-From 18d41744338d6e291612e66e8baace4faaad7b2e Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 6 Dec 2024 08:27:53 +0100
-Subject: [PATCH] Revert "Fix NetBSD build"
-
-This reverts commit 88b7bb3521cc51cb1e80630395ae736040cc8ff8.
-
-This unfortunately broke non-thread builds, so revert it until fixed
-upstream.
-
-Upstream: https://github.com/eclipse-mosquitto/mosquitto/issues/3183
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/dummypthread.h       | 14 ++++++++++++
- lib/handle_pubackcomp.c  |  4 ++--
- lib/mosquitto_internal.h |  6 +++++-
- lib/packet_mosq.c        | 46 ++++++++++++++++++++--------------------
- lib/pthread_compat.h     | 28 ------------------------
- lib/util_mosq.c          | 32 ++++++++++++++--------------
- 6 files changed, 60 insertions(+), 70 deletions(-)
- create mode 100644 lib/dummypthread.h
- delete mode 100644 lib/pthread_compat.h
-
-diff --git a/lib/dummypthread.h b/lib/dummypthread.h
-new file mode 100644
-index 00000000..c0eb2c15
---- /dev/null
-+++ b/lib/dummypthread.h
-@@ -0,0 +1,14 @@
-+#ifndef DUMMYPTHREAD_H
-+#define DUMMYPTHREAD_H
-+
-+#define pthread_create(A, B, C, D)
-+#define pthread_join(A, B)
-+#define pthread_cancel(A)
-+#define pthread_testcancel()
-+
-+#define pthread_mutex_init(A, B)
-+#define pthread_mutex_destroy(A)
-+#define pthread_mutex_lock(A)
-+#define pthread_mutex_unlock(A)
-+
-+#endif
-diff --git a/lib/handle_pubackcomp.c b/lib/handle_pubackcomp.c
-index d70d602d..4568bb40 100644
---- a/lib/handle_pubackcomp.c
-+++ b/lib/handle_pubackcomp.c
-@@ -57,9 +57,9 @@ int handle__pubackcomp(struct mosquitto *mosq, const char *type)
- 		}
- 	}
- 
--	COMPAT_pthread_mutex_lock(&mosq->msgs_out.mutex);
-+	pthread_mutex_lock(&mosq->msgs_out.mutex);
- 	util__increment_send_quota(mosq);
--	COMPAT_pthread_mutex_unlock(&mosq->msgs_out.mutex);
-+	pthread_mutex_unlock(&mosq->msgs_out.mutex);
- 
- 	rc = packet__read_uint16(&mosq->in_packet, &mid);
- 	if(rc) return rc;
-diff --git a/lib/mosquitto_internal.h b/lib/mosquitto_internal.h
-index 31120258..ac71ffbf 100644
---- a/lib/mosquitto_internal.h
-+++ b/lib/mosquitto_internal.h
-@@ -33,7 +33,11 @@ Contributors:
- #endif
- #include <stdlib.h>
- 
--#include <pthread_compat.h>
-+#if defined(WITH_THREADING) && !defined(WITH_BROKER)
-+#  include <pthread.h>
-+#else
-+#  include <dummypthread.h>
-+#endif
- 
- #ifdef WITH_SRV
- #  include <ares.h>
-diff --git a/lib/packet_mosq.c b/lib/packet_mosq.c
-index b063eb71..fd716baf 100644
---- a/lib/packet_mosq.c
-+++ b/lib/packet_mosq.c
-@@ -129,13 +129,13 @@ void packet__cleanup_all_no_locks(struct mosquitto *mosq)
- 
- void packet__cleanup_all(struct mosquitto *mosq)
- {
--	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 
- 	packet__cleanup_all_no_locks(mosq);
- 
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
--	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- }
- 
- 
-@@ -151,7 +151,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
- 	packet->to_process = packet->packet_length;
- 
- 	packet->next = NULL;
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 
- #ifdef WITH_BROKER
- 	if(db.config->max_queued_messages > 0 && mosq->out_packet_count >= db.config->max_queued_messages){
-@@ -174,7 +174,7 @@ int packet__queue(struct mosquitto *mosq, struct mosquitto__packet *packet)
- 	}
- 	mosq->out_packet_last = packet;
- 	mosq->out_packet_count++;
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
- #ifdef WITH_BROKER
- #  ifdef WITH_WEBSOCKETS
- 	if(mosq->wsi){
-@@ -232,8 +232,8 @@ int packet__write(struct mosquitto *mosq)
- 	if(!mosq) return MOSQ_ERR_INVAL;
- 	if(mosq->sock == INVALID_SOCKET) return MOSQ_ERR_NO_CONN;
- 
--	COMPAT_pthread_mutex_lock(&mosq->current_out_packet_mutex);
--	COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+	pthread_mutex_lock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_lock(&mosq->out_packet_mutex);
- 	if(mosq->out_packet && !mosq->current_out_packet){
- 		mosq->current_out_packet = mosq->out_packet;
- 		mosq->out_packet = mosq->out_packet->next;
-@@ -242,7 +242,7 @@ int packet__write(struct mosquitto *mosq)
- 		}
- 		mosq->out_packet_count--;
- 	}
--	COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->out_packet_mutex);
- 
- #ifdef WITH_BROKER
- 	if(mosq->current_out_packet){
-@@ -252,7 +252,7 @@ int packet__write(struct mosquitto *mosq)
- 
- 	state = mosquitto__get_state(mosq);
- 	if(state == mosq_cs_connect_pending){
--		COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+		pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 		return MOSQ_ERR_SUCCESS;
- 	}
- 
-@@ -274,10 +274,10 @@ int packet__write(struct mosquitto *mosq)
- 						|| errno == WSAENOTCONN
- #endif
- 						){
--					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 					return MOSQ_ERR_SUCCESS;
- 				}else{
--					COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+					pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 					switch(errno){
- 						case COMPAT_ECONNRESET:
- 							return MOSQ_ERR_CONN_LOST;
-@@ -296,7 +296,7 @@ int packet__write(struct mosquitto *mosq)
- 		if(((packet->command)&0xF6) == CMD_PUBLISH){
- 			G_PUB_MSGS_SENT_INC(1);
- #ifndef WITH_BROKER
--			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
-+			pthread_mutex_lock(&mosq->callback_mutex);
- 			if(mosq->on_publish){
- 				/* This is a QoS=0 message */
- 				mosq->in_callback = true;
-@@ -309,7 +309,7 @@ int packet__write(struct mosquitto *mosq)
- 				mosq->on_publish_v5(mosq, mosq->userdata, packet->mid, 0, NULL);
- 				mosq->in_callback = false;
- 			}
--			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
-+			pthread_mutex_unlock(&mosq->callback_mutex);
- 		}else if(((packet->command)&0xF0) == CMD_DISCONNECT){
- 			do_client_disconnect(mosq, MOSQ_ERR_SUCCESS, NULL);
- 			packet__cleanup(packet);
-@@ -321,7 +321,7 @@ int packet__write(struct mosquitto *mosq)
- 		}
- 
- 		/* Free data and reset values */
--		COMPAT_pthread_mutex_lock(&mosq->out_packet_mutex);
-+		pthread_mutex_lock(&mosq->out_packet_mutex);
- 		mosq->current_out_packet = mosq->out_packet;
- 		if(mosq->out_packet){
- 			mosq->out_packet = mosq->out_packet->next;
-@@ -330,7 +330,7 @@ int packet__write(struct mosquitto *mosq)
- 			}
- 			mosq->out_packet_count--;
- 		}
--		COMPAT_pthread_mutex_unlock(&mosq->out_packet_mutex);
-+		pthread_mutex_unlock(&mosq->out_packet_mutex);
- 
- 		packet__cleanup(packet);
- 		mosquitto__free(packet);
-@@ -338,9 +338,9 @@ int packet__write(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 		mosq->next_msg_out = db.now_s + mosq->keepalive;
- #else
--		COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+		pthread_mutex_lock(&mosq->msgtime_mutex);
- 		mosq->next_msg_out = mosquitto_time() + mosq->keepalive;
--		COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+		pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 	}
- #ifdef WITH_BROKER
-@@ -348,7 +348,7 @@ int packet__write(struct mosquitto *mosq)
- 		mux__remove_out(mosq);
- 	}
- #endif
--	COMPAT_pthread_mutex_unlock(&mosq->current_out_packet_mutex);
-+	pthread_mutex_unlock(&mosq->current_out_packet_mutex);
- 	return MOSQ_ERR_SUCCESS;
- }
- 
-@@ -536,9 +536,9 @@ int packet__read(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 					keepalive__update(mosq);
- #else
--					COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+					pthread_mutex_lock(&mosq->msgtime_mutex);
- 					mosq->last_msg_in = mosquitto_time();
--					COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+					pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 				}
- 				return MOSQ_ERR_SUCCESS;
-@@ -571,9 +571,9 @@ int packet__read(struct mosquitto *mosq)
- #ifdef WITH_BROKER
- 	keepalive__update(mosq);
- #else
--	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+	pthread_mutex_lock(&mosq->msgtime_mutex);
- 	mosq->last_msg_in = mosquitto_time();
--	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+	pthread_mutex_unlock(&mosq->msgtime_mutex);
- #endif
- 	return rc;
- }
-diff --git a/lib/pthread_compat.h b/lib/pthread_compat.h
-deleted file mode 100644
-index ca1f27dc..00000000
---- a/lib/pthread_compat.h
-+++ /dev/null
-@@ -1,28 +0,0 @@
--#ifndef PTHREAD_COMPAT_
--#define PTHREAD_COMPAT_
--
--#if defined(WITH_THREADING) && !defined(WITH_BROKER)
--#  include <pthread.h>
--
--#  define COMPAT_pthread_create(A, B, C, D) pthread_create((A), (B), (C), (D))
--#  define COMPAT_pthread_join(A, B) pthread_join((A), (B))
--#  define COMPAT_pthread_cancel(A) pthread_cancel((A))
--#  define COMPAT_pthread_testcancel() pthread_testcancel()
--
--#  define COMPAT_pthread_mutex_init(A, B) pthread_mutex_init((A), (B))
--#  define COMPAT_pthread_mutex_destroy(A) pthread_mutex_init((A))
--#  define COMPAT_pthread_mutex_lock(A) pthread_mutex_lock((A))
--#  define COMPAT_pthread_mutex_unlock(A) pthread_mutex_unlock((A))
--#else
--#  define COMPAT_pthread_create(A, B, C, D)
--#  define COMPAT_pthread_join(A, B)
--#  define COMPAT_pthread_cancel(A)
--#  define COMPAT_pthread_testcancel()
--
--#  define COMPAT_pthread_mutex_init(A, B)
--#  define COMPAT_pthread_mutex_destroy(A)
--#  define COMPAT_pthread_mutex_lock(A)
--#  define COMPAT_pthread_mutex_unlock(A)
--#endif
--
--#endif
-diff --git a/lib/util_mosq.c b/lib/util_mosq.c
-index 4bebcbd0..22f8c4d5 100644
---- a/lib/util_mosq.c
-+++ b/lib/util_mosq.c
-@@ -87,10 +87,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 		return MOSQ_ERR_SUCCESS;
- 	}
- #endif
--	COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+	pthread_mutex_lock(&mosq->msgtime_mutex);
- 	next_msg_out = mosq->next_msg_out;
- 	last_msg_in = mosq->last_msg_in;
--	COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+	pthread_mutex_unlock(&mosq->msgtime_mutex);
- 	if(mosq->keepalive && mosq->sock != INVALID_SOCKET &&
- 			(now >= next_msg_out || now - last_msg_in >= mosq->keepalive)){
- 
-@@ -98,10 +98,10 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 		if(state == mosq_cs_active && mosq->ping_t == 0){
- 			send__pingreq(mosq);
- 			/* Reset last msg times to give the server time to send a pingresp */
--			COMPAT_pthread_mutex_lock(&mosq->msgtime_mutex);
-+			pthread_mutex_lock(&mosq->msgtime_mutex);
- 			mosq->last_msg_in = now;
- 			mosq->next_msg_out = now + mosq->keepalive;
--			COMPAT_pthread_mutex_unlock(&mosq->msgtime_mutex);
-+			pthread_mutex_unlock(&mosq->msgtime_mutex);
- 		}else{
- #ifdef WITH_BROKER
- #  ifdef WITH_BRIDGE
-@@ -118,7 +118,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 			}else{
- 				rc = MOSQ_ERR_KEEPALIVE;
- 			}
--			COMPAT_pthread_mutex_lock(&mosq->callback_mutex);
-+			pthread_mutex_lock(&mosq->callback_mutex);
- 			if(mosq->on_disconnect){
- 				mosq->in_callback = true;
- 				mosq->on_disconnect(mosq, mosq->userdata, rc);
-@@ -129,7 +129,7 @@ int mosquitto__check_keepalive(struct mosquitto *mosq)
- 				mosq->on_disconnect_v5(mosq, mosq->userdata, rc, NULL);
- 				mosq->in_callback = false;
- 			}
--			COMPAT_pthread_mutex_unlock(&mosq->callback_mutex);
-+			pthread_mutex_unlock(&mosq->callback_mutex);
- 
- 			return rc;
- #endif
-@@ -150,11 +150,11 @@ uint16_t mosquitto__mid_generate(struct mosquitto *mosq)
- 	uint16_t mid;
- 	assert(mosq);
- 
--	COMPAT_pthread_mutex_lock(&mosq->mid_mutex);
-+	pthread_mutex_lock(&mosq->mid_mutex);
- 	mosq->last_mid++;
- 	if(mosq->last_mid == 0) mosq->last_mid++;
- 	mid = mosq->last_mid;
--	COMPAT_pthread_mutex_unlock(&mosq->mid_mutex);
-+	pthread_mutex_unlock(&mosq->mid_mutex);
- 
- 	return mid;
- }
-@@ -280,14 +280,14 @@ int util__random_bytes(void *bytes, int count)
- 
- int mosquitto__set_state(struct mosquitto *mosq, enum mosquitto_client_state state)
- {
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- #ifdef WITH_BROKER
- 	if(mosq->state != mosq_cs_disused)
- #endif
- 	{
- 		mosq->state = state;
- 	}
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return MOSQ_ERR_SUCCESS;
- }
-@@ -296,9 +296,9 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
- {
- 	enum mosquitto_client_state state;
- 
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	state = mosq->state;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return state;
- }
-@@ -306,18 +306,18 @@ enum mosquitto_client_state mosquitto__get_state(struct mosquitto *mosq)
- #ifndef WITH_BROKER
- void mosquitto__set_request_disconnect(struct mosquitto *mosq, bool request_disconnect)
- {
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	mosq->request_disconnect = request_disconnect;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- }
- 
- bool mosquitto__get_request_disconnect(struct mosquitto *mosq)
- {
- 	bool request_disconnect;
- 
--	COMPAT_pthread_mutex_lock(&mosq->state_mutex);
-+	pthread_mutex_lock(&mosq->state_mutex);
- 	request_disconnect = mosq->request_disconnect;
--	COMPAT_pthread_mutex_unlock(&mosq->state_mutex);
-+	pthread_mutex_unlock(&mosq->state_mutex);
- 
- 	return request_disconnect;
- }
--- 
-2.39.5
-
diff --git a/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch b/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
new file mode 100644
index 0000000000..9c69c6a9c2
--- /dev/null
+++ b/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
@@ -0,0 +1,35 @@
+From 47c015e0d3fb5c5c71a68fe21c8e5eb2a5fbfc1d Mon Sep 17 00:00:00 2001
+From: "chunbo.bai" <chunbo.bai@tcl.com>
+Date: Fri, 7 Mar 2025 14:16:45 +0800
+Subject: [PATCH] fix: compile failed when WITH_TLS is off
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3227
+Signed-off-by: "chunbo.bai" <chunbo.bai@tcl.com>
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+---
+ src/conf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/conf.c b/src/conf.c
+index 74ca66fcb..bfccf729c 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -2313,6 +2313,7 @@ static int config__check(struct mosquitto__config *config)
+ 		}
+ 	}
+ 
++#ifdef WITH_TLS
+ 	/* Check for missing TLS cafile/capath/certfile/keyfile */
+ 	for(int i=0; i<config->listener_count; i++){
+ 		 bool cafile = !!config->listeners[i].cafile;
+@@ -2333,6 +2334,7 @@ static int config__check(struct mosquitto__config *config)
+ 			 return MOSQ_ERR_INVAL;
+ 		 }
+ 	}
++#endif
+ 	return MOSQ_ERR_SUCCESS;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index f644f688b9..ff74d9c534 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.20.tar.gz.asc
-sha256  ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8  mosquitto-2.0.20.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.21.tar.gz.asc
+sha256  7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d  mosquitto-2.0.21.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 727dd4ff4c..900d1e65cb 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.20
+MOSQUITTO_VERSION = 2.0.21
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
