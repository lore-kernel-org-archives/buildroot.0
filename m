Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85F4C4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 22:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A6AD405E5;
	Sun, 27 Nov 2022 22:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A6AD405E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2CwLd6t3Zrb; Sun, 27 Nov 2022 22:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6110840524;
	Sun, 27 Nov 2022 22:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6110840524
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 156931BF282
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 22:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B0540524
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 22:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B0540524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJfapN05V1qq for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 22:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA9840283
 for <buildroot@uclibc.org>; Sun, 27 Nov 2022 22:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BA9840283
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 486A484987; Sun, 27 Nov 2022 22:45:47 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 27 Nov 2022 22:45:47 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.7
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jacmet@uclibc.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-15151-163-j29rdNWjat@https.bugs.busybox.net/>
In-Reply-To: <bug-15151-163@https.bugs.busybox.net/>
References: <bug-15151-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15151] Busybox /etc/init.d scripts are not
 executable
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

https://bugs.busybox.net/show_bug.cgi?id=15151

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Hi,

I am unable to reproduce it here with current top of 2022.02.x with this
config:

$ cat defconfig
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y

$ make && tar -tvf output/images/rootfs.tar | grep init.d
drwxr-xr-x 0/0               0 2022-11-27 23:42 ./etc/init.d/
-rwxr-xr-x 0/0            1012 2022-11-27 23:42 ./etc/init.d/S01syslogd
-rwxr-xr-x 0/0            1004 2022-11-27 23:42 ./etc/init.d/S02klogd
-rwxr-xr-x 0/0            2804 2022-11-27 23:42 ./etc/init.d/S02sysctl
-rwxr-xr-x 0/0            1620 2022-11-27 23:42 ./etc/init.d/S20urandom
-rwxr-xr-x 0/0             438 2022-11-27 23:42 ./etc/init.d/S40network
-rwxr-xr-x 0/0             423 2022-11-27 23:42 ./etc/init.d/rcK
-rwxr-xr-x 0/0             408 2022-11-27 23:42 ./etc/init.d/rcS

$ git describe
2022.02.7-30-gecda7f786a

Please provide some more details about your setup.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
