Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B93E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C91284AA8;
	Thu, 12 Dec 2024 21:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbYJEtMfJAHh; Thu, 12 Dec 2024 21:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3C784A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3C784A79;
	Thu, 12 Dec 2024 21:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B15D1146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC9D084A79
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAxJY0KB374z for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8640A84A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8640A84A75
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EB5186ED7; Thu, 12 Dec 2024 21:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:07:21 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8016537b7d1ac17c625b8a922689bd27342d9c0e
X-Git-Newrev: 21e949b3e65e219cb58541e70187e9eb9c105d05
X-Patchwork-Hint: ignore
Message-Id: <20241212213337.7EB5186ED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openvpn: fix
 'accommodate' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=21e949b3e65e219cb58541e70187e9eb9c105d05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b253ae3054b8b21238e2f57803f780e7bc04daf1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5aa2386d36..77afc9eaf4 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENVPN
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenVPN is a full-featured SSL VPN solution which can
-	  accomodate a wide range of configurations, including road
+	  accommodate a wide range of configurations, including road
 	  warrior access, home/office/campus telecommuting, WiFi
 	  security, secure branch office linking, and enterprise-scale
 	  remote access solutions with load balancing, failover, and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
