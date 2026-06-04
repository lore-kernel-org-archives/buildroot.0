Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCEDCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA6281F37;
	Fri,  5 Jun 2026 12:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6e2l3qEU2t1; Fri,  5 Jun 2026 12:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F333081ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663091;
	bh=zQ1e/1c/IWrFS78ixzmSF9Zm+pm4hkIMKYeEuTd/N6o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dydfzQ17mLtKrFbpCwfCtAZLfL6e3cCbzOc+FEN0LzcNgnQzacL0NYei+STbpKTmI
	 JtelyUnjW0GrgkfHag60lna5Puj2j6CvKaaazGS/Ox80Se0miMuvlsYZ5d6+BakCnd
	 uQY5RUalF6y9MiYGzlU7ZH7qZlGCCwQVo2DMzE56khrZ9sBZ0iy7cGFzNjEsrpROvk
	 NfuZBKzPoVG+qxDqWPVH2cNkABjND/LDqKN+cGV/o05IPWRKfXq/cgKtv1UoYXyWPE
	 ItjxgpDIjOA1X+kgNkNVsqPipz/S08EI4Hs9fVBCPkxl3Ncr6EahBF83y/cm8lOXdb
	 ltZk+4sRg05gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F333081ED1;
	Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1157C388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70DC781E73
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rp48Udi2hip for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A39181E87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A39181E87
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7424F87B3F; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:53:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2d6ed0c937456d6702a656effe156ad02bf3b46
X-Git-Newrev: 5afc9ee27b6e0e2fe79d89121940eeba30adfe0c
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.7424F87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/redis: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5afc9ee27b6e0e2fe79d89121940eeba30adfe0c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE "cpe:2.3:a:redis:redis:*:*:*:*:*:*:*:*" is valid for this
package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/redis/redis/security/advisories/GHSA-c8h9-259x-jff4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25243

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25601df83be78a3d3539eb1cb6f23d818b656472)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ce39305176..b9702eb6e0 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -8,7 +8,7 @@ REDIS_VERSION = 7.2.13
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-REDIS_CPE_ID_VENDOR = redislabs
+REDIS_CPE_ID_VENDOR = redis
 REDIS_SELINUX_MODULES = redis
 
 define REDIS_USERS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
