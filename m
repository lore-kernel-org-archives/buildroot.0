Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9771CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E798961419;
	Fri, 29 May 2026 15:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJGx54o4v2sR; Fri, 29 May 2026 15:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8456142D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069115;
	bh=dB6UN0H++NEJLRopHcxAuajgleFxvT5ncPMyQDWnGPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hr1BK8x3HLBHswMmF5/uPNhRZtDJEM8lkLAQosJR1HqQasNCKLwyABlGX9RQ9/GDZ
	 tTuSk3Xua/YeCEX68282JHKcEPyktjqz+wAhaZaZfWKSVIFDBdJWkQklphhFtIDoc+
	 xaP6r5nX+fD43Gig6i4+egyriEhIgzY3g0PEUidPbnRbQpZAsG+1s2TRn9hGtqZmIS
	 V+Zdc4+38Vs/2xOBZ4+x//G4xRD03/H8Kwxlxy6wN5AB0YuoHaaY5tGDsaCpwSu2SJ
	 zAXVKbI3LaW9lcwvbV6wdn1fXlAGGF4BKngVaaab3t8Vk7Lpp5bNeDCiM3c3rk+Ved
	 kVWoDVzuXIX7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8456142D;
	Fri, 29 May 2026 15:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B5F288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05AA61340
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsCb4N25nIEk for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D7B46132B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D7B46132B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC7A1873EF; Fri, 29 May 2026 15:38:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4ff747a2bb72ce31f789584a91d9ea064e394c0
X-Git-Newrev: 7a5817137bfc57317adfdbd11e540c3a0dcd1c98
X-Patchwork-Hint: ignore
Message-Id: <20260529153817.AC7A1873EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: replicate
 IGNORE_CVES to host packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a5817137bfc57317adfdbd11e540c3a0dcd1c98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For host packages, this commit adds the same `ignore_cves` list as their
target counterpart and make it available from the `show-info` output.

When generating a CycloneDX SBOM with `make show-info-all |
utils/generate-cyclonedx` and running an analysis over it with
`support/script/cve-check`, multiple vulnerabilities
entries would be created with different analysis for packages that have
both a host and target variant that include IGNORE_CVES entries.

This is the case for the grub2 package that include ignored
vulnerabilities that patch both the target and host package but aren't
declared as ignored for the host package. This resulted in
vulnerabilities marked as 'exploitable' for the host variant while it
is patched.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 83f3506913..09d6e5b20b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -745,6 +745,13 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
+# replicate the target '_IGNORE_CVES' to the host variant
+ifndef $(2)_IGNORE_CVES
+ ifdef $(3)_IGNORE_CVES
+  $(2)_IGNORE_CVES = $$($(3)_IGNORE_CVES)
+ endif
+endif
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
