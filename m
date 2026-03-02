Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1252D58E4C
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 09:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A910812D8;
	Mon,  2 Mar 2026 09:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCljFM5C55wN; Mon,  2 Mar 2026 09:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E55812F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772443912;
	bh=6nCpwDvKdWSe8TibChtthQlZ2zeR3vGd8Qv4S5yD/1A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRPcuAuZoefuBbwatWrlqOex2g+KR0VvMjGs2I14X1BQZ/DeViC4sOezf4Qovqcdh
	 6r8dpGFlwYks//bBYtTwg9Nxuilr3+ed4quQIhHMGtB4wMotlipmYTdJuCEG3C1jHH
	 0U0TIR8VHQicKzDFy6r50S+DldC8YgHYbzW0ZqGPpjjEGDtgPMDujN9EfV67Bf4e+C
	 SxRS08hF9UeDxhanuzTtjEP/rg3l2kGiNUqyZ8xFOHq/RfFGIIDWRwnBIzD0cu0VDz
	 a1bN8W3heEw2gRL9YYJ5o/cuT+UEdONe7mDLg0T28qYtUTLxvL1Q72QTpd+XnlddLC
	 fplmYfwFqLR8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E55812F8;
	Mon,  2 Mar 2026 09:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DC4F231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BB2940F22
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjrUtg9r-kmn for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 09:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2E3A40EFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2E3A40EFE
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 09:31:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01B5483F32; Mon,  2 Mar 2026 09:31:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Mar 2026 10:28:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d88660265bd80591034caf0dbb95236342a2c823
X-Git-Newrev: 156e5fa7eb0de95076a54a93f66ba32ec1591853
X-Patchwork-Hint: ignore
Message-Id: <20260302093150.01B5483F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.50.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/156e5fa7eb0de95076a54a93f66ba32ec1591853
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a number of crashes. Release notes:

  https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3c2f7aedbd..77bdc5485b 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
-sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
-sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
+sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
+sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 161807bc5a..26c70ae6c8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.4
+WEBKITGTK_VERSION = 2.50.5
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
