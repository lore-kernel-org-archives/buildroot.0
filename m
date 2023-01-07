Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E651DC46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 17:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50A83400B8;
	Sat,  7 Jan 2023 17:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A83400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVTheqKA6P6y; Sat,  7 Jan 2023 17:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EC4A4028D;
	Sat,  7 Jan 2023 17:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EC4A4028D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57A7F1BF5D7
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 17:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32FCF60B58
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 17:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FCF60B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDOqde4xrLfR for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 17:16:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A4BC60899
 for <buildroot@uclibc.org>; Sat,  7 Jan 2023 17:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A4BC60899
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 41DA98731F; Sat,  7 Jan 2023 17:16:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 07 Jan 2023 17:16:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.11.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sagimor6@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15231-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15231] New: gcc --help -v doesn't work correctly
 with gcc>=10 and BR2_RELRO_PARTIAL or BR2_RELRO_FULL
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

https://bugs.busybox.net/show_bug.cgi?id=15231

            Bug ID: 15231
           Summary: gcc --help -v doesn't work correctly with gcc>=10 and
                    BR2_RELRO_PARTIAL or BR2_RELRO_FULL
           Product: buildroot
           Version: 2020.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: sagimor6@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9451
  --> https://bugs.busybox.net/attachment.cgi?id=9451&action=edit
quick fix

gcc --help -v 2>&1 | grep ffunction-sections

This should display the option with description.
But with buildroot gcc>=10 with RELRO protection configured to Partial or Full,
this doesn't work (doesn't display anything).
So affected buildroots are with versions >=2020.11.2
You can check this with bootlin compilers with buildroot>=2021.11

The cause of this is:

1) from gcc 10, the following doesn't work:
gcc -Wl,--some-flag --help -v 2>&1 | grep ffunction-section

I created a bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108328

2) toolchain-wrapper with BR2_RELRO_PARTIAL or BR2_RELRO_FULL adds -Wl,-z,relro
linker flags which trigger this

now, BR2_RELRO_PARTIAL or BR2_RELRO_FULL are the default since 2021.05.

Moreover, this causes the python and python3 package to compile without the
-fwrapv option, because python detects it using the: gcc --help -v 2>&1 | grep
fwrapv

This is just one example that I stumbled upon, I think this can cause problems
in general, and in other packages that do these kinds of checks.

I attached a quick fix patch (should I send it to the mailing list too?), but
feel free to comment on the gcc bug report I created.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
