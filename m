Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B31C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9C3400CF;
	Sun,  7 Jan 2024 16:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9C3400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISESPDy7qJFx; Sun,  7 Jan 2024 16:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3410C40191;
	Sun,  7 Jan 2024 16:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3410C40191
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7771BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B14B60B38
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B14B60B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppEfgYkesCof for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:17:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D2A660681
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D2A660681
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A47360002;
 Sun,  7 Jan 2024 16:17:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMVqH-006hVX-0X;
 Sun, 07 Jan 2024 17:17:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-4-adam.duskett@amarulasolutions.com>
 <87msth1ofj.fsf@48ers.dk> <ZZqUtsil3DTT20FN@landeda>
Date: Sun, 07 Jan 2024 17:17:41 +0100
In-Reply-To: <ZZqUtsil3DTT20FN@landeda> (Yann E. MORIN's message of "Sun, 7
 Jan 2024 13:10:30 +0100")
Message-ID: <87sf39yv6i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-01-07 10:29 +0100, Peter Korsgaard spake thusly:
 >> >>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
 >> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 >> > ---
 >> >  ...veral-defects-found-by-Coverity-scan.patch | 61 +++++++++++++++++++
 >> >  1 file changed, 61 insertions(+)
 >> >  create mode 100644 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 >> 
 >> > diff --git
 >> > a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 >> > b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 >> > new file mode 100644
 >> > index 0000000000..1719769872
 >> > --- /dev/null
 >> > +++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
 >> > @@ -0,0 +1,61 @@
 >> > +From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
 >> > +From: Sandro Mani <manisandro@gmail.com>
 >> > +Date: Tue, 5 Dec 2023 16:38:48 -0700
 >> > +Subject: [PATCH] Fix several defects found by Coverity scan
 >> > +
 >> > +From: giflib-5.2.1-17.fc39.src.rpm
 >> > +Upstream: Not submitted
 >> 
 >> No upstream and no CVE? Where does this fix then come from?

 > I was a bit sloppy when applying that one, indeed. As the commit log
 > mention, it's taken from the Fedora 39 source package, and I believed it
 > was enough reference.

 > Looking at that source package, it matches the patch named giflib_coverity.patch
 > and the Fedora dist-git for that patch date back to 2020-02-17:
 >     https://src.fedoraproject.org/rpms/giflib/c/df94d26a07ac8772b3380f4e5b4145daa7bf65e1?branch=rawhide

 > As far as I could find, it has not been submitted upstream, and upstream
 > looks like it has been pretty mothballed for a while now; last commit
 > was on 2019-08-17:
 >     https://sourceforge.net/p/giflib/mailman/giflib-devel/
 >     https://sourceforge.net/p/giflib/code/ci/master/tree/

 > I could not find any associated CVE:

 >     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe%3A2.3%3Aa%3Agiflib_project%3Agiflib%3A5.2.1%3A*%3A*%3A*%3A*%3A*%3A*%3A*

 > Looking at the code, I doubt it is a security issue, in fact. It's
 > probably just a memory leak, as the free() is replaced by this function:

 >    79 void
 >    80 GifFreeMapObject(ColorMapObject *Object)
 >    81 {
 >    82     if (Object != NULL) {
 >    83         (void)free(Object->Colors);
 >    84         (void)free(Object);
 >    85     }
 >    86 }

 > So, Object->Colors leaked, but I don't think it was a "security" issue.

Ok, thanks for the details. I'll add it anyway to the backports for
consistency.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
