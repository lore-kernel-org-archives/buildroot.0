Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDB1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E42B60F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E42B60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3FE883D77;
	Tue,  3 Aug 2021 22:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLrNbL2QzNJU; Tue,  3 Aug 2021 22:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5520D83D96;
	Tue,  3 Aug 2021 22:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 781DD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05480608B7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8R_4AxIZFng for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BABA60883
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A5D5F878C2; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:13:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5ca521e232eae31276e7a12d17f0cf9d9c0108f
X-Git-Newrev: 49f6b2f39ee23e3e53c0b001894644734b8338b6
X-Patchwork-Hint: ignore
Message-Id: <20210803211026.A5D5F878C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/samba4: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=49f6b2f39ee23e3e53c0b001894644734b8338b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for samba4 is added by the services/samba module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ffb582e14d..21daa034af 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -12,6 +12,7 @@ SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
 SAMBA4_CPE_ID_PRODUCT = samba
+SAMBA4_SELINUX_MODULES = samba
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
