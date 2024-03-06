Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B563DC54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1F9418EA;
	Wed,  6 Mar 2024 21:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdLz7qbmTTH8; Wed,  6 Mar 2024 21:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593D941901
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593D941901;
	Wed,  6 Mar 2024 21:36:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE281BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC93606ED
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLRHasw6TfEG for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4ABEB606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABEB606D5
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ABEB606D5
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvqr90T0; Wed, 06 Mar 2024 22:36:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:05 +0100
Message-Id: <20240306213606.2149683-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKeX8HOmXHZo8lOrd7EONARBGx2ODX/MOPa1mfH2bm8CqcVAczmH3EYvfgqP0neAoQxADVmMpcUXCod3fltGslCXxlLp4s4H3BQS/e5P/+UADszoYhjz
 Rgtaznbf8uGO+j9LOL1BvOjn6Cavz6vyuOAuxwdj3v4etczv2ZdL4Ky0t7VlijkQ0KTR+RCHrZK8kdeINvt5stWP1weTkUaXDvLKU5ukdaChDFutDAOXYdzZ
 j1og0pp9GlTy6+KYE98p+YxKJxNkN0jLxWf5cuoA28dTxKISlSnqBDrkp125LwTJkoJm8ZbEzi8AuXIm9TCgwyEBqSsVdAeZC59BG3VYeUDhT6NsV7BYJt0Z
 +lBYfpXUDEhV3rHYQMuzgCp2jNMDs4jVz95r+hZb3h0IFtQ2xlNK9psFe3V71FZD+G8ujdZ4QmyptxQdmHaEP+KEawwSkGJbFzqNNhskGmxTPFZbWTae66gx
 2R7CQTI90eN+d8efEFAEJDqgdGSFNShODnG2MkgTtRImRgxYq1MEYpKBrT4FjLuJf5yYa/siRCHjxqcX3zlmtzaTdHxPdO6Z1r8MsIIQHkwm0IXUooMDJ+ep
 WqU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760970; bh=jHFO1XTMWT6VtOkf8Amh1cAwAq8QZpwiiZGMzHIfz3A=;
 h=From:To:Subject:Date:MIME-Version;
 b=KX6bjQetZgj/oFqq6j9zq3SgcimDORYX7p2e49FfmSgPfD4BeGETT6Mmslj9fNQQ2
 lFZU1tqOzy6DCvW3Cj0lZ1AJLoZI/ysFfdBDAKr9VMlUh4sW4COKXt0i/okJMJ34jm
 o43jNGELaC13DX9/A5qBBIutwMkj/KhqTQybySuyjQqoZNPb0yKxfERu/tdzCls6zW
 BBo94qYzVyjq0U5RviXCbgiSmJskZs0Dc/TaIQ78dkjJMP/0uxanjcAVj5SAdHjq5Q
 DtRRSGmcLfxCx842fLXou1zJWWPv1XWp58SXQfzk9pwsftUYKg/xGCIAljoOmadoLI
 B9QVSNPgJHSCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KX6bjQet
Subject: [Buildroot] [PATCH v3 8/9] package/postgis: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/postgis/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 7d42390677..78569d63be 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_LIBXML2
@@ -18,7 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, not binutils bug 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
