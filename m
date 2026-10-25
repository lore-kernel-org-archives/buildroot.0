Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512F606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UgKcVY3U
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E93D6061D;
	Sun, 25 Oct 2026 21:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKHQRyHydZG1; Sun, 25 Oct 2026 21:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AFDDF60607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963305;
	b=HBkajHKKYp6mF/YeqOyDqW/YGkX/Z16c9Erdd/6qoZyxUcd196gQefcV+FPhr8PZ0ooJ
	 hEyg6FVoxBrtE1qOzgRLmwA4+3c2XtGtYhkPauSnp1X+vSB/zl0/8JC2sR40iyPr68Ski
	 IULRyrLd04f93c7Iz+g1OZfoAhuG4+r7av6s3c2BRN/tstDqVONDMFjvdN6rvI/0xMFeJ
	 71JXnACyiDAjbWtXRAwEEzhGaGgB/lP0fWh5G2JIPul9yxEkSVGbuXAX6RZBWfc5tg+yN
	 w0fuRqRksqDj9eqr63+rmer58MzuA8MIT1RbIX6/lf1zFCQeIWuU0jxnPLzpwnANHuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFhBlxqxEjsWIsUBqn90sqnSieirg8TOuXw5+2dXxJE=;
	b=sP/19bdv9qj6o50czT1Ti4qO8dOjEjGRNfA9Uh3cbkk/tQLa4BkhE7f1WEjIYlBRibhR
	 HgHHwcBOhhqRRgyBKBTK3JcWjBRyuHomb034hfCNkvc9NOB7xb78QrWuAJFzRVdiND/SG
	 F7vqlgjBzazGCeJdcGPLCKkNRPVJ2NK8GpGx41s5GAcgeodFaPiRChFwJ7TmNdfzefk/2
	 uwDhg16nfVGFtOS+42gbAcEmwPGBkiO0yx08dBk+ltt5PvqwW8lJxivBFmX5NlLmjotEp
	 uEzXaB4dKaVjraXq4bjvLvbVz+h2d5dQ66bOxXZZBmRee78/BITGlsTRYdCW5Eeo6fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963305;
	bh=tFhBlxqxEjsWIsUBqn90sqnSieirg8TOuXw5+2dXxJE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UgKcVY3UACrWoim+/OOo1KKrZUA09M5W/yO+S8rIuu4ZG7AxLeAJUvXPlmnutavDj
	 4mI0Fd1/HEknIwZ0FQI+IzR76zHs66xgwrk3zuGQLTsBgNnmi6XsMSKEOingXmhqsJ
	 S5kRVWXms48sPP3UYAvXoI2+z8I7i7X7roYEc6gDoW883WsiBZZzNKvNlRpbO0YQEa
	 20Jenv9laq9DH0OEUt0Z7af89T96d2CL2yD92/8cZOF8aJicts8VcA+XXLnClbykd7
	 21FHBaLBXp+QG60hpDCqIeylCXWsDiA4LXKDQ6q9PjR+01eIZN/06yXqXZfdLavO+k
	 7hSdvRLXa9meA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDDF60607;
	Sun, 25 Oct 2026 21:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C01B3334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8C180D47
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJddBDDc2eJj for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:21:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07DB580D32
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963303;
 b=QVcGk9dDGGmiX1c/OxdvD48U5n/FgY9Ckh9p8q9fL/c9PUaGTnRPjmOqxL3iKESSLUHd
 j8gptezmTMM57+ut27xFim/vZ5Z2PBXrksivWI/b8ylg5ZUlk8xk0Ch26o+AGEuJzyzGL
 YdDLfZSzw6wUckaNEI6MBJ225uLtabfuml/8QplVNqdvzoICoZNu080oCSLLLQJiWpb9w
 yn0SQRYwo0SmXgAjaN6JkkD1bwI8iz73tqbo24PDQ/hyoNhP/VBzZbF6EELaiAqjQ+N+w
 VC9B2MkNsegMUhdHVOGllXKGK5mG68If/QVum6fbEXOqpV9TDuxw/8LnMUwmPCZnx5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963303;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=KjdfbhC9jjSRhZf8EQYS22biCByOtBo/xUshLQgOWSE=;
 b=mvR4EtvnrXx+USW0V4+fGjKqYVEKq3NniYp6Q2Bksc8W66P7vZTj13tkVhuyLP3a8kh8
 iVhhAWN3tDuRdNqmI3xSmWTdp3jECvNCT4E4z/GzfNJqL1EeS/vevzRCGoccYZckjSCYt
 GxApnlOnL6CJYdunAUCbDdnHfZDpNUFPZ4WfrWrLn8FK07mT7n5/eSwogSGNfHdWnyoSA
 9ZT7JnCFQR93FHMafSz9o8lrHgP7in+wZYr9koQhDw3u15MeYQtSmbngjl7NC9rETaB3I
 vhXccm1qXOjnVecku9nK4DoB9NIzFmZeOyI5Zk6gj9aUQh1/UTZNeAiQdcgOtfdrlFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aWFlDVeY; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DB580D32
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1xT2Gs36Cz-007Y6u; Sun, 25
 Oct 2026 22:21:39 +0100
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 25 Oct 2026 22:21:22 +0100
Message-ID: <20261025212123.4106996-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BR7gafNbbycDaATxg89IXZDIjAMfxXJWRjNfH5A6AFgsjfsBBOG
 YiMQjpX3KnBPG6HEv9ZwLqY8q1YsdgY2b0mZIGrfziY9Cz+3a+hHiTFF155v7d6AGksktZc
 HLFdeHjp7RmmAx06Q5fO13FEeRFhO5vWaocnNt7MTYla+8bzJTOb5RID0OsAVgDOkwTcYLI
 LimwqzQl4+clPCOTb7a9w==
