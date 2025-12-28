Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD2EE92725
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2848149C;
	Sun, 28 Dec 2025 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSkC0ZBP5BKu; Sun, 28 Dec 2025 21:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD7E81453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955636;
	bh=4Lch0t4QBQQWUDmdCTsK6Zp6VJmIg/+y5h+qB7TvQYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TrpB9OW9L2QHFb3bbdT4t9PYj9HtztHixc0EwAclen7c50qyAIDbh6ekmgstzr7I/
	 Br/r5FJqVEwcfGmbbO8R3sq3kusj5/FLsI6rjofWJp4B/zc7ckxZXmnDIwx/xtbs9J
	 QOBl9cHRzNZvAXYIuue/KEdUWtmGjCCzn2+Tik5IoF5cvsUG/kZRs572oPwrkk6Tf5
	 X993/8bC2VbfY10KC4pWrKmKF+sZ7B6cOdhx9ZmKPvroYOMrzg8NZUVi89IpirnxBG
	 Z0qqFNu8Ss50h8WyX0CYFSUQKiK1Iegqaa/St4xf3gObNWpRazvUqK2gDEn9F0Mg7e
	 43P8OMwQBcZ7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD7E81453;
	Sun, 28 Dec 2025 21:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C71D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 878CF8144A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RytcRwiCj6Tr for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A608144D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A608144D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F54887971; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3efa0091a433ed88ebc9d25630fbf8291808f0c2
X-Git-Newrev: c0921c6b38fd494de8b3490b965614d3f2089399
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.8F54887971@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0921c6b38fd494de8b3490b965614d3f2089399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch | 1 +
 .../musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
index dbfd87db76..a0418e1df8 100644
--- a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
+++ b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
@@ -17,6 +17,7 @@ buffer.
 bug report was submitted in private by Nick Wellnhofer on account of
 potential security implications.
 
+CVE: CVE-2025-26519
 Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
diff --git a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
index a14041364a..8250790d4f 100644
--- a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
+++ b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
@@ -14,6 +14,7 @@ output byte count overflow, moving the output position backwards,
 potentially past the beginning of the buffer, without storing any
 bytes.
 
+CVE: CVE-2025-26519
 Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
