Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FD0C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DACA40D7D;
	Fri, 25 Apr 2025 22:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5u3gF6sXS_z5; Fri, 25 Apr 2025 22:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2D540D7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2D540D7E;
	Fri, 25 Apr 2025 22:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 505FC15A
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DCF2822EF
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-u_oWSHTEV3 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F41782228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F41782228
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F41782228
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:43:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8RluuhQlKtfOn8RluuPyaY; Sat, 26 Apr 2025 00:43:50 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Date: Sat, 26 Apr 2025 00:43:49 +0200
Message-Id: <20250425224349.2355480-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH+pCevC+E1WLPsckEHud1C7lETNNrB0+GnF9VZNnOpcSRCPemEFXTQaEmT1WACP+AIONpjFeKrksQqx/RRa5lZXhoWWKMe1aFw4XbLKURD8cagggRkg
 UczsbnQYwSQTGDVn0UJqGwX39MpRnTGFe6FIu20DTeaWIKLgRDAJCghjCMNxfsGP5jJ+VGPUIHuaH7YwuwaDdcZm9vC6fkXigEaQHF6TcbPqlRntHjEdftbI
 uj4QH+YPHzBp+WAT4q+Vnw/3qXtHppTBkiSbTM6s4I6osWyH90Dqtvlp4cnp1XLCnC7KjxcmBWQQLfI9D3aFfw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745621030; bh=SsUV9Y51A3lH+Dt3rYZHgWb6TUKeLvh9C0n782EH54Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=CitF1EZ4tNwy30gE4s0gcfYpfgjHvyIIzvycfc6wx6xdB/LTdcEx/TXok9pN7HtM9
 fLzVKlOdIVcHDBHatJARcGUSMq1FSs6gzgUF2EGvwGVdin2cG7nLveMwrzk8lfv6Nn
 keV8bLXFjZyuqIjHBwAMzE7FphHpOIYtr/4vYqqcxujek25FPM5sEiobpHSxFnQDfd
 wDoEDwEDMnNwPvq0OPviGOmc1vTxYzH4z+dOE/sEiwApy84icwVnFPuwtzZOnd/x7I
 M+++YiJ2fi/r2uyhCCJvsChtWhtWsiY+cBTgeodwzzyjlJ1aVaXjzmSu+CPgpuDyQD
 yNanw0Jvdcdiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CitF1EZ4
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build with Linux 6.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build with Linux 6.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...cfg80211.c-fix-build-with-Linux-6.13.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch

diff --git a/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch b/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..6d26b20a5c
--- /dev/null
+++ b/package/wilc-driver/0011-cfg80211.c-fix-build-with-Linux-6.13.patch
@@ -0,0 +1,28 @@
+From 446911a48cd1a2c740b43a32d0ffa6e3f1887e84 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 26 Apr 2025 00:40:43 +0200
+Subject: [PATCH] cfg80211.c: fix build with Linux 6.13
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 25da3a1..d0cd826 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -291,6 +291,9 @@ struct wilc_vif *wilc_get_wl_to_vif(struct wilc *wl)
+ }
+ 
+ static int set_channel(struct wiphy *wiphy,
++#if KERNEL_VERSION(6, 13, 0) <= LINUX_VERSION_CODE
++		       struct net_device *netdev,
++#endif
+ 		       struct cfg80211_chan_def *chandef)
+ {
+ 	struct wilc *wl = wiphy_priv(wiphy);
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
