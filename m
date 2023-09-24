Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC198CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 07:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E63181FB9;
	Sun, 24 Sep 2023 07:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E63181FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJglnxANR681; Sun, 24 Sep 2023 07:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8976281FD6;
	Sun, 24 Sep 2023 07:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8976281FD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B62A1BF363
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 07:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE37409A5
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 07:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE37409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8T4So7aUaTxS for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 07:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45802400D7
 for <buildroot@uclibc.org>; Sun, 24 Sep 2023 07:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45802400D7
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 322CC87316; Sun, 24 Sep 2023 07:51:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 24 Sep 2023 07:51:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc bug_status resolution
Message-ID: <bug-15787-163-IdxCeN77rx@https.bugs.busybox.net/>
In-Reply-To: <bug-15787-163@https.bugs.busybox.net/>
References: <bug-15787-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15787] atmel_sama5d3_xplained_mmc_defconfig:
 Missing http://sources.buildroot.net/mpc-1.2.1.tar.gz
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

https://bugs.busybox.net/show_bug.cgi?id=15787

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998@free.fr
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Jan-Benedict, All,

Thanks for the report, but this is probably a spurious issue on your side:

1. It first tries to reach the GNU official site:

[build 2023-09-23 03:45:52] --2023-09-23 03:45:52-- 
http://ftpmirror.gnu.org/mpc/mpc-1.2.1.tar.gz
[build 2023-09-23 03:45:52] Resolving ftpmirror.gnu.org (ftpmirror.gnu.org)...
209.51.188.200
[build 2023-09-23 03:45:52] Connecting to ftpmirror.gnu.org
(ftpmirror.gnu.org)|209.51.188.200|:80... failed: Network is unreachable.

2. then it falls back to trying on Buildroot's backup site:

[build 2023-09-23 03:45:52] --2023-09-23 03:45:52-- 
http://sources.buildroot.net/mpc/mpc-1.2.1.tar.gz
[build 2023-09-23 03:46:12] Resolving sources.buildroot.net
(sources.buildroot.net)... failed: Temporary failure in name resolution.
[build 2023-09-23 03:46:12] wget: unable to resolve host address
'sources.buildroot.net'

3. for legacy reasons, Buildroot tries the old URL, which fails because
indeed that is not where we nowadays stores mirrored archvies:

[build 2023-09-23 03:46:12] --2023-09-23 03:46:12-- 
http://sources.buildroot.net/mpc-1.2.1.tar.gz
[build 2023-09-23 03:46:19] Resolving sources.buildroot.net
(sources.buildroot.net)... 104.26.0.37, 104.26.1.37, 172.67.72.56
[build 2023-09-23 03:46:19] Connecting to sources.buildroot.net
(sources.buildroot.net)|104.26.0.37|:80... connected.
[build 2023-09-23 03:46:19] HTTP request sent, awaiting response... 404 Not
Found

Note that, downloads from sources.buildroot.org only occur when the resource
was not found on the official upstream site, see the help text for the
BR2_BACKUP_SITE symbol.

In this case, the issue is really somewhere between your machine and the
network.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
