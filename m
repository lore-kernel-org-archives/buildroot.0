Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DDC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB57605A1;
	Mon,  3 Feb 2025 14:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DRA9WaH9ULw; Mon,  3 Feb 2025 14:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B86360C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B86360C20;
	Mon,  3 Feb 2025 14:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8281A2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D404605A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3YI7grxlnqQ for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91175608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91175608E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91175608E4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C87944433B;
 Mon,  3 Feb 2025 14:27:53 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Clement Ramirez <clement@clementramirez.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Feb 2025 15:27:40 +0100
Message-ID: <20250203142748.1135655-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
References: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdeguddtgffhteeflefhtdetvedvledukeekiedugeejhefgveduueduueethfenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegtlhgvmhgvnhhtsegtlhgvmhgvnhhtrhgrmhhirhgviidrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738592873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTDYg1BnkzQSX9CX1oJaLS3ehNxgfm7ZtfQkBdPhQP8=;
 b=CnxsM1WBQJs40px8SqZSQ7ehZ37kdvm8M8YecjPk3H9yWVTCpfzI8kx+FtiOHCpdReOSij
 IkU9U0ZNJ8a+D3Zq4sbOkeE6omvqzeU+FsOj9uFJYlRbbTcHgYrxNdu9Btsz7Jzb6QdhcI
 n04Zc3Q+cPNYi3hvG0sZKj1GN+xiv29ky+bXsCrW0euzWeSQuL6drC4EGtzpGdOIo9GHin
 hyvPfsfywu8L43/s5XbBDj58AEKRvdRt3hGI5ZtBvDv4YTmwg7A+f5vuMxH/qvEzksv2Xw
 8LFRDU0G+hUE2SsCn/76Vw2UNQpSRLKpzy69dPKg9n1bbsPCmCOORoLn9PN1Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CnxsM1WB
Subject: [Buildroot] [PATCH 1/4] package/busybox: fix patch 0009 formatting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As it is, patch 0009 cannot be applied with "git am", so fix its
format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-failing-saying-ncurses-is-not-found.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
index 4651d8c2c9..f4a926ae37 100644
--- a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -1,6 +1,6 @@
-From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
-From: ctxnop@gmail.com (Nop)
-Date: Sun, 21 Jul 2024 14:10:52 +0200
+From 32949508fe566aee8988cb6d8ee101ecc5e49a65 Mon Sep 17 00:00:00 2001
+From: ctxnop <ctxnop@gmail.com>
+Date: Sun, 26 Jan 2025 20:59:20 +0100
 Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
 
 Newer GCC increased diagnostics levels resulting in considering the
@@ -17,13 +17,12 @@ Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
  scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
-b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 5075ebf2d..c644d1d48 100755
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..08e4da3de 100755
 --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
 +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
 @@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
-
+ 
  # Check if we can link to ncurses
  check() {
 -        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
@@ -34,5 +33,6 @@ index 5075ebf2d..c644d1d48 100755
  EOF
  	if [ $? != 0 ]; then
  	    echo " *** Unable to find the ncurses libraries or the"       1>&2
---
-2.45.2
+-- 
+2.47.1
+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
