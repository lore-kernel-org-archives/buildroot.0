Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA10DC4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFD481F8C;
	Wed,  7 Dec 2022 15:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EFD481F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E69jlfWF9TT9; Wed,  7 Dec 2022 15:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8646D81358;
	Wed,  7 Dec 2022 15:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8646D81358
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A40D31BF40E
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC9681F83
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC9681F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXrq94mzwuxT for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1CF381358
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CF381358
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C250085E06; Wed,  7 Dec 2022 15:08:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 16:02:35 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f5a13c2ce9a631b2f3b26bca89afeb94bd55ec19
X-Git-Newrev: 595749c38517a00fe99d68795d592e3340330cb2
X-Patchwork-Hint: ignore
Message-Id: <20221207150805.C250085E06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exim: mark
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=595749c38517a00fe99d68795d592e3340330cb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 43d5ff7ee4c5f012d79ba69ae6c736e3a88d20c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
