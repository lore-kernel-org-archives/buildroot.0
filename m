Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A53C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 10:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FCC605A7;
	Sun,  5 Mar 2023 10:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3FCC605A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUC4ivP29sr9; Sun,  5 Mar 2023 10:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADC260FA4;
	Sun,  5 Mar 2023 10:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADC260FA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770B81BF868
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51BAD40227
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51BAD40227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JyX38TPGK3L for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA604018F
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA604018F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54C2486201; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 11:24:52 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c88787ada849749b001ed27bffaa53fdc08166c1
X-Git-Newrev: 3e3ac87a9b6839126fc8a8ff33985d9a44039177
X-Patchwork-Hint: ignore
Message-Id: <20230305103136.54C2486201@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 support/dependencies/dependencies.sh: require FileHandle perl package for
 syslinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e3ac87a9b6839126fc8a8ff33985d9a44039177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 474196d6bb410c0a9f5e1c8bb7018594a29a57bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 70e951a7e6..1224220ac9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -307,6 +307,10 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
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
