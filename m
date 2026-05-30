Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D240CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BF44290C;
	Sat, 30 May 2026 09:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsVuBYtipsmF; Sat, 30 May 2026 09:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1733C42DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131876;
	bh=84js+iqEUxdNQNq4nDBA2deE5zgn8D4u2jGootRx0Tk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jvtNtKPpYPoqIjmEWyNvGM6/AUOUnIYQIpPN7BM1rngZHH/urJ0Nly1daCXXK6l5F
	 JiGa8oIRIEyOh9xH9FFRu1WPNPSA9Us3w3atwsNkxZyw14H5bgUOyxXHQw9h0e2x3p
	 Aln48TkWTKBG6wTNBY0VTX8lHoXLgFcBqhP6wTD6wdDUG9OO073V+Kcg8iCKJa1b4t
	 VZA5MZy0xpoL8N2upxo5nJ24Xu2+OzHjhGizOuf8kYRtUdKLNzx6Icmjv3f+m8ySOo
	 Ay5w4AaIxNk2cfwk7kybaaVVA/39zWQe7y5ph3jdkHvnJWzh/1C8xN9Z4EOFGzoHjl
	 yFfN6iSBO9iUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1733C42DE8;
	Sat, 30 May 2026 09:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C2DD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFEFB80F4C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROmZqCA_jUXQ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198C980F3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198C980F3E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:04:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AE1E86C70; Sat, 30 May 2026 09:04:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:57:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a27004cffb6bb034ff80cfac42a87bbd208755d
X-Git-Newrev: 3dad008858f656c30d7b7040aaed46786f370493
X-Patchwork-Hint: ignore
Message-Id: <20260530090421.1AE1E86C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jq: add CPE vendor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3dad008858f656c30d7b7040aaed46786f370493
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE "cpe:2.3:a:jqlang:jq:*:*:*:*:*:*:*:*" is valid for this package.

See the GHSA [1] and the associated CVE [2].

[1] https://github.com/jqlang/jq/security/advisories/GHSA-rmpv-jgvr-wpr9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-44777

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index b0776021fc..19a130b694 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -9,7 +9,7 @@ JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation), \
 	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
-JQ_CPE_ID_VALID = YES
+JQ_CPE_ID_VENDOR = jqlang
 JQ_INSTALL_STAGING = YES
 
 # uses c99 specific features
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
