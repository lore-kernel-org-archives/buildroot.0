Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE0EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA4541E9A;
	Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAg2YAvgQFN1; Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26CDD41E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011388;
	bh=GDwL/BI4iJilQwLce2omt2USENYKW8/njRx4/y5bMGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=im6TXZM4umX/rK1JcjO6rJrm6UFCOxYGX91BAFJP2iMQbgzxVFvbK91UOGYO0fYuo
	 MoMP/1nqX2AqFfWRNhcaP9MhmojRgqe/TzD9vhG2VpQiMFUjo+8tETe1fHo6YmV1NN
	 3QgbvPcIg1zgpnhUoL8GPROgffUAJANEFjllEaL1uOPaKOMfhQXz/B3Hdy+8buSfwO
	 MoxTMuXeErVvOTMq+x+5XC1duKK6pWrytpn9xG6e6qjnwTEZQuvULUn7L21y2+KFZZ
	 pV2GiUQi45tmncUPw6NJvOhHXTPOxmM2/EZiNyFeZX2n/h1lzLGjNZ2DAUxgPrVvLJ
	 TUOk/Z6Ynu/2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26CDD41E45;
	Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02581EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A16DE41E57
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0R1aF88soct for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCED341E43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCED341E43
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D254283A88; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:15:20 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 102262dbf9cf1fd8ba12133170863af411d4fb87
X-Git-Newrev: 96fdae1fbf18abc2f2de0a26da2f0503ab8f26e2
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.D254283A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: add
 CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 to _IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96fdae1fbf18abc2f2de0a26da2f0503ab8f26e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] bumped glibc from 2.42-3-gbc13db739 to 2.42-51-gcbf39c26b
to fix some CVEs, but forgot to add those CVEs to GLIBC_IGNORE_CVES.
This was needed because the GLIBC_CPE_ID_VERSION used for CVE checks
remains to the same value "2.42" which is marked as vulnerable to
those CVEs.

This commit adds those _IGNORE_CVES with the corresponding upstream
commit references, to make sure they will not be reported by the
"make pkg-stats" command.

Fixes:
- [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/18de297a5ad3d1fc1b44f54ae69289ca10200ad5

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 574aa2cfee19c7dfe505a303dd45b17a966bbdaa)
[thomas: match to 2.41 branch]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3f519bfdca..d8e178edad 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -34,6 +34,15 @@ GLIBC_IGNORE_CVES += CVE-2025-5702
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
+# Fixed by glibc-2.41-121-g1e2c1ea4307197ccece0cda574bcfebf9080894c
+GLIBC_IGNORE_CVES += CVE-2026-0861
+
+# Fixed by glibc-2.41-122-g15c9839a0b853f552b4ed9047841b6223f3c104d
+GLIBC_IGNORE_CVES += CVE-2026-0915
+
+# Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+GLIBC_IGNORE_CVES += CVE-2025-15281
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
