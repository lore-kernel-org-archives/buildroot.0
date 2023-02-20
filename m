Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF06C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64272801CF;
	Mon, 20 Feb 2023 20:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64272801CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIOQZpCMuymG; Mon, 20 Feb 2023 20:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79EB081F23;
	Mon, 20 Feb 2023 20:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79EB081F23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978DF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 712A581F23
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 712A581F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFe1tCR9kD2E for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DDF81B14
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DDF81B14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 774428643D; Mon, 20 Feb 2023 20:39:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:39:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e8cce6f2b1936dbda9d63ddf4f41acf59a64113
X-Git-Newrev: 474196d6bb410c0a9f5e1c8bb7018594a29a57bb
X-Patchwork-Hint: ignore
Message-Id: <20230220203958.774428643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 require FileHandle perl package for syslinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=474196d6bb410c0a9f5e1c8bb7018594a29a57bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslinux needs FileHandle module:

Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/makeerrlist.pl line 8.
/home/buildroot/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-gnu-gcc -Wp,-MT,errlist.o,-MD,./.errlist.o.d -Os -march=i386 -falign-functions=0 -falign-jumps=0 -falign-labels=0 -ffast-math -fomit-frame-pointer -std=gnu99 -m32 -mpreferred-stack-boundary=2 -fno-stack-protector -fwrapv -freg-struct-return -fPIC -fno-exceptions -fno-asynchronous-unwind-tables -fno-strict-aliasing -falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0 -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include -I. -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/../include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/include/sys -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/core/include -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/com32/lib/ -I/home/buildroot/autobuild/instance-0/output-1/bu
 ild/syslinux-6.03/com32/lib/sys/module -I/home/buildroot/autobuild/instance-0/output-1/build/syslinux-6.03/bios/com32/lib//../.. -W -Wall -Wstrict-prototypes  -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME -DPNG_NO_WRITE_tIME -mregparm=3 -DREGPARM=3 -c -o errlist.o errlist.c
cc1: fatal error: errlist.c: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/de88089888b2ca354b28af3550abf846560da7d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 4353e9585e..a692856d31 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -298,6 +298,10 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
     required_perl_modules="${required_perl_modules} JSON::PP"
 fi
 
+if grep -q ^BR2_TARGET_SYSLINUX=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules FileHandle"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
