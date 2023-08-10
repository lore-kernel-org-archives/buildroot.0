Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD483C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 18:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA6241DBF;
	Thu, 10 Aug 2023 18:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA6241DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-TzhCpxeZIK; Thu, 10 Aug 2023 18:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5782641DC0;
	Thu, 10 Aug 2023 18:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5782641DC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B676E1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FDF383FBD
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 18:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FDF383FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QWVYwmzzqRY for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 18:02:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B4083FA0
 for <buildroot@uclibc.org>; Thu, 10 Aug 2023 18:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B4083FA0
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 9EEFC84A58; Thu, 10 Aug 2023 18:02:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 10 Aug 2023 18:02:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arinc.unal@arinc9.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15715-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15715] New: freeradius-server won't start
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

https://bugs.busybox.net/show_bug.cgi?id=15715

            Bug ID: 15715
           Summary: freeradius-server won't start
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: arinc.unal@arinc9.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Tested on today's master branch.

# radiusd -X
[...]
/etc/raddb/mods-enabled/mschap[11]: Failed to link to module 'rlm_mschap':
/usr/lib/rlm_mschap.so: cannot open shared object file: No such file or
directory

After removing /etc/raddb/mods-enabled/mschap:

# radiusd -X
[...]
/etc/raddb/mods-enabled/realm[21]: Failed to link to module 'rlm_realm':
/usr/lib/rlm_realm.so: cannot open shared object file: No such file or
directory

After removing /etc/raddb/mods-enabled/realm, something fails that I shouldn't
remove:

# radiusd -X
[...]
/etc/raddb/mods-enabled/ntlm_auth[17]: ...t-key --domain=MYDOMAIN
--username=%{mschap:User-Name} --password=%{User-Password}
/etc/raddb/mods-enabled/ntlm_auth[17]:                                        
^ Unknown module

Upon investigating package/freeradius-server/freeradius-server.mk, I've seen
that the rlm_mschap and rlm_realm modules are explicitly disabled because "we
don't have the dependencies" for them. I have removed these two lines which
disable these modules. The package compiled fine and the server started
working.

I don't know what was meant by not having the dependencies for these modules so
I'm submitting a bug here to let someone with more experience in this project
know.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
