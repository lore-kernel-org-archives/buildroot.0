Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E38C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 11:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4095A41907;
	Sun,  4 Feb 2024 11:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4095A41907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQLxtRRrt6ZR; Sun,  4 Feb 2024 11:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82527418EE;
	Sun,  4 Feb 2024 11:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82527418EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A19091BF41B
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 11:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 870A940207
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 11:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870A940207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXmXKl_gNDTx for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 11:20:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 726CE4013B
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 11:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726CE4013B
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97C28A4C00B7
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 12:20:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41030)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rWaY3-000000004Fu-1cPM
 for buildroot@buildroot.org; Sun, 04 Feb 2024 12:20:31 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 12:20:31 +0100
Message-Id: <20240204112031.514780-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1707045631;
 bh=XMX8V/9YUztEZdZmMVuepH7zH83MUg5vdGgFtEqYnYQ=;
 h=From:To:Subject:Date:From;
 b=UXcv0vEUBj+5zZpNcp9RUIeFqs9Fk/tKw+YBhhaI30dHYzxGjB0XozaaHnGSngKgG
 rZMB/5hi65JtFvIrrcqVLwerNlvDDRMppxOQcLxceQcVy56A5TL/qWDXz1N0lsN57T
 gqTa+ah57pLznQebQLjjDhpttyA2LzPie25uhbXVFNzuZfhFuEOA1kefrMFCfY+/iO
 jzj0JqIq8BshfHCiGDZt+l9xF0hqYaCrdCMAMKIyDo41Ezy/kZpNyIN3K7biUzvL96
 vpJ3MLJxpo+j5PdqeERZhvsm5ybX3lrIAToCf2xjRWvhL4co8KSM1IAc95jnrKCrbB
 rgTpGgDtotKSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=UXcv0vEU
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-inputstream-adaptive: bump
 version to 20.3.17-Nexus
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
v2: squashed with previous bump to 20.3.16-Nexus

 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index ebcf32fd4a..e38191c0c4 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1d7c933d05534e591e11fd204e836a3498fffc6a0717d5427c89acfd16fb9d40  kodi-inputstream-adaptive-20.3.15-Nexus.tar.gz
+sha256  f67cfef057f8842716db4521a8cd3966c37a1da8fc3fb297527f6f25be20688a  kodi-inputstream-adaptive-20.3.17-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 267541ace9..ba4f6de61a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.15-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.17-Nexus
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
