Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1CCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02AA42E32;
	Sat, 30 May 2026 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbFbTEp-WZfe; Sat, 30 May 2026 09:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B5B42E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131878;
	bh=Jz2EuvOmf/EumhJYTCGjPOXoeYfxZv4MQ2whcd9z7nQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q1yQ6c3kcwsrT6EzDHe1j0YArDnY0Cq1BUHhaGoqHIyTJzcLP5AMWGu9i+e5dzf7+
	 T1LNPRP40gNad0IOtBJIwmOEeh7pWDMSrgQhnmncWK1h7ZymDntHdaLbe8ap1c9Nkq
	 wpIEDUADzXNd6R6RIDVSwiJyA97uj6m0NQ2PcJQK00gdsmwS8iHT5iN0QBO3b98rgp
	 lwHNCHv+oawqW5g4ph7ChaJAdsYTw5q5DhQ2seKsfNcLQiGZ3dgvnhoDl/BtLeyEbn
	 0R0rUcZW+CjcfgClICjRSX0BT24EafPjr6z9ztLPTqG474Gid3cj4ySemHt6oOyH1S
	 YFOJu9r9X2boQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B5B42E35;
	Sat, 30 May 2026 09:04:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C83D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 140C9407EC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y2hrvHPrr3J for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC2740877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC2740877
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BF6B86A1A; Sat, 30 May 2026 09:04:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:57:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88b575a9206b009ddb584ae3ef65947dcaf86857
X-Git-Newrev: 25601df83be78a3d3539eb1cb6f23d818b656472
X-Patchwork-Hint: ignore
Message-Id: <20260530090421.5BF6B86A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: update CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25601df83be78a3d3539eb1cb6f23d818b656472
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:redis:redis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/redis/security/advisories/GHSA-c8h9-259x-jff4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 6ce9933029..9db7226675 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -10,7 +10,7 @@ REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
 	MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = LICENSE.txt
-REDIS_CPE_ID_VENDOR = redislabs
+REDIS_CPE_ID_VENDOR = redis
 REDIS_SELINUX_MODULES = redis
 
 define REDIS_USERS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
