Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495EA606A33A
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VnsO7Axy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F41404F9;
	Wed,  4 Nov 2026 17:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OnLtIU-TXDy; Wed,  4 Nov 2026 17:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7481404FF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813585;
	b=myNc/iqVuTUIcAocBb2Mn2IX2Eg9b6W/Y2vONtcEHrLuJb3NptEKEUmaLzxm6HUDG5mx
	 HdNC7uJZ+ePHcy8hIIVY5JF2O78fE8QtYO7G8S6fR+j9u07IcrSX/u0rvLOxwvYkxffqQ
	 N27N0wWrLrCF7XXs3LHbghURL1rv201ReFkOdVRi4VIrkdkopFxK57sBHLSoHWctk6Gu7
	 Zi3Qa+Ub2WLk5OfzC4XJQq/HnUomHAFI7PSQkcvivVuJuuoOqM6cUlTb1U20r9x9R482W
	 tHOAmNQeJ9Nen3TW08Cx/Q+YTuDbnj3AYYcVu3h+Iv/gMbxrvkJMgTyjhX2Cc+8VNow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cP2YUy9ewTo4O8fR85pEMY/MlOf8R5DRjYotRQPV208=;
	b=YBNozTyBWFfZqqD4m5XHum3dUlc5LOTHZFNCfEc/5NZ9BBVI/g9TbsCiwqTEjv5F2eK/
	 bLYxFFEqNRUDHZC+VmyN+cckt4ntFeyzICbstp+hGLkl4h6M1FhOwfx2PRF92AauknMgB
	 Ydo98m+rm/T3WiIjGQv5DlmVZ/i3reP6bLLCAIEtcZ4eJGy8ZSnP4SOz8uJKw2gM+gJbw
	 3R+lormhSmrQwPg+AHpeMhbyMwQmY/TaWVUH/EJgqs+BEzW2x8vD61BA/n+wQwATQ9Wu5
	 OUfjhXGo1f1QJtc1Tg7ZSVJd5f0n0XHX+zKAuAaIygQLnrSBA8vXcQbz2Rka0GuEOQw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813585;
	bh=cP2YUy9ewTo4O8fR85pEMY/MlOf8R5DRjYotRQPV208=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VnsO7AxyOcPwDdLqWZM8oNd3JWxUjjps2DEnSeAdKr+n7x2CCynUanZBeGcgcZWvC
	 G3FCU74AKgcnDof0DZ/3skeD6rGCHwoo0S0DDWw7qZavkVz8jH4Il3n/BucIW25SCZ
	 FipGJSE/TvuqPYqkYDJkXwjmfanrWWJXOF1RC3tYqgxeUGzrobj/paQEw/6a09rNyf
	 AceQ+oN34pCzTGDvGsXwGX0cvC7xyE6TmnhU7HjhYKVMfYnJ6EN9tF4x5GQJjogt2w
	 aFJKXrOS5Hv+BHjRG9sUzOkJ/JFP8UZJmr3m8fQifvMyXu81mDK1jqsHwvMMO07aKB
	 IY217lxRXlo3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7481404FF;
	Wed,  4 Nov 2026 17:33:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF831EF8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B15D840211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOjX6bW4PJMH for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3B5A440062
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B5A440062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:33:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 592BD9DCF5; Wed,  4 Nov 2026 17:31:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:32:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db1d0382f35893ac624b614b765ddecfbdd1bef5
X-Git-Newrev: 78f0de27ff99d1fe65aada26e3b3de18641f11c2
X-Patchwork-Hint: ignore
Message-Id: <20261104173131.592BD9DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: security bump version to
 2.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/78f0de27ff99d1fe65aada26e3b3de18641f11c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ppp-project/ppp/releases/tag/v2.5.5
https://github.com/ppp-project/ppp/releases/tag/v2.5.4

Version 2.5.4 fixes CVE-2026-75883 and CVE-2026-85495.

Removed patch which is included in this release.

Updated configure options for OpenSSL engines support due to commit
https://github.com/ppp-project/ppp/commit/23d1bb7eddd8598d5106c8957b312392f01dcce1

Please note that the bump to 2.5.4 was skipped in buildroot due to
runtime errors fixed with this release:
"This is a bug-fix and security release, with no new features.
 Changes include:
 Fix bugs where hook scripts such as /etc/ppp/ip-up were not being run.
 [...]"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .../0001-dhcpv6relay-fix-build-with-gcc-9.x.patch  | 184 ---------------------
 package/pppd/pppd.hash                             |   2 +-
 package/pppd/pppd.mk                               |   8 +-
 3 files changed, 7 insertions(+), 187 deletions(-)

