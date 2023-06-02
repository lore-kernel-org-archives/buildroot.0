Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C139C77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA21C42837;
	Fri,  2 Jun 2023 19:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA21C42837
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nOKs-Cuu7SX; Fri,  2 Jun 2023 19:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB0842746;
	Fri,  2 Jun 2023 19:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB0842746
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 100021BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE0F04012F
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0F04012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTDD2-oOmD0F for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:42:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECFB4400A4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECFB4400A4
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:42:17 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 853281C0004;
 Fri,  2 Jun 2023 19:42:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q5Af7-00BskA-GC; Fri, 02 Jun 2023 21:42:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230109042648.2342444-1-james.hilliard1@gmail.com>
 <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
 <CADvTj4o-0p0GLyp_LK_zciQACB9L5ZuTZyQU4My0ZcgwR0ym6w@mail.gmail.com>
 <468bf7d8-5ea2-d367-b6dc-65d01beb775c@smile.fr>
 <CADvTj4okAxHFG_dOdqJYaKAnt_5jOTrtkbHp8KNPkYvN16Tk9g@mail.gmail.com>
Date: Fri, 02 Jun 2023 21:42:13 +0200
In-Reply-To: <CADvTj4okAxHFG_dOdqJYaKAnt_5jOTrtkbHp8KNPkYvN16Tk9g@mail.gmail.com>
 (James Hilliard's message of "Wed, 31 May 2023 08:20:42 -0600")
Message-ID: <878rd1ejmy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

Hi,

 >> Do you think we should revert to ipython 7.x for 2023.02 and 2023.05? It is safe
 >> to do so?

 > Good chance there's some incompatible dependencies.

 >> ipython 8.x requires 4 new packages, I'm not sure it's safe to add them for
 >> 2023.02 and 2023.05.

 > Probably safer than trying to revert.

You may be right. I'll start by adding those 4 packages to master.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