UI-OutboundReport: notjunk:1;M01:P0:uCOuR1WVTfM=;JhOMq0fjgJgYM8ZBHOg2CLeNb2F
 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
 MfZKABb6OJ9jIdBit3d3GujDFCfGA+hoH451A==
Subject: [Buildroot] [PATCH v3 1/2] boot/uboot: make binman dependency on
 host-python-pkg-resources optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Binman needs pkg_resources only in U-Boot versions before 2025.10,
otherwise the dependency is unnecessary and best avoided.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* rename option to
  BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES
* remove unnecessary "depends on"

Tested with engicam_px30_core_defconfig, which uses U-Boot
2025.04. With
BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y the build
works, without it binman fails because it cannot import pkg_resources.

engicam_px30_core_defconfig appears to be the only defconfig that uses
binman *and* a U-Boot version < 2025.10 according to output of:

grep UBOOT_CUSTOM $(grep -R -l BR2_TARGET_UBOOT_USE_BINMAN configs/)

Nonetheless, if any defconfigs you care about use binman, please
verify and if needed (preferably) update U-Boot or enable
BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y.

 boot/uboot/Config.in | 13 +++++++++++++
 boot/uboot/uboot.mk  |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 381a12197d..ad3efaf4be 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -379,6 +379,19 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2026.10/develop/package/binman.html
 
+if BR2_TARGET_UBOOT_USE_BINMAN
+
+config BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES
+	bool "binman needs host-python-pkg-resources"
+	help
+	  In U-Boot versions before 2025.10 binman uses the Python
+	  module pkg_resources, which used to be provided by
+	  python-setuptools before version 82.0.0. Select this option
+	  to use backported pkg_resources when building old U-Boot
+	  versions.
+
+endif
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7e831f6c3..ba6f608751 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -312,10 +312,12 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+ifeq ($(BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES),y)
+UBOOT_DEPENDENCIES += host-python-pkg-resources
+endif
 endif
 
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
