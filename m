Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDCAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C48A610CE;
	Tue, 12 Apr 2022 19:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RU-kR_o6ii0w; Tue, 12 Apr 2022 19:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC7C610CC;
	Tue, 12 Apr 2022 19:58:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0909B1BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 068D840358
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1FqNRCSKKXv for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:58:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA0A540303
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:58:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EC58583B9F; Tue, 12 Apr 2022 19:48:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 21:55:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f239f506cdac9bbe7a1d3395b4dc7544b6cd4367
X-Git-Newrev: 9d2fc046ed078630b40350dd33e87b7594938534
X-Patchwork-Hint: ignore
Message-Id: <20220412194832.EC58583B9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: security bump to version
 4.4.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d2fc046ed078630b40350dd33e87b7594938534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Security vulnerabilies will be fixed by bumping internal bind from
  9.11.14 to 9.11.36
- Drop patch (already in version)
- This bump will also fix the following build failure on platforms
  without stdatomic lock free thanks to
  https://gitlab.isc.org/isc-projects/bind9/-/commit/261c84d91d1b4581df9f7f0ec031908299de7726

  stats.c: In function 'setcounter':
  stats.c:300:29: error: 'val' undeclared (first use in this function); did you mean 'value'?
    300 |  stats->counters[counter] = val;
        |                             ^~~
        |                             value
