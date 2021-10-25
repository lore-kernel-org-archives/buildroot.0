Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ADBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABCD60EB1
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 13:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EABCD60EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B814F40383;
	Mon, 25 Oct 2021 13:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9KLLuo6nUU0; Mon, 25 Oct 2021 13:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEAF4037F;
	Mon, 25 Oct 2021 13:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A771BF30A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9222E402A3
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 13:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ardNndi-oCgw for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 13:10:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95D9C4029A
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:10:55 +0000 (UTC)
Date: Mon, 25 Oct 2021 14:10:43 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Message-Id: <V9BJ1R.G7Z0UMF2MZVF@crapouillou.net>
In-Reply-To: <SN5P110MB0480C708DCA6CEC9E1765471F2839@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
References: <20211018214014.1202-1-matthew.weber@collins.com>
 <20211018214014.1202-2-matthew.weber@collins.com>
 <FYZI1R.QAI4TMAEMRIG2@crapouillou.net>
 <SN5P110MB0480C708DCA6CEC9E1765471F2839@SN5P110MB0480.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Subject: Re: [Buildroot] [External] Re: [PATCH 2/2] package/lightning:
 [revert]ignore not applicable CVE-2020-7747
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matthew,

Le lun., oct. 25 2021 at 13:09:25 +0000, "Weber, Matthew L Collins" =

<Matthew.Weber@collins.com> a =E9crit :
> Paul,
> =

> =

>>  From: Paul Cercueil <paul@crapouillou.net>
>>  Sent: Monday, October 25, 2021 4:06 AM
>>  To: Weber, Matthew L Collins <Matthew.Weber@collins.com>
>>  Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Yann E . =

>> MORIN <yann.morin.1998@free.fr>
>>  Subject: [External] Re: [PATCH 2/2] package/lightning: =

>> [revert]ignore not applicable CVE-2020-7747
>> =

>>  Hi Matthew, all,
>> =

>>  I still get the emails about CVEs in Lightning though :(
>>  I just got one a few hours ago.
> =

> The changes to resolve that were merged on master last week and I =

> noticed today that Peter applied them to the long term support branch =

> (probably after you received that email).  Which branch did the email =

> list CVE against?
> =

> Regards,
> Matt

I get those emails for the 2021.02.x and 2021.08.x branches.

Cheers,
-Paul


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
