Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802C4C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C7360EE2;
	Thu, 21 Mar 2024 16:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vm3lSPoE2l4Q; Thu, 21 Mar 2024 16:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301FB60EE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301FB60EE4;
	Thu, 21 Mar 2024 16:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C074A1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA6860EE4
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5aBoQ0qnySk for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 16:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C96DE60EE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C96DE60EE2
 for <buildroot@uclibc.org>; Thu, 21 Mar 2024 16:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B166B821F0; Thu, 21 Mar 2024 16:49:43 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 21 Mar 2024 16:49:43 +0000
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
Message-ID: <bug-16000-163-Jtg35Q0AUg@https.bugs.busybox.net/>
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

--- Comment #5 from Roland Franke <fli4l@franke-prem.de> ---
Hello,
sorry for my mistake.
As already written will i work with a Debian 11 (Bullseye) X86_64 host.
There will be the standard-version of GCC, C++, and all other need packages
installed.
I will work here with the buildroot 2024.02 Version what is the actually
official version. I will be build ing here with uClibc and GCC (Not musl) .I
have here a few additional packages installed, but the main packages be
complete the identical version as come with the 2024.02 version.
Note that i normal work with BR2_PER_PACKAGE_DIRECTORY=y
With this the complete build (without GDB (Host and target) will run fine.
As soon as i activate the GDB should be build (Can be at last as additional
build, but also after an complete clean and also with only GDB to build) i will
running into the error given in the first information.

After a while of search i have found the official patch for GCC as informed in
the note from 18.03.2024, what is the identical one as you have informed in
your link [3].
It was suggested at least only as information that this build will fail here
and that the patch has solved my problem. So that it will be in your hands, if
you accept that and made an official patch for buildroot (Till sometime GCC
will patch the system self and the patch here by buildroot went to not longer
need.
If you not accept that, it will be also ok for me, as i had my system at work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
