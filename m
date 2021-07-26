Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB52C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:41:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC3F60E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DC3F60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18480843B5;
	Wed,  4 Aug 2021 00:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIIhTWwPR1gp; Wed,  4 Aug 2021 00:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BD6843B3;
	Wed,  4 Aug 2021 00:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB7F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1718D40F75
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFI6mK_qRDLv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4F4B40F7B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0624D82B36; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: beb6ece34d7b36452c08917f3aa1f389860d699b
X-Git-Newrev: a36f6f341bfa2f6c755508eb7f70b273b7c7e35e
X-Patchwork-Hint: ignore
Message-Id: <20210803211020.0624D82B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ntp: add SELinux module
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
