Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFB5C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 17:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 470F460DF6;
	Thu, 21 Mar 2024 17:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWzjt6mRrkvs; Thu, 21 Mar 2024 17:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE7460EC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE7460EC9;
	Thu, 21 Mar 2024 17:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B34781BF2F3
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD74E40466
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 17:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkFh-ZOsYOSr for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 17:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C2C4040A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C2C4040A
 for <buildroot@uclibc.org>; Thu, 21 Mar 2024 17:06:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CBBC681152; Thu, 21 Mar 2024 17:06:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 21 Mar 2024 17:06:31 +0000
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
Message-ID: <bug-16003-163-tYXhm5PQ1P@https.bugs.busybox.net/>
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

--- Comment #2 from Roland Franke <fli4l@franke-prem.de> ---
I work with a Debian 11 (Bullseye) X86_64 host.
There will be the standard-version of GCC, C++, and all other need packages
installed.
I will work here with the buildroot 2024.02 Version what is the actually
official version. I will be build ing here with uClibc and GCC (Not musl) .I
have here a few additional packages installed, but the main packages be
complete the identical version as come with the 2024.02 version.
Note that i normal work with BR2_PER_PACKAGE_DIRECTORY=y

my .config is stored at: https://pastes.io/wqa8jsvgsg

As soon as i try to activate the samba4 package, i will run in the named fault.
It take her no matter, if i try this after an complete clean and build the
whole buildroot. It stuck also when i had a full build and activate samba4
after that and try to build this after. It stuck also when i will try to build
samba4 alone.

On the same system, i have a second configuration for building for a x86_64
system. Here the samba4 package will be build fine in all conditions.
That is the point why i made the request here.
Maybe the actual samba4 will not longer work with a x86 system?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
