Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E44C48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD964812E2;
	Wed, 14 Feb 2024 15:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Q1vcpUHvMer; Wed, 14 Feb 2024 15:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888E38126E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888E38126E;
	Wed, 14 Feb 2024 15:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEE61BF313
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5F26063C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDIttn_L8Yhs for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 15:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5113B60633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5113B60633
 for <buildroot@uclibc.org>; Wed, 14 Feb 2024 15:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 261EF83A53; Wed, 14 Feb 2024 15:30:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 14 Feb 2024 15:30:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vfazio@xes-inc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15943-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15943] New: Reevaluate Python3 patches
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

https://bugs.busybox.net/show_bug.cgi?id=15943

            Bug ID: 15943
           Summary: Reevaluate Python3 patches
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: vfazio@xes-inc.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Currently, we have the following patches for Python 3:

0001-Make-the-build-of-pyc-files-conditional.patch
0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
0003-Adjust-library-header-paths-for-cross-compilation.patch
0004-Serial-ioctl-workaround.patch
0005-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
0006-Add-an-option-to-disable-pydoc.patch
0007-Add-an-option-to-disable-lib2to3.patch
0008-Add-an-option-to-disable-IDLE.patch
0009-python-config.sh-don-t-reassign-prefix.patch
0010-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
0011-Add-option-to-disable-the-sqlite3-module.patch
0012-Add-an-option-to-disable-the-tk-module.patch
0013-Add-an-option-to-disable-the-curses-module.patch
0014-Add-an-option-to-disable-expat.patch
0015-fix-building-on-older-distributions.patch
0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch


This issue is just to start some discussion on removing or reworking some of
these patches and to check upstream status

I'm going to skip 6-8, 11-14. These would be preferable to upstream or to find
an alternative disable mechanism but so far are necessary. Some seem to require
these build flags, others are being disabled via py_cv_ autoconf variables.

Patch 0001:
* Has no upstream status
* could maybe be upstreamed
* we disable it because:
  * we don't need all levels of optimization consuming disk space
  * we generate the legacy variants for sourceless distributions
(https://github.com/python/cpython/issues/95827)
* We could, instead, remove the files post build instead of patching to disable
it
  * this costs build time, but is one less patch to maintain since we already
have a hook to remove these files in python3.mk though it is not removing
opt-0.pyc

Patch 0002:
* no upstream status
* could maybe be upstreamed as you can't reliably run cross built code to
determine bugginess of a function
* patch could be removed if we define ac_cv_buggy_getaddrinfo=no like we do
other ac_cv values in python3.mk or if we explicitly set either
--(en|dis)able-ipv6
(https://github.com/python/cpython/commit/9635013a8fb68c044ea2cae2ec344b3940c188b2)
  * there could be issues if there is an actually buggy IPv6 implementation

Patch 0003:
* has no upstream status
* not likely to be upstreamed
* can probably be removed because these environment variables were dropped in
BR 0d327c267a57e3a75b10becde772addb7fc49297 so this patch isn't doing anything

Patch 0004:
* has no upstream status
* original discussion:
http://lists.busybox.net/pipermail/buildroot/2014-July/102202.html
* may not be needed for toolchains using kernel headers newer than 3.17
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f61bf8e7d19e0a3456a7a9ed97c399e4353698dc
* what's our required minimum kernel header version? If we had one defined, we
can make assumptions in our packages & patches.

Patch 0005:
* Upstream: https://github.com/python/cpython/issues/67096
* can likely be dropped since Python 3.10
https://github.com/python/cpython/commit/14086cfc5eed8c5e78342d79e5db87a135d75fa8

Patch 0010:
* no upstream status
* could maybe be upstreamed if the argument was made for it... the argument for
landing this is buttressed by the other disable flags we patch in

Patch 15:
* no upstream status
* no need for one...
* should be dropped, we do not use the build host's python when cross compiling
python as it requires a reasonably new version for regen, so we use the BR host
version which is the same as the target version to satisfy this.
  * As of 3.12 it requires 3.10
https://github.com/python/cpython/commit/146106a0f1cc61815fa33f0d3f808a3e3e3275be

Patch 16:
* no upstream status
* musl and uClibc do not have official upstream support though concessions have
been made for musl
* I think this needs more consideration... 
  * CPython has very specific checks for the PLATFORM_TRIPLET which got
reworked for 3.13 (and actually forcibly disables uClibc)
  * There's a bug in 3.12 where the "build_os" gets substituted for the
PLATFORM_TRIPLET instead of the "host_os", fixed in 3.13 via
https://github.com/python/cpython/commit/c163d7f0b67a568e9b64eeb9c1cbbaa127818596
  * this commit (c163d7f0b67a568e9b64eeb9c1cbbaa127818596) also changes the
PLATFORM_TRIPLET calculation
* The patch should maybe be changed to fix the build_os/host_os issue and add a
line for uclibc and/or to change the platform triplet detection code to
correctly identify musl/uclibc

Patch 17:
* no upstream status (cpython doesn't have uclibc support)
* should not be necessary for uClibc versions newer than 1.0.37 (see
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/libcrypt/crypt.c?id=6993d9378224489b49325bd1fb962f0e8bb935f1)
* Do we specify a minimum uClibc version requirement anywhere so we can make
assumptions in our packages & patches?

--

Should the option disable patches just be a single patch? If not, I think I'd
argue they should be the first few patches in the series. That way as we add
and remove patches there's less patch reordering.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
