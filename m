Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3BACAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB2E561005;
	Tue, 23 Sep 2025 16:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1NoFvZVqWdZ; Tue, 23 Sep 2025 16:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B9B60FDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B9B60FDC;
	Tue, 23 Sep 2025 16:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3173004
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8028240D5F
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVcMXUoE-dYn for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C2A40D65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C2A40D65
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:33:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 524A68625F; Tue, 23 Sep 2025 16:33:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 18:29:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36f8a0eba7bdd464add43b8dc706c3739db00997
X-Git-Newrev: f0b011e0aa497217385d9dc5af887757667281fe
X-Patchwork-Hint: ignore
Message-Id: <20250923163318.524A68625F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: security bump to version
 1.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0b011e0aa497217385d9dc5af887757667281fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes the security fixes for CVE-2025-32366 and
CVE-2025-32743.

Release notes:
- Fix issue with setting MFP optional for PSK.
- Fix issue with comparison in timezone checking.
- Fix issue with dnsproxy and empty lookup.

See also:
https://git.kernel.org/pub/scm/network/connman/connman.git/tree/ChangeLog?h=1.45
https://git.kernel.org/pub/scm/network/connman/connman.git/log/?h=1.45

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32366
https://www.cve.org/CVERecord?id=CVE-2025-32743

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add links to change logs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-NULL-empty-lookup-causing-potential-cra.patch | 46 ----------------------
 ...roxy-Address-CVE-2025-32366-vulnerability.patch | 41 -------------------
 package/connman/connman.hash                       |  2 +-
 package/connman/connman.mk                         |  8 +---
 4 files changed, 2 insertions(+), 95 deletions(-)

diff --git a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
deleted file mode 100644
index 9c1274e43c..0000000000
--- a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
-From: Praveen Kumar <praveen.kumar@windriver.com>
-Date: Thu, 24 Apr 2025 11:39:29 +0000
-Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
-
-In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
-can be NULL or an empty string when the TC (Truncated) bit is set in
-a DNS response. This allows attackers to cause a denial of service
-(application crash) or possibly execute arbitrary code, because those
-lookup values lead to incorrect length calculations and incorrect
-memcpy operations.
-
-This patch includes a check to make sure loookup value is valid before
-using it. This helps avoid unexpected value when the input is empty or
-incorrect.
-
-Fixes: CVE-2025-32743
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f
----
- src/dnsproxy.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index f28a5d7551a4..7ee26d9ff886 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
- 				gpointer request, gpointer name)
- {
- 	int sk = -1;
-+	int err;
- 	const char *lookup = (const char *)name;
--	int err = ns_try_resolv_from_cache(req, request, lookup);
-+
-+	if (!lookup || strlen(lookup) == 0)
-+		return -EINVAL;
-+
-+	err = ns_try_resolv_from_cache(req, request, lookup);
- 
- 	if (err > 0)
- 		/* cache hit */
--- 
-2.43.0
-
diff --git a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
deleted file mode 100644
index 9651b2dfe4..0000000000
--- a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=EC=8B=A0=EC=9C=A4=EC=A0=9C=28=ED=95=99=EB=B6=80=EC=83=9D-?=
- =?UTF-8?q?=EC=86=8C=ED=94=84=ED=8A=B8=EC=9B=A8=EC=96=B4=EC=A0=84=EA=B3=B5?=
- =?UTF-8?q?=29?= <ioerts@kookmin.ac.kr>
-Date: Mon, 12 May 2025 10:48:18 +0200
-Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
-
-In Connman parse_rr in dnsproxy.c has a memcpy length
-that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
-and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
-than the amount of remaining packet data in the current state of
-parsing. As a result, values of stack memory locations may be sent
-over the network in a response.
-
-This patch adds a check to ensure that (*end + *rdlen) does not exceed
-the valid range. If the condition is violated, the function returns
--EINVAL.
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4
----
- src/dnsproxy.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index 7ee26d9ff886..1dd2f7f5d47e 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
- 	if ((offset + *rdlen) > *response_size)
- 		return -ENOBUFS;
- 
-+	if ((*end + *rdlen) > max)
-+		return -EINVAL;
-+
- 	memcpy(response + offset, *end, *rdlen);
- 
- 	*end += *rdlen;
--- 
-2.43.0
-
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 38af1847ae..807f7144b1 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff  connman-1.44.tar.xz
+sha256  77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913  connman-1.45.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index c9637eadf5..695a81f1e5 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.44
+CONNMAN_VERSION = 1.45
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
@@ -13,12 +13,6 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CPE_ID_VENDOR = intel
 
-# 0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
-CONNMAN_IGNORE_CVES += CVE-2025-32743
-
-# 0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
-CONNMAN_IGNORE_CVES += CVE-2025-32366
-
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
