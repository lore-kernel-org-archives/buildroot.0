Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37CAC77B7F
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 04:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8977640C25;
	Fri,  5 May 2023 04:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8977640C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_wCwa8QZGtj; Fri,  5 May 2023 04:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B122C40186;
	Fri,  5 May 2023 04:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B122C40186
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A48391BF39F
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A488146C
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 04:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A488146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFg8Cf8iZCr3 for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 04:13:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D207881465
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D207881465
 for <buildroot@busybox.net>; Fri,  5 May 2023 04:13:36 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 16E6E440F87;
 Fri,  5 May 2023 07:07:50 +0300 (IDT)
To: buildroot@busybox.net
Date: Fri,  5 May 2023 07:13:10 +0300
Message-Id: <8bd45a8969a830626dc674204f09c522fd61bb6c.1683259990.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1683259670;
 bh=Z88Mktn6P3RlDLPaHgyjbl5gf2JJaC2gh4HO3m82Tc8=;
 h=From:To:Cc:Subject:Date:From;
 b=Sb0+QEO/3VJ9GUD1QonXEDk3j0DlsM/lAoN+5V2vgmptXCIEBwl8JDnG4TOO5heC4
 wgfNnyqfRq680+7trjC8mNlrbQeC+q4ESkd8Rzz2VE5zUxyvkPz/nuAlQ5cXBmz8wI
 lTPNhTYtiORAqulnCUJFPr94ji8zVLU9X/jiSs+4mo/CAtZMZVFoqpum8eT/gn9e4S
 jU9Vispj1CMQE44/SeunILZnuo13XKPoMhMk3A2puUFlj2I2mkTBI6puZoYNaRuDsW
 4n54HHv38JFUYLPKLfAojcyt9foveP0uzdxxKztZv1mxf1Po7Jy8vv69wNkAbDV6Hf
 YWvn6tBnPtn5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Sb0+QEO/
Subject: [Buildroot] [PATCH] package/libpcap: bump to version 1.10.4
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 270fd8869dac..34339c126196 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.3.tar.gz.sig
-sha256  2a8885c403516cf7b0933ed4b14d6caa30e02052489ebd414dc75ac52e7559e6  libpcap-1.10.3.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz.sig
+sha256  ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f  libpcap-1.10.4.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index d4292ae9a3fb..a4523f22182b 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.3
+LIBPCAP_VERSION = 1.10.4
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
