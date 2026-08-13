Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398DC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A47060898;
	Fri, 14 Aug 2026 13:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-WkHKJOSZKH; Fri, 14 Aug 2026 13:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D614E60689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713686;
	bh=lpwrcCZSVOzlebjOggm2pfVkY4xAN/m86kvAYQ3eSpc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l7ROBmjiwGTam84Y3gujEGfjX5XahsZT0KsjXqdJYpkBLnt84rc7TEXV828mN6Fes
	 7SvUijd2XmDuy4VAY4qkyd9yBHLYpwRHxO/T7Gi87gCS8I1YVOcP5AVoaMZprxOmvJ
	 TFed26j5ClmyVjEBw9nTPStaVzq3wYS1pAR3EX504DLjXeqEqmA/DeZkFX/Et+TzTt
	 sJYotew2S9AvNKacfPMWf4jPSKBvF3XHCajAaTLRzqCxaIcVJ55oQNFZRIREo0rzAm
	 GfE7pLuRrZFJOZizinpYqpQFCaXsz4/2UINrooh4I55zIvZVRBBk3GVkX13tt/oLPt
	 SpvctZDRCLUJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D614E60689;
	Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1593D23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07B0B4030E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcdMDJRTcwo7 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F61C400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F61C400E3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32F898D66C; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:04:03 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4279f3abedcce9ea89f0bad84be9f27ebcd1223a
X-Git-Newrev: 039fa2334fedf03234c556d986b7fa4bf91f6c35
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.32F898D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libmodsecurity:
 security bump version to 3.0.16
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/039fa2334fedf03234c556d986b7fa4bf91f6c35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES

Fixes CVE-2026-52761 & CVE-2026-52747

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b98fac95a92924ccf3e2e8ebb137bb00cd30d8fe)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libmodsecurity/libmodsecurity.hash | 5 +++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index aab9d14d67..011059d91d 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
-sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.16/modsecurity-v3.0.16.tar.gz.sha256
+sha256  739be3c71b1939f14e91afe1eeae654acbd440da11bd29790458840bc315b4c0  modsecurity-v3.0.16.tar.gz
+
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 8920cb012e..653b4fd159 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.15
+LIBMODSECURITY_VERSION = 3.0.16
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
