Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B081C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0651A40AE8;
	Sat, 23 Jul 2022 12:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0651A40AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAmST10usx2X; Sat, 23 Jul 2022 12:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136B1401A4;
	Sat, 23 Jul 2022 12:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 136B1401A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C81D81BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1CA384989
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CA384989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LN7snRUn0KPr for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:40:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB2383E17
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEB2383E17
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:40:44 +0000 (UTC)
Date: Sat, 23 Jul 2022 13:40:20 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-Id: <8J4HFR.YJ0SRPNI7QRD@crapouillou.net>
In-Reply-To: <eac575df-c7d2-c356-d66d-45f3b4f2f37f@mind.be>
References: <20220721183503.369200-1-paul@crapouillou.net>
 <a96703d8-83e8-fc44-0d89-0d5e7e0ba395@mind.be>
 <4Y2HFR.1A53UFE79W2J2@crapouillou.net>
 <eac575df-c7d2-c356-d66d-45f3b4f2f37f@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1658580034; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4RtiX4Foi9U3klaBnYmiXKZfKsr1XnHkGBGQLfvla0=;
 b=kzvA4+oPcPYVCO1O8lww5A72Nb0U0rZ6AFFbQOTeNCllG/kOt6nrsxksGZDS5oDqYnnKrM
 ZNNIX4gAUhfu8wAPJvpk+a8YYaEIv11OMeNgoRQnKkB7wY7T2R0TnZ3LFMQ0S6/WSPOIRS
 f3ZTsKNuiNJHCYqeV4cO9L/kpzl+P+Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=kzvA4+oP
Subject: Re: [Buildroot] [PATCH 1/1] linux: allow modules install path to be
 overriden
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



Le sam., juil. 23 2022 at 14:35:22 +0200, Arnout Vandecappelle =

<arnout@mind.be> a =E9crit :
> =

> =

> On 23/07/2022 14:06, Paul Cercueil wrote:
>> =

>> =

>> Le sam., juil. 23 2022 at 14:01:12 +0200, Arnout Vandecappelle =

>> <arnout@mind.be> =7Fa =E9crit :
>>> =

>>> =

>>> On 21/07/2022 20:35, Paul Cercueil wrote:
>>>> On my system the modules are not installed in the root filesystem
>>>> directly, but in a separate squashfs image that is then shipped
>>>> alongside the kernel.
>>> =

>>>  That use case is way too specific to add support for it...
>>> =

>>>> Support this setup by allowing board files to override the install =

>>>> path
>>>> for the kernel modules.
>>> =

>>>  This works for in-tree modules, but it stops working if you have =

>>> any =7F=7Fout-of-tree modules.
>> =

>> Fair enough.
>> =

>>>  The proper way to do this would be to add a post-build script that =

>>> moves =7F=7FTARGET_DIR/lib/modules to where you want it - or probably =

>>> just run mksquashfs =7F=7Fon it and remove it afterwards.
>> =

>> But this would only work once and then it would be impossible to =

>> rebuild.
> =

>  If you want to support rebuild, you have to rsync to some other dir =

> and keep that dir.

If I keep that directory then it will end up in the rootfs as well...

-Paul


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
