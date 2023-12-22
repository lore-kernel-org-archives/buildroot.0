Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8848DC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 18:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB98183F7E;
	Fri, 22 Dec 2023 18:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB98183F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8YScrIH2CRS; Fri, 22 Dec 2023 18:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFA483F7C;
	Fri, 22 Dec 2023 18:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FFA483F7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADE01BF3EF
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 18:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E38D442D01
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 18:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38D442D01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmFUp4STbioA for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 18:56:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 284EB42CC9
 for <buildroot@uclibc.org>; Fri, 22 Dec 2023 18:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284EB42CC9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 10E2787D06; Fri, 22 Dec 2023 18:56:34 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 22 Dec 2023 18:56:33 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: meliodasren01@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15898-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15898] New: Unable to boot syslinux.efi produced
 by buildroot (EFI 64-bit), the one provided by the tarball works fine though
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

https://bugs.busybox.net/show_bug.cgi?id=15898

            Bug ID: 15898
           Summary: Unable to boot syslinux.efi produced by buildroot (EFI
                    64-bit), the one provided by the tarball works fine
                    though
           Product: buildroot
           Version: 2023.08.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: meliodasren01@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello,

Hopefully I am just missing something in my buildroot's menuconfig settings but
I can't figure out what it could be. If this is the case then it might be a bug
since I suspect the menuconfig should auto-select whatever I'm missing based on
the settings I chose.

Some of the settings currently set include:
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_EFI=y

The rest with "SYSLINUX" are =n.

Everything compiles fine. I end up with the following syslinux file after the
build finishes:
output/images/syslinux/syslinux.efi

It is 129717 bytes. 

I this should be the 64-bit version since I also have the following set:
BR2_ARCH=x86_64

However, this file does not boot.

I know that this file is to blame and nothing else because I can simply do the
following to boot successfully:
- extract the original syslinux compressed file
(dl/syslinux/syslinux-6.03.tar.xz), which contains a copy of the syslinux.efi
file that they build (and buildroot deletes during the build process)
- replace the syslinux.efi built by buildroot with the one extracted from the
compressed archive (i.e. syslinux-6.03/efi64/efi/syslinux.efi)
- this syslinux.efi boots fine, with no other changes made

Note: The one provided from the original compressed archive is 199952 bytes.

This leads me to believe that the syslinux.efi built by buildroot is missing
something, since it fails to boot and it's about 35% smaller than the original
provided by the compressed archive.

Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
