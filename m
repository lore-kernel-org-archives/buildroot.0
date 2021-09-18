Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E0CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE70F60EC0
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE70F60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6790A84335;
	Sat, 18 Sep 2021 10:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0gvxfv-CE7U; Sat, 18 Sep 2021 10:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D184484321;
	Sat, 18 Sep 2021 10:46:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88D5E1BF48B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B27425CD
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9gZcUq_3Yzr for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 10:46:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1C0425C7
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 10:46:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C8F308B477; Sat, 18 Sep 2021 10:45:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 12:46:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1fa1d4b709be2d73acd113b5a8c5930f37e7b14
X-Git-Newrev: 69bcb52766e8a877fa024f963c544b886217aa46
X-Patchwork-Hint: ignore
Message-Id: <20210918104503.C8F308B477@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: add libnl optional
 dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=69bcb52766e8a877fa024f963c544b886217aa46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl is an optional dependency (which is enabled by default) since the
addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/libvirt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 396dd61577..f30baaab71 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -134,6 +134,13 @@ else
 LIBVIRT_CONF_OPTS += -Dlibiscsi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+LIBVIRT_CONF_OPTS += -Dlibnl=enabled
+LIBVIRT_DEPENDENCIES += libnl
+else
+LIBVIRT_CONF_OPTS += -Dlibnl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 LIBVIRT_CONF_OPTS += -Dlibpcap=enabled
 LIBVIRT_DEPENDENCIES += libpcap
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
