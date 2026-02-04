Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD1E83EF4
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 08:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE5040CB9;
	Wed,  4 Feb 2026 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yFhPTGFLQhn; Wed,  4 Feb 2026 08:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BF2B40CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770194738;
	bh=8IT6XR7qh317nIOIYFSlbf1nk/CdjZfqVcGga2ebMqg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=le7FgPlQkqsuMEvMpYr9o3hCIWvju+WrWR3WOIKrr802HtWnN/dAjxFlz7POTJqWS
	 xjpKUeXpYFJiwKL+kGU4QJvmWhENLl7hY8pf3yoqVgB5zojf+5v6XDSRNTRAu6FcK2
	 aauUGJ2Hx6Lpxy9lkqcxubIAlNvNJ9y6QLXgy6vqC48ukwwYkciS5G/V5SdYAbDqkg
	 zZrl55dZvTgYo0a8oLoWBBs9AQqVyYP6l1a73MXyQYQxH5C2pzVVDqQhge1ZSsQOjS
	 /e8lzPBY1Rt/WLRMvI9JH6poJDe2py73jcbVIFymKuj0QQisxIfPfT8C8kS9Hw/MKI
	 SayIJtoG6M3NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BF2B40CAA;
	Wed,  4 Feb 2026 08:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30C5AF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB88403ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-dpTd4U0wRs for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 08:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC24402EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC24402EA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 08:45:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30EE4867CC; Wed,  4 Feb 2026 08:45:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 09:26:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9f426aa527d279c078d234ffa3c4c8c052369ff
X-Git-Newrev: 574aa2cfee19c7dfe505a303dd45b17a966bbdaa
X-Patchwork-Hint: ignore
Message-Id: <20260204084536.30EE4867CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: add CVE-2025-15281
 CVE-2026-0861 CVE-2026-0915 to _IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/574aa2cfee19c7dfe505a303dd45b17a966bbdaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/glibc/glibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e3453b8cc2..44bf9c4b06 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,6 +28,15 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
+# Fixed by glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
+GLIBC_IGNORE_CVES += CVE-2026-0861
+
+# Fixed by glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
+GLIBC_IGNORE_CVES += CVE-2026-0915
+
+# Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_IGNORE_CVES += CVE-2025-15281
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
