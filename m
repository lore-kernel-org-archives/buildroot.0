Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65688C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C8284E48;
	Fri, 26 Jan 2024 08:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C8284E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRf8yR4kHmpS; Fri, 26 Jan 2024 08:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4148484DE9;
	Fri, 26 Jan 2024 08:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4148484DE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8629F1BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FA636FA16
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA636FA16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HU65zh3Aw82M for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:43:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13C0F61AB0
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C0F61AB0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 099C440006;
 Fri, 26 Jan 2024 08:43:23 +0000 (UTC)
Message-ID: <43b543a2-6782-42f2-ac09-1c72d9c49d59@korsgaard.com>
Date: Fri, 26 Jan 2024 09:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240125144121.1534299-1-aperez@igalia.com>
 <8734ul6ruc.fsf@48ers.dk> <20240126003346.GB2901019@igalia.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240126003346.GB2901019@igalia.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libwpe: switch back to version
 1.14.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/01/2024 23.33, Adrian Perez de Castro wrote:
>> Hmm, this was bumped back in July before 2023.08-rc1. Is there no 1.16.x
>> version coming?
> 
> Not anytime soon. Release 1.14.2 which I just made yesterday includes all the
> fixes that are also in 1.15.2 -- usually we only do a new stable branch if
> there are new features, and we haven't added anything to libwpe for a quite
> long time.
> 
> Also, Yann asked on IRC whether the packages that depend on libwpe
> (wpebackend-fdo, wpewebkit, gst1-plugins-bad) can use 1.14.x... Yes,
> they can. For WPE WebKit we even have a compatibility table here:
> 
>    https://wpewebkit.org/release/schedule/
> 
> =)


OK, good - Applied, thanks.

> Maybe we should reconsider the versioning scheme, using suffixes for
> development releases and release candidates ("X.Y-devN", "X-Y-rcN")
> instead of even/odd numbering. It seems to cause enough confusion to
> at least consider the change.

I don't really feel strongly about it. It is a bit "odd", but consistent 
with the gtk/gnome stuff.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
