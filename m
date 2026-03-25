Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C231109C05C
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A963607A2;
	Wed, 25 Mar 2026 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t32jHSBgx8Kp; Wed, 25 Mar 2026 19:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D93960AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774468746;
	bh=wgoxLpY6S384BL6wpm8uSPv9/UQQSf3wxChNj3bj+YA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bnGPn5IGenrB7sc6zWuHuuS/u9M1aI+AOofmKAa0sX8cmglpIEGegsbd8aRX8rb/u
	 5whr138MpkCAE6ZyuHa2u1MNV5NbfqxZYBkMTc019VqI7cG2W3QbM8fGOPqrrqQXdf
	 3KLFLEHQcmrCjrWD6jhg9I08pVnpd/MpeaNFrQwd6Qa/kulxBO7OReA1uUovp/+l45
	 ETwhjPhhoMcny8Ga4ZpBxNBtORPOvXuXCgOvS1iY2lpd3Lu4dQrEwMaP+NCMNl5bf8
	 RihaLTkbzcmq4ol88eC3LyHTAHF3WhmNNnc2hxUpeANgFBfgfbQLx4gN8Go3TK4/2o
	 tHkVlS1kthj1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D93960AEE;
	Wed, 25 Mar 2026 19:59:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E48353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C85AB607A2
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmyUs-MNNADb for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5821606B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5821606B1
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 19:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3419F7F887; Wed, 25 Mar 2026 19:59:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 20:56:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50eca46e3571dda2921d0a2a7d2ee9737f2e82eb
X-Git-Newrev: 7d26ff6c144e17327351dcf8aa5dfa6181afee85
X-Patchwork-Hint: ignore
Message-Id: <20260325195903.3419F7F887@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nghttp2: security bump to 1.68.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8426694975745873679=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8426694975745873679==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d26ff6c144e17327351dcf8aa5dfa6181afee85
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For changelog, see:
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.1

Fixes:
CVE-2026-27135:
nghttp2 Denial of service: Assertion failure due to the missing
state validation:
https://www.cve.org/CVERecord?id=CVE-2026-27135

Signed-off-by: Mattias Walström <lazzer@gmail.com>
[Julien: add links to changelog and CVE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 30c2c9078e..6af7b3eecb 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c  nghttp2-1.68.0.tar.xz
+sha256  6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2  nghttp2-1.68.1.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 3db48e7323..50b94582e1 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.68.0
+NGHTTP2_VERSION = 1.68.1
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT

--===============8426694975745873679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8426694975745873679==--
