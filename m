Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CAEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BED94049C;
	Mon, 20 Feb 2023 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BED94049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChCWMMlCiUj6; Mon, 20 Feb 2023 20:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6BE41D00;
	Mon, 20 Feb 2023 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C6BE41D00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A61D1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FCC240BAA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FCC240BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq9qPM054CVr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF1AD40C0C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1AD40C0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC99C86494; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:09:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b79d735139282ecf052dc89d4c221bbd16447112
X-Git-Newrev: 0ad4301f608a270b6f463ebd91684cde0f584ebd
X-Patchwork-Hint: ignore
Message-Id: <20230220205146.AC99C86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/botan: add
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ad4301f608a270b6f463ebd91684cde0f584ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

add host-python3 dependency to avoid the following build failure raised
since the addition of the package in commit
e43da7bb32285bbd41b38a379aef77132d149df7:

(cd /home/autobuild/autobuild/instance-19/output-1/build/botan-2.19.2; PATH="/home/autobuild/autobuild/instance-19/output-1/host/bin:/home/autobuild/autobuild/instance-19/output-1/host/sbin:/home/autobuild/make:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ./configure.py --cpu="m68k" --disable-cc-tests --os=linux --cc=gcc --cc-bin="/home/autobuild/autobuild/instance-19/output-1/host/bin/m68k-linux-g++" --prefix=/usr --without-documentation --extra-libs=atomic --disable-shared-library --enable-static-library --no-autoload --without-stack-protector --without-os-feature=getauxval --with-boost --with-sqlite --with-zlib --disable-altivec --disable-neon)
/usr/bin/env: 'python': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
