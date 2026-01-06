Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA891D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1554152C;
	Wed,  7 Jan 2026 18:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sq_E5CRjcyzE; Wed,  7 Jan 2026 18:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E53414F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808970;
	bh=0KfFP0Mkp5h+cEjsUZsKwKFm3yH8LHkWk+Cs7t9QYsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ba0geLw/6V1lBjAWyGt6UFotXqJplapTD6H5e83+4qKMJaYA7J+RunuHtStw+kWYf
	 Zqtrr0huiHfGCJXJv4X+Km1tYnTjEwJj/k/C2ERvthtUV9qSoOmEsYxfOFZ+tTlNtq
	 nyyQG9iSKTBeGDtMEDBNsesAJLSoH4jWMtwkvZlHH1/uT/hRocoTeNs47pA1R8fVuD
	 nDE0Q3khn/Kltfkh9BYpTVZj4Zq4vVLhg7ChvNC1HMeYeFlHK6XlSO0DjrdoeKGyTP
	 ugVWkbwq5DVrupCbySks7oaBPZnKZNkfK6EKKjVS9oUJOkHW2KRa0YhLGPVVFZbXLX
	 OY0f/uwvdopfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E53414F1;
	Wed,  7 Jan 2026 18:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A2EA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC87681270
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0K2ZHcrLDFrW for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0126F80E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0126F80E98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F378A81340; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 99520a44856c50c18e6018446d8b9afa09dc12c6
X-Git-Newrev: 19f5ea0f924012b3608f3c11a8a1f83f30994ebd
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.F378A81340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/musl: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=19f5ea0f924012b3608f3c11a8a1f83f30994ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0921c6b38fd494de8b3490b965614d3f2089399)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
