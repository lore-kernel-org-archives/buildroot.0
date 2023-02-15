Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B98C64EC7
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 12:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4E6410B5;
	Wed, 15 Feb 2023 12:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4E6410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buB57_bgYM-w; Wed, 15 Feb 2023 12:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD2B409AC;
	Wed, 15 Feb 2023 12:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD2B409AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1961BF82F
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 12:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811BC60D58
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 12:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811BC60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iniHf_qTivZ2 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 12:52:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA8E60B1E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA8E60B1E
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 12:52:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77D75FF804;
 Wed, 15 Feb 2023 12:52:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pSHGx-004v07-8x; Wed, 15 Feb 2023 13:52:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230211182546.633728-1-thomas@devoogdt.com>
 <20230211182546.633728-2-thomas@devoogdt.com>
 <87ttzn473w.fsf@dell.be.48ers.dk>
 <CACXRmJjsrzs0zE62H9vnYjEL89y7j_SHGfRKA24yu4noY8aPxA@mail.gmail.com>
Date: Wed, 15 Feb 2023 13:52:31 +0100
In-Reply-To: <CACXRmJjsrzs0zE62H9vnYjEL89y7j_SHGfRKA24yu4noY8aPxA@mail.gmail.com>
 (Thomas Devoogdt's message of "Wed, 15 Feb 2023 12:41:57 +0100")
Message-ID: <87h6vn3xbk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] package/fluent-bit: add support for
 non glibc toolchain
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Hi, Peter
 > It would indeed be better to link against those,
 > but this is sadly the nature of how fluent-bit is made.

Do you know why they have made that choice? From a quick look it doesn't
seem like the code has been modified.

 > Next to those two libs, there are a dozen  of other libs that are also
 > literally copied in their code base. What you are proposing is to adapt
 > their cmakefile and only compile the static libs if no dynamic lib could be
 > found. Or even never compile it and just pass the linker flags. I'm afraid
 > that we could have compatibility problems by that, so I would keep it
 > static for now.

If that is the only option supported by upstream, then indeed that is
what we will have to do. Will you monitor for security vulnerabilities
in the vendored libraries and ensure this is also fixed there? E.G. we
recently had a (low risk) vulnerability in c-ares.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
