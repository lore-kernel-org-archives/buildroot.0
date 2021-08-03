Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B70C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:35:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF9F60EFD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CF9F60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A0E83807;
	Tue,  3 Aug 2021 14:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxZGbTRo7_QL; Tue,  3 Aug 2021 14:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C58D8380B;
	Tue,  3 Aug 2021 14:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66EF61BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 619BA40270
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EImbOGOi-th for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A9FE400F2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0A4078A690; Tue,  3 Aug 2021 14:35:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 16:25:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f87a20a9a40e3a00b126781c586e36ffcf47bd75
X-Git-Newrev: 0376fc9373cf2bc8209268b8816111aca97e97e4
X-Patchwork-Hint: ignore
Message-Id: <20210803143528.0A4078A690@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/linuxptp:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0376fc9373cf2bc8209268b8816111aca97e97e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
