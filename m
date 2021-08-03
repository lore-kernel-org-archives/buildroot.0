Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1332C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:38:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D6560F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0D6560F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A01F40540;
	Tue,  3 Aug 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRFsbEUnPY1B; Tue,  3 Aug 2021 14:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE60F40538;
	Tue,  3 Aug 2021 14:38:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 563961BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B02831AC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrGrETqVcqfM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:35:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CC5983183
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E49A8A6B4; Tue,  3 Aug 2021 14:35:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 16:25:03 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c3b276e03e3bdc6c5d9ab40b44d1bf3ea6d3bf51
X-Git-Newrev: 16f0aea2886d991894343d5e0931386a9fbc78f7
X-Patchwork-Hint: ignore
Message-Id: <20210803143535.6E49A8A6B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/linuxptp:
 security bump version to 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=16f0aea2886d991894343d5e0931386a9fbc78f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This fixes the following CVEs:
 - CVE-2021-3570 linuxptp: missing length check of forwarded messages
 - CVE-2021-3571 linuxptp: wrong length of one-step follow-up in transparent clock

See mailing list post for details: https://sourceforge.net/p/linuxptp/mailman/message/37315519/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a7f3dc0a02972b8270f898eaab8d82a439686ade)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linuxptp/linuxptp.hash | 8 ++++----
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 4f8a1f89fc..a5479b0ebc 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/linuxptp/files/v3.0/
-sha1  9a3869dbd322252c9a6bc0dbdfe8941586810a7f  linuxptp-3.1.tgz
-md5  2264cb69c9af947028835c12c89a7572  linuxptp-3.1.tgz
+# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
+sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
+md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
 
 # Locally computed:
-sha256  f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d  linuxptp-3.1.tgz
+sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index f91be921af..da23631d20 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.1
+LINUXPTP_VERSION = 3.1.1
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
