Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F64C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 09:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0199832D1;
	Tue, 31 Oct 2023 09:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0199832D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0LQl7wqhoAj; Tue, 31 Oct 2023 09:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A770831A2;
	Tue, 31 Oct 2023 09:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A770831A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3122F1BF2C2
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C59424EB
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 09:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C59424EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17j4IwR7xBUz for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 09:48:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0762F424E2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 09:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0762F424E2
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA6E3FF812;
 Tue, 31 Oct 2023 09:48:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxlMI-0042Zt-0S;
 Tue, 31 Oct 2023 10:48:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Scott Fan <fancp2007@gmail.com>
References: <20231026181904.3218122-1-bernd@kuhls.net>
 <87o7gf1b6h.fsf@48ers.dk>
 <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
Date: Tue, 31 Oct 2023 10:48:26 +0100
In-Reply-To: <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
 (Scott Fan's message of "Tue, 31 Oct 2023 17:00:46 +0800")
Message-ID: <87jzr315sl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.1.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Scott" == Scott Fan <fancp2007@gmail.com> writes:

 > For 2023.02.x branch, it need bump to 1.1.1w version.

Why? Isn't 1.1.1w only including the security fix for the Windows-only
CVE-2023-4807 vulnerability?

https://www.openssl.org/news/secadv/20230908.txt

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
