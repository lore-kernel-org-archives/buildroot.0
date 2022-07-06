Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30822C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 08:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AF5483438;
	Wed,  6 Jul 2022 08:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF5483438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3iPNGQnM_Be; Wed,  6 Jul 2022 08:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 354F08322E;
	Wed,  6 Jul 2022 08:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354F08322E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53D1F1BF83C
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 08:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EEC38322E
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 08:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EEC38322E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQ2logznG1E5 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 08:38:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06E7F8316A
 for <buildroot@uclibc.org>; Wed,  6 Jul 2022 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E7F8316A
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 58A568251A; Wed,  6 Jul 2022 08:25:13 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 06 Jul 2022 08:38:10 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: w.meganck@televic.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14901-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14901] New: QT5webengine 5.15.8 build problem
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

https://bugs.busybox.net/show_bug.cgi?id=14901

            Bug ID: 14901
           Summary: QT5webengine 5.15.8 build problem
           Product: buildroot
           Version: 2022.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: w.meganck@televic.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I can't build qt5wbengine.
[18472/21833] LINK v8_snapshot/gen-regexp-special-case
FAILED: v8_snapshot/gen-regexp-special-case 
/home/wm/projects/televic/buildroot/output_plixus_mmu_idc_imx6/build/qt5webengine-5.15.8/host-bin/python
"../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py"
--output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie
-Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack -Wl,-z,relro
-Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -pie -Wl,--disable-new-dtags
-Wl,-O2 -Wl,--gc-sections -L/usr/lib -o "v8_snapshot/gen-regexp-special-case"
-Wl,--start-group @"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,--end-group 
-ldl -lpthread -lrt -licui18n -licuuc -licudata
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicui18n.so when
searching for -licui18n
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicui18n.a when
searching for -licui18n
/usr/bin/ld: cannot find -licui18n
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.so when
searching for -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicuuc.a when
searching for -licuuc
/usr/bin/ld: cannot find -licuuc
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicudata.so when
searching for -licudata
/usr/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libicudata.a when
searching for -licudata
/usr/bin/ld: cannot find -licudata
collect2: error: ld returned 1 exit status
[18480/21833] CXX
host/obj/third_party/perfetto/src/tracing/core/service/tracing_service_impl.o
ninja: build stopped: subcommand failed.
make[5]: *** [Makefile.gn_run:356: run_ninja] Error 1
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:292:
/home/wm/projects/televic/buildroot/output_plixus_mmu_idc_imx6/build/qt5webengine-5.15.8/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2

Which version should be libicu?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
