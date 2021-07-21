Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B494AC12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CDE61245
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CDE61245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3910E82D5D;
	Wed, 21 Jul 2021 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VE0STQZFSPvh; Wed, 21 Jul 2021 19:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A535582BA1;
	Wed, 21 Jul 2021 19:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1DC31C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCB140302
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2uo-tFvzwLD for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 19:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8D6F402A5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 19:08:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 13BD18872A; Wed, 21 Jul 2021 18:34:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 21:07:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dfde38c71f0e46dbcac7ac58fae6ebcc515178a
X-Git-Newrev: 952c42e3e7f4d52f406aa9c53d3e23e65e3b383f
X-Patchwork-Hint: ignore
Message-Id: <20210721183407.13BD18872A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=952c42e3e7f4d52f406aa9c53d3e23e65e3b383f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for avahi is added by the services/avahi module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9976df5357..9de6ebc4d2 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -9,6 +9,7 @@ AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
+AVAHI_SELINUX_MODULES = avahi
 AVAHI_INSTALL_STAGING = YES
 
 # CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
