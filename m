Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F8CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA3C60ACB;
	Fri,  5 Jun 2026 12:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3tcCl4z7O6L; Fri,  5 Jun 2026 12:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E67E60AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663528;
	bh=HePU12rH7hQ7EGapCRLT5ZDKllIbcCP7TLO1apPK4Js=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T28W5Xn0Kv1xaiTJKg0swu1RmNHpw0uLqPE/Lcf890wuqwT9GM+QjpJIjbJqPISE6
	 NaxVqy7L5K97KYkvw/4da1OjInGkw/gWmy+6Sa9NEH+fNlkfLYuBQNLmSHZh2JMslx
	 AnZQxThz3CgcwK/NbVUVVVVy7fhFSyoNp/t3EV3yubxOYEpAxHYJSnsRa/KxbFtNus
	 bY1CMX20OhM3rdDu7nPHXui9jH52LKNZ8pN0H7hFVX9ztAuyh3x4iq/H/hhJ2aVmEE
	 /x8TiSOC8UkOHhm9gdGWLjQc9zAWB+p+JcWurzUuCgauQogqIy75vO1jmwjJMXmxmB
	 4ikLEnu5UISIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E67E60AB8;
	Fri,  5 Jun 2026 12:45:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 228F2F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F7C4037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFyt0VDHZaha for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68CA54037E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68CA54037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:45:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 914ED87B41; Fri,  5 Jun 2026 12:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:41:59 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 40a3986edb9f40cece98e12f26e07046e01c734f
X-Git-Newrev: 2121a13066e52597896711066b1cf587b4c799b5
X-Patchwork-Hint: ignore
Message-Id: <20260605124510.914ED87B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/redis: update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2121a13066e52597896711066b1cf587b4c799b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index fb166b6f49..c1e87b0f23 100644
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
