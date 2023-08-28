Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF985C83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 06:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C42240492;
	Mon, 28 Aug 2023 06:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C42240492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBeVaNKN_Csd; Mon, 28 Aug 2023 06:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9663D40399;
	Mon, 28 Aug 2023 06:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9663D40399
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB6321BF34D
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 06:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C303B60C18
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 06:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C303B60C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VR62haqoPvRJ for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 06:00:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51AAC60BD9
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 06:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AAC60BD9
Received: by mail.gandi.net (Postfix) with ESMTPSA id F266B20010;
 Mon, 28 Aug 2023 06:00:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qaVID-005RLU-11; Mon, 28 Aug 2023 08:00:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Robert Smigielski <ptdropper@gmail.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
Date: Mon, 28 Aug 2023 08:00:04 +0200
In-Reply-To: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 (Robert Smigielski's message of "Thu, 10 Aug 2023 08:55:11 -0400")
Message-ID: <877cpf7lln.fsf@48ers.dk>
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

 > Announcing CycloneDX support for the embedded / IOT / MIOT world. Using
 > your Buildroot output, my project produces CycloneDX SBOM files for supply
 > chain management and vulnerability management. I am a long time Buildroot
 > user now in the device security space. Glad to provide CycloneDX SBOM
 > support for Buildroot users.

 > https://github.com/CycloneDX/cyclonedx-buildroot

 > https://pypi.org/project/CycloneDX-Buildroot/

Thanks! I think I have seen it earlier, where I noticed that it only
worked on the legal-info manifest - But we have quite a bit more
SBOM-related info in Buildroot nowadays visible in show-info. I see that
you are now also using this info for the CPE data, so that is good.

So what is the status of this project? Anything missing? Anything you
are missing from Buildroot? What (open source) tools can consume the
generated SBOMs and do something interesting with it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
