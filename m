Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E794C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E0F812E8;
	Thu, 21 Mar 2024 21:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1N_IC_a8bK2; Thu, 21 Mar 2024 21:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEDC8812EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEDC8812EA;
	Thu, 21 Mar 2024 21:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B607A1BF39F
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B079A812E5
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6UspaPcnvEM for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE41B81235
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE41B81235
 for <buildroot@uclibc.org>; Thu, 21 Mar 2024 21:08:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D75E881EA4; Thu, 21 Mar 2024 21:08:40 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 21 Mar 2024 21:08:40 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernd@kuhls.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-16003-163-niJetSEoJL@https.bugs.busybox.net/>
In-Reply-To: <bug-16003-163@https.bugs.busybox.net/>
References: <bug-16003-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16003] samba4 will not build for x86
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

https://bugs.busybox.net/show_bug.cgi?id=16003

--- Comment #6 from Bernd Kuhls <bernd@kuhls.net> ---
Using this defconfig based on Roland's config

BR2_x86_pentium_mmx=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_KERNEL_HEADERS_6_1=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_BINUTILS_VERSION_2_40_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_CCACHE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_SSP_REGULAR=y
BR2_RELRO_PARTIAL=y
BR2_PACKAGE_SAMBA4=y

I could reproduce the build error (Debian 12 x86_64).
According to some findings it seems to occur only on x86, reason unknown:
https://avidemux.org/smif/index.php?msg=70245
https://bz.apache.org/ooo/show_bug.cgi?id=127139#c6

Please add this hack in package/samba4/samba4.mk

ifeq ($(BR2_i386)$(BR2_TOOLCHAIN_HAS_SSP),yy)
SAMBA4_LDFLAGS += -lc -Wl,--as-needed
endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
