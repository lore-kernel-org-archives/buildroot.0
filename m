Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7A5ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 16:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B606FAA2;
	Fri, 16 Sep 2022 16:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B606FAA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNdht0JvbrwS; Fri, 16 Sep 2022 16:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9F36FAAF;
	Fri, 16 Sep 2022 16:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9F36FAAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2911BF3D9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 16:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 549F841678
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 16:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 549F841678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqN3VHJH5Jzn for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 16:16:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 895A54166C
 for <buildroot@uclibc.org>; Fri, 16 Sep 2022 16:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895A54166C
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7812283CC2; Fri, 16 Sep 2022 16:16:32 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 16 Sep 2022 16:16:32 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: yann.morin.1998@free.fr
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to cc bug_status
Message-ID: <bug-14996-163-lQ0vzys3gh@https.bugs.busybox.net/>
In-Reply-To: <bug-14996-163@https.bugs.busybox.net/>
References: <bug-14996-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14996] Too many directories in BR2_EXTERNAL causes
 hang during make
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

https://bugs.busybox.net/show_bug.cgi?id=14996

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned@buildroot.uclibc |yann.morin.1998@free.fr
                   |.org                        |
                 CC|                            |yann.morin.1998@free.fr
             Status|NEW                         |ASSIGNED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
David, All,

Thanks for the report, and the detailed explanations (which I did not yet
entirely
groked, and will need a bit more time before I see the issue).

How many br2-external trees are you using? I've done a bit of testing
with 0 to 1000 br2-external trees, and here are the results:

$ time make BR2_EXTERNAL='' list-defconfigs
real    0m0.129s

$ time make BR2_EXTERNAL='(1 item)' list-defconfigs
real    0m0.138s

$ time make BR2_EXTERNAL='(10 item)' list-defconfigs
real    0m0.262s

$ time make BR2_EXTERNAL='(100 item)' list-defconfigs
real    0m1.912s

$ time make BR2_EXTERNAL='(1000 item)' list-defconfigs
real    0m19.344s

So, what we can see, is that it is roughly linear to the number of br2-external
trees. Even the 1000-tree case is far from appearing stuck (granted, it is a
bit
long, but after seeing 2s for 100 items, it did not feel excruciating to wait).

Also, I do not have any message from make 4.2.1 that reports any infinite
recursion.

Can you provide a bit more details on your configuration?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
