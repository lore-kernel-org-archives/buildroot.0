Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5AC00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D35C60B96;
	Sat,  5 Aug 2023 21:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D35C60B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTdqBZIe3HHn; Sat,  5 Aug 2023 21:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3FA660B06;
	Sat,  5 Aug 2023 21:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FA660B06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9371BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EDFA60A82
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EDFA60A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqyV0wv-LGmr for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:35:08 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9469160C1F
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9469160C1F
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51904A4C03A4;
 Sat,  5 Aug 2023 23:35:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOvS-0000qD-0D;
 Sat, 05 Aug 2023 23:35:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:35:05 +0200
Message-Id: <20230805213505.3588260-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271306;
 bh=poMKimMcDYGay30DjOHqXropK/iYnSlCVx4TeSeJ8vs=;
 h=From:To:Cc:Subject:Date:From;
 b=BIPfSI4SSYz9zZkjh596rZJg3OeUWAIKmYaCQsI0G1yrykquI7I8KCzAEmp1tvDmH
 dWKBwIG315WhBH7bfUe9FUZ0c+VGS9zgPtI/8GzHvmec/hmIH+p4h+xXwJP4r60Mef
 ChXr+BC5UgLuVEx0Ho0ueoBFQQImpqU+5ot6Bo0xGzehopiW/++ViNwHqUQMtavQau
 Se6J8VgxJ4x2X03GBNkKsbq+F2Zrk4qxbU1MVSdhCTeEYa9LOGuYovzhE+cWLND7LN
 SeMIVrcgrUOC222EhW7t0AUXFzVz7rWIvqBXLVjMN2Nf0UslYiztFBO/g9ZBVvjVI4
 FZ8P5Ap9cZ/Zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BIPfSI4S
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump version to 0.3.77
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 98de073bdb..88fd9c2fab 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b30d886b87aa8c055af6d6c7261d1d04336f3a75221c31afe1ea8ba86184bf70  pipewire-0.3.74.tar.bz2
+sha256  3027cadf9933adb03b1895069c79f4eb39f7f2873b962c674ee1fec316ec60e1  pipewire-0.3.77.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 24e642b418..994da081b7 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.74
+PIPEWIRE_VERSION = 0.3.77
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
