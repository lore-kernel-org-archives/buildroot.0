Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFEAC25B7C
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAAB605D4;
	Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0aiwsbRtNHg; Wed, 29 May 2024 07:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F0860732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F0860732;
	Wed, 29 May 2024 07:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1950F1D3285
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04808406E6
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrUOtDZAVxih for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5ABD40762
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5ABD40762
 for <buildroot@uclibc.org>; Wed, 29 May 2024 07:19:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CFE22876CE; Wed, 29 May 2024 07:19:40 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 29 May 2024 07:19:40 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: naveen.runjala@honeywell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16087-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16087] New: Make file compilation error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=16087

            Bug ID: 16087
           Summary: Make file compilation error
           Product: buildroot
           Version: 2024.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: naveen.runjala@honeywell.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

i was trying to build the kernel images for the freescale imx93evk bord.
seeing the below compilation error, after run the make:



/usr/bin/make install-leaf DESTDIR=../.././gcc \
  slibdir= libsubdir= MULTIOSDIR=.
/bin/bash ../../../libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc_eh.a ../.././gcc/
chmod 644 ../.././gcc/libgcc_eh.a
/home/kettos/nxp/imx93_buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/bin/ranlib
../.././gcc/libgcc_eh.a
/bin/bash ../../../libgcc/../mkinstalldirs ../.././gcc; /usr/bin/install -c -m
644 ./libgcc_s.so.1 ../.././gcc/libgcc_s.so.1; rm -f ../.././gcc/libgcc_s.so;
/usr/bin/install -c -m 644 ./libgcc_s.so ../.././gcc/libgcc_s.so
/bin/bash ../../../libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc.a ../.././gcc/
chmod 644 ../.././gcc/libgcc.a
/home/kettos/nxp/imx93_buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/bin/ranlib
../.././gcc/libgcc.a
/usr/bin/install -c -m 644 libgcov.a ../.././gcc/
chmod 644 ../.././gcc/libgcov.a
/home/kettos/nxp/imx93_buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/bin/ranlib
../.././gcc/libgcov.a
parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o crtfastmath.o";   
                        \
for file in $parts; do                                  \
  rm -f ../.././gcc/$file;              \
  /usr/bin/install -c -m 644 $file ../.././gcc/;        \
  case $file in                                         \
    *.a)                                                \
     
/home/kettos/nxp/imx93_buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/bin/ranlib
../.././gcc/$file ;;        \
  esac;                                                 \
done
Makefile:1020: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:280: recipe for target
'/home/kettos/nxp/imx93_buildroot/buildroot/output/build/host-gcc-final-13.2.0/.stamp_built'
failed
make[1]: ***
[/home/kettos/nxp/imx93_buildroot/buildroot/output/build/host-gcc-final-13.2.0/.stamp_built]
Error 2
Makefile:82: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
