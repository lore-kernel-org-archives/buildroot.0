Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F162ACD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C820160AE8;
	Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tTDWXqAoYWq; Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049B760AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663090;
	bh=7+LFYSkXu3VAoSreDXRffJHAAYcmCCsEqPvVpAlmajM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hdw2W/8z+Ln+/TSnxR3RKS70HQA1AjTOYReZhUxvDA5uFzmMdkbK4ZmEf+gnfWdYk
	 CRIb8r8H75+wh9ZnVaLzkJ6aCaH0yOWY7rpXHL6WXJIZKQFGJeo+mSAjOHn6I7Wnwf
	 DxdUFANdTT1f5VTKae+b0qky716IvHyIpskDq7W0IezLuSZBfgB/Z2LC9YhV64PJ50
	 vejXa+AgVjLn3g95Nt4O9t/Lj+vW+1antJFzbznDGVKf2CSfZ4xqB96nS3JEDC+ZPN
	 U1SVJEujbojyUwZph3JwFA3aX+nAs2+z+d41BzkfGbwJIC2g8xpTJBr1e6AnXBfj67
	 p8Aqi6BSvl4tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 049B760AFB;
	Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B610F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3E981E6A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO1uE661hp8z for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3755681E73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3755681E73
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61D0587B04; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:52:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 60a1e76b4ba98a68332b135b2ffdcfc542e42f62
X-Git-Newrev: c2d6ed0c937456d6702a656effe156ad02bf3b46
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.61D0587B04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hiredis: add CPE
 vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2d6ed0c937456d6702a656effe156ad02bf3b46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE "cpe:2.3:a:redis:hiredis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/hiredis/security/advisories/GHSA-hfm9-39pp-55p2
[2] https://nvd.nist.gov/vuln/detail/CVE-2021-32765

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 88b575a9206b009ddb584ae3ef65947dcaf86857)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f7acb2f131..33a87e7780 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -9,7 +9,7 @@ HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
-HIREDIS_CPE_ID_VENDOR = redislabs
+HIREDIS_CPE_ID_VENDOR = redis
 HIREDIS_INSTALL_STAGING = YES
 
 # The package is a dependency to ccache so ccache cannot be a dependency
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
