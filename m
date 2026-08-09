Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC1AC5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 11:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E689980DBB;
	Sun,  9 Aug 2026 11:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAiCrDTf8TJ8; Sun,  9 Aug 2026 11:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 145A080DBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786273395;
	bh=/Y4u6b5apDZPFbS/3WrbkS8M8E3El/9/EAOkF2X37ok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OB6n/sSw9lIvICEzzVDbIO4D+4PVGh5Uf7KHkT6FHi71ASbglGo2eSFr0Vz8BGgeU
	 Kl1+KbJcqqxWkpRAL4FzrmQg4TOMRc8KVIIClTWEFxPX1QGVa7Ej5TCxF7sIZ2MtB0
	 +2EkSnV8+zUN+9t2KMw8K4VtUu/AUAX1Zv7HofC4uRPclGYcp9l5JZ4YCQbziWcdF9
	 6ls9VlTnBfkQFGH5H8nqCXsRRZxPhXy1ygINMDLtmMkr19R9lOHlpH5smeffH5oTkv
	 BOUznjzXyqhnuNBuqXS8x21lnOal2AK+kf3860/CyBRvgP/nsTY+K3kjAyRPhnQxRC
	 OeFZgVrEJMyag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145A080DBC;
	Sun,  9 Aug 2026 11:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EFD028A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7576E4053E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mniIBDimmdSj for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 11:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72C24052B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72C24052B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 11:03:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 294758D20E; Sun,  9 Aug 2026 11:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 13:02:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4456d899d0481efe7e7994090d0b709dbba47f39
X-Git-Newrev: d1473993d17bb9592406478689528411cfe13d0e
X-Patchwork-Hint: ignore
Message-Id: <20260809110225.294758D20E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: fix Config.in comment
 dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1473993d17bb9592406478689528411cfe13d0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit fef9cad1fe84b4366e705adb03470e12199ffd25 ("package/libxmlsec1:
bump version to 1.3.12") has introduced a gcc 7.x and atomic
dependency, but the Config.in comment dependencies are not correct:

+comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
+       depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_ATOMIC

Indeed, we treat BR2_TOOLCHAIN_HAS_ATOMIC like an architecture
dependency in Buildroot, so it should be:

+comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

so that the comment does NOT show up when BR2_TOOLCHAIN_HAS_ATOMIC is
false.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlsec1/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
index 782e6ced7c..9270447510 100644
--- a/package/libxmlsec1/Config.in
+++ b/package/libxmlsec1/Config.in
@@ -14,4 +14,5 @@ config BR2_PACKAGE_LIBXMLSEC1
 	  https://github.com/lsh123/xmlsec
 
 comment "libxmlsec1 needs a toolchain w/ gcc >= 7"
-	depends on  !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
