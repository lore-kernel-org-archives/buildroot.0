Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA93C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:16:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B2E60F44
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0B2E60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E578402F4;
	Mon, 26 Jul 2021 20:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOJNrShyOFyI; Mon, 26 Jul 2021 20:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED655402E9;
	Mon, 26 Jul 2021 20:16:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD071BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FC7B83224
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNTGv3aVyKH9 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D230C82FCE
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6019488D42; Mon, 26 Jul 2021 19:40:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75148bac539d10d543c6c4a126fa1611688f93f2
X-Git-Newrev: f043646044261578fd554c1f899b84e798ef9437
X-Patchwork-Hint: ignore
Message-Id: <20210726194026.6019488D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=f043646044261578fd554c1f899b84e798ef9437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for fetchmail is added by the services/fetchmail module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 7233da98a5..c2e5e3e9c4 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -11,6 +11,7 @@ FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FET
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_CPE_ID_VENDOR = fetchmail
+FETCHMAIL_SELINUX_MODULES = fetchmail
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
