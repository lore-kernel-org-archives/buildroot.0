Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA59C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 15:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D37F60035;
	Wed,  1 May 2024 15:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHcoB9afJnb6; Wed,  1 May 2024 15:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3676B60602
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3676B60602;
	Wed,  1 May 2024 15:08:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D35561BF297
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFFD060602
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 15:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zulB4iWPVDL6 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 15:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4EA60035
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4EA60035
 for <buildroot@uclibc.org>; Wed,  1 May 2024 15:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D984185ECC; Wed,  1 May 2024 15:08:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 01 May 2024 15:08:52 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-16027-163-aZsG6fmB5S@https.bugs.busybox.net/>
In-Reply-To: <bug-16027-163@https.bugs.busybox.net/>
References: <bug-16027-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16027] problems building on fedora-40
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

https://bugs.busybox.net/show_bug.cgi?id=16027

--- Comment #10 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello.

> How about just switching to curl, instead
> of playing around the legacy stuff as wget is?

1. wget is not legacy. cURL and wget were initialy released at about the
same period, in 1996 [0] [1]; both saw their latest release in March 2024.
Hard to say that wget is legacy without saying so for cURL.

[0] https://en.wikipedia.org/wiki/Wget  => January 1996
[1] https://en.wikipedia.org/wiki/CURL  => November 1996

2. cURL can be configured without FTP support [2], so if switching from wget
to wget2 was done, knowing that FTP was dropped, and considering that was
acceptable on the basis that FTP is legacy (broken, insecure...), then it
is not inconceivalbe that distros may consider truning FTP off in their builds
of cURL, ion the same basis (broken, insecure...). Switching to cURL would
not solve the issue. Yes, it is a bit far-fetched, but given the reasoning
behind wget2 switch, it is legit to consider it for other tools that are not
FTP-only.

[2] https://github.com/curl/curl/blob/master/configure.ac#L631

3. Existing packages (in external trees) may use wget's authentication options
yo authenticate to an HTTP server; switching to cURL would break them. That
also applies to existing (def)config files that use non-standard options, like
--no-proxy to talk to internal servers, or --load-cookies with a pre-build
script that authenticates against an internal server or filled by a CI/CD
job, etc...

4. For all things HTTP-related, wget2 is expected to be option-compatible with
wget.

5. As a consequence, it feels more appropriate to keep using wget for HTTP/S
downloads, and use a tool dedicated to FTP for FTP downloads, and implemented
as a separate backend in Buildroot.

Regards,
Yann E. MORIN,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
