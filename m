Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D434BC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810B160831;
	Mon, 13 Jan 2025 20:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5Qna0IxIBUd; Mon, 13 Jan 2025 20:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A3EE6083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3EE6083C;
	Mon, 13 Jan 2025 20:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B9C940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7330F60807
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qNnMzmN-LF5 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45F57606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F57606CE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45F57606CE
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:58:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybKp-1tL6lr18yz-017wVY; Mon, 13
 Jan 2025 21:58:50 +0100
Message-ID: <c8ac2b3f-4652-4764-a302-c518bd0f1696@gmx.de>
Date: Mon, 13 Jan 2025 21:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-4-fiona.klute@gmx.de>
 <20250113213003.0b2ef4ec@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250113213003.0b2ef4ec@windsurf>
X-Provags-ID: V03:K1:ChSzgfnM8zYSXTcB26lWu5v5r7of/fdY+JV21UV5Z8sx41G2jT1
 ZsEM1lMdM2hf45YyPw5H3r2pZOHDqLWM0OhC/BxpPsCpxcw1J9hpwx8TZPurtgrucbCwlyc
 rtTBRua4VK6bljPfxc7NmrGj/Ba5r1iEbqnk07sthTZo2bCaetHAfKarfvO/NzDtLKF4slk
 vdqFuRf1i2aSiqhWYC5zA==
UI-OutboundReport: notjunk:1;M01:P0:sEZaJFAaObQ=;1gdLCifi7kAGuGcyW/FVv9rDuUD
 Ra349fI1ltRAQJvoYIVKK7+EYavqZaYxOcLNhN/a72MyxFg3Lc582XYxmWXmHD4B6elYJWyz2
 Lkk4N/Qv4CpKYo6M/8opoMvrShQ5za3X2xuv0W5/BYkxNd0/WwWai4vg3npsH1jwIsxcGy+JR
 hnquTvSHEHH1IrK/TOiOYuz5oMATgSR1N91BFfQUXJTiUdlmpg8RnoUBivlEfOaUBaAgVJGwm
 Al9KH4iTaDCovAHRoQZ0z3l+4l9TBBA+1PiPxRDya7LUsuuAlJISnH/kHxL2gS35/5OGLTbgb
 sQ9JY5sXFXfeQk1aX5ZkzH4ErsCqt5JLkrmvw4jVZiRmd3zwBb30hBh+XMHBLz4DluWE/371c
 pFgDd4c7uzpyLcfk2ZwLwtBvUW52qnrGlzz8zrU3WIAUw5CjfxNe56bZm9YAP6jprID8/2SNE
 lZ7wlScdShfop3jbfzCynGbSlft3f8yduKmabFIectu+UCojUI5Pbq5HtVEPPtEh7hw/O5UYS
 L3UGIwM5rc2/2CIhY6n2FvrbttyIuCuFnvC9c3n2XnX8OJuhzeYnXZ7aHoSxKyhGyrsR3ZQOH
 CwS+Obmzx3v8El3WhPy3h5fXGNuzLi3ifrZ+0nJp2CpOmJUU2CxrEV46B08Oq99cn4pWro0DK
 iwmfry5p+T/iTG/IZffvzOT7yTXZaNsxMTunALOrd+0+peVuA1QvtFZXtSepTwr3L9NQy3/2v
 IWsP1SlleJpCfez+ghHwJ/zWaJ6h15k51gGEAhbM9iTYJ8WEcX9ilCGGUK4xDeAu9m23dJHRu
 tLcSl0rChteCEO9OWO9gHLFGjh/PlGDrPSpm8dQAUSAgRku9aePuLePSvojTeFsr/sLjrM4vE
 ICj3IWYIrl3282yCDLBLdt927ZMXK4VeH4ACF4oQEOUTOAxQ08RNQ+8lEE+x42M3jcw1uqRcP
 2aC8KePlq3emA8A2sQ8ZKEV7pVTsQOlwURN9PLFgU8CJI6owUiqJQRgZPmogd9Wo0iQAWoZ+O
 C3I2atIimGy6XaXo0auLrXDkIkkanqlN9DDUGui4F4ULDGZNrbf/JrfmXGKwAduCvKkDgIP8v
 Qx7CCzpmg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736801930; x=1737406730; i=fiona.klute@gmx.de;
 bh=3jSKPnRbS+57LYaekL/yuLyPyMX+pp6x394Dg0PHRgQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LAygL/X7KMi7bFTCllKzfYkP8tKyo6kr4SJkQ5xI9eKefITa2/JWB9el2KkHbl3/
 kBycPt1FquU01G1EURbfqtaoOdZRHcMatmamp6EWPTJdKmtTFBID1/CLdGNBlUmre
 5gORd0muNl9G9hiXnzPEAHl+G0EkROx5AYXact/uBz6FC+qqcj9Fo9i1rjBugdcz6
 NvK9JxBPV032JsSw8njBaXrs2HzI0DrmDPYBOe6LCT8qpCcVFjVmaz2braVFHnp4P
 BmFq7WmMBkopaR+ZG1PL+ID0eYMlwn+3iy43vR7FpGUYVopJBGIT74vM/G2EdA6uu
 AGiXmRbSjLL4habnXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LAygL/X7
Subject: Re: [Buildroot] [PATCH v7 3/5] package/python-gobject: bump to
 version 3.50.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 21:30 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Mon, 13 Jan 2025 21:04:52 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> Current gobject-introspection releases work with musl, so relax the C
>> library requirement.
>
> Is this change thanks to the bump of python-gobject to 3.50.0, or
> related to the previous patch? I'm trying to figure out if this
> dependency change has anything to do with the version bump.

This part is related to the previous patch. python-gobject requires GOI,
and if that works with musl python-gobject will, too.

Bestr regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
