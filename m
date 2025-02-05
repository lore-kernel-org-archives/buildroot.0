Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B148C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70B983A9D;
	Wed,  5 Feb 2025 14:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LL_ugixjxfbI; Wed,  5 Feb 2025 14:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF93F83A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF93F83A9E;
	Wed,  5 Feb 2025 14:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E102ECD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C241183A8C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmQ9QQ5g_hiW for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C4080E4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05C4080E4F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E50FE8709A; Wed,  5 Feb 2025 14:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 15:36:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db86b18af503ebe45ed9142fec0abe7d9f96ced0
X-Git-Newrev: a2be7aff30aa1366913fbe2b8d4e132d63895117
X-Patchwork-Hint: ignore
Message-Id: <20250205143640.E50FE8709A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: install D-Bus policy to
 datadir
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2be7aff30aa1366913fbe2b8d4e132d63895117
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/dnsmasq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9f342cb049..5dd7ed5c21 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -70,7 +70,7 @@ DNSMASQ_COPTS += -DHAVE_DBUS
 
 define DNSMASQ_INSTALL_DBUS
 	$(INSTALL) -m 0644 -D $(@D)/dbus/dnsmasq.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
+		$(TARGET_DIR)/usr/share/dbus-1/system.d/dnsmasq.conf
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
