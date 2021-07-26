Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BC9C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FBC60F44
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45FBC60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A8E607B3;
	Mon, 26 Jul 2021 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0UvPLkXJc3h; Mon, 26 Jul 2021 20:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788E5605FB;
	Mon, 26 Jul 2021 20:16:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30AA1BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ED766009C
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Upt7xEBtCJc for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F72F600B5
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A42B28808D; Mon, 26 Jul 2021 19:40:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c42db433ded2dc6bbb8252fed49c99928dc3462
X-Git-Newrev: cc22746a5b429dbc13844e0d0ca3378a4b0d3cc4
X-Patchwork-Hint: ignore
Message-Id: <20210726194026.A42B28808D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iodine: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cc22746a5b429dbc13844e0d0ca3378a4b0d3cc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for iodine is added by the services/iodine module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iodine/iodine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 5de6389189..521ca3d927 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -10,6 +10,7 @@ IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
 IODINE_LICENSE_FILES = README
 IODINE_CPE_ID_VENDOR = kryo
+IODINE_SELINUX_MODULES = iodine
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
