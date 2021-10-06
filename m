Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AE1C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D0CE61131
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 14:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D0CE61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5094440700;
	Wed,  6 Oct 2021 14:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EOfkYg_UHPq; Wed,  6 Oct 2021 14:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B487F40611;
	Wed,  6 Oct 2021 14:37:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62E891BF36B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 528C740700
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 14:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCAWFw6j1stC for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E2B4059E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 14:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8312F9230D; Wed,  6 Oct 2021 14:32:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:16:30 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 3f3455be95b3a46d19600e8ce214dd9360c441a2
X-Git-Newrev: 12656a68669bf0385449b2c7c636be1b058830c2
X-Patchwork-Hint: ignore
Message-Id: <20211006143256.8312F9230D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/lvm2: make a
 standard install for host
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12656a68669bf0385449b2c7c636be1b058830c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Use the standard install for the host, so e.g. pvcreate is installed as
well. pvcreate is needed for libvirt.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit cadf33cab9014f9d9b0c9f4fa352e2fbf0129d70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 6726e165b1..a5724328ff 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -72,9 +72,8 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-dmeventd \
 	--disable-fsadm \
 	--disable-readline \
-	--disable-selinux
-HOST_LVM2_MAKE_OPTS = device-mapper
-HOST_LVM2_INSTALL_OPTS = install_device-mapper
+	--disable-selinux \
+	--with-confdir=$(HOST_DIR)/etc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
