Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B96C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B9B60ED6
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6B9B60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B5160A92;
	Wed,  4 Aug 2021 19:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDYomCgQU812; Wed,  4 Aug 2021 19:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EF060670;
	Wed,  4 Aug 2021 19:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 133591BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 024D1402A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCKvv08p3eMB for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C95D401D2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 22F9D8B6DD; Wed,  4 Aug 2021 19:42:51 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:42:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 664f83ec7d1a0d026c03efbe35a6d6fe40c82eec
X-Git-Newrev: 975ab2fa88a0c94b362499ea8ad99222f335fb45
X-Patchwork-Hint: ignore
Message-Id: <20210804194251.22F9D8B6DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: add SELinux
 module
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

commit: https://git.buildroot.net/buildroot/commit/?id=975ab2fa88a0c94b362499ea8ad99222f335fb45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for wireshark is added by the apps/wireshark module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index e852083de6..6006ecaaa5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -10,6 +10,7 @@ WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
 WIRESHARK_CPE_ID_VENDOR = wireshark
+WIRESHARK_SELINUX_MODULES = wireshark
 WIRESHARK_DEPENDENCIES = \
 	c-ares \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
