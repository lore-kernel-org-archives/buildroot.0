Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE16C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:30:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C1861074
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42C1861074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC48260EDA;
	Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrBINab-Q2Sp; Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4941160709;
	Wed,  6 Oct 2021 19:30:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14C051BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B1483E5B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d96DVJXHyzsy for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60CE683E03
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CA79E9121F; Wed,  6 Oct 2021 19:28:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1d74108b1e5ee952fc45d6102ed8d721c13231f
X-Git-Newrev: 0ae5ca9b67f321552f6428de14105192cebd7e8f
X-Patchwork-Hint: ignore
Message-Id: <20211006192813.CA79E9121F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: Allow mesh
 configuration
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
Content-Type: multipart/mixed; boundary="===============1830524095462344466=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1830524095462344466==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0ae5ca9b67f321552f6428de14105192cebd7e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wpa_supplicant defconfig doesn't enable CONFIG_MESH
by default, and currently there is only a path to
disable it in buildroot. This patch will restore
the logic to enable it.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Acked-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e9078b9f89..3c0b0c1dfc 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -104,7 +104,9 @@ else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WIFI_DISPLAY
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_MESH
+else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_MESH
 endif
 

--===============1830524095462344466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1830524095462344466==--
