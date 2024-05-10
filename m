Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C3C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 19:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06AB941F5F;
	Fri, 10 May 2024 19:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWTfJtlSJoeN; Fri, 10 May 2024 19:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D353941FA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D353941FA8;
	Fri, 10 May 2024 19:55:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 769901BF390
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F2D41FA8
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 19:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glnWWqsk9_Fo for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 19:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7870941F5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7870941F5F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 19:55:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C80186EA6; Fri, 10 May 2024 19:55:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 21:55:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92ae6d75c164e2665d6410de2b1d14babfc0eec6
X-Git-Newrev: f80b393d4506783bb2d27d3d97730040857ec4e1
X-Patchwork-Hint: ignore
Message-Id: <20240510195547.6C80186EA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: add staging
 installation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f80b393d4506783bb2d27d3d97730040857ec4e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install janus to staging directory so that external plugins can be built.

Signed-off-by: Leo Soares <leojrfs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/janus-gateway.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 786bc211d4..0b4db458f6 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -10,6 +10,7 @@ JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
+JANUS_GATEWAY_INSTALL_STAGING = YES
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
