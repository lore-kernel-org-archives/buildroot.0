Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCE4C021A0
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 16:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548CC803EF;
	Wed, 12 Feb 2025 16:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_O2_PwaR3nk; Wed, 12 Feb 2025 16:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6287A847F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6287A847F0;
	Wed, 12 Feb 2025 16:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 049FCC2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 16:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD040847F9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 16:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgHzkp_nUkfZ for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 16:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D32E822EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D32E822EA
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 16:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 068388758F; Wed, 12 Feb 2025 16:39:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 17:38:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03b0379426518d50650bbcfaeaff6836ec8e3d8d
X-Git-Newrev: a7a18c2ef8d654a34d31eb5cc146acdcc4b2029f
X-Patchwork-Hint: ignore
Message-Id: <20250212163936.068388758F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: security update to 1.26.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7a18c2ef8d654a34d31eb5cc146acdcc4b2029f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changelog:
http://nginx.org/en/CHANGES-1.26

Fixes the following security issue:

CVE-2025-23419: Security: insufficient check in virtual servers handling
with TLSv1.3 SNI allowed to reuse SSL sessions in a different virtual
server, to bypass client SSL certificates verification

https://www.cve.org/CVERecord?id=CVE-2025-23419

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
