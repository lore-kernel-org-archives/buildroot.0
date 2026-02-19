Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2DE9A03B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC8C81B0A;
	Thu, 19 Feb 2026 11:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyIL-f_Ssrs3; Thu, 19 Feb 2026 11:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B4F081DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771499724;
	bh=cXPsz1ciwwtEzMiWzJ2lNvtLWRbF50FvSdG695HXEqs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OhOmKWurwfWUiY/ndgYiOGVySyLP+lXHPpHPKnm5+3wA9/+LZmefEXdvFysEkOUz1
	 LXVAHsIG0gVYvtqZTKYiKxMYvWRGTlRNSwd4xxdGYW4OuZvw8U8fmjIan3CnWJiNUP
	 CluZT/j62iOAAbjmJD3xis/PixlYe4nvNIw3qA9NOLHHqSHlIei8zCWsOhthYPKdze
	 UUCozxDQ7Szgq2uUoy1yDt5AzpZvJM+5SPPcw3vwceoSMbaLR5g+SUOvh+65kcrag5
	 3UEnAWKV1ehAcju2Lgx1H+JidvsTqnWA4eGtcFAfBPjPxKHPret0rQ/ii/wW8Vc920
	 vEeqQzyiq1krA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B4F081DFF;
	Thu, 19 Feb 2026 11:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B70061CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86B040671
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x73pPOkb_Rq9 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 11:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977734066C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 977734066C
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8643C83A26; Thu, 19 Feb 2026 11:15:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 10:37:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e0c14c083a930e2dbe63bcc1cf5ed453e858a742
X-Git-Newrev: 314b6f63681c42ea05724e73b6d6ea14dfb05024
X-Patchwork-Hint: ignore
Message-Id: <20260219111522.8643C83A26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nghttp2: bump to
 version 1.68.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/314b6f63681c42ea05724e73b6d6ea14dfb05024
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Includes the releases with the release notes:
v1.65.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.65.0
v1.66.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.66.0
v1.67.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
v1.68.0: https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 4b60d6d143..30c2c9078e 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
+sha256  5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c  nghttp2-1.68.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 98f837e28e..3db48e7323 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.64.0
+NGHTTP2_VERSION = 1.68.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
