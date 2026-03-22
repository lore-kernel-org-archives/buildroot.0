Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38B4F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C803B822A1;
	Mon, 23 Mar 2026 19:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_yn1Ptr8QaC; Mon, 23 Mar 2026 19:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D25A2822D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295295;
	bh=kES2Nh1LCgYHQOUTFAJh5VL3CyTWW+y2gQ9vGf+rSxY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=avL4EZIS5uL90rMelKXCZ9Nw6BbZqJuTyPJX2a1R9Mze0hgfQ4l369NRrW5hAvNWM
	 TUvhCb8+V0w6TQmadc+5UqZjgy1erxnQjMDVZqozTrCvkQTrsSe9YwiRTVhfYrHqmH
	 hxxVi9LrQUgUpLMTGw4rbGE33e/9FcM4tBFp19osQnC3qiX1fxKosTii9C1JTnHUIl
	 1ImnWyivPjs2zlSrXdiTjKQ8Z0eeaI8HMGpvuu/ZJaqtETSOtmmggkF8bY0wACoTWO
	 0U4NsRX2yWLuWCZoBZ3izGY58jOZH6XJR0nEcpgUafhPvOo9GzigZvu+dqY+tvD+pA
	 e0B2VM+LjDSFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D25A2822D7;
	Mon, 23 Mar 2026 19:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C57F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 671018221A
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dPZCkJ7cn2p for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C197D82277
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C197D82277
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2569181140; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 12:28:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86254ee6b5168c2b1c413c27810a541bda1dfff6
X-Git-Newrev: 9c66b7ece134a0bcc218aa118eab79dd59cdc855
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.2569181140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dvblast: bump version to 3.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c66b7ece134a0bcc218aa118eab79dd59cdc855
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/dvblast/-/blob/3.5/NEWS

Depends on bitstream >= 1.6.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dvblast/dvblast.hash | 8 ++++----
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index 1b75d779d9..3776cef525 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.md5
-md5  148a26e1207e111f905461cfb1cd106a  dvblast-3.4.tar.bz2
-# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.sha256
-sha256  7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44  dvblast-3.4.tar.bz2
+# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.md5
+md5  d244aadb0b202a0838449235fc5f27dd  dvblast-3.5.tar.bz2
+# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.sha256
+sha256  baa5a9aa1726b97240e16fef8856395cd42440aee410bf479479249f9cce6076  dvblast-3.5.tar.bz2
 # Locally computed
 sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
 sha256  2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 3571ff3c74..c3e19f3e3f 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVBLAST_VERSION = 3.4
+DVBLAST_VERSION = 3.5
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