- Update hash of license file (ISC address updated and preamble removed:
  https://gitlab.isc.org/isc-projects/dhcp/-/commit/429a56d73c0f9f2edf400fd6313850a3ce4fd809
  https://gitlab.isc.org/isc-projects/dhcp/-/commit/ee868403d0df934442a438aa6b5832bacabb7b23)

https://gitlab.isc.org/isc-projects/dhcp/-/blob/v4_4_3/RELNOTES

Fixes:
 - http://autobuild.buildroot.org/results/e4d027b5bcda852d0b5a54035de5ed37499a4ef0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...esolve-ISC-DHCP-does-not-build-with-gcc10.patch | 121 ---------------------
 package/dhcp/dhcp.hash                             |   6 +-
 package/dhcp/dhcp.mk                               |   2 +-
 3 files changed, 4 insertions(+), 125 deletions(-)

diff --git a/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch b/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch
deleted file mode 100644
index ad244267fe..0000000000
--- a/package/dhcp/0001-WIP-Resolve-ISC-DHCP-does-not-build-with-gcc10.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 129b7e402bd6e7278854e5a8935fce460552b5f4 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Thu, 30 Jul 2020 10:01:36 -0400
-Subject: [PATCH] [#117] Fixed gcc 10 compilation issues
-
-client/dhclient.c
-relay/dhcrelay.c
-    extern'ed local_port,remote_port
-
-common/discover.c
-    init local_port,remote_port to 0
-
-server/mdb.c
-    extern'ed dhcp_type_host
-
-server/mdb6.c
-    create_prefix6() - eliminated memcpy string overflow error
-
-[Retrieved from:
-https://gitlab.isc.org/isc-projects/dhcp/-/merge_requests/60/diffs?commit_id=129b7e402bd6e7278854e5a8935fce460552b5f4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- RELNOTES          | 5 +++++
- client/dhclient.c | 5 +++--
- common/discover.c | 4 ++--
- relay/dhcrelay.c  | 4 ++--
- server/mdb.c      | 2 +-
- server/mdb6.c     | 2 +-
- 6 files changed, 14 insertions(+), 8 deletions(-)
-
-diff --git a/RELNOTES b/RELNOTES
-index 9d0a0414..6919dba7 100644
---- a/RELNOTES
-+++ b/RELNOTES
-@@ -103,6 +103,11 @@ ISC DHCP is open source software maintained by Internet Systems
- Consortium.  This product includes cryptographic software written
- by Eric Young (eay@cryptsoft.com).
- 
-+		Changes since 4.4.2 (Bug Fixes)
-+
-+- Minor corrections to allow compilation under gcc 10.
-+  [Gitlab #117]
-+
- 		Changes since 4.4.2b1 (Bug Fixes)
- 
- - Added a clarification on DHCPINFORMs and server authority to
-diff --git a/client/dhclient.c b/client/dhclient.c
-index 189e5270..7a7837cb 100644
---- a/client/dhclient.c
-+++ b/client/dhclient.c
-@@ -83,8 +83,9 @@ static const char message [] = "Internet Systems Consortium DHCP Client";
- static const char url [] = "For info, please visit https://www.isc.org/software/dhcp/";
- #endif /* UNIT_TEST */
- 
--u_int16_t local_port = 0;
--u_int16_t remote_port = 0;
-+extern u_int16_t local_port;
-+extern u_int16_t remote_port;
-+
- #if defined(DHCPv6) && defined(DHCP4o6)
- int dhcp4o6_state = -1; /* -1 = stopped, 0 = polling, 1 = started */
- #endif
-diff --git a/common/discover.c b/common/discover.c
-index ca4f4d55..22f09767 100644
---- a/common/discover.c
-+++ b/common/discover.c
-@@ -45,8 +45,8 @@ struct interface_info *fallback_interface = 0;
- 
- int interfaces_invalidated;
- int quiet_interface_discovery;
--u_int16_t local_port;
--u_int16_t remote_port;
-+u_int16_t local_port = 0;
-+u_int16_t remote_port = 0;
- u_int16_t relay_port = 0;
- int dhcpv4_over_dhcpv6 = 0;
- int (*dhcp_interface_setup_hook) (struct interface_info *, struct iaddr *);
-diff --git a/relay/dhcrelay.c b/relay/dhcrelay.c
-index 883d5058..7211e3bb 100644
---- a/relay/dhcrelay.c
-+++ b/relay/dhcrelay.c
-@@ -95,8 +95,8 @@ enum { forward_and_append,	/* Forward and append our own relay option. */
-        forward_untouched,	/* Forward without changes. */
-        discard } agent_relay_mode = forward_and_replace;
- 
--u_int16_t local_port;
--u_int16_t remote_port;
-+extern u_int16_t local_port;
-+extern u_int16_t remote_port;
- 
- /* Relay agent server list. */
- struct server_list {
-diff --git a/server/mdb.c b/server/mdb.c
-index ff8a707f..8266d764 100644
---- a/server/mdb.c
-+++ b/server/mdb.c
-@@ -67,7 +67,7 @@ static host_id_info_t *host_id_info = NULL;
- 
- int numclasseswritten;
- 
--omapi_object_type_t *dhcp_type_host;
-+extern omapi_object_type_t *dhcp_type_host;
- 
- isc_result_t enter_class(cd, dynamicp, commit)
- 	struct class *cd;
-diff --git a/server/mdb6.c b/server/mdb6.c
-index da7baf6e..ebe01e56 100644
---- a/server/mdb6.c
-+++ b/server/mdb6.c
-@@ -1945,7 +1945,7 @@ create_prefix6(struct ipv6_pool *pool, struct iasubopt **pref,
- 		}
- 		new_ds.data = new_ds.buffer->data;
- 		memcpy(new_ds.buffer->data, ds.data, ds.len);
--		memcpy(new_ds.buffer->data + ds.len, &tmp, sizeof(tmp));
-+		memcpy(&new_ds.buffer->data[0] + ds.len, &tmp, sizeof(tmp));
- 		data_string_forget(&ds, MDL);
- 		data_string_copy(&ds, &new_ds, MDL);
- 		data_string_forget(&new_ds, MDL);
--- 
-GitLab
-
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index ec7c4fe58d..be03423db8 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz.sha256.asc
-sha256  b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a  dhcp-4.4.2-P1.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz.sha256.asc
+sha256  0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818  dhcp-4.4.3.tar.gz
 # Locally calculated
-sha256  9961fce0d83a6229b9084cdadedfa723a53274c63af610c9adb61b607e0f5a76  LICENSE
+sha256  45a39c430be0920cb9570f34b32d2378fe6048c034f2f3265b9326d64ada73df  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b52bf3a579..c58592cc45 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.4.2-P1
+DHCP_VERSION = 4.4.3
 DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
