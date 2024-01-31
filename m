Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5E0C48285
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 08:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F42E41686;
	Wed, 31 Jan 2024 08:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F42E41686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GIeP6LCnU-O; Wed, 31 Jan 2024 08:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D34415F8;
	Wed, 31 Jan 2024 08:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D34415F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1801BF846
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11A30415F8
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A30415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpABp3uV0qGM for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 08:14:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36587415D6
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 08:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36587415D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33B63E0010;
 Wed, 31 Jan 2024 08:14:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rV5k6-000jgq-22;
 Wed, 31 Jan 2024 09:14:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgy7KsqtSyzJJaw9r6a7c9atEpPQpbbJgGn2qY=yi=nLFg@mail.gmail.com>
 <87il3azdfc.fsf@48ers.dk>
 <CABRndgxX2z+z6Rj4-BchYhd2BETmai8xd=Ht6JnJK1h=Q+=KPg@mail.gmail.com>
Date: Wed, 31 Jan 2024 09:14:46 +0100
In-Reply-To: <CABRndgxX2z+z6Rj4-BchYhd2BETmai8xd=Ht6JnJK1h=Q+=KPg@mail.gmail.com>
 (Zvi Vered's message of "Wed, 31 Jan 2024 09:31:02 +0200")
Message-ID: <87zfwlx6kp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] LKUS in buildroot 2023.02.9
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hi Peter,
 > Thank you for very much for your reply.

 > The reason for using 4.9.20 is that this is 6 years old system.
 > I cannot upgrade the kernel due to customer decision.

OK.

 > What do you mean by "is to boot unattended" ?

Encrypted disks means that you need to provide an encryption key.

On a normal PC this is normally done by interactively letting the user
type it in at each boot, but most embedded systems needs to be able to
boot unattended (E.G. without a user manually typing in a password), so
you need to store the encryption key somewhere safe.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
