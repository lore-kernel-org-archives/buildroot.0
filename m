Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A5CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB3B413E0;
	Mon, 17 Nov 2025 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6Fh9BHHzfwi; Mon, 17 Nov 2025 19:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C718E413DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C718E413DE;
	Mon, 17 Nov 2025 19:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3BB158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B93F4002C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXxexYQvLmGu for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4056A408B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4056A408B0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DEFF848E6; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:41:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 053c52a094f4bbc2eee5a569ebee7b5a40beb49b
X-Git-Newrev: e5d7805ea7b1952052e4bec3b47a13fb738110e6
X-Patchwork-Hint: ignore
Message-Id: <20251117195127.3DEFF848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tpm2-tss:
 security bump to v3.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5d7805ea7b1952052e4bec3b47a13fb738110e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For more information about the release, see:
 - https://github.com/tpm2-software/tpm2-tss/releases/tag/3.2.3

Fixes the following vulnerability:

- CVE-2024-29040

The JSON Quote Info returned by Fapi_Quote has to be deserialized by
Fapi_VerifyQuote to the TPM Structure `TPMS_ATTEST`. For the field
`TPM2_GENERATED magic` of this structure any number can be used in the
JSON structure. The verifier can receive a state which does not
represent the actual, possibly malicious state of the device under test.
The malicious device might get access to data it shouldn't, or can use
services it shouldn't be able to.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/cve-2024-29040
  - https://github.com/tpm2-software/tpm2-tss/security/advisories/GHSA-837m-jw3m-h9p6

(cherry picked from commit 04533b70e6dd908dcaaa275b47de55fed0b9908d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index c9fa4e6ae0..d8730ba0e1 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
+sha256  6279a9a1983ea6ffe41925067b7f0de3a6ed95020a30e7c97d80fa2754259534  tpm2-tss-3.2.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 81a1a0e59b..095b57baea 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.2
+TPM2_TSS_VERSION = 3.2.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
