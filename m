Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DEBC5DF70
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3549607D0;
	Mon, 17 Aug 2026 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3E36LASug6qU; Mon, 17 Aug 2026 17:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A616E607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786986457;
	bh=j39lPIo2Ffw1TJmnFLSeNNOqowQel3ROs5tSMO7c0d8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NPHaQg30nPlp/+Ig6AkKIbIlyFcr3yCj+KhJFRrHZS0d12wUAONkVXpFYCDRbSIhN
	 4fglqJnZNh6hJo7m75jzydcR/S5Vf+tkbvhQb7+jGjhf5kHExmmOqHaBhkTDn5+yXY
	 Slh/Ge3Ob51eNfIEEodoT/ksQHvCZAn9+6ttZJKd54YjiTL96Y7/Bj6VCleL5D+1J/
	 dQ1w+d2JOfXBuVpz55oQDeex4FFNUoh99nhd5WVkYstIHNkP7Z6G9FVnluYUsD766X
	 4LShLSNW7IOV2ryDRXJxW01jYcoMelF25aQn6DnBqvx8ZkVFd3CPzNBIKFWUfhlcOb
	 21Ajk7B4KEQEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A616E607C3;
	Mon, 17 Aug 2026 17:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 915A6337
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77C7880FFD
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECs6KrSDZ-Ma for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD9280FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD9280FF2
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:07:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B1768B87D; Mon, 17 Aug 2026 17:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 18:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de14a2ab51b22edbde4bdae03670932ee3918610
X-Git-Newrev: 83f79dd82cab6d103f515a155baf18e9f4125c33
X-Patchwork-Hint: ignore
Message-Id: <20260817170642.8B1768B87D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hostapd: bump version to 2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83f79dd82cab6d103f515a155baf18e9f4125c33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.infradead.org/pipermail/hostap/2026-August/045441.html

Removed patches which are included in this release.

Removed the hostap driver from the package due to its upstream removal:
https://git.w1.fi/cgit/hostap/commit/?id=dfd207d96c1bbc4a2013db638bc1d48cc0865c27

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  6 ++
 ...-request-only-when-accepting-the-response.patch | 82 ----------------------
 .../0002-RADIUS-Fix-pending-request-dropping.patch | 74 -------------------
 package/hostapd/Config.in                          |  8 ---
 package/hostapd/hostapd.hash                       |  4 +-
 package/hostapd/hostapd.mk                         | 10 +--
 6 files changed, 9 insertions(+), 175 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4da157fbba..d0d487f010 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
+	bool "hostapd hostap driver removed"
+	select BR2_LEGACY
+	help
+	  The hostap driver was removed from hostapd.
+
 config BR2_GDB_VERSION_ARC
 	bool "ARC-specific gdb version removed"
 	select BR2_LEGACY
