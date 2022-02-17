Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D78D41677;
	Thu, 17 Feb 2022 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQnYSeQC4zn2; Thu, 17 Feb 2022 21:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE2C41663;
	Thu, 17 Feb 2022 21:52:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57AA01C1162
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 446384026A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fo7vuXx2EP4 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E41400C6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 671BD837BA; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:47:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37ba37d516772ade08abf00badc5a6592222972c
X-Git-Newrev: 9f96c4be57d1edb2c89d542e9d1d894c5a20b7c2
X-Patchwork-Hint: ignore
Message-Id: <20220217214408.671BD837BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-netaddr-ip: don't override
 PERL_NETADDR_IP_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f96c4be57d1edb2c89d542e9d1d894c5a20b7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PERL_NETADDR_IP_CONF_OPTS is wrongly overridden in a conditional since
commit 86658b0b18719c93fca359be65904ff366be9985

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index 4824b4e9ee..c4885715b4 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -12,7 +12,7 @@ PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 PERL_NETADDR_IP_DISTNAME = NetAddr-IP
 
 ifeq ($(BR2_STATIC_LIBS),y)
-PERL_NETADDR_IP_CONF_OPTS = -noxs
+PERL_NETADDR_IP_CONF_OPTS += -noxs
 endif
 
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
