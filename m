Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE103C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 11:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1CA4608FB
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 11:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1CA4608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FCB540253;
	Sun,  5 Sep 2021 11:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRWQ74n_rxok; Sun,  5 Sep 2021 11:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7297740225;
	Sun,  5 Sep 2021 11:16:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2D131BF580
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 11:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF7F40225
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 11:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIo-A9nRN3iI for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 11:16:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A6F400C9
 for <buildroot@uclibc.org>; Sun,  5 Sep 2021 11:16:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CD27088542; Sun,  5 Sep 2021 11:14:37 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 05 Sep 2021 11:16:01 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leon@exquisip.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-14196-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14196] New: when using
 raspberrypicm4io_64_defconfig,
 make fails with mkfs.ext4: No such file or directory while trying to
 determine filesystem size
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14196

            Bug ID: 14196
           Summary: when using raspberrypicm4io_64_defconfig, make fails
                    with mkfs.ext4: No such file or directory while trying
                    to determine filesystem size
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: leon@exquisip.nl
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9086
  --> https://bugs.busybox.net/attachment.cgi?id=9086&action=edit
patch fs/ext2/ext2.mk to touch file that'll contain filesystem

After using raspberrypicm4io_64_defconfig, then doing make, the build process
ends as follows:

...
printf '   \n' >>
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/fakeroot
printf '   \n' >>
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/fakeroot
printf '        rm -f /home/ldr/src/buildroot/output/images/rootfs.ext2\n      
/home/ldr/src/buildroot/output/host/sbin/mkfs.ext4 -d
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/target -r 1 -N 0 -m 5 -L
"rootfs" -O ^64bit /home/ldr/src/buildroot/output/images/rootfs.ext2 "120M" ||
{ ret=$?; echo "*** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; exit $ret; }\n' >>
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/fakeroot
chmod a+x /home/ldr/src/buildroot/output/build/buildroot-fs/ext2/fakeroot
PATH="/home/ldr/src/buildroot/output/host/bin:/home/ldr/src/buildroot/output/host/sbin:/home/ldr/.asdf/shims:/opt/asdf-vm/bin:/usr/local/bin:/usr/bin:/var/lib/snapd/snap/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
FAKEROOTDONTTRYCHOWN=1 /home/ldr/src/buildroot/output/host/bin/fakeroot --
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/fakeroot
rootdir=/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/target
table='/home/ldr/src/buildroot/output/build/buildroot-fs/full_devices_table.txt'
mke2fs 1.46.3 (27-Jul-2021)
mkfs.ext4: No such file or directory while trying to determine filesystem size
*** Maybe you need to increase the filesystem size
(BR2_TARGET_ROOTFS_EXT2_SIZE)
make: *** [fs/ext2/ext2.mk:63:
/home/ldr/src/buildroot/output/images/rootfs.ext2] Error 1

--

I can reproduce in commandline by just running:

/home/ldr/src/buildroot/output/host/sbin/mkfs.ext4 -d
/home/ldr/src/buildroot/output/build/buildroot-fs/ext2/target -r 1 -N 0 -m 5 -L
"rootfs" -O ^64bit /home/ldr/src/buildroot/output/images/rootfs.ext2 "120M"

--

so the mkfs.ext4 wants the file that will contain the filesystem to already
exist, which it doesnt, becuase it's removed one command earlier.

--

I was able to fix my issue by adding a touch in fs/ext2/ext2.mk.

Please see attachment.

But not sure if this is a correct way to fix my issue.

Hope it helps.

Thanks,

Leon

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
