Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7696C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 829AB40A49;
	Mon, 14 Nov 2022 15:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829AB40A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrgWwqRvoL0M; Mon, 14 Nov 2022 15:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD0B740A88;
	Mon, 14 Nov 2022 15:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD0B740A88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 152E41BF94B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4E0E40A13
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E0E40A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GA5Gugfqm_Nr for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E94DC409D9
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94DC409D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6C3383954; Mon, 14 Nov 2022 15:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:42:54 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7c737fbe6d7fa542bbcaa43bf40fa9b134870dcf
X-Git-Newrev: e829ece969c2e41de63466a138036ed89e5c160a
X-Patchwork-Hint: ignore
Message-Id: <20221114155133.D6C3383954@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/botan: add
 host-python3 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e829ece969c2e41de63466a138036ed89e5c160a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

add host-python3 dependency to avoid the following build failure raised
since the addition of the package in commit
e43da7bb32285bbd41b38a379aef77132d149df7:

(cd /home/autobuild/autobuild/instance-19/output-1/build/botan-2.19.2; PATH="/home/autobuild/autobuild/instance-19/output-1/host/bin:/home/autobuild/autobuild/instance-19/output-1/host/sbin:/home/autobuild/make:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ./configure.py --cpu="m68k" --disable-cc-tests --os=linux --cc=gcc --cc-bin="/home/autobuild/autobuild/instance-19/output-1/host/bin/m68k-linux-g++" --prefix=/usr --without-documentation --extra-libs=atomic --disable-shared-library --enable-static-library --no-autoload --without-stack-protector --without-os-feature=getauxval --with-boost --with-sqlite --with-zlib --disable-altivec --disable-neon)
/usr/bin/env: 'python': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0ad4301f608a270b6f463ebd91684cde0f584ebd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index b26ee4c66e..b0ebe594b1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -13,6 +13,7 @@ BOTAN_CPE_ID_VENDOR = botan_project
 
 BOTAN_INSTALL_STAGING = YES
 
+BOTAN_DEPENDENCIES = host-python3
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
 	--disable-cc-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
