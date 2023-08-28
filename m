Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15965C83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EEEF81FD9;
	Mon, 28 Aug 2023 14:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EEEF81FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hi-7eYA56Z_y; Mon, 28 Aug 2023 14:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB1281FD1;
	Mon, 28 Aug 2023 14:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB1281FD1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C90C31BF8B4
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 14:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B068440558
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 14:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B068440558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4WwY9K-5vRZ for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 14:57:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01866402D7
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 14:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01866402D7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C858C0007;
 Mon, 28 Aug 2023 14:57:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qadfy-005xnS-FW; Mon, 28 Aug 2023 16:57:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Robert Smigielski <ptdropper@gmail.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk>
 <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
Date: Mon, 28 Aug 2023 16:57:10 +0200
In-Reply-To: <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 (Robert Smigielski's message of "Mon, 28 Aug 2023 08:11:34 -0400")
Message-ID: <87r0nn5i61.fsf@48ers.dk>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:

Hi,

 > At this time I'm reading up on the difference between CPE and PURL. While
 > we have CPE information in their currently, it may be beneficial to have
 > PURL for some of the packages. I'm still new to the concept of what those
 > two formats provide. Your feedback is most welcome. Glad you are finding
 > this useful.

Conceptually they seem quite similar, with PURL being more generic, but
I fail to see how we could use PURLS in Buildroot, E.G. how to do the
equivalent of the CPE matching we use to figure out if the version of a
package in Buildroot is vulnerable to a specific CVE?

I gave your generateBuildrootSBOM.py script a quick try here, and
noticed a few things:

- The purl links seems wrong (missing slash between site and filename):
  "purl": "pkg:generic/busybox@1.36.1?download_url=https://www.busybox.net/downloadsbusybox-1.36.1.tar.bz2"

- The patches are not mentioned in the SBOM. Adding the show-info data
  does bring the CPE identifiers, but E.G. doesn't include _IGNORE_CVES
  data (that we use to signal that a vulnerability is either not
  applicable to Buildroot or fixed by a backported patch). I don't know
  much about cyclonedx, but judging from
  https://github.com/DependencyTrack/dependency-track/issues/919 it
  sounds like such info can be represented in the SBOM.

- Latest version in git is 1.0.4 (using an non-annotated tag, whereas
  1.0.3 was annotated), but on pypi there is (only) a 1.0.5, which seems
  to match the 1.0.4 sources. It is marked as needing python > 3.10, and
  doesn't pull in the dependencies, so it doesn't work very well

- The output filename is used as a prefix, with .json .one.xml and .xml
  variants. I understand why you do this, but it is a bit confusing
  still. Is there any real use of the non-JSON formats / available
  tooling to convert if needed?

Is there a specific reason why you are maintaining it separately from
Buildroot? Given the fairly tight link to the Buildroot details that
may change in the future (not to mention ease of use/discovery) it seems
to me to be something that would be interesting to ship together with
our other python based tooling inside Buildroot?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
