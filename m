Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE10AC021A0
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 15:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52D0880BCE;
	Wed, 12 Feb 2025 15:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKkU3oXR90VT; Wed, 12 Feb 2025 15:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60EE5813A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EE5813A2;
	Wed, 12 Feb 2025 15:49:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2389A1C9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13451813A2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mI-r7E3Z3MpS for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 15:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45C6A80CC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C6A80CC9
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45C6A80CC9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 15:48:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 377CA3530F2B; Wed, 12 Feb 2025 16:48:53 +0100 (CET)
Date: Wed, 12 Feb 2025 16:48:53 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z6zC5QX0zHRKsMvM@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739375333; bh=esi71vkTcQKdHiiOpuZs1YTB8k1ueQ9UF2vVHWSTwd4=;
 h=Date:From:To:Subject:From;
 b=H8hLV2hxdpizBhdl9n1lcVP4EY/TVGup9jD+XeUXgfwd49fgiLjENdD51COsUuQNV
 LEpgchlWhmRlECYfvBwFblGhQUXD/xsZAqwmPvRJJmIswc+Mo9g/pRZs6r9B72hH2w
 bATSSnFqJs5jLgy8kYOhtcfyHrKSFdr4fuewTNAy3AbrxS13HRP2c4j2/Dq9+HkcPN
 VuGbgjHC/nkX7YbNgNY6axN1VT6fETbudOm1bTQ7fEFepGZ5bOSuqAqYYBA/2EOOmW
 1wysD3rJScuWtkwyGUbGRfV9pD2hIoxJSevzU/A+miNOMbHDUGm63T5VfeoyyCvSS4
 A4sYD6dfauDDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=H8hLV2hx
Subject: [Buildroot] [PATCH] package/nginx: security update to 1.26.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a changelog:
http://nginx.org/en/CHANGES-1.26

Fixes the following security issue:
CVE-2025-23419:
Security: insufficient check in virtual servers handling with TLSv1.3
SNI allowed to reuse SSL sessions in a different virtual server,
to bypass client SSL certificates verification

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 4cf859dadc..77220665f3 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  627fe086209bba80a2853a0add9d958d7ebbdffa1a8467a5784c9a6b4f03d738  nginx-1.26.2.tar.gz
+sha256  69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa  nginx-1.26.3.tar.gz
 # License files, locally calculated
 sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 7a5455def7..6ca1ac2075 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.26.2
+NGINX_VERSION = 1.26.3
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
