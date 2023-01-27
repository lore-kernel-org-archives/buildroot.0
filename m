Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA9BC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 11:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E6C41881;
	Fri, 27 Jan 2023 11:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E6C41881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKLMnWufCjzS; Fri, 27 Jan 2023 11:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060FE416BA;
	Fri, 27 Jan 2023 11:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 060FE416BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8721BF2BA
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 11:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5EBC60BF5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 11:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5EBC60BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeVYnyuEhTdK for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 11:08:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A00260B8C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A00260B8C
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 11:08:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B364C0005;
 Fri, 27 Jan 2023 11:08:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pLMb1-0006Im-EM; Fri, 27 Jan 2023 12:08:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Kuhne <Stefan.Kuhne@gmx.net>
References: <21929154-7cb8-31ff-20de-d48d25e53423@carrier-2>
 <6e0a1eb8-4495-76a4-63a9-852fccbb9a79@carrier-2>
Date: Fri, 27 Jan 2023 12:08:39 +0100
In-Reply-To: <6e0a1eb8-4495-76a4-63a9-852fccbb9a79@carrier-2> (Stefan Kuhne's
 message of "Tue, 24 Jan 2023 19:37:27 +0100")
Message-ID: <87zga45j60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Build of glib2 failed
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

>>>>> "Stefan" == Stefan Kuhne <Stefan.Kuhne@gmx.net> writes:

 > Am 23.01.2023 um 20:32 schrieb Stefan Kuhne:
 > Hello.

 >> I've a problem to build glib2:
 >> 
 >> ...
 >> Library m found: YES
 >> Run-time dependency libffi found: YES 3.4.4
 >> Run-time dependency zlib found: YES 1.2.13
 >> Checking for function "ngettext" : NO
 >> Library intl found: NO
 >> 
 >> output/build/libglib2-2.72.3/meson.build:2102:4: ERROR: Automatic
 >> wrap-based subproject downloading is disabled
 >> 
 > I missed UCLIBC_HAS_INTL and UCLIBC_HAS_ICONV in uclibc config.

Yes, if you tweak the default uClibc-ng config then you may end up with
build issues.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
