Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54161C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 08:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01844414A2;
	Mon, 11 Dec 2023 08:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01844414A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkIGwh8RQK-U; Mon, 11 Dec 2023 08:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2668B40980;
	Mon, 11 Dec 2023 08:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2668B40980
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD1D61BF3A4
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C70140114
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 08:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C70140114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-5wium6i3-y for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 08:23:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBFAB400EF
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFAB400EF
Received: by mail.gandi.net (Postfix) with ESMTPSA id A152420005;
 Mon, 11 Dec 2023 08:23:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rCbZG-0037jk-3B;
 Mon, 11 Dec 2023 09:23:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231210191939.1487618-1-yann.morin.1998@free.fr>
Date: Mon, 11 Dec 2023 09:23:10 +0100
In-Reply-To: <20231210191939.1487618-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 10 Dec 2023 20:19:39 +0100")
Message-ID: <878r61no5t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] doc/manual: rsync is not optional
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > rsync is used in the infrastructure, mostly for the per-package infra,
 > and for the override-srcdir mechanism, but also to build the manual.
 > As such, it is not optional but mandatory, and already listed so.

 > Drop the reference to rsync from the list of optional packages.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

You could argue that there would be use cases for not building the
manual, using override-srcdir or per-package builds, but it is also used
for creating the file systems, so indeed required.

Committed, thanks.

> ---
 >  docs/manual/prerequisite.adoc | 3 +--
 >  1 file changed, 1 insertion(+), 2 deletions(-)

 > diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
 > index 48be489f90..262a5153f5 100644
 > --- a/docs/manual/prerequisite.adoc
 > +++ b/docs/manual/prerequisite.adoc
 > @@ -69,7 +69,7 @@ development packages typically have a _-dev_ or _-devel_ suffix.
 >  In the official tree, most of the package sources are retrieved using
 >  +wget+ from _ftp_, _http_ or _https_ locations. A few packages are only
 >  available through a version control system. Moreover, Buildroot is
 > -capable of downloading sources via other tools, like +rsync+ or +scp+
 > +capable of downloading sources via other tools, like +git+ or +scp+
 >  (refer to xref:download-infra[] for more details). If you enable
 >  packages using any of these methods, you will need to install the
 >  corresponding tool on the host system:
 > @@ -78,7 +78,6 @@ corresponding tool on the host system:
 >  ** +cvs+
 >  ** +git+
 >  ** +mercurial+
 > -** +rsync+
 >  ** +scp+
 >  ** +sftp+
 >  ** +subversion+
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
