Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90924ECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACE440DA2;
	Thu,  5 Feb 2026 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4YnDMm8O4lT; Thu,  5 Feb 2026 21:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422E640B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325370;
	bh=styX0kScNw2iSDMAySllnsAFU+TMcLZn8CSYJZUPZGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C03JAEXJ18SHErkKJf/Pans5x0LUDWbxos8DUpraiGRubIB8rIqT/rQTwCo2iX/rt
	 xur00UH4dt2L12jv1KJpwcNBUL/+aQoj79oO0vLsjCjWDlvqbYJefns7UABVnpN+a7
	 Fj+3gK3MKK+19WIML/xQMDSg+Qt5BpRMCuUjgvRlksf3169synTLgPBqGlc8PeebYV
	 faWSgDQWwbEHVZwNFEqm1+01FbbMJEjM8duxIJZiBXc1haTsmObue3locG9DqnDIrX
	 nI7THdsFY0ykRDsDtlc4HC1Vo6YZWMDLo9y8OPTIf3c87vuWR+WvoFoJlOWdjCt9VP
	 mJb3VAe5VDnKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422E640B6A;
	Thu,  5 Feb 2026 21:02:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12695470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E736260B4F
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89IfZw_s4v7Y for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C92BB60B22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C92BB60B22
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8D0F86A3C; Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 22:01:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8090d0eb9e252eb6a589d2b4fddee8b6ec83764d
X-Git-Newrev: d6ce4e260263ef293b7a5dc7052ec56615ffd9eb
X-Patchwork-Hint: ignore
Message-Id: <20260205210245.B8D0F86A3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: update to 6.0.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6ce4e260263ef293b7a5dc7052ec56615ffd9eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for Changes:
https://github.com/strongswan/strongswan/releases/tag/6.0.4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Marcus: remove patch and CVE_IGNORE]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../0001-eap_mschapv2_failure_request_len.patch    | 46 ----------------------
 package/strongswan/strongswan.hash                 |  6 +--
 package/strongswan/strongswan.mk                   |  4 +-
 3 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
deleted file mode 100644
index 7442c123c4..0000000000
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Thu, 9 Oct 2025 11:33:45 +0200
-Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
- the client
-
-For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
-`message_len` to become negative, which is then used in calls to malloc()
-and memcpy() that both take size_t arguments, causing an integer
-underflow.
-
-For 6 and 7, the huge size requested from malloc() will fail (it exceeds
-PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
-fault in memcpy().
-
-However, for 8, the allocation is 0, which succeeds.  But then the -1
-passed to memcpy() causes a heap-based buffer overflow (and possibly a
-segmentation fault when attempting to read/write that much data).
-Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
-Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
-overflow and causes the daemon to get aborted immediately instead.
-
-Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-CVE: CVE-2025-62291
-Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-index 21cc95a6a360..35faad2e0bb5 100644
---- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-+++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
- 	data = in->get_data(in);
- 	eap = (eap_mschapv2_header_t*)data.ptr;
- 
--	if (data.len < 3) /* we want at least an error code: E=e */
-+	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
- 	{
- 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
- 		return FAILED;
--- 
-2.43.0
-
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index f6b16fc8a2..7a6939b979 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
-md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
+# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
+md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
 # Calculated based on the hash above
-sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
+sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index d27341a860..fd46445df3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.14
+STRONGSWAN_VERSION = 6.0.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
@@ -12,8 +12,6 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
-# 0001-eap_mschapv2_failure_request_len.patch
-STRONGSWAN_IGNORE_CVES += CVE-2025-62291
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
