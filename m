Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67BC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2AFB41C06;
	Wed,  3 Aug 2022 16:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AFB41C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlWmhbgdQi31; Wed,  3 Aug 2022 16:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB9141BDA;
	Wed,  3 Aug 2022 16:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACB9141BDA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 453DD1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B0960B5B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B0960B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YxFuzmvd84CT for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:36:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E723608B7
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E723608B7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EDA4186D77; Wed,  3 Aug 2022 16:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 18:35:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dceb0402a0647136393cedd93b49287dae9cc6c
X-Git-Newrev: af8a75fa0d65923b70c5fbcea4f00fb72c4860a6
X-Patchwork-Hint: ignore
Message-Id: <20220803162231.EDA4186D77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scipy: fix scipy::io module
 runtime dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af8a75fa0d65923b70c5fbcea4f00fb72c4860a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need python built with the --zlib feature, for the io
module to import properly and be usable

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scipy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 0fa6c9e311..229b5997ad 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
-	select BR2_PACKAGE_ZLIB # runtime scipy::io
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime scipy::io
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
