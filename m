Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7D6CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379CD8469B;
	Fri, 15 May 2026 17:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWQSHFFp3ELS; Fri, 15 May 2026 17:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45ED98470A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867234;
	bh=MWQClSA2URW+6Zx+egPQ4XaGEm5qlkc9rI6Kmac35Vs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UnsJ6KtlMvPEE24B2GqdvpQd3aMQplyI22vLn0jnaW1tNmF00HbCmedT/S6TqKw1q
	 X87Qjzy/mg59NSzpSxRxcyrmw3PpVxOcBNtCdpwohXw5v/RMKkg2ynoaJCy51DZvEO
	 ihw0JCUA4IU5i/M1RlL8pyZbxb5xUXEd11qJKmNXYRjVX4ZpVVPb8Sl/zvKU7ktsi1
	 7ImD9qrTIj5lUE/yp9rgYoRl2/7Q4AFhXNiKqoRaZoZPllXgfBi+DX/x8SIRdPgxDu
	 fLtpbRzzmGhtgLJVQ6s2uYNVDpP7OH1oI0fkkIkbvQVtj2yaj/TdGJ2tdxayYuffQs
	 lEQK6jI0V2hAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45ED98470A;
	Fri, 15 May 2026 17:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF2D45B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9CD641D9E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmN_aM5rW0Us for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F136441DA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F136441DA0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B1C5863DA; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:22:33 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 071ba58f000d528b3d8b02dae808a5ada45452a5
X-Git-Newrev: cb4e02c6ac0eddf9b7aecdf2871076d5b32ef0d1
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.3B1C5863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/pkg-stats: run main function only if called as script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb4e02c6ac0eddf9b7aecdf2871076d5b32ef0d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The __name__ == '__main__' guard allows importing pkg-stats as a
module using importlib, circumventing the normal module filename
requirements. This in turn makes it possible to test/debug individual
functions.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 8cde69e1011e82e44447803d6dbbaac96375d0a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5dcc812e2b..2b2194b9a5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
     )
 
 
-def __main__():
+def main():
     global cvecheck
 
     args = parse_args()
@@ -1403,4 +1403,5 @@ def __main__():
         dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
-__main__()
+if __name__ == '__main__':
+    main()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
