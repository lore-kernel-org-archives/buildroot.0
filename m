Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AAACD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF26E820DC;
	Fri,  5 Jun 2026 12:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fav7E2RO1EU; Fri,  5 Jun 2026 12:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280AF82015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663181;
	bh=kZ2rPy1p4lKnEebfYqRBoQvanyRKrPbbnUH4ChBHGcE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TIt/xudalZZVDdIw37mzjrLojEovNKkLf2Vkja7iWAncaTnToPr0hDVIYFTNYBVmt
	 DXl65OwTGySvCaZ9bDZPLq6nH7Thb+5NSqSxBf4iI0UmcK8UwcGdpVud+9B1MAhUvU
	 knmrQxziSDND4Ga95jsDV5LqQQ+dj9vt4O8zk69GsWDLu3DGDqNF4MtKaugGVXNIxD
	 WXyICUOnngamMbrnqtg2Q6E1sq4sp6LHauW81neuUuS2crAip6Whrp93lBT8xcw8Sb
	 SW4WSEGmRhqifDVSndd2N4dhHt59fITfV/5MxYgolYWtIgoSEj/hfdMenQK6vpP51o
	 tVMDfhcG3NPQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280AF82015;
	Fri,  5 Jun 2026 12:39:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 114383B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528CE81EBE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6zQ8pBW8rry for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 207FA81FE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 207FA81FE0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4939887B05; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:04:21 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8b76c781519b7692c85a9168a21e69ac3444c9e1
X-Git-Newrev: 6681de3d35c47ac2b32f37f285a657329c15401a
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.4939887B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/pkg-generic.mk:
 replicate IGNORE_CVES to host packages
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6681de3d35c47ac2b32f37f285a657329c15401a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 7a5817137bfc57317adfdbd11e540c3a0dcd1c98)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..e5e0d49a16 100644
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
