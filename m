Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EBEC19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 13:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB08A404D3;
	Sat,  6 Aug 2022 13:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB08A404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCIRn5Lxe3na; Sat,  6 Aug 2022 13:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2AF040165;
	Sat,  6 Aug 2022 13:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AF040165
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CBD61BF2B5
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06CDE416BE
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 13:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06CDE416BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0__TXMHVJ8FX for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 13:57:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EBFB416BC
 for <buildroot@uclibc.org>; Sat,  6 Aug 2022 13:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBFB416BC
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 02E74868EF; Sat,  6 Aug 2022 13:42:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 06 Aug 2022 13:57:04 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.05.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.roehmel@rwth-aachen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14946-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14946] New: Missing dependencies for virgl xorg
 configuration
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

https://bugs.busybox.net/show_bug.cgi?id=14946

            Bug ID: 14946
           Summary: Missing dependencies for virgl xorg configuration
           Product: buildroot
           Version: 2022.05.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: tobias.roehmel@rwth-aachen.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi all,

I was trying to run buildroot on AARCH64 softmmu Qemu with X-server and virgl
graphics acceleration and found out that it doesn't work without these 2
configurations: BR2_PIC_PIE (RELRO Protection=none) BR2_PACKAGE_LIBEPOXY.

My buildroot configuration is qemu_aarch64_virt_defconfig + the graphics stuff
as in the attachment.

If RELRO Protection is enabled, the X-server loads libraries in such an order
that virtio_gpu_dri.so (the virtio GPU driver) is not found.

If BR2_PACKAGE_LIBEPOXY is not enabled, xorg is built without glamor_gbm which
makes the dri2 initialization for the driver fail.

I'm not a graphics expert so I don't know if this is somehow intended. I think
it would be easier if these dependencies would be sorted out automatically.

The Qemu I used is upstream with the following configure:
configure --target-list=aarch64-softmmu --enable-debug --enable-opengl
--enable-virglrenderer --enable-gtk --enable-sdl
and the following command:
qemu-system-aarch64 -machine virt -cpu max -kernel Image -serial mon:stdio -m
size=4G -device virtio-gpu-gl-pci -display sdl,gl=on

Best regards,
Tobias

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
