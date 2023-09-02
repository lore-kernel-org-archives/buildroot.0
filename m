Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F8C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F97B40500;
	Sat,  2 Sep 2023 15:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F97B40500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jI-vYSfnF-mg; Sat,  2 Sep 2023 15:29:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3F2A40471;
	Sat,  2 Sep 2023 15:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F2A40471
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 086171BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF17860758
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF17860758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ9wLFmX8f_L for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:29:47 +0000 (UTC)
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC4A6074C
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC4A6074C
Received: from [192.168.50.162] ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cSZAqwxiWT5N3cSZAqusyh; Sat, 02 Sep 2023 17:29:40 +0200
Message-ID: <b8d73440-18af-a0c6-d3ca-928104b22844@benettiengineering.com>
Date: Sat, 2 Sep 2023 17:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Andrea Simeoni <andreasimeoni73@gmail.com>, buildroot@buildroot.org
References: <CAPmASevJ9KynWxPBga3chKQCBVUCeZ-gt88LMfAzt6+-F6bZHw@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPmASevJ9KynWxPBga3chKQCBVUCeZ-gt88LMfAzt6+-F6bZHw@mail.gmail.com>
X-CMAE-Envelope: MS4xfGbGLnE1PKwc3sxnG7j2iY6iIrudt9JdPoa0a/jYf/565R+yRQBhU/4M30tDbrO4FrbZeNvoLUU9NWckkhNats2SberCOfIQMCIiIrkNdLTr4d16I22b
 u232gFxdRbGWXlr0DqAtjccOsqVGXE8TZzeA/XYXHe0ZA8DaA2D0Cmnxj4vFHp0veWntQTjnTqDuf91zpIJSwpBM7pGVyA4xQQFbYOb5U9P/DEzkvNXIM4Om
 vgayYBpunC5EjT6H/goTYvaMwGnNb4qGHAn2RYiX72o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693668581; bh=fmojJbsfwxaQYrjln/2+6Uxcx1l9dCSa7oAN3JeK8Jo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gN60Q9gr/w77SmOk7xMEVvKdl3xQ0JJAOkn30lETkRFEW8lOmBe4WE09yfSx+934T
 Sj6L9/ePGBtLxhSiaMRNMxDgeOvCU4J2W+Akljs4MQ6AU61bvUfxDvcLyKZbF2BhMY
 FRC381n8wuTnlWSdT82hDqiZq35bUpBWQ8bwkPQM6MuOaQ3VlpL+vK+5aZ3jA/PRF0
 qkJnUl8COZZF48W7gz65SQjErtGOhYIMum0byjt+mzXIT8zY+XPg/a8afJ0aOX1TNz
 Mljy3P1XPqviTjuqwPubqE1wsiL7v4w4yk8ah7Nb1pTCSM68+MMzPIMogeK9dFxueR
 l2Ay8KceYWR4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gN60Q9gr
Subject: Re: [Buildroot] stat command missing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrea,

On 02/09/23 12:19, Andrea Simeoni wrote:
> Hello! How to add the stat command to the image?
> Is needed by QtCreator to deploy files to the remote target.
> 
> I tried to add CONFIG_STAT=y to the busybox config file but it's not 
> recognized.
> Even a search in xconfig did not find anything related to stat.
> Thanks

Enabling Busybox CONFIG_STAT option works good for me. How do you enable
it?

I mean, you have to add a busybox config file or a fragment.
To do the first test you can issue:
$ make busybox-menuconfig
and enable it under Coreutils
then you have to rebuild it with:
$ make busybox-rebuild

but the best way is to supply a busybox config fragment.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
