Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F8C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 18:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2900E60697;
	Fri, 22 Mar 2024 18:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJZzliza_zUv; Fri, 22 Mar 2024 18:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E84F60FF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E84F60FF9;
	Fri, 22 Mar 2024 18:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F332F1BF489
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 18:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC87D418C4
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 18:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lPmm0PlW7OLX for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 18:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0047A418A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0047A418A0
 for <buildroot@uclibc.org>; Fri, 22 Mar 2024 18:31:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id DC2F282860; Fri, 22 Mar 2024 18:31:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 22 Mar 2024 18:31:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fli4l@franke-prem.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-16000-163-rKxTYJDDzP@https.bugs.busybox.net/>
In-Reply-To: <bug-16000-163@https.bugs.busybox.net/>
References: <bug-16000-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16000] GDB will not build
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

https://bugs.busybox.net/show_bug.cgi?id=16000

--- Comment #6 from Roland Franke <fli4l@franke-prem.de> ---
The build failed by me in the configuration:
BR2_ARCH_HAS_TOOLCHAIN_BUILDROOT=y
BR2_ARCH="x86_64"
BR2_NORMALIZED_ARCH="x86_64"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ARCH="nocona"
BR2_BINFMT_SUPPORTS_SHARED=y
BR2_READELF_ARCH_NAME="Advanced Micro Devices X86-64"
BR2_X86_CPU_HAS_MMX=y
BR2_X86_CPU_HAS_SSE=y
BR2_X86_CPU_HAS_SSE2=y
BR2_X86_CPU_HAS_SSE3=y
BR2_x86_nocona=y
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
BR2_UCLIBC_TARGET_ARCH="x86_64"
BR2_GCC_VERSION="12.3.0"
BR2_GDB_VERSION="13.2"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
