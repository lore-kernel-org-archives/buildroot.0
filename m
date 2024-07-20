Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B5C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 08:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3AE60F7F;
	Sat, 20 Jul 2024 08:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23Ak2lkNMA4M; Sat, 20 Jul 2024 08:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E64DA60767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64DA60767;
	Sat, 20 Jul 2024 08:27:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1931BF349
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C18460767
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 08:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8Xd7Tr-bGUv for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 08:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E215E606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E215E606F2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E215E606F2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 08:27:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D1801C0004;
 Sat, 20 Jul 2024 08:27:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sV5R5-00FHYu-0U;
 Sat, 20 Jul 2024 10:27:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 <87v81jvko4.fsf@dell.be.48ers.dk>
 <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
 <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be>
Date: Sat, 20 Jul 2024 10:27:23 +0200
In-Reply-To: <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be> (Arnout
 Vandecappelle's message of "Fri, 19 Jul 2024 17:32:25 +0200")
Message-ID: <87ed7oeadw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Andreas Hilse <andreas.hilse@googlemail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 19/07/2024 10:12, Andreas Hilse wrote:
 >> Hello Peter,
 >> As I've been seeing the patch for 9.7 on the 2024.02.x branch I am
 >> assuming there will be no backport for 9.8p1?
 >> This would mean that the LTS release 2024.02 will get false positives
 >> by vulnerability scanners that only check for the version.

 >  I would say, in that case, fix your vulnerability scanner. We have
 >  dozens of packages where CVEs are patched. See the IGNORE_CVES
 > variables in various packages.

 >  That said, Peter forgot to add an IGNORE_CVES when applying the fix,
 >  so our own pkg-stats will also have a false positive... Well, it
 >  would have if NVD was still working.

Ups, I'll fix that now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
