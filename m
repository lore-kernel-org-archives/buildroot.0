Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61480D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359EC408DA;
	Wed,  7 Jan 2026 17:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPnQqVtCLRuZ; Wed,  7 Jan 2026 17:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC0040A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808055;
	bh=20uEmBIknNUfXRLGifHHi9swyO7iFnv41+KPN/G2ffA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SYjnRUofHm77ZbyaoP+dRcEwlrurCj3KOumH0s23T0ichAWTaBLwWC1DAwcmcu5lj
	 SBfZro2T0Uhnt/N6sVGR0iBLHMhRXTiOUVVs5AC1vSYPpO2rI9kufrpGgoeHygzLIa
	 90Mfl+LZTAyarANgnvUfJ3L0AeUvLFkMu7+Zsx/tvH9SzvJDeUG1/8/1wXkX16ioOf
	 +zIBsJJc9enccBcYi4xObhraLO0+P8/ZAc/C3l6jUiL8N9Ma+pdzzauC9W91KJwa2f
	 NqdPhYpoPzeLeSw236PSVJpo6y+FrcSiUw5l0hdoq204BCEeaT0YrsoxKw7tOEd2aX
	 eGjli8OTZR/Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC0040A9A;
	Wed,  7 Jan 2026 17:47:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AF0AEB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BEF80BAA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFqyL6q7clgZ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F3B80A6C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F3B80A6C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A395487D42; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: de761fa21cc737292655f7c57f1cca382367e2b4
X-Git-Newrev: 1c0863d6ed1e232eb573095946c9a68aac7d2f48
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.A395487D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linenoise: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c0863d6ed1e232eb573095946c9a68aac7d2f48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
