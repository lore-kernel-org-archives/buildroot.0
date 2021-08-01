Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFE3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:39:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D0C61058
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12D0C61058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DACE740236;
	Sun,  1 Aug 2021 09:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOqrX9tTvfx4; Sun,  1 Aug 2021 09:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2F2A4010A;
	Sun,  1 Aug 2021 09:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11EC31BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F93E836A5
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE7agOry3Gd0 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B54C836AE
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 62B418A395; Sun,  1 Aug 2021 09:38:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c8cb0204ff44cb507ba6b8b4aa3476d668b873
X-Git-Newrev: b1af56fddc556973aada3f220812a3bcd386146f
X-Patchwork-Hint: ignore
Message-Id: <20210801093845.62B418A395@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: needs gcc >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1af56fddc556973aada3f220812a3bcd386146f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cegui needs gcc >= 5 since bump to current master in commit
352a8b3fe8b1d78073b1119369f10688e00bc859 and
https://github.com/cegui/cegui/commit/17f7f6156eb0ba903d5ae926e372b8c5c26d8c68
or the build will fail on:

/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp: In member function 'virtual CEGUI::String CEGUI::Spinner::getTextFromValue() const':
/home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp:310:116: error: 'defaultfloat' is not a member of 'std'
             tmp << std::fixed << std::setprecision(d_precision) << d_currentValue << std::setprecision(defPrec) << std::defaultfloat;
                                                                                                                    ^

defaultfloat is not available before gcc 5 and
https://github.com/gcc-mirror/gcc/commit/c4b64f5bcac6f7d5e1ae7d3026a3e228fb8adbbd

Fixes:
 - http://autobuild.buildroot.org/results/006ce109980a76870d2347e53307082b36d9904a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cegui/Config.in b/package/cegui/Config.in
index 1bd0ee1cc3..20b865835b 100644
--- a/package/cegui/Config.in
+++ b/package/cegui/Config.in
@@ -1,11 +1,13 @@
-comment "cegui needs a toolchain w/ C++, threads, dynamic library, wchar"
+comment "cegui needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-			|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+			|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+			|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_CEGUI
 	bool "cegui"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11 PR59987
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GLM
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
