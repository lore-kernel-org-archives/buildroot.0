Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB6BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E74F16103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E74F16103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD90460890;
	Tue,  3 Aug 2021 22:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5suujFbf10M1; Tue,  3 Aug 2021 22:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A9F6087D;
	Tue,  3 Aug 2021 22:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 210671BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D246A608EB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5tXbAN-vz6e for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C8A460875
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 76B6183FEF; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 09:44:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9852113fcd2cd0e98ee7222af5ed9dc2b1df42b9
X-Git-Newrev: 46273a8eb92171b3c70a6b2750549329a0d4ccba
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.76B6183FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuci: ignore
 CVE-2019-15513
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

commit: https://git.buildroot.net/buildroot/commit/?id=46273a8eb92171b3c70a6b2750549329a0d4ccba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2019-15513 was fixed upstream in 2015 with commit
19e29ffc15dbd958e8e6a648ee0982c68353516f, which is older than the commit
we currently use in LIBUCI_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reword comment and commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuci/libuci.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index a8922a96e1..0d0b78036e 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -12,6 +12,9 @@ LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
+# Fixed in commit 19e29ffc15dbd958e8e6a648ee0982c68353516f, older than LIBUCI_VERSION
+LIBUCI_IGNORE_CVES += CVE-2019-15513
+
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
