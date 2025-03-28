Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04895C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBC483E94;
	Mon, 19 May 2025 10:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTfwyddbxsxX; Mon, 19 May 2025 10:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA31183E8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA31183E8E;
	Mon, 19 May 2025 10:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1423EE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 453F540D55
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvi9wgYxtnH3 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAFD40DD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFAFD40DD9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAB788725C; Mon, 19 May 2025 10:39:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 19:39:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57d2bdb1238aa1743400e59f2d52efd51f373180
X-Git-Newrev: e242a5908cf882e7f692dbc32415de2cfa5ec9f2
X-Patchwork-Hint: ignore
Message-Id: <20250519103945.AAB788725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/exim: security bump
 version to 4.98.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e242a5908cf882e7f692dbc32415de2cfa5ec9f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2025-30232:
https://lists.exim.org/lurker/message/20250326.140105.6b97555b.en.html
https://exim.org/static/doc/security/CVE-2025-30232.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index eba73e267f..0dd5ac47ae 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  d858b75ad2cc6bf71c9071ba26a55b3ea9add26607bd832df3cb54f82221c2ce  exim-4.98.1.tar.xz
+sha256  88b8e8a67c1db6cc0b1d148161aa36e662f4ca2fef25d5b6f3694d490e42dcae  exim-4.98.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  8f80999a41ed40e86ee16eea5cfd765e2f164ea149f40eeb410fd02fcf35c23317dc69540efe336e9e0fae930b1cc6771e0180dd70f1314531cdb139740c744e  exim-4.98.1.tar.xz
+sha512  aaa4cfc8aee90818c6d1c2fd0cf64b82668d1a343f462f678b38b2b79e10a467240f2e81786eec7705eec3598d23686a74437c50b68502f29ff67788393c812a  exim-4.98.2.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 5135d02574..9ecae0d038 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.98.1
+EXIM_VERSION = 4.98.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
