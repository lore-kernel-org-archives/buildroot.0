Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34F4C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:24:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8974560E09
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8974560E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAFC4042F;
	Sat, 24 Jul 2021 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zY2pMBLUrN5f; Sat, 24 Jul 2021 20:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBCC402CE;
	Sat, 24 Jul 2021 20:24:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 081231BF95E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0453C402A8
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcNyfU5wu56d for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4020C402CE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D2948899D; Sat, 24 Jul 2021 19:49:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:22:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c474ffaad158230bf2d04ccf0544f5b3b1d5738
X-Git-Newrev: 4254520f0aff3e744de2d23ff64e0c24ff974a27
X-Patchwork-Hint: ignore
Message-Id: <20210724194941.7D2948899D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: add SELinux refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=4254520f0aff3e744de2d23ff64e0c24ff974a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for openvpn is added by the services/openvpn refpolicy
module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index c07f8b4ff5..749a567e16 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -11,6 +11,7 @@ OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CPE_ID_VENDOR = openvpn
+OPENVPN_SELINUX_MODULES = openvpn
 OPENVPN_CONF_OPTS = \
 	--disable-unit-tests \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
