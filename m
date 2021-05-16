Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616CFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD0A60C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CD0A60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED17F405A5;
	Tue,  3 Aug 2021 21:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2hQdzZvlbxT; Tue,  3 Aug 2021 21:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECFB840597;
	Tue,  3 Aug 2021 21:16:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4681C1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CF4C606DC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4szxlN4s4Yv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA67D60662
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2059A87BB7; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 13:36:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d60b443e7a95a2217fae669e2e8661ced4a925f
X-Git-Newrev: 97be782fd4dec3c75d5d4857914e91f91270fbfa
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.2059A87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bullet: needs wchar
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=97be782fd4dec3c75d5d4857914e91f91270fbfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bullet needs wchar since bump to version 3.09 in commit
28b4947ed8f53c4edfbf8fef9304dc76480c01ca:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/bullet-3.09/examples/ThirdPartyLibs/Gwen/Structures.h:42:14: error: 'wstring' in namespace 'std' does not name a type
   42 | typedef std::wstring UnicodeString;
      |              ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2b1158970fc45e9ebd4be4d726352166ed417a1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bullet/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index 5d8a57aa47..1f632b8931 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_USE_WCHAR
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
 	  Library.
 
 	  http://bulletphysics.org
 
-comment "bullet needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
