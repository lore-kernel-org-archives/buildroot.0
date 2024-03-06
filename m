Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36545C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047E6418C2;
	Wed,  6 Mar 2024 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-C2IEuN4C-d; Wed,  6 Mar 2024 21:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E826418EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E826418EA;
	Wed,  6 Mar 2024 21:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A8361BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377EA418DC
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmS5v6nNttRE for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03F4A403EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03F4A403EA
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03F4A403EA
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvpr90Sn; Wed, 06 Mar 2024 22:36:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:04 +0100
Message-Id: <20240306213606.2149683-8-giulio.benetti@benettiengineering.com>
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
 t=1709760970; bh=0dGDQMJ+5q6XdAZcrkMg4EHrcmjQEDpOO48yZPxP0Fs=;
 h=From:To:Subject:Date:MIME-Version;
 b=JGUjpM6fD/s4b4oa/8CbElgR0YBfoiX6O+a3k80dOu2lC6+CceYkH2kBMUy7W07sj
 Bim8E1F7rdS6uOTLjPh8q8LseBjraQ9vZK5BUIzY2CMaC+lPdaUxLSiB7xFgz/AWfW
 vLcFHtSIBQN5obML0bbhMHisJNHU8jgvp6viov3tcvc+G6Xxz4wzehewCjkfti9fOi
 kPyMgDqHg9J7VxLjBOqCKfRoHBJO4oGOIX0lZYIrz8RDp5iN1TbduNQPuEWtW3o0w2
 ssP4fIS7fASPOAi9LefqNu2E+0Bwiyoywk4JUu85ZGTstoAG25ltAkVfoRcBpjH4RP
 SPqji1HkhgpxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JGUjpM6f
Subject: [Buildroot] [PATCH v3 7/9] package/pistache: drop nios2 binutils
 bug 27597 dependency
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
 package/pistache/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 3acf1f53f0..ca2d2833cd 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
@@ -13,9 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
