Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03487C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C704061F;
	Sun, 24 Mar 2024 17:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcr8UczeZq7O; Sun, 24 Mar 2024 17:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D2840B26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D2840B26;
	Sun, 24 Mar 2024 17:11:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6FF1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBF8F4062A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA1H2rFez-aR for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC3554026A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC3554026A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A67AA83C52; Sun, 24 Mar 2024 17:11:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:00:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75bad69099dfb66433feaf4accf1105e1f8a4319
X-Git-Newrev: f30f5e4f61e72a507df96bea1960a9388c780a82
X-Patchwork-Hint: ignore
Message-Id: <20240324171116.A67AA83C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pure-ftpd: remove optional
 dependency to libiconv
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f30f5e4f61e72a507df96bea1960a9388c780a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 26d5d1c0a20719876220b429a43f8b1bcc29138b removed the
configure option --with-rfc2640 due to upstream commit:
https://github.com/jedisct1/pure-ftpd/commit/33eda763bfca8dfcf736275272b84602dcd18549

In the same upstream commit the iconv support was also removed because
it was only needed for rfc2640 support, this removal was forgotten in
the forementioned buildroot commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pure-ftpd/pure-ftpd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index ffd27d7b99..b918c70930 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -10,7 +10,6 @@ PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
 PURE_FTPD_CPE_ID_VENDOR = pureftpd
-PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
