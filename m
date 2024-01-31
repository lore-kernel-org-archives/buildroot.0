Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BDEC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 14:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BF283DB2;
	Wed, 31 Jan 2024 14:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BF283DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvtBX5k0G7Wn; Wed, 31 Jan 2024 14:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43AC7839DC;
	Wed, 31 Jan 2024 14:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43AC7839DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA81D1BF578
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 14:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31BD60F2D
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 14:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31BD60F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLYEMpa38xCm for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 14:10:11 +0000 (UTC)
Received: from mx.msync.work (mx.msync.work [62.182.159.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D0160F15
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 14:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D0160F15
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5072D107E; Wed, 31 Jan 2024 14:10:02 +0000 (UTC)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jan 2024 16:57:49 +0300
Message-ID: <20240131140930.159882-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1706710206; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=EiWlKVuqW+F3yQptNjpGucEnaQqesdHlCgARM4iFRl0=;
 b=cT2ElbVMyi+Uqs/O4oPYN5YyOmSTLVVaGTOeBNyLqWxfAhJV2UdFz8pOF5lPEGlOlcDNAi
 lJG4+aNKVPwxfyNSihqXwZt3AElpFQ91Rej9FD/KSu7t1OZYfArZ83j36lZ/g5WnkaOUzp
 RgKHvKJNi/xhbEyUg5b7PU7a2UXa2NDrGXk85nIC2vuvIBsYg6UnCw9+ka/HPoMhZmCVym
 eohx/wH+uUjPdm4FhYjVT+bfsdS9iSmd6Mnv9JQ7RnfV22rJwnlvm9HsZmX4MPA3JB+dRd
 C2HrUb3Zx30H5ffzU0Lht+MGse0Ksc8fUfzSShVH2WbqBBbA8y32UdyKt2Bjow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=cT2ElbVM
Subject: [Buildroot] [PATCH] package/rtl8822cs bump driver version to latest
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
From: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Viacheslav Bocharov <adeep@lexina.in>

- Update driver for kernel 6.7+
- Fix warning/errors on build

Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 4b44512913..34bcc412ce 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
+sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 6036acb864..dbdc7d84bf 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
+RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
