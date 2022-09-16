Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE25C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B5141CC7;
	Fri, 16 Sep 2022 12:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B5141CC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T09V4_NR_leS; Fri, 16 Sep 2022 12:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF95418B2;
	Fri, 16 Sep 2022 12:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAF95418B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60ED31BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B9E8418B2
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B9E8418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYUl3gFn6Ldr for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18E5541740
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E5541740
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 07C3083CEA; Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:02:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 284419a95f8c76be3e1853eaa4031a9dd6f94661
X-Git-Newrev: 7b5b8e4f968d51ca194f664f12ad98388db6a6bb
X-Patchwork-Hint: ignore
Message-Id: <20220916120631.07C3083CEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Revert "package/libvirtd:
 fix recursive dependency in Kconfig"
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5b8e4f968d51ca194f664f12ad98388db6a6bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This reverts commit f81242ae4fb64ab85af5d38e70246222276552ae to avoid
the following build failure:

Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ecf49374ee622c7b8ff0ac8d5cb223a9b65141b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index af0fc36aea..65226af336 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -44,13 +44,15 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
+	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_IPROUTE2
 	# These are required because there is no way to unequivocally select a modern netcat
-	select BR2_PACKAGE_NETCAT_OPENBSD if !BR2_PACKAGE_NMAP_NCAT
+	select BR2_PACKAGE_NMAP      if !BR2_PACKAGE_NETCAT_OPENBSD
+	select BR2_PACKAGE_NMAP_NCAT if !BR2_PACKAGE_NETCAT_OPENBSD
 	select BR2_PACKAGE_RADVD
 	help
 	  Build the libvirt daemon (libvirtd) otherwise build only the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
