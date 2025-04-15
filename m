Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C24C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C649460E4B;
	Tue, 15 Apr 2025 20:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAJmnz84AJw3; Tue, 15 Apr 2025 20:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDCE76069E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCE76069E;
	Tue, 15 Apr 2025 20:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D26C7109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3BE940669
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGV7aAwn37VJ for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DD2640C51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD2640C51
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DD2640C51
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:01:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61D7D43163;
 Tue, 15 Apr 2025 20:00:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1u4mSm-009T14-1P;
 Tue, 15 Apr 2025 22:00:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>,
	buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:00:46 +0200
Message-Id: <20250415200047.2256467-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdetgeekkeejudeggeelleeuueehteduvddvjeekgfehgfdtieelheffvdeitddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: add (proposed) upstream
 fix for parallel installation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The openssl developers have proposed a fix for the parallel installation
issue worked around by commit 27ab880ebb9a (package/libopenssl do not build
in parallel).

Add the fix here so the workaround can dropped again.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...l-process-to-avoid-multiple-make-dep.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch

diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
new file mode 100644
index 0000000000..feb0e21ef7
--- /dev/null
+++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
@@ -0,0 +1,44 @@
+From 4562b002366535b3d387fae7fa1dbd8e315ae142 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Mon, 14 Apr 2025 12:23:15 -0400
+Subject: [PATCH] Serialize install process to avoid multiple make depend
+ operations
+
+If make install is run with a large -j value (make install -j N , where
+N > 1)
+
+We can run into a situation in which the install fails because multiple
+make depend operations are running in parallel, which will fail due to
+makefile rewriting.
+
+Serialize the install process to guarantee that those operations don't
+step on one another
+
+Fixes # 27074
+
+Upstream: https://github.com/openssl/openssl/pull/27388
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Configurations/unix-Makefile.tmpl | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index e85763ccf8..b671723813 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -650,7 +650,11 @@ depend: Makefile
+ # Install helper targets #############################################
+ ##@ Installation
+ 
+-install: install_sw install_ssldirs {- "install_docs" if !$disabled{docs}; -} {- $disabled{fips} ? "" : "install_fips" -} ## Install software and documentation, create OpenSSL directories
++install: Makefile ## Install software and documentation, create OpenSSL directories
++	$(MAKE) install_sw
++	$(MAKE) install_ssldirs
++	{- "\$(MAKE) install_docs" if !$disabled{docs} -}
++	{- "\$(MAKE) install_fips" if !$disabled{fips} -}
+ 
+ uninstall: {- "uninstall_docs" if !$disabled{docs}; -} uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -} ## Uninstall software and documentation
+ 
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
