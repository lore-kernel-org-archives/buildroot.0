Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FEDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:02:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72A060F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E72A060F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C244D40685;
	Wed,  4 Aug 2021 01:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSV-fY-KgcvO; Wed,  4 Aug 2021 01:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD4F4068D;
	Wed,  4 Aug 2021 01:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6171BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B2940EB5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuMhGxmyoPk8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FE76400E7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DFD4F8750D; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:05:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7d0de574dbda34f496a0ff2a8ece2b3c8ed9d5ca
X-Git-Newrev: f1c5ca57c30c851f63b1e24c7add5a9c34853bc8
X-Patchwork-Hint: ignore
Message-Id: <20210803211025.DFD4F8750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpcbind: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1c5ca57c30c851f63b1e24c7add5a9c34853bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for rpcbind is added by the services/rpcbind module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpcbind/rpcbind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 725075f962..2eee116755 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -10,6 +10,7 @@ RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
 RPCBIND_LICENSE_FILES = COPYING
 RPCBIND_CPE_ID_VENDOR = rpcbind_project
+RPCBIND_SELINUX_MODULES = rpcbind
 
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
