Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF549C5DF62
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FACB417BF;
	Wed, 26 Jan 2022 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mdip4AwAyVFd; Wed, 26 Jan 2022 20:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F3C417B9;
	Wed, 26 Jan 2022 20:32:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F891BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2AF160FC8
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7DUThYTQxv9 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:32:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F2AA60F9F
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:32:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58E4160003;
 Wed, 26 Jan 2022 20:32:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCoxx-0007Cg-JS; Wed, 26 Jan 2022 21:32:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220106223905.1069334-1-fontaine.fabrice@gmail.com>
Date: Wed, 26 Jan 2022 21:32:29 +0100
In-Reply-To: <20220106223905.1069334-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 6 Jan 2022 23:39:05 +0100")
Message-ID: <87tudqdyqq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump to
 version 0.9.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fixed: [CVE-2021-46141]
 >   Fix a bug affecting both uriNormalizeSyntax* and uriMakeOwner*
 >   functions where the text range in .hostText would not be duped using
 >   malloc but remain unchanged (and hence "not owned") for URIs with
 >   an IPv4 or IPv6 address hostname; depending on how an application
 >   uses uriparser, this could lead the application into a use-after-free
 >   situation.
 >   As the second half, fix uriFreeUriMembers* functions that would not
 >   free .hostText memory for URIs with an IPv4 or IPv6 address host;
 >   also, calling uriFreeUriMembers* multiple times on a URI of this
 >   very nature would result in trying to free pointers to stack
 >   (rather than heap) memory.
 > - Fixed: [CVE-2021-46142]
 >   Fix functions uriNormalizeSyntax* for out-of-memory situations
 >   (i.e. malloc returning NULL) for URIs containing empty segments
 >   (any of user info, host text, query, or fragment) where previously
 >   pointers to stack (rather than heap) memory were freed.

 > https://github.com/uriparser/uriparser/blob/uriparser-0.9.6/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
