Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0644C04FFE
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9052E414D6;
	Thu,  2 May 2024 08:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yp4DUszQqci7; Thu,  2 May 2024 08:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34294415BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34294415BB;
	Thu,  2 May 2024 08:37:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD8BE1BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0A2960E4B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB_yc8To8jL3 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31C360E4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F31C360E4D
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC1786608; Thu,  2 May 2024 08:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 10:36:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 02ff38a44ac38b98ce7b15dedd7af82d1315ca90
X-Git-Newrev: fe8897edff7da06e71eb7abddd96aa69b30a4071
X-Patchwork-Hint: ignore
Message-Id: <20240502083654.EEC1786608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gdb: bump 14.x
 series from 14.1 to 14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe8897edff7da06e71eb7abddd96aa69b30a4071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

According to https://www.sourceware.org/gdb/:

 This is a minor corrective release over GDB 14.1, fixing the following issues:

    PR symtab/31112 (DLL export forwarding is broken)
    PR c++/31128 (gdb crashes when trying to print a global variable stub without a running inferior)
    PR tdep/31254 ([gdb/tdep, arm] FAIL: gdb.threads/staticthreads.exp: up 10)
    PR gdb/31256 (Crash with basic 'list .')
    PR python/31366 (Frame.static_link() segfaults)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bfefed17a9e5a421b3217685003d3b22c99de4ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 891e45948e..53706cd3ee 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,5 +67,5 @@ config BR2_GDB_VERSION
 	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
 	# When making 14.x the default, or 14.x becomes the oldest version,
 	# be sure to update the target variant to properly select mpfr.
-	default "14.1"     if BR2_GDB_VERSION_14
+	default "14.2"     if BR2_GDB_VERSION_14
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index c62da28cbf..144f6da296 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,7 +3,7 @@ sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb748
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
-sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
+sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
