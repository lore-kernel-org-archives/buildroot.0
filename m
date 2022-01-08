Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C65BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A3B4021E;
	Sat,  8 Jan 2022 14:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a91U_grTVX4C; Sat,  8 Jan 2022 14:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8169140249;
	Sat,  8 Jan 2022 14:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E65831BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D418E81363
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C70GdVJx6nWU for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:17:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C93981357
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:17:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1652FC9A64
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:14:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4861960004;
 Sat,  8 Jan 2022 14:14:06 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6CTt-0001uU-Jw; Sat, 08 Jan 2022 15:14:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
Date: Sat, 08 Jan 2022 15:14:05 +0100
In-Reply-To: <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 (Fabrice Fontaine's message of "Sun, 2 Jan 2022 21:36:34 +0100")
Message-ID: <874k6egvrm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 > Indeed, this is also an alternative, even if I think that adding
 > mbedtls3 would be a great addition.
 > For example, libcurl supports mbedts 3.0 since its version 7.79 and
 > https://github.com/curl/curl/commit/3f126138be3c459a2794d35f8170e92e65a50dad.
 > Otherwise, as requested by Thomas, I sent an email to mbedtls mailing
 > list:
 > https://lists.trustedfirmware.org/archives/list/mbed-tls@lists.trustedfirmware.org/thread/HEHCNQZTBOZV56RTGRTGSQQRMEWYJPGI/

What is the plan from upstream regarding mbedtls 2.x? Will it be
maintained in parallel with 3.x for some time (and for how long?) or is
it effectively EOL already?

If it is EOL then I guess we should just update the current mbedtls
package to 3.x (and disable mbedtls support for packages not compatible
with it yet), but if the plan is to support 2.x for quite some time then
indeed a separate mbedtls3 package makes more sense.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
