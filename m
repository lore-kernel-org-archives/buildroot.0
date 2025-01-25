Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBA3C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE6C80E0D;
	Sat, 25 Jan 2025 23:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNJskqsApQTn; Sat, 25 Jan 2025 23:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A4280ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A4280ED8;
	Sat, 25 Jan 2025 23:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB71C94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBBB84070B
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOAiWJmR0UPM for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29533403EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29533403EA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29533403EA
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:09:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.60]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1tw5zD3mNG-00LjeD; Sun, 26
 Jan 2025 00:09:34 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sun, 26 Jan 2025 00:09:11 +0100
Message-ID: <20250125230912.83139-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:UeWcD3KZEZUH0nsRvOEargGRlGGhsn+yewOAnmFXo48135bElVq
 Sbk7oDAnuzrVy6M7YGYsLdp7MmcBjlA+RKNMKaKI49SF+igijdk9bOOztnBi2mF3OQwf+Zv
 Zb2e2vIiaNlQlpE0zjMesHDjDNAzG7+8ex3zuv4mldv8Hd8ihCpaC+j6dvJSU4wUjsL3pL8
 l+SSqoi1/sjZkX/fWCC+Q==
UI-OutboundReport: notjunk:1;M01:P0:TH61mO7BN2w=;70KRI6gWHkjdz0f+x2rxt37CddA
 ZfXYjFI0mwh63paGpwFm5gBJTo3sJ6xsT6XSUv0J+6LBvU7Nil6oYmhIJk9flWc8rHO73Xt6O
 kLPoJPustLx5B4p6CJESdEFHcc/FgjNjA6rlYS9ok/cw6cyoULVTGs2mPKa17/gWW8P4W6Dlz
 T0F7OiBOo0CKQi6eh7Km8/qLXToKmr4/U4UtTs6Z5OzCye2Bqmg8eetKNPBC6wLCd9rp9WH9O
 8JoZhYXY7do1qWxk9Yh3u4b/yghNjKJvpY7qbdpCGMA5H83HP3jVZb9D5KQJiqu5Yc9qfp/wE
 8YIdFOQQus63r4qKi5HKXHnWtWPSWi/ZIc1N8txSQrd8AFug+7m9UHQyXvec3dbY6vduXy5rl
 f6O31n4YABMoi0EczUEDuO9DZXDp+NhjuvggYFnGM3sE0TJ/UMUcWCX2aRjbPK0ENIzM/Fe0K
 k0GSXqKOskthJFzJkR0RaM69BYt1/x1lYpWOOTH9tdh9XEyedugqGRP6qJgxZSuY4gksj0N2V
 GBZm1zlpdPy7ZwP4FfVnQeHgg4G3P6s5/i3nMpxZTkjPQd7TXJpt/PzDpVXEyFDjLmUM+z6lT
 0NIEaBkdTNvyx6dFH1KHNtn+IvHpx/GlxjdUDO6UYEEyFSC4IyuAuCIIynGiNZy3A+db7IkKE
 2d7W1gYrzZzNo4SPWhENDRBMPJud0MPnQYqCkFp3Ux4R9ifM+fO+Z9E3FWAJ66cNXhR36HBaP
 0quSN2qnC2JL28MoaMDR3ZVzdTXOK0boS64jbqu8gs/1S2tZwHnBt3yVnHq0166LnXfl8/DNK
 W3IS8rbj4v3jBknP/EiWjOSJJGjXZbD7XV2EW5mQ3ixbvq8bq9pUZCg2eil8uRqjZqej72E3J
 fQegbwabmM7fBOgsf6soT8fb2DVGZznLMlmvX/pPeid/HLYG+anLdBRN4UaPQPG/S3yQMT8ZB
 z5DTMg5GdJjQWwBuwsuB0ukTjg8iMEGPIDh0Kfv9FTKQVkvFIuOD5YQ9fyk4Lzx2aX6cDKwwi
 pNaldmqIJlsf8och/apEEUMNV44eg3jhw4pxeEeLKyMjTZyCxEeULswalL3kd8w2eobCsS1Il
 r9Tw+Bk6j8s3TIqMrJw4cHo1lWOdWtr2ypRlEhxOx2QIb7OJ+sSHhY5j56IF8jKjwg8huGvDQ
 O+J+mdJuizmPzzHfcG3N03jUr6k9QEfn4tdo/SuV/LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737846574; x=1738451374; i=fiona.klute@gmx.de;
 bh=T9zksxcU4GyyfQ8j3RkHdWy2Hbd37znj6SCjoYTYqqM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rg+8Gkg1+VI0NRiPqD8Jbt8az6N+knRpQLBjz60gXvBL+pteNWGUHF1e7PYd5MCI
 FZVHLxVoSfTvehvBdlWDJHyh8AVSEwbUHorxVTtBHIKHw3Qm+iZd/d3FoufptLE6V
 JKhOkANGuEyDYv4smvnQq4rrJbLWuH9ubhq1tD80MtWWj99ErSGU9NCX7LCE/hWOp
 wKZlm0zSg3g/0S7UafWhFzvegzGeP2YhhIrrCKzt9Z3Za5Z7jEOoJedvyAEPBep16
 ARaTumgUIixvY5EOtgbZfKdiR+CXG+GPhSlpy+RxzHNRHGVnPfSI2+ycvSdhD8qJR
 nzP+2UJ4Iv60i+272w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rg+8Gkg1
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.50.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.2/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index ffa438aa01..64ec5acbea 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.1/downloads/NetworkManager-1.50.1.tar.xz.sha256sum
-sha256  5f9b881810e83a9f7c152f9c0051ee0bf922bd23053208f642c8fcaa1bdcdd25  NetworkManager-1.50.1.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.2/downloads/NetworkManager-1.50.2.tar.xz.sha256sum
+sha256  10473be9d3ab89f8a27a68b7bf5bc9557851a5183b74b6241e5e0fa5c6921fef  NetworkManager-1.50.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 015e6b212a..1a0adacfa0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.50
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
