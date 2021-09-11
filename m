Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99903C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 07:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0334160F8F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 07:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0334160F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A474D81975;
	Sat, 11 Sep 2021 07:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2hT1CQsLp_X; Sat, 11 Sep 2021 07:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC03681774;
	Sat, 11 Sep 2021 07:59:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64C471BF281
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 07:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE8241576
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 07:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKItCD9oUoeA for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 07:59:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB99D41485
 for <buildroot@uclibc.org>; Sat, 11 Sep 2021 07:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2F58A88EEF; Sat, 11 Sep 2021 07:57:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 11 Sep 2021 07:59:08 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: yann.morin.1998@free.fr
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution cc assigned_to
Message-ID: <bug-14206-163-fcJquasMhX@https.bugs.busybox.net/>
In-Reply-To: <bug-14206-163@https.bugs.busybox.net/>
References: <bug-14206-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14206] QT5 touch screen rotation does not work
 since 2021.05
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

https://bugs.busybox.net/show_bug.cgi?id=14206

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---
                 CC|                            |yann.morin.1998@free.fr
           Assignee|unassigned@buildroot.uclibc |yann.morin.1998@free.fr
                   |.org                        |

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thomas, All,

(In reply to Thomas Ruschival from comment #0)
> Looking for the cause I found that since 2021.05 libxkbcommon (BR2_PACKAGE_LIBXKBCOMMON)
> and libinput (BR2_PACKAGE_LIBINPUT) are selected. In turn libevdev (BR2_PACKAGE_LIBEVDEV)
> is selected.
> Libinput and libxkbcommon are selected by BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM.

Indeed, this code is incorrect; good catch! :-)

I'll send a patch soonish to fix that.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