diff --git a/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch b/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch
deleted file mode 100644
index b7dfd87e8a..0000000000
--- a/package/pppd/0001-dhcpv6relay-fix-build-with-gcc-9.x.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-From 56f6f09035b034b96c84637160729aabf07f3460 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Wed, 17 Jun 2026 20:45:19 +0200
-Subject: [PATCH] dhcpv6relay: fix build with gcc 9.x
-
-Fixes various build errors seen with gcc 9.x:
-
-Making all in dhcpv6relay
-  CC       dhcpv6relay_la-dhcpv6relay.lo
-dhcpv6relay.c: In function 'dhcpv6relay_down':
-dhcpv6relay.c:193:1: error: parameter name omitted
- void dhcpv6relay_down(void*, int)
- ^~~~
-dhcpv6relay.c:193:1: error: parameter name omitted
-dhcpv6relay.c: In function 'dhcpv6relay_release_route':
-dhcpv6relay.c:265:45: error: parameter name omitted
- void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, uint32_t /* lifetime */)
-                                             ^~~~~~~~
-dhcpv6relay.c: In function 'dhcpv6relay_process_ia_pd':
-dhcpv6relay.c:343:2: error: label at end of compound statement
-  default:
-  ^~~~~~~
-dhcpv6relay.c: In function 'dhcpv6relay_process_ia_na':
-dhcpv6relay.c:380:2: error: label at end of compound statement
-  default:
-  ^~~~~~~
-dhcpv6relay.c: In function 'dhcpv6relay_process_packet_for_routes':
-dhcpv6relay.c:422:2: error: a label can only be part of a statement and a declaration is not a statement
-  dhcpv6relay_route_func func;
-  ^~~~~~~~~~~~~~~~~~~~~~
-dhcpv6relay.c:449:6: error: label at end of compound statement
-      default:
-      ^~~~~~~
-dhcpv6relay.c: In function 'dhcpv6relay_server_event':
-dhcpv6relay.c:463:1: error: parameter name omitted
- void dhcpv6relay_server_event(int fd, void*)
- ^~~~
-dhcpv6relay.c:558:2: error: label at end of compound statement
-  default:
-  ^~~~~~~
-dhcpv6relay.c: In function 'dhcpv6relay_client_event':
-dhcpv6relay.c:619:1: error: parameter name omitted
- void dhcpv6relay_client_event(int fd, void*)
- ^~~~
-dhcpv6relay.c: In function 'dhcpv6relay_send_router_advertisement_timed':
-dhcpv6relay.c:795:1: error: parameter name omitted
- void dhcpv6relay_send_router_advertisement_timed(void*)
- ^~~~
-dhcpv6relay.c: In function 'dhcpv6relay_router_solicitation':
-dhcpv6relay.c:802:1: error: parameter name omitted
- void dhcpv6relay_router_solicitation(int fd, void*)
- ^~~~
-dhcpv6relay.c: In function 'dhcpv6relay_up':
-dhcpv6relay.c:855:1: error: parameter name omitted
- void dhcpv6relay_up(void*, int)
- ^~~~
-dhcpv6relay.c:855:1: error: parameter name omitted
-
-Upstream: https://github.com/ppp-project/ppp/pull/598
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- pppd/plugins/dhcpv6relay/dhcpv6relay.c | 22 ++++++++++++----------
- 1 file changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/pppd/plugins/dhcpv6relay/dhcpv6relay.c b/pppd/plugins/dhcpv6relay/dhcpv6relay.c
-index e9ebba1..e416720 100644
---- a/pppd/plugins/dhcpv6relay/dhcpv6relay.c
-+++ b/pppd/plugins/dhcpv6relay/dhcpv6relay.c
-@@ -190,7 +190,7 @@ void routes_remove_all()
- }
- 
- static
--void dhcpv6relay_down(void*, int)
-+void dhcpv6relay_down(__attribute__((unused)) void* unused, __attribute__((unused)) int unusedint)
- {
-     routes_remove_all();
-     if (dhcpv6relay_sock_ll >= 0) {
-@@ -262,7 +262,7 @@ void dhcpv6relay_route_timeout(void* _r)
- }
- 
- static
--void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, uint32_t /* lifetime */)
-+void dhcpv6relay_release_route(const struct in6_addr* addr, uint8_t prefixlen, __attribute__((unused)) uint32_t lifetime)
- {
-     char in6addr[INET6_ADDRSTRLEN];
- 
-@@ -341,7 +341,7 @@ void dhcpv6relay_process_ia_pd(const unsigned char *bfr, uint16_t len, dhcpv6rel
- 	    routefunc((const struct in6_addr*)(bfr + 9), bfr[8], ntohl(*(const uint32_t*)(bfr+4)));
- 	    break;
- 	default:
--	    /* nothing */
-+	    break;
- 	}
- 
- 	bfr += optlen;
-@@ -378,7 +378,7 @@ void dhcpv6relay_process_ia_na(const unsigned char *bfr, uint16_t len, dhcpv6rel
- 	    routefunc((const struct in6_addr*)bfr, 128, ntohl(*(const uint32_t*)(bfr+20)));
- 	    break;
- 	default:
--	    /* nothing */
-+	    break;
- 	}
- 
- 	bfr += optlen;
-@@ -392,6 +392,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
-     if (len < 1)
- 	return;
-     uint8_t pkttype = *bfr;
-+    dhcpv6relay_route_func func;
- 
-     switch (pkttype) {
-     case DHCPv6_MSGTYPE_RELAY_FORW:
-@@ -419,7 +420,6 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
- 	break;
-     case DHCPv6_MSGTYPE_REPLY:
-     case DHCPv6_MSGTYPE_RELEASE:
--	dhcpv6relay_route_func func;
- 	if (pkttype == DHCPv6_MSGTYPE_RELEASE)
- 	    func = dhcpv6relay_release_route;
- 	else
-@@ -447,6 +447,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
- 		dhcpv6relay_process_ia_na(bfr, optlen, func);
- 		break;
- 	    default:
-+		break;
- 	    }
- 	    bfr += optlen;
- 
-@@ -460,7 +461,7 @@ void dhcpv6relay_process_packet_for_routes(const unsigned char *bfr, uint16_t le
- }
- 
- static
--void dhcpv6relay_server_event(int fd, void*)
-+void dhcpv6relay_server_event(int fd, __attribute__((unused)) void* unused)
- {
-     unsigned char buffer[1024];
-     unsigned char *options = buffer + 34; /* skip fixed header */
-@@ -558,6 +559,7 @@ void dhcpv6relay_server_event(int fd, void*)
- 	default:
- 	    /* notice("DHCPv6 relay: Skipping processing of option %u of length %u.",
- 		    type, len); */
-+	    break;
- 	}
- 	options += len;
- 	r -= len;
-@@ -616,7 +618,7 @@ int dhcpv6relay_init_upstream()
- }
- 
- static
--void dhcpv6relay_client_event(int fd, void*)
-+void dhcpv6relay_client_event(int fd, __attribute__((unused)) void* unused)
- {
-     unsigned char buffer[1024];
-     unsigned char fwd_head[256];
-@@ -792,14 +794,14 @@ void dhcpv6relay_send_router_advertisement(const struct sockaddr* da)
- }
- 
- static
--void dhcpv6relay_send_router_advertisement_timed(void*)
-+void dhcpv6relay_send_router_advertisement_timed(__attribute__((unused)) void* unused)
- {
-     dhcpv6relay_send_router_advertisement(NULL);
-     ppp_timeout(dhcpv6relay_send_router_advertisement_timed, NULL, dhcpv6relay_ra_interval, 0);
- }
- 
- static
--void dhcpv6relay_router_solicitation(int fd, void*)
-+void dhcpv6relay_router_solicitation(int fd, __attribute__((unused)) void* unused)
- {
-     unsigned char bfr[1]; /* kernel will truncate packets in case of overflow,
- 			     and we don't care about the content.  Will
-@@ -852,7 +854,7 @@ int dhcpv6relay_populate_ll(struct sockaddr_in6* res)
- }
- 
- static
--void dhcpv6relay_up(void*, int)
-+void dhcpv6relay_up(__attribute__((unused)) void* unused, __attribute__((unused)) int unusedint)
- {
-     struct sockaddr_in6 sa;
-     struct ipv6_mreq mreq;
--- 
-2.47.3
-
diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index a79f73fe93..7ec081fe20 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c5509158e99e148f572d4f  ppp-2.5.3.tar.gz
+sha256  0ebbcfef906d16cfbb9cbdd19c0d92aa3df2fd8fdd29731f614c58d16a279aa5  ppp-2.5.5.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index f8b68f39b7..d854f6a036 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPPD_VERSION = 2.5.3
+PPPD_VERSION = 2.5.5
 PPPD_SITE = https://download.samba.org/pub/ppp
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
@@ -25,9 +25,13 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PPPD_CONF_OPTS += \
 	--enable-eaptls \
-	--enable-openssl-engine \
 	--enable-peap \
 	--with-openssl=$(STAGING_DIR)/usr
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+PPPD_CONF_OPTS += --enable-openssl-engine
+else
+PPPD_CONF_OPTS += --disable-openssl-engine
+endif
 PPPD_DEPENDENCIES += openssl
 else
 PPPD_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
