Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C2CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C4D141217;
	Wed, 17 Sep 2025 17:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I04iKcTAnQXL; Wed, 17 Sep 2025 17:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0DB41080
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0DB41080;
	Wed, 17 Sep 2025 17:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E29199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE0F2406A2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRodwoWYVcq5 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B025E42646
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B025E42646
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACBE1856A7; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 19:32:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdb540a00e72190a8cb2df370226a2e916f899b2
X-Git-Newrev: 85c71fee3fd30f310f3890db24efd52fc9119f60
X-Patchwork-Hint: ignore
Message-Id: <20250917173332.ACBE1856A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 deprecated CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85c71fee3fd30f310f3890db24efd52fc9119f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE 'x.org:xorg-server' is deprecated in favour of
'x.org:x_server'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/F6729083-29EE-4772-9DFF-80B43980D6BE
  - https://nvd.nist.gov/vuln/detail/CVE-2025-26601

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix "xorg-server:x_server" to "x.org:x_server" in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f480c1c0ac..2ce02ade36 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -10,7 +10,7 @@ XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserv
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
 XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
-XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
+XSERVER_XORG_SERVER_CPE_ID_PRODUCT = x_server
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
