Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B5EC7EE43
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 19:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A1D80E50;
	Mon, 12 Jun 2023 19:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A1D80E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9pZf_s28ZJW; Mon, 12 Jun 2023 19:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2877D80E17;
	Mon, 12 Jun 2023 19:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2877D80E17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B45791BF2C9
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 19:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99579409A0
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 19:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99579409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMhIeZzPbiE7 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 19:28:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0E940995
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C0E940995
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 19:28:29 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AD381C0005;
 Mon, 12 Jun 2023 19:28:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q8nDF-003bWh-7C; Mon, 12 Jun 2023 21:28:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-3-aduskett@gmail.com> <87pm60znip.fsf@48ers.dk>
 <20230612175414.GA2773@scaer>
Date: Mon, 12 Jun 2023 21:28:25 +0200
In-Reply-To: <20230612175414.GA2773@scaer> (Yann E. MORIN's message of "Mon,
 12 Jun 2023 19:54:14 +0200")
Message-ID: <87bkhkzdie.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 02/13] package/python-pip: add host
 variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-06-12 17:52 +0200, Peter Korsgaard spake thusly:
 >> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
 >> > In the following patch that updates libselinux, the libselinux python tools now
 >> > require pip to install.
 >> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 >> Somewhat related, is there any way we can ensure that this pip is only
 >> used for the installation logic (which is fine if a bit odd)

 > Yes, I too found it odd. I don't recall the details, though, but indeed,
 > we do need pip to perform the install step, while the build step is
 > still performed with setuptools.

 >> and NOT to pull in extra python
 >> dependencies (which is naturally NOT OK)?

 > That was a concern of mine when I applied the patch, too, but I did not
 > have a good idea to prevent that.

 > But since then, I've learnt about --no-index, and if that is not enough,
 > we can redirect to a fake index with -i and --extra-index-url. Could
 > using --no-deps also be useful?

 > So we could maybe provide our wrapper around pip3, that uses a combo of
 > those options, to prevent installing anything but a local file.

Ahh, yes - That could be a nice improvement!

 > That would not work for packages that use a python script to import pip
 > and directly call it, though; is that even possible (I'd guess so, and
 > probably something, somewhere is (ab)using that).

Hmm, I guess someone is creative enough for that ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
