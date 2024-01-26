Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67479C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8FD84D6F;
	Fri, 26 Jan 2024 08:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8FD84D6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6buYAp2Dfh8; Fri, 26 Jan 2024 08:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FCB84D58;
	Fri, 26 Jan 2024 08:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FCB84D58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 010F31BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE90484D58
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE90484D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtKVX5jt4nhf for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:29:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF30584D3C
 for <buildroot@busybox.net>; Fri, 26 Jan 2024 08:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF30584D3C
Received: by mail.gandi.net (Postfix) with ESMTPSA id F171AFF806;
 Fri, 26 Jan 2024 08:29:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTHaO-007ukZ-0n;
 Fri, 26 Jan 2024 09:29:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240117121512.32640-1-ps.report@gmx.net>
Date: Fri, 26 Jan 2024 09:29:16 +0100
In-Reply-To: <20240117121512.32640-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Wed, 17 Jan 2024 13:15:12 +0100")
Message-ID: <87v87g4hwj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.3
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > - removed 0002-wscript-fix-build-without-stack-protector.patch
 >   (upstream applied, see [1])

 > - update license info according to upstream commit [2]
 >   (add Apache-2.0, Beerware, BSD-4-Clause and ISC, rename license
 >   file to end with '.txt' suffix)

 > See [3] for details.

 > [1] https://gitlab.com/NTPsec/ntpsec/-/commit/15862410de61d478a4b9aee5f5107889cfa9d125
 > [2] https://gitlab.com/NTPsec/ntpsec/-/commit/e29d66214116ae3679692e04982115863caa95b9
 > [3] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_3

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
