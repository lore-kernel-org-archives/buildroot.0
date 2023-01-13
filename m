Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79424C54EBE
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 04:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C388B60BCD;
	Fri, 13 Jan 2023 04:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C388B60BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aK0LTWhs1kGC; Fri, 13 Jan 2023 04:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28393607D0;
	Fri, 13 Jan 2023 04:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28393607D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 612D81BF28E
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 04:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48341415CF
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 04:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48341415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJRSWc1DW5CU for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 04:34:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0387741570
 for <buildroot@uclibc.org>; Fri, 13 Jan 2023 04:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0387741570
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D851F879BC; Fri, 13 Jan 2023 04:34:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 13 Jan 2023 04:34:22 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glscene2010@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15246-163-43qaTOGKPf@https.bugs.busybox.net/>
In-Reply-To: <bug-15246-163@https.bugs.busybox.net/>
References: <bug-15246-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15246] buildroot ignore my config
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

https://bugs.busybox.net/show_bug.cgi?id=15246

--- Comment #3 from Andrei Cherniaev <glscene2010@gmail.com> ---
May be I have some mistakes? 
I do
1) make menuconfig -C buildroot
And select Load "/mnt/ramdisk/my_external_tree/configs/pc_x86_bios_defconfig"
And select Save "/mnt/ramdisk/my_external_tree/configs/pc_x86_bios_defconfig"

2)
make clean -C buildroot
make BR2_EXTERNAL=${MyBaseDir}/my_external_tree -C buildroot
pc_x86_bios_defconfig

I get "# configuration written to /mnt/ramdisk/buildroot/.config", so let's
look into /mnt/ramdisk/buildroot/.config
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL)/board/my_company/my_board/pc_x86_bios_kernel4.19.269_defconfig"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot123"

yes, "123" is my mark! Looks ok. But may be I have a mistake in
/mnt/ramdisk/my_external_tree/board/my_company/my_board/pc_x86_bios_kernel4.19.269_defconfig
? I do
make linux-menuconfig -C buildroot 
And select Load
"/mnt/ramdisk/my_external_tree/board/my_company/my_board/pc_x86_bios_kernel4.19.269_defconfig"
And select Save
"/mnt/ramdisk/my_external_tree/board/my_company/my_board/pc_x86_bios_kernel4.19.269_defconfig"

Now let's build:
3) 
# get absoletly new buildroot from git
rm -Rf buildroot/
git clone https://github.com/buildroot/buildroot

make BR2_EXTERNAL=${MyBaseDir}/my_external_tree -C buildroot
pc_x86_bios_defconfig
make -C buildroot

And I see default values, "Welcome to Buildroot", not "Welcome to
Buildroot123"... Why?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
