Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6A2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 286AA61414
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 286AA61414
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0055480BAA;
	Tue, 16 Nov 2021 20:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fx-O9-SnTDXI; Tue, 16 Nov 2021 20:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F0C80CC0;
	Tue, 16 Nov 2021 20:34:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3EE1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D05180F1F
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypXJG5G60FBW for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 674FC80F43
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BD5FE8D43D; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 21:14:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7413b8c6e4a2359b3f3f6e0fe8b83d77e0b46142
X-Git-Newrev: 3c2245cb65741c965f4bb87d35ac3c64f250a1ae
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.BD5FE8D43D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: select boost chrono and
 date-time with gcc < 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c2245cb65741c965f4bb87d35ac3c64f250a1ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
4e267a7d3d5d350710a81ada188a1629348e4b4a:

-- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time

Fixes:
 - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cxx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 6f1956f829..27a5f06988 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
