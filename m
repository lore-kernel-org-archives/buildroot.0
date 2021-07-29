Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE165C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 07:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B16261074
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 07:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B16261074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C31D83AD6;
	Thu, 29 Jul 2021 07:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLOVnlOIUX67; Thu, 29 Jul 2021 07:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D98C839E9;
	Thu, 29 Jul 2021 07:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0E9E1BF35A
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 07:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EB34606BF
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 07:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcOIKiEjyDCO for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 07:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84773606B8
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 07:13:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0FFB78917B; Thu, 29 Jul 2021 06:38:51 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 09:13:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84582b4d6a0ce87ff284600f68fa35a0772a39b8
X-Git-Newrev: 209e580219640fd0a12e6af15e4a611f4660fdba
X-Patchwork-Hint: ignore
Message-Id: <20210729063851.0FFB78917B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: fix syntax error
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

commit: https://git.buildroot.net/buildroot/commit/?id=209e580219640fd0a12e6af15e4a611f4660fdba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missed backslash to fix such error:
package/xml-security-c/Config.in:16: syntax error
package/xml-security-c/Config.in:15: invalid option
package/xml-security-c/Config.in:15:warning: ignoring unsupported character '!'
package/xml-security-c/Config.in:16: unknown option "BR2_TOOLCHAIN_GCC_AT_LEAST_4_7"

Fixes: bbda38afbbfa ("package/xml-security-c: new package")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xml-security-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 4c01855292..81d945f23d 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -12,5 +12,5 @@ config BR2_PACKAGE_XML_SECURITY_C
 	  https://santuario.apache.org/cindex.html
 
 comment "xml-security-c needs a toolchain w/ C++, wchar, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR ||
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
