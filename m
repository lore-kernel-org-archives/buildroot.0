Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FB2C54E60
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 18:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC71F60882;
	Sat,  9 Mar 2024 18:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7T_5kvn4cuuJ; Sat,  9 Mar 2024 18:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB23160895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB23160895;
	Sat,  9 Mar 2024 18:58:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FA701BF853
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 18:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D19A81F1E
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 18:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2KT-FkKEe1l for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 18:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41FF81A6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41FF81A6A
 for <buildroot@uclibc.org>; Sat,  9 Mar 2024 18:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 75ED288165; Sat,  9 Mar 2024 18:58:13 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 09 Mar 2024 18:58:13 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.9
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: yann.morin.1998@free.fr
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15976-163-PcjG8hHFyb@https.bugs.busybox.net/>
In-Reply-To: <bug-15976-163@https.bugs.busybox.net/>
References: <bug-15976-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15976] .hash file requires newline to process
 correctly
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

https://bugs.busybox.net/show_bug.cgi?id=15976

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
masonwardle, All,

Thanks for the report.

> I have a <package-name>.hash file with [...]
> I failed to put a newline at the end of the file.

We do have a .editorconfig file at the root of the Buildroot tree,
that instructs text editors to always "insert_final_newline", as
it is customary for UNIX-style text files.

What is your text editor? Can you configure it to respect the
.editorconfig directives?

> this could be addressed in the documentation

Yes, it would be nice to have a patch that points to the existing
.editorconfig, and points to the documentation on how to configure
usual rext editors: https://editorconfig.org/#pre-installed

Would you like to send such patch, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
