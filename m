Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6466CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 11:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94D785758;
	Sun, 12 Dec 2021 11:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWcKoPRswthk; Sun, 12 Dec 2021 11:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C17C85754;
	Sun, 12 Dec 2021 11:49:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13D711BF393
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 11:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0214860791
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 11:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxrT_XaNnYRh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 11:49:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C0F160785
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 11:49:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0AAD8E0005;
 Sun, 12 Dec 2021 11:49:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwNMI-0001JM-6X; Sun, 12 Dec 2021 12:49:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Dec 2021 12:49:38 +0100
In-Reply-To: <20211019172532.3431240-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Oct 2021 19:25:30 +0200")
Message-ID: <87bl1m11rh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/e2fsprogs: don't install
 compile_et
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

 > Don't install compile_et as it raises the following build failure with
 > samba4 since, at least, bump to version 4.14.7 in commit
 > 630e85f8f5ed64933b45599fc4332d9609177c5c:

 > source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
 >    47 | static struct et_list link = { 0, 0 };
 >       |                       ^~~~
 > In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
 >                  from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
 >                  from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
 >                  from ../../lib/replace/../replace/replace.h:659,
 >                  from ../../source4/heimdal_build/config.h:10,
 >                  from source4/heimdal/lib/asn1/asn1_err.c:1:
 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:819:12: note: previous declaration of 'link' was here
 >   819 | extern int link (const char *__from, const char *__to)
 >       |            ^~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d6de6ed59c553f6f413d280f3c65184945bb3850

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
