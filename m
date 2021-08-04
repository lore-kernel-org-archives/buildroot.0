Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D19BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB9F604AC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DB9F604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2669E83C70;
	Wed,  4 Aug 2021 20:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlFOpjaha6iy; Wed,  4 Aug 2021 20:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8657E83C5F;
	Wed,  4 Aug 2021 20:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64C161BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54F1983C62
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89TvUTV0yP0s for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFD083BC7
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AEE518B76F; Wed,  4 Aug 2021 20:36:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:07:14 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 7a47f23f8bc68d021926420a6bbe34f490706b46
X-Git-Newrev: e72132104cbe236392e6bde9d1e5b9e772b55e98
X-Patchwork-Hint: ignore
Message-Id: <20210804203610.AEE518B76F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/chrony: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=e72132104cbe236392e6bde9d1e5b9e772b55e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Support for chrony is added by the services/chronyd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6d4c9437c6351368ba33ee38b8334b8338e90413)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index b73ddb56b2..dc162a6c40 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -9,6 +9,7 @@ CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 CHRONY_CPE_ID_VENDOR = tuxfamily
+CHRONY_SELINUX_MODULES = chronyd
 CHRONY_DEPENDENCIES = host-pkgconf
 
 CHRONY_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
