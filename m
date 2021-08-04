Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3649C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E0D60F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4E0D60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DE52402A9;
	Wed,  4 Aug 2021 19:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BA-GCE5wB9g; Wed,  4 Aug 2021 19:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B8840298;
	Wed,  4 Aug 2021 19:43:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 325C41BF9D1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C17683B4A
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Lg9aIc_VHA0 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C401283B46
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:43:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D8C9886BD9; Wed,  4 Aug 2021 19:42:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:41:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4545ec800a2c417211a09a35adb57880e01a28c1
X-Git-Newrev: e4eaa1bdb2af99b58eba4601621132e4eef3710c
X-Patchwork-Hint: ignore
Message-Id: <20210804194250.D8C9886BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hostapd: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4eaa1bdb2af99b58eba4601621132e4eef3710c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for hostapd is added by the services/hostapd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8820254f89..e988999d3e 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,6 +31,7 @@ HOSTAPD_IGNORE_CVES += CVE-2021-30004
 HOSTAPD_IGNORE_CVES += CVE-2021-27803
 
 HOSTAPD_CPE_ID_VENDOR = w1.fi
+HOSTAPD_SELINUX_MODULES = hostapd
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
