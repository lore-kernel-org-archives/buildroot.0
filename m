Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC91C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E41A61048;
	Mon, 19 May 2025 12:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jTLNXpHayN8; Mon, 19 May 2025 12:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4074B60F3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4074B60F3B;
	Mon, 19 May 2025 12:20:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B77D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFEE400F2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1B7_0mnOr9W for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4076A4102F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4076A4102F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4076A4102F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:20:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1ua3fL109r-00IGkX; Mon, 19
 May 2025 14:20:36 +0200
Message-ID: <fd6adc0e-6f2e-436c-961a-d96322a68e73@gmx.de>
Date: Mon, 19 May 2025 14:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250414161545.2863615-1-fiona.klute@gmx.de>
 <20250414161545.2863615-2-fiona.klute@gmx.de>
 <20250517172714.691fef81@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250517172714.691fef81@windsurf>
X-Provags-ID: V03:K1:BpZK2OlZGH3FWtlaWzVTKRSg4X5EDbtszclzk41qIrUoDuvdc8c
 Ae0T+CwFeig8SLgNMGHSA4jDtI1GpCRjAV287QmOy18LvUNX01cuBOXFJtbf9C6yqYh/xUx
 h/T6prUHUzhEm5mrk8+SFa+fvUKtlO25BqULvmTp5/UVLsRjukLRshbttqnDHSqIU/YPrkZ
 GyFpyU0qFTu3yF+InAgUA==
UI-OutboundReport: notjunk:1;M01:P0:jcw461BZh/Q=;RrP8mVNBtPeaq3pZluIhUtjmmf3
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747657236; x=1748262036; i=fiona.klute@gmx.de;
 bh=XUPNV9K8mKPx4xzBUV4gEJmx9ORiMN0jc2hjs92krKU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Qd+MiNGA0llxPDv8gy/E0AJoWLTKU+SjZHl3h8R0o3DEufQh+eAERO+esvSq4dgd
 34ptqhF13hIxDyBQ7ZTK+g2lSPI/KgGj+vEYld3snpSK1vQDp3QTlWndSrQw2ofWh
 k9PJUdVGGsWh5HdT7FsujnWclOqFXaYAlhQ+ts2gvwoFV7vqTeXosLMAZuF3InF8j
 Tb2S2VGLEi2hViInMGwFDKAR9lxrI1VGrl+zDw75KMqpCXP8xTI8vjD8Q7ZBItdAR
 N0IotwvXnS2mhH3tjtA6VhRiNzsVRlTPK03pqUfSMLBHqOOxxyAqNH1v4UUmk4eDx
 go41p9qfVBwqCD3avw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Qd+MiNGA
Subject: Re: [Buildroot] [PATCH v4 2/4] package/python-gobject: fix event
 source registration with Python 3.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 17.05.25 um 17:27 schrieb Thomas Petazzoni:
> Hello Fiona,
> 
> Thanks for working on this (which we know is a complex topic). However,
> while the series looks good and I was about to apply it, there's one
> fairly significant concern below.
> 
> On Mon, 14 Apr 2025 18:15:43 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Since Python 3.13 BaseSelectorEventLoop.add_reader() and
>> BaseSelectorEventLoop.add_writer() use the mapping returned by
>> selector.get_map() to detect if a file object is already
>> registered. This fails with the implementation in gi.events._Selector
>> if some calls use a file object, and others the raw file descriptor.
>>
>> Full upstream bug report:
>> https://gitlab.gnome.org/GNOME/pygobject/-/issues/689
>>
>> This bug breaks package/python-aiomqtt, because its client object uses
>> file objects in some places for the connection socket, and the file
>> descriptor in others. The result is that the connection attempt times
>> out because source registration fails, and the Future that marks
>> successful connection never resolves.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
>> The bug fixed by this patch is present in 3.50.0 and 3.52.3 alike, the
>> reason for applying the update first is simply that the patch doesn't
>> apply with 3.50.0, and backporting would be unnecessary effort when
>> the update is due anyway.
> 
> And actually that doesn't work, and we want exactly the opposite: the
> fix before the bump. Indeed, the fix is needed for our 2025.02.x LTS
> branch, which has python-gobject 3.50.0. So we definitely want the fix
> on 3.50.0 (so that we can backport it to 2025.02.x) and *then* the bump
> (which would be only on the master branch).
> 
> Do you think you could rework your series with this change?
I've just sent a new version:
https://patchwork.ozlabs.org/project/buildroot/list/?series=457457

The kind pygobject people backported the patch to their 3.50 branch, so 
at this point was just a matter of applying that first. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