diff --git a/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch b/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
deleted file mode 100644
index fb86d1303d..0000000000
--- a/package/hostapd/0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 25 Jan 2025 11:21:16 +0200
-Subject: RADIUS: Drop pending request only when accepting the response
-
-The case of an invalid authenticator in a RADIUS response could imply
-that the response is not from the correct RADIUS server and as such,
-such a response should be discarded without changing internal state for
-the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
-is somewhat more complex since it could have been indicated before
-validating the authenticator. In any case, it seems better to change the
-state for the pending request only when we have fully accepted the
-response.
-
-Allowing the internal state of pending RADIUS request to change based on
-responses that are not fully validation could have allow at least a
-theoretical DoS attack if an attacker were to have means for injecting
-RADIUS messages to the network using the IP address of the real RADIUS
-server and being able to do so more quickly than the real server and
-with the matching identifier from the request header (i.e., either by
-flooding 256 responses quickly or by having means to capture the RADIUS
-request). These should not really be realistic options in a properly
-protected deployment, but nevertheless it is good to be more careful in
-processing RADIUS responses.
-
-Remove a pending RADIUS request from the internal list only when having
-fully accepted a matching RADIUS response, i.e., after one of the
-registered handlers has confirmed that the authenticator is valid and
-processing of the response has succeeded.
-
-Upstream: https://git.w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44
-CVE: CVE-2025-24912
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/radius/radius_client.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 2a7f36170..7909b29a7 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       roundtrip / 100, roundtrip % 100);
- 	rconf->round_trip_time = roundtrip;
- 
--	/* Remove ACKed RADIUS packet from retransmit list */
--	if (prev_req)
--		prev_req->next = req->next;
--	else
--		radius->msgs = req->next;
--	radius->num_msgs--;
--
- 	for (i = 0; i < num_handlers; i++) {
- 		RadiusRxResult res;
- 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
-@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			radius_msg_free(msg);
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
-+			/* Remove ACKed RADIUS packet from retransmit list */
-+			if (prev_req)
-+				prev_req->next = req->next;
-+			else
-+				radius->msgs = req->next;
-+			radius->num_msgs--;
-+
- 			radius_client_msg_free(req);
- 			return;
- 		case RADIUS_RX_INVALID_AUTHENTICATOR:
-@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       msg_type, hdr->code, hdr->identifier,
- 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
- 		       "");
--	radius_client_msg_free(req);
- 
-  fail:
- 	radius_msg_free(msg);
--- 
-cgit v1.2.3
-
diff --git a/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch b/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch
deleted file mode 100644
index 474f40da0c..0000000000
--- a/package/hostapd/0002-RADIUS-Fix-pending-request-dropping.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <quic_jouni@quicinc.com>
-Date: Wed, 5 Feb 2025 19:23:39 +0200
-Subject: RADIUS: Fix pending request dropping
-
-A recent change to this moved the place where the processed RADIUS
-request was removed from the pending list to happen after the message
-handler had been called. This did not take into account possibility of
-the handler adding a new pending request in the list and the prev_req
-pointer not necessarily pointing to the correct entry anymore. As such,
-some of the pending requests could have been lost and that would result
-in not being able to process responses to those requests and also, to a
-memory leak.
-
-Fix this by determining prev_req at the point when the pending request
-is being removed, i.e., after the handler function has already added a
-new entry.
-
-Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
-
-Upstream: https://git.w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109
-CVE: CVE-2025-24912
-
-Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/radius/radius_client.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 7909b29a7..d4faa7936 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 	struct radius_hdr *hdr;
- 	struct radius_rx_handler *handlers;
- 	size_t num_handlers, i;
--	struct radius_msg_list *req, *prev_req;
-+	struct radius_msg_list *req, *prev_req, *r;
- 	struct os_reltime now;
- 	struct hostapd_radius_server *rconf;
- 	int invalid_authenticator = 0;
-@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		break;
- 	}
- 
--	prev_req = NULL;
- 	req = radius->msgs;
- 	while (req) {
- 		/* TODO: also match by src addr:port of the packet when using
-@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		    hdr->identifier)
- 			break;
- 
--		prev_req = req;
- 		req = req->next;
- 	}
- 
-@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
- 			/* Remove ACKed RADIUS packet from retransmit list */
-+			prev_req = NULL;
-+			for (r = radius->msgs; r; r = r->next) {
-+				if (r == req)
-+					break;
-+				prev_req = r;
-+			}
- 			if (prev_req)
- 				prev_req->next = req->next;
- 			else
--- 
-cgit v1.2.3
-
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 660274ddf0..40747a4e62 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -14,13 +14,6 @@ config BR2_PACKAGE_HOSTAPD
 
 if BR2_PACKAGE_HOSTAPD
 
-config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
-	bool "Enable hostap driver"
-	default y
-	select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
-	help
-	  Enable support for Host AP driver.
-
 config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	bool "Enable nl80211 driver"
 	default y
@@ -41,7 +34,6 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 config BR2_PACKAGE_HOSTAPD_DRIVER_NONE
 	bool
 	default y
-	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	depends on !BR2_PACKAGE_HOSTAPD_DRIVER_WIRED
 
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 7921586172..8d9f384dae 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a  hostapd-2.11.tar.gz
-sha256  f1b5992bbdd015c3ccb7faaadd62ef58ed821e15b9329bf2ceb27511ccc3f562  README
+sha256  f43502561c28ba47ab77e18e1a973d07361c68cc8b14178e619bd5796b70eabd  hostapd-2.12.tar.gz
+sha256  83be1b142c59ccf0d6c5dde0695d8f84dfba109bea058e78ec2942389ccf327f  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d83b574fad..d673c84587 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.11
+HOSTAPD_VERSION = 2.12
 HOSTAPD_SITE = http://w1.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
@@ -16,10 +16,6 @@ HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_SELINUX_MODULES = hostapd
 
-# 0001-RADIUS-Drop-pending-request-only-when-accepting-the-response.patch
-# 0002-RADIUS-Fix-pending-request-dropping.patch
-HOSTAPD_IGNORE_CVES += CVE-2025-24912
-
 HOSTAPD_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_DEBUG_FILE \
@@ -37,10 +33,6 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
-ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP),)
-HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_HOSTAP
-endif
-
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),)
 HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
