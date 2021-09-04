Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CE5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:47:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA8D60F42
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CA8D60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BF46079E;
	Sat,  4 Sep 2021 20:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuv6-fHcyGar; Sat,  4 Sep 2021 20:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F7260793;
	Sat,  4 Sep 2021 20:47:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39E921BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2F4D40167
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXE2ndmIKjfW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBDE4015B
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C575B8841C; Sat,  4 Sep 2021 20:44:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:35:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3560d99544a02e8aaa3093043f44ccdf1ec770f4
X-Git-Newrev: 53af97d57779f60175f0033c7a3a32232dca2f10
X-Patchwork-Hint: ignore
Message-Id: <20210904204445.C575B8841C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/python-matplotlib: merge dependency comments
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53af97d57779f60175f0033c7a3a32232dca2f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d77aba25a55560d4c15bf319d6dc24619232a8ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-matplotlib/Config.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index e7e2804b4f..afc090856f 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -34,8 +34,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-comment "python-matplotlib needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
