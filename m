Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950E7C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 22:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6B441BAD;
	Thu, 18 Aug 2022 22:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6B441BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9dbY9ra_NOy; Thu, 18 Aug 2022 22:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C3D4175C;
	Thu, 18 Aug 2022 22:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C3D4175C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09CE21BF33D
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7BB04175C
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BB04175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLBPJwkOhCsl for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 22:29:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEFF541758
 for <buildroot@uclibc.org>; Thu, 18 Aug 2022 22:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFF541758
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id AA48486CCB; Thu, 18 Aug 2022 22:15:18 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 18 Aug 2022 22:29:55 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ju.o@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14971-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14971] New: Kernel 3.10.108 fail to build in
 Buildroot 2022.08-rc1
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

https://bugs.busybox.net/show_bug.cgi?id=14971

            Bug ID: 14971
           Summary: Kernel 3.10.108 fail to build in Buildroot 2022.08-rc1
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: ju.o@free.fr
                CC: buildroot@uclibc.org, yann.morin.1998@free.fr
  Target Milestone: ---

Hi,

During a linux-backports update, it was found that kernel v3.10.108 was failing
to compile in buildroot 2022.08-rc1. See:
https://lists.buildroot.org/pipermail/buildroot/2022-August/649507.html

As reported by Yann, this was likely introduced by:
https://git.buildroot.org/buildroot/commit/?id=9b41b54be07711c10ad13ce157be272ed1cf402e

The issue can be reproduced with:

    make qemu_aarch64_virt_defconfig
    utils/config \
      --set-str LINUX_KERNEL_CUSTOM_VERSION_VALUE 3.10.108 \
      -e PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10 \
      -d PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
    make olddefconfig
    make linux

After some analysis, it appears that in 3.10.108, bison does not generate the
declaration 'YYLTYPE yylloc', which is also removed by the Buildroot commit
9b41b54b.  We end up with no declaration at all.  Those declaration are emitted
with the dtc-parser.y contains the '%locations' directive.

In the kernel, dtc was updated to v1.5.1-22-gc40aeb60b47a in:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0cec114e36606412908a35695a5db944cec2e3db

This commit is included in kernel v5.6.

This dtc update include the dtc commit:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=7150286225476345bd6e7312331e3baf4d621c32

which adds the '%locations' directive.

I'm able to workaround the failure by adding in linux/linux.mk:

define LINUX_ADD_DTC_LOCATIONS
  if test -e $(@D)/scripts/dtc/dtc-parser.y && \
      ! grep -Eq '^%locations$$' $(@D)/scripts/dtc/dtc-parser.y ; then \
    $(SED) '/^%{$$/i %locations' $(@D)/scripts/dtc/dtc-parser.y; \
  fi
endef
LINUX_POST_PATCH_HOOKS += LINUX_ADD_DTC_LOCATIONS

and add REGENERATE_PARSERS=1 into LINUX_MAKE_FLAGS. This basically adds the
missing directive, if not found.

Before sending a patch, I created this bug to log my findings and collect few
comments, if this is a good approach.  Any suggestions?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
