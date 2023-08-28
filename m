Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E08DC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E64E4150F;
	Mon, 28 Aug 2023 19:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E64E4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJMaLVVrcdJo; Mon, 28 Aug 2023 19:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB7F4141D;
	Mon, 28 Aug 2023 19:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB7F4141D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DADC71BF276
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2DAE4141D
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DAE4141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmcVV3NSgjdH for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 19:57:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 029DF41403
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 19:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029DF41403
Received: by mail.gandi.net (Postfix) with ESMTPSA id B204AFF803;
 Mon, 28 Aug 2023 19:57:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qaiMx-006HkG-Mt; Mon, 28 Aug 2023 21:57:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk>
 <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk>
 <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be>
Date: Mon, 28 Aug 2023 21:57:51 +0200
In-Reply-To: <71359643-6efe-4a83-55e3-8eb3d87edfe5@mind.be> (Arnout
 Vandecappelle's message of "Mon, 28 Aug 2023 21:38:11 +0200")
Message-ID: <87msyb548w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Cc: Robert Smigielski <ptdropper@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hello,

 >  I mentioned PURL vs CPE in my talk at ELC this year. You can look it
 >  up on youtube. It was near the end of the talk.

OK, I'll have a look.


 >> Conceptually they seem quite similar, with PURL being more generic, but
 >> I fail to see how we could use PURLS in Buildroot, E.G. how to do the
 >> equivalent of the CPE matching we use to figure out if the version of a
 >> package in Buildroot is vulnerable to a specific CVE?

 >  I think Robert is not necessarily primarily concerned with finding
 >  vulnerabilities, but rather with constructing a meaningful and
 > accurate SBoM (which is what dependencytrack does).

True. The monitoring stuff seems quite interesting for vulnerabilities
though.


 >  That said, it you want to use PURLs for vulnerabilities, you have to
 >  use a vulnerability database that uses PURLs. To my knowledge, there
 > is just one "open source" one: https://osv.dev. (There's also Sonatype
 > which can be used gratis but is not free.) Since there are many, many
 > CVEs that don't make it into OSV, using _only_ PURLs is certainly not
 > enough. But we could combine the two.

OK. It doesn't sound like it will bring a lot of advantages for the
effort to maintain PURL identifiers :/


 >  Another issue with PURLs is: which one do we use? PURLs are organised
 >  around ecosystems. For PyPI it's clear, but for your typical C
 > library/application it's less so. E.g. openssl appears in the Debian,
 > Alpine, AlmaLinux, RPM, RockyLinux ecosystems (and possibly more),
 > each with a distinct PURL. We could start our own namespace, but
 > that's kind of pointless unless we also issue advisories...

I guess we should use the one matching where we get the source code from
(if any). The cyclonedx tool uses a "generic"
pkg:generic/$name?download_url=$site/$tarball, so we could default to
that and just use pypi/github/whatever for the special cases where there
is a more accurate one.


 >  There's by the way another issue (which also exists for the CPE-based
 >  approach): our "BoM" for the cargo and go packages is not correct: we
 > vendor the dependencies, but they're not taken into account in the
 > BoM. The tarball we put in legal-info does include the vendored
 > dependencies, but they're not mentioned in the manifest, and we don't
 > scan their vulnerabilities.

True. I am not sure of a good way how to fix that though. That shouldn't
stop us from generating a good SBOM for all the other packages.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
