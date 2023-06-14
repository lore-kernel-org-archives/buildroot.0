Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C131DEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 542788376D;
	Wed, 14 Jun 2023 13:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542788376D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qy4Kg5mCdk2k; Wed, 14 Jun 2023 13:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66957836C3;
	Wed, 14 Jun 2023 13:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66957836C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3837A1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1073E60E43
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1073E60E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSp56tFtjWSz for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:51:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E957A60A67
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E957A60A67
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:51:47 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 549F120009
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:51:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1q9QuX-0088B8-JH
 for buildroot@buildroot.org; Wed, 14 Jun 2023 15:51:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230606195922.1BAED86D16@busybox.osuosl.org>
Date: Wed, 14 Jun 2023 15:51:45 +0200
In-Reply-To: <20230606195922.1BAED86D16@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 6 Jun 2023 21:56:00 +0200")
Message-ID: <87h6ranocu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/go: security bump to version
 1.9.10
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=620ce32227b0722c9c68c5d0cd42d8600a18ca6b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - cmd/go: cgo code injection

 >   The go command may generate unexpected code at build time when using cgo.
 >   This may result in unexpected behavior when running a go program which
 >   uses cgo.

 >   This may occur when running an untrusted module which contains directories
 >   with newline characters in their names.  Modules which are retrieved using
 >   the go command, i.e.  via "go get", are not affected (modules retrieved
 >   using GOPATH-mode, i.e.  GO111MODULE=off, may be affected).

 >   Thanks to Juho Nurminen of Mattermost for reporting this issue.

 >   This is CVE-2023-29402 and Go issue https://go.dev/issue/60167.

 > - runtime: unexpected behavior of setuid/setgid binaries

 >   The Go runtime didn't act any differently when a binary had the
 >   setuid/setgid bit set.  On Unix platforms, if a setuid/setgid binary was
 >   executed with standard I/O file descriptors closed, opening any files
 >   could result in unexpected content being read/written with elevated
 >   prilieges.  Similarly if a setuid/setgid program was terminated, either
 >   via panic or signal, it could leak the contents of its registers.

 >   Thanks to Vincent Dehors from Synacktiv for reporting this issue.

 >   This is CVE-2023-29403 and Go issue https://go.dev/issue/60272.

 > - cmd/go: improper sanitization of LDFLAGS

 >   The go command may execute arbitrary code at build time when using cgo.
 >   This may occur when running "go get" on a malicious module, or when
 >   running any other command which builds untrusted code.  This is can by
 >   triggered by linker flags, specified via a "#cgo LDFLAGS" directive.

 >   Thanks to Juho Nurminen of Mattermost for reporting this issue.

 >   This is CVE-2023-29404 and CVE-2023-29405 and Go issues
 >   https://go.dev/issue/60305 and https://go.dev/issue/60306.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
