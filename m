Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104CCE784B2
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 08:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A932760BCA;
	Mon,  2 Oct 2023 08:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A932760BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvorkVFqw5DW; Mon,  2 Oct 2023 08:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA04560BDD;
	Mon,  2 Oct 2023 08:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA04560BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15B091BF283
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E11FC418C1
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11FC418C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Occ4ATfuiMml for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 08:59:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95D43418BC
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 08:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D43418BC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AD82C0008;
 Mon,  2 Oct 2023 08:59:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qnElp-000VXU-Fp; Mon, 02 Oct 2023 10:59:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231001191539.B15DC83F75@busybox.osuosl.org>
Date: Mon, 02 Oct 2023 10:59:17 +0200
In-Reply-To: <20231001191539.B15DC83F75@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sun, 1 Oct 2023 21:14:07 +0200")
Message-ID: <87h6n9h02i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] docs/manual: add a FAQ entry about
 Y2038 support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f10f47ff2873d2259e4a03060e9cf0fd1b0f05e0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This was reviewed in person by Arnout.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  docs/manual/faq-troubleshooting.adoc | 28 ++++++++++++++++++++++++++++
 >  1 file changed, 28 insertions(+)

 > diff --git a/docs/manual/faq-troubleshooting.adoc b/docs/manual/faq-troubleshooting.adoc
 > index b08bf9bc4a..a61276d4c5 100644
 > --- a/docs/manual/faq-troubleshooting.adoc
 > +++ b/docs/manual/faq-troubleshooting.adoc
 > @@ -242,3 +242,31 @@ help reduce the build time:
 
 >   * Experiment with top-level parallel build, see
 >     xref:top-level-parallel-build[].
 > +
 > +[[faq-2038]]
 > +=== How does Buildroot support Y2038?
 > +
 > +There are multiple situations to consider:
 > +
 > + * On 64-bit architectures, there is no problem, as +time_t+ has
 > +   always been 64-bit.

 > +
 > + * On 32-bit architectures, the situation depends on the C library:
 > +
 > + ** With _uclibc-ng_, there is no support for 64-bit +time_t+ on
 > +    32-bit architectures, so systems using _uclibc-ng_ on 32-bit
 > +    platforms will not be Y2038 compatible.
 > +
 > + ** With _musl_, 64-bit +time_t+ has always been used on 32-bit
 > +    architectures, so systems using _musl_ on 32-bit platforms are
 > +    Y2038 compatible.

"has always been used" is not really true, it was added in musl 1.2.0:
https://musl.libc.org/time64.html

Maybe we should say "always uses" instead?

 > +
 > + ** With _glibc_, 64-bit +time_t+ on 32-bit architectures is enabled
 > +    by the Buildroot option +BR2_TIME_BITS_64+. With this option
 > +    enabled, systems using _glibc_ on 32-bit platforms are Y2038
 > +    compatible.
 > +
 > +Note that the above only comments about the capabilities of the C
 > +library. Individual user-space libraries or applications, even when
 > +built in a Y2038-compatible setup, can exhibit incorrect behavior if
 > +they do not make correct use of the time APIs and types.

We should probably also mention the kernel dependency, E.G. the above is
only correct if using Linux 5.6+ kernel / headers:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=22b17db4ea05561c7c8e4d770f10751e22e339f9

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
