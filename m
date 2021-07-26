Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA76C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D492860F91
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D492860F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B372D40376;
	Mon, 26 Jul 2021 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK2jWHGJ4jy6; Mon, 26 Jul 2021 20:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10F5940385;
	Mon, 26 Jul 2021 20:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC0131BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7207482FE4
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpbsjcAMJbP4 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E4938322A
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9075688EEC; Mon, 26 Jul 2021 19:40:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beb6ece34d7b36452c08917f3aa1f389860d699b
X-Git-Newrev: a36f6f341bfa2f6c755508eb7f70b273b7c7e35e
X-Patchwork-Hint: ignore
Message-Id: <20210726194027.9075688EEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=a36f6f341bfa2f6c755508eb7f70b273b7c7e35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for ntp is added by the services/ntp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntp/ntp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 0dc75a7a6d..ff23cdc2b6 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -15,6 +15,7 @@ NTP_LICENSE_FILES = COPYRIGHT
 NTP_CPE_ID_VENDOR = ntp
 NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
 NTP_CPE_ID_UPDATE = p$(NTP_VERSION_POINT)
+NTP_SELINUX_MODULES = ntp
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
