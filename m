Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B0C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B878188D;
	Wed, 22 May 2024 11:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WukadY9WwSLV; Wed, 22 May 2024 11:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD5B81A30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD5B81A30;
	Wed, 22 May 2024 11:47:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63DA21C5AC2
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500BC40120
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVgnAjhlcsKO for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C18B40102
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C18B40102
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:47:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5668D87506; Wed, 22 May 2024 11:47:02 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 13:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b4ec03998e89003b11692ff7f7dad2453432f4e
X-Git-Newrev: 6ea7784c9427e25a3b4f39ab1cc82a9ac1c01966
X-Patchwork-Hint: ignore
Message-Id: <20240522114702.5668D87506@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: remove
 python-pybind from C++ dependency comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ea7784c9427e25a3b4f39ab1cc82a9ac1c01966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pybind dependency has been removed since the version bump to
0.3.2 [1]

[1] 06e1a3620e5268951be089d2b150c1802de7de4c

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-ml-dtypes/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 58c218b214..7dce2fea42 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_ML_DTYPES
 	bool "python-ml-dtypes"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on BR2_INSTALL_LIBSTDCPP # python-pybind, python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
