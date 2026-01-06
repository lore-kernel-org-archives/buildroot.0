Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD2D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F9734137F;
	Wed,  7 Jan 2026 18:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh3FjdwsT6Vp; Wed,  7 Jan 2026 18:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCD24137A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808928;
	bh=p72ZjZvkDliXt25FGmb1VodrEv1/DtdX9sPFadYiO5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VPGJWpIVGkKdL4mwFuUvyl63GJFMKjXVXrM6Ok4MkCl21KBq4p1v0EHIxr5G+lLUE
	 uwWcMYWNW+DyLdTAGfnhmtbOwu+SigHgLQl43sWZ250Tgs1OB7iQH/bi9uhodh0VMp
	 PoLnm6l7Viw7a8hpB++Vpzcm3CxU1MZQUgz96A7R0LkWfk6cWvmKlO6ZQ3iSGJCViv
	 u3C4vcQhC3SJXO+trgeZlBDsgUXmv3Ir3hXC4TN/e70J6/zjDCu7/Q7j8fqwShrMu4
	 nSfGe7Dci1Br1IIF7qR38oXkW7W8SbVeWH1ctQXWA7Pzxa5zdOJvbZOSHtsUIkGoKm
	 3uzXkkZb0FGzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCD24137A;
	Wed,  7 Jan 2026 18:02:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14353A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C40810B1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIMm2-59Zvqz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692F580E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 692F580E98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6856B83C98; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:50:58 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d943f82156e18837cfd10f9a37f811936676eea7
X-Git-Newrev: 79b670f497cf1fb6153554f73827a701ae3bc244
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.6856B83C98@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/linenoise: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=79b670f497cf1fb6153554f73827a701ae3bc244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The CPE 'cpe:2.3:a:antirez:linenoise:1.0:*:*:*:*:*:*:*' is valid for the
package linenoise [1].

Since the latest version is '1.0' since 2015 the CPE_ID_VERSION is set
to that version.

The CVE that applies on version 1.0 were checked with the 'cve-check'
script:

```
echo '{"components": [{"bom-ref": "linenoise", "name": "linenoise", "version": "1.0", "cpe": "cpe:2.3:a:antirez:linenoise:1.0:-:*:*:*:*:*:*"}]}' | support/scripts/cve-check | jq -r '.vulnerabilities[].id'
```

Only the CVE-2025-9810 exists and that was fixed in [2].

[1] https://nvd.nist.gov/products/cpe/detail/10423C23-6AAA-439E-B723-1FCDEB3A769F
[2] 3c7cbf97d7 package/linenoise: security bump to version e26268de5e

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2668d121e5add1f999206b5c43fa325587de81b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linenoise/linenoise.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 05f8aa4845..29bed3ce4f 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -8,10 +8,15 @@ LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
+LINENOISE_CPE_ID_VENDOR = antirez
+LINENOISE_CPE_ID_VERSION = 1.0
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
 
+# Fixed in https://github.com/antirez/linenoise/commit/880b94130ffa5f8236392392b447ff2234b11983
+LINENOISE_IGNORE_CVES += CVE-2025-9810
+
 define LINENOISE_BUILD_CMDS
 	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
 	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
