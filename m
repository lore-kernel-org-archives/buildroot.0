Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9060C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 09:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AD541717;
	Sun, 24 Dec 2023 09:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AD541717
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W65RIy-gVP4q; Sun, 24 Dec 2023 09:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BCB416F8;
	Sun, 24 Dec 2023 09:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BCB416F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6D821BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ADF240179
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 09:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ADF240179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJ8zdBGbnVQT for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 09:45:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D72F6400EA
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 09:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72F6400EA
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E97AA4C0184
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:45:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45526)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHL2p-0008KC-0F
 for buildroot@buildroot.org; Sun, 24 Dec 2023 10:45:15 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 10:45:15 +0100
Message-Id: <20231224094515.1349572-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703411115;
 bh=N0FFS3YFMkNleusPmUFBba6zrHX5mCsnjU/+iFbiXXE=;
 h=From:To:Subject:Date:From;
 b=BvVzvm/yU5r9PCR8QkTV4JA5w1MSYOULxB3mJrUVuU0PbR7Y0cZhrZn/tyqISiZ8o
 aoxI4iOePlJCBGiFOsW4Wr9wTxqmsRJQXP9dT+L0gbo9yQwgmK8tUaGBb7noqzRpIQ
 Oijcbai33J+uXd2+nAGIVvHCQhfNNCxaRUkRUCwJS23yhnVygesWuvnQ93pE4jw2GD
 pGz4zITJeAJ7u6rvVkBr+7f+n8qdNnRidx19e/XWrV6qgMEGPbczSfJRDTCOhpynfe
 d2of2DWbd1rUAK3WcMrNjdRYNhV8TKmSs/xS3M3FNKz2vQ0wj1PYlj6QWBwDDosZq/
 qhXLFuxCjDhLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=BvVzvm/y
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 20.3.15-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index a59e0fda88..ebcf32fd4a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  43d8da96176aedaef8ba14ec90398c5b13d0bb01c388150c02b9952870b655e8  kodi-inputstream-adaptive-20.3.13-Nexus.tar.gz
+sha256  1d7c933d05534e591e11fd204e836a3498fffc6a0717d5427c89acfd16fb9d40  kodi-inputstream-adaptive-20.3.15-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index be7b36bce4..267541ace9 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.13-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.15-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
