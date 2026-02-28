Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D6FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1205417F0;
	Sat, 28 Feb 2026 14:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bXFWo_AizIV; Sat, 28 Feb 2026 14:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 009C1417FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772288454;
	bh=It/KGkUyF9qdU5dan/cDNdsfsGn3B2b3LKMDHnKeeDc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hNCFLhU4gBduBYTdMOXZqixr25mQAfCmygHgwErVOV6kDeg8CS5nl0DYS/WVNtCZU
	 Pydu9KHQsJ/koquZQiXfZdf4E9rJi+5/jNc2wvhylAFfQzBJoQFaygakWXcHF7v0SA
	 XuP2s7znMqzoHangVoQMb0f01tPsfod+v4DczvlYnyR3f5ExUQuhsNYVNYry07ympk
	 P7YbIRXktIPNIEmZIgsA1YZKPHxG+YfOvH4gKoFlX/sAsDMHHcv/+rd9EuCvcjbEjS
	 kKZY0jPfRqaBmWOdXas/2+9U0VF71uz7Kk38p86XJKoBqFg8x28tp9qZjblLmiusuS
	 NMyCkZnuf/oPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 009C1417FA;
	Sat, 28 Feb 2026 14:20:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF491D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30248607C1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WI9uTnPe0Jbj for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D35606CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85D35606CE
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:20:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E44C85AAD; Sat, 28 Feb 2026 14:20:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 15:14:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d332d9627c17defffda0cb64d20ee5735c0ee9fc
X-Git-Newrev: a7db1db0816d1e668b2802e9d1279915ef8b6634
X-Patchwork-Hint: ignore
Message-Id: <20260228142052.6E44C85AAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmodbus: bump
 version to 3.1.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7db1db0816d1e668b2802e9d1279915ef8b6634
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/stephane/libmodbus/blob/v3.1.12/NEWS.md

Added tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmodbus/libmodbus.hash | 3 ++-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 5c081d9710..ddca835f34 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,4 @@
+# From https://github.com/stephane/libmodbus/releases/tag/v3.1.12
+sha256  2f4d4191cd196c1fba131daec03b621db75129d8255c832fc66b259d9fc46e7b  libmodbus-3.1.12.tar.gz
 # Locally computed
-sha256  15b4b2e0f68122c2da9b195de5c330489a9c97d40b4a95d2822378dc14d780e7  libmodbus-3.1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4902d6257f..5d20aef35c 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.11
+LIBMODBUS_VERSION = 3.1.12
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
