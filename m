Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EBAC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C44461029
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C44461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 580A4838F0;
	Sun,  1 Aug 2021 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pl7pijXexim; Sun,  1 Aug 2021 20:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5F0838B6;
	Sun,  1 Aug 2021 20:25:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629F51BF981
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC7E4022B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lws-z4GuqNzJ for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:24:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A477A4021C
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:24:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AB8248A4D0; Sun,  1 Aug 2021 20:24:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:14:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1d8b030707dcf45313d0a0c703716c2acb677e6
X-Git-Newrev: bc0a2a5885e94ae316be413a6e24a14a1ad3c11e
X-Patchwork-Hint: ignore
Message-Id: <20210801202436.AB8248A4D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tftpd: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc0a2a5885e94ae316be413a6e24a14a1ad3c11e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for tftpd is added by the services/tftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tftpd/tftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index ffd52ce0d0..42b5f17821 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -11,6 +11,7 @@ TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
 TFTPD_CPE_ID_PRODUCT = tftpd-hpa
+TFTPD_SELINUX_MODULES = tftp
 # From git
 TFTPD_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
