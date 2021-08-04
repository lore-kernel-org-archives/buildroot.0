Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0DBC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0161060F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0161060F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C793283B81;
	Wed,  4 Aug 2021 18:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRIcPUyl7Esg; Wed,  4 Aug 2021 18:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4334883B2B;
	Wed,  4 Aug 2021 18:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDCC81BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E63FD40666
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26Ag4dflSQYf for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2175640625
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B51E8B5FE; Wed,  4 Aug 2021 18:06:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 19:47:57 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 41d4fd9fdc0d4931962955a44b431a6ae685ae59
X-Git-Newrev: 80e514984b10abd2bd8ab581f6276f85f9b763c1
X-Patchwork-Hint: ignore
Message-Id: <20210804180629.5B51E8B5FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/avahi: add
 SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=80e514984b10abd2bd8ab581f6276f85f9b763c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Support for avahi is added by the services/avahi module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 952c42e3e7f4d52f406aa9c53d3e23e65e3b383f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
