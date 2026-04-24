Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F42FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D8584DFF;
	Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWGjReLR5f6a; Fri, 24 Apr 2026 16:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3921884D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047968;
	bh=mPXql6zIisuN8zQTQavTKA7Tztdx0gzcO1pKtLXJZlw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jrYWY7yYmDWk85ZXZyISaJCTol+lcFAsU3//u+PkmsrH76r20v6ntBfcKY9hy0SGa
	 GsL+nmtVpj/i847HPCIh9BBOnaevKhjSsH1V++Mkt4es9d8lWg+zx/DK1Zcmhxv44x
	 ETPA0ugNH/6K5IT91LIrd0wEdyuk8LvIrAf1MBJZEW99i7j6rYT2MsqIZE1kCgIoYI
	 sWpy8eyL2R4D9MtHm+t56o5vCPQ+hbKRdylmJLQCy0K2z/LPDhLh6EpZ7xSHZvwQGx
	 D1M/LtNz8FZOlG+/AZk9QmFXUwKabo5QONJmSk7is2vamp1QKFE6/S6kyr3/mpnLi6
	 exFNsF9HtgA8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3921884D7A;
	Fri, 24 Apr 2026 16:26:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3BC206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB2A984D2F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YGRvMDcTAJy for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F5B84C49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F5B84C49
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 037FC82AFA; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 97203c48f9c36d87fe13fc0486d93718e4dcaa48
X-Git-Newrev: 136f41d0e908d2094fe7ad87fdf738a882e8b1a3
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.037FC82AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xz: add patch
 trailer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/136f41d0e908d2094fe7ad87fdf738a882e8b1a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] introduced a set of patches to fix CVE-2025-31115.
Since [2] the security patches neeed to reference the vulnerability with
the `CVE: ` trailer in the patch header.

This set of patch is no longer present on master branch with xz bump [3]
but hasn't been cherry picked to 2025.02.x branch.

[1] 06c6c49fe8 package/xz: add security patches fixing CVE-2025-31115
[2] 1167d0ff3d docs/manual: mention CVE trailer
[3] aaa50b0e61 package/xz: bump to version 5.8.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch                       | 1 +
 .../xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch   | 1 +
 .../xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch   | 1 +
 .../xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
index 2424fb0d13..41870a8282 100644
--- a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
+++ b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] liblzma: mt dec: Fix a comment
 
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/831b55b971cf579ee16a854f177c36b20d3c6999
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
index 7845380a8c..14985ebc8f 100644
--- a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
+++ b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
@@ -12,6 +12,7 @@ called (reinitializing the decoder always calls threads_end()).
 
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/c0c835964dfaeb2513a3c0bdb642105152fe9f34
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
index 9915e6b275..d370d8b613 100644
--- a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
+++ b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
@@ -26,6 +26,7 @@ Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
 Reported-by: Harri K. Koskinen <x64nop@nannu.org>
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/d5a2ffe41bb77b918a8c96084885d4dbe4bf6480
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
diff --git a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
index 1a914e08db..b3fd11b29d 100644
--- a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
+++ b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
@@ -21,6 +21,7 @@ Block before the worker thread is activated.
 Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
 Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
 Thanks-to: Sam James <sam@gentoo.org>
+CVE: CVE-2025-31115
 Upstream: https://github.com/tukaani-project/xz/commit/8188048854e8d11071b8a50d093c74f4c030acc9
 Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
