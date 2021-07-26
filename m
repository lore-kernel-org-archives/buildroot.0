Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6DFC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 511B660F9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 511B660F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16C9940375;
	Mon, 26 Jul 2021 21:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8BhsCg_wzit; Mon, 26 Jul 2021 21:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A52F402FE;
	Mon, 26 Jul 2021 21:43:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C16E1BF995
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9E04033B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRxzt98pETal for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1B51400C6
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0604C89015; Mon, 26 Jul 2021 21:08:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:42:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bab9cf65a803287bb49ccd5d2b376ae7cd9c8ac
X-Git-Newrev: 5278e4304c1d9f4706cb5babd527545e24f1c1d5
X-Patchwork-Hint: ignore
Message-Id: <20210726210854.0604C89015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atftp: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=5278e4304c1d9f4706cb5babd527545e24f1c1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for atftp is added by the services/tftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atftp/atftp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index a2df4af056..3db966c169 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -9,6 +9,7 @@ ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
 ATFTP_CPE_ID_VENDOR = atftp_project
+ATFTP_SELINUX_MODULES = tftp
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
