Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26826EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 18:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D12410E5;
	Sat,  1 Jul 2023 18:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D12410E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDDwV9PmZkTm; Sat,  1 Jul 2023 18:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9867414C0;
	Sat,  1 Jul 2023 18:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9867414C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 875C91BF329
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5BC4019D
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 18:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E5BC4019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G02P5n6cuE9t for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 18:18:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CBAC4011A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CBAC4011A
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 18:18:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79D55A4C00BC;
 Sat,  1 Jul 2023 20:18:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48878)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFfBL-0001wo-0u;
 Sat, 01 Jul 2023 20:18:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Jul 2023 20:18:51 +0200
Message-Id: <20230701181851.286915-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688235531;
 bh=eYNin0vQkNrZWCrvImp6gXIFN185NxbzEwfadFys3No=;
 h=From:To:Cc:Subject:Date:From;
 b=rLF4vOLG9otmnvO9x2Wr1HOp8jJs9Ja482e9O7lhDy5KAwBOAGz+NlJ7qNIOubShd
 A/kDfg84GS5OuAxpyN9LBYVNQK5SQi3PoOOrnplgVspY85sjqcxwY3t0vltUzgD6I7
 Q7wwyuc+srdaR0F7JxFPo3lHpf+lNELQywpEezfRtKouUUK4SVVO/UAN2+DD3xm9jK
 zoM413lJARPVvS+rHXt871XoVwdeEBD788vlEt0X+dChXro2mfriwM+W6tZf60OZxv
 Oer6//uoAhvbPmDnYjYnkG3uSU8lDX++qOyjIWpugoc73GpyoxN/VmXKB+q/CH0Ll8
 PqV4ee46kz2uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=rLF4vOLG
Subject: [Buildroot] [PATCH 1/1] package/rygel: Fix Config.in comment
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the comment out of the if-clause and include the python3 dependency

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rygel/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index 30e8430537..e160068a55 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -52,12 +52,12 @@ comment "gstreamer1 needs gst1-editing-services"
 
 endchoice
 
-comment "rygel needs a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
+endif # BR2_PACKAGE_RYGEL
+
+comment "rygel needs python3 and a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_8
-
-endif # BR2_PACKAGE_RYGEL
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_PACKAGE_PYTHON3
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
