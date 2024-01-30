Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1015C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F2E821F9;
	Tue, 30 Jan 2024 22:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F2E821F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDUTmUaBXQJx; Tue, 30 Jan 2024 22:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DFF821F6;
	Tue, 30 Jan 2024 22:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DFF821F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A92D71BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82677821F6
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82677821F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAhvg3vFBn_k for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:03:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BDC9821E5
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDC9821E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76087C0005;
 Tue, 30 Jan 2024 22:03:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rUwCt-00Gbr3-2f;
 Tue, 30 Jan 2024 23:03:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgy7KsqtSyzJJaw9r6a7c9atEpPQpbbJgGn2qY=yi=nLFg@mail.gmail.com>
Date: Tue, 30 Jan 2024 23:03:51 +0100
In-Reply-To: <CABRndgy7KsqtSyzJJaw9r6a7c9atEpPQpbbJgGn2qY=yi=nLFg@mail.gmail.com>
 (Zvi Vered's message of "Tue, 30 Jan 2024 09:54:53 +0200")
Message-ID: <87il3azdfc.fsf@48ers.dk>
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

 > Hello,
 > I'm booting an x86 Intel CPU using Linux 4.9.20 (32 bits) and buildroot
 > 2023.02.9
 > I consider using LKUS in order to encrypt the disk.
 > Is it a wise decision ?

LKUS? Do you mean LUKS (Linux Unified Key Setup)? LUKS is good (but is
just a standard for describing the encryption meta data).

Any specific reason for using such an old Linux kernel version?


 > The motivation: If someone will steal the disk, it will be difficult to
 > copy its contents.

 > I can not use hardware encryption because I cannot replace the disk.

Like always with encryption, the difficult part is handling the
encryption key - Especially if the system is to boot unattended.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
