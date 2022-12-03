Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01934C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8435842A73;
	Mon, 20 Feb 2023 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8435842A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNKnUufZUz71; Mon, 20 Feb 2023 21:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D0E42CE0;
	Mon, 20 Feb 2023 21:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D0E42CE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 148FC1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 719664156D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 719664156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzJFCVFy4x-E for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A01BC4158F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01BC4158F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B7DF86496; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Dec 2022 15:31:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4bccc70e07a2a8c093249d6701161791e7ab7b58
X-Git-Newrev: 43d5ff7ee4c5f012d79ba69ae6c736e3a88d20c7
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.9B7DF86496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/exim: mark
 CVE-2022-3620 as ignored
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=43d5ff7ee4c5f012d79ba69ae6c736e3a88d20c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2022-3620: A vulnerability was found in Exim and classified as
problematic.  This issue affects the function dmarc_dns_lookup of the file
dmarc.c of the component DMARC Handler.  The manipulation leads to use after
free.  The attack may be initiated remotely.  The name of the patch is
12fb3842f81bcbd4a4519d5728f2d7e0e3ca1445.  It is recommended to apply a
patch to fix this issue.  The associated identifier of this vulnerability is
VDB-211919.

This vulnerability is in the DMARC handling, which is only used if
libopendmarc is available AND SUPPORT_DMARC is set to yes, neither of which
is true for Buildroot, so ignore the CVE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index cd2fabeab1..b84a51d6de 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -16,6 +16,9 @@ EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 # 0006-Fix-regex-n-use-after-free.-Bug-2915.patch
 EXIM_IGNORE_CVES += CVE-2022-3559
 
+# built without dmarc support
+EXIM_IGNORE_CVES += CVE-2022-3620
+
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
