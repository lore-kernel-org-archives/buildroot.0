Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD880C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43BAB4047D;
	Sun,  3 Dec 2023 19:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BAB4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOiM8L-ZW-Ej; Sun,  3 Dec 2023 19:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0EC40438;
	Sun,  3 Dec 2023 19:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A0EC40438
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82F8B1BF32C
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A12240438
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A12240438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTpyGKd0D5oY for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 19:14:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA9B040192
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 19:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA9B040192
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4A86C0003;
 Sun,  3 Dec 2023 19:14:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9rva-009Y14-05;
 Sun, 03 Dec 2023 20:14:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231203184400.499648-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 20:14:53 +0100
In-Reply-To: <20231203184400.499648-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Dec 2023 19:44:00 +0100")
Message-ID: <87ttozw11u.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.11.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure raised since bump of fmt
 > to version 10.1.0 in commit 619b5585d92c8f701cd92e0e26c0883a753125ad
 > thanks to
 > https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a:

 > -- Performing Test HAVE_SYSTEM_LIBFMT
 > -- Performing Test HAVE_SYSTEM_LIBFMT - Failed

 > [...]

 > -- Downloading...
 >    dst='/home/buildroot/autobuild/instance-3/output-1/build/mariadb-10.11.4/extra/libfmt/src/8.0.1.zip'
 >    timeout='none'
 >    inactivity timeout='none'
 > -- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
 > CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
 >   Each download failed!

 >     error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
 >           status_code: 1
 >           status_string: "Unsupported protocol"
 >           log:
 >           --- LOG BEGIN ---
 >           Protocol "https" not supported or disabled in libcurl

 > This bump will also fix CVE-2023-22084

 > https://mariadb.com/kb/en/mariadb-10-11-5-release-notes/
 > https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9cb577195aa939289102116df5a2eac03f0d5017

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
