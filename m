Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6179FCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B11F8460C;
	Fri, 15 May 2026 17:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YudrOpew8xs; Fri, 15 May 2026 17:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C730845CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867126;
	bh=A4NS9HZc0dz2m0+lF6dfBjqCGw3CnUSoscBX1PnXNZU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qA0TleKRLFdygoZLshh2nMgNtUAt385AFGr1do50sY1h3SSAyzTcAxlXOqyKVmTM6
	 lEdsjzN6RiNpkVyUfNlWH5x6IKdygoJTgvm+qb9OLd02AJWemPmRz6WR45Nh+DK8Su
	 uuSdcGcmcOgpZg6v1axZnIDttBHniyh8+j0KsLDwYeUNXKQkeCmZasoBV2k6DmeQrQ
	 4/UkGwORwj1Cl+8YWE4EtBMR0o42ZfVyiLW3Oo/NabVXDZ9uTf4ZryZpFXIK24ABhd
	 s7BjA/7IFH77F96ujID3QbrJsUiuGwQmrv0owVddUkBUbDHBp7+rHTOQnMnSV7xXbW
	 8B4lolBGiWm3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C730845CE;
	Fri, 15 May 2026 17:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C8C923F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D0D861697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY0YAWR8OTGz for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 640C76169F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 640C76169F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A24998633C; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6dc1c726967e7d99d63b642c2558a3b94e778e9c
X-Git-Newrev: e3805d87ca33227e9f290d0688997cb06351df89
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.A24998633C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/frr: install
 systemd service files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2219173067887082393=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2219173067887082393==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3805d87ca33227e9f290d0688997cb06351df89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The FRR package currently only installs systemv services files. The
upstream package also provides a systemd service file and a service
template file. Install those when systemd is selected as an init
manager.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 5af981a6727bb4a5e984c86556ec674e525db218)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 7ee436d282..d4c93e45da 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -123,5 +123,12 @@ define FRR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50frr
 endef
 
+define FRR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/tools/frr.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr.service
+	$(INSTALL) -D -m 644 $(@D)/tools/frr@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr@.service
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============2219173067887082393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2219173067887082393==--
