Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC6C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 10:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF98607C9;
	Sun, 31 Dec 2023 10:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF98607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXpV3831He9l; Sun, 31 Dec 2023 10:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC21860750;
	Sun, 31 Dec 2023 10:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC21860750
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D861BF487
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 10:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E014960750
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 10:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E014960750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkCwcsb1XDKB for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 10:30:03 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C75D6074C
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 10:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C75D6074C
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.163.240] ([213.147.164.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1rhFNh271j-00Wmq3; Sun, 31
 Dec 2023 11:29:58 +0100
Message-ID: <e0c3dc2c-c4fb-446c-8f64-cf58a97369b6@gmx.at>
Date: Sun, 31 Dec 2023 11:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-3-dalang@gmx.at> <20231108225550.4555e0b7@windsurf>
Content-Language: en-US
In-Reply-To: <20231108225550.4555e0b7@windsurf>
X-Provags-ID: V03:K1:QSQPEWwmUhF/rfRTGnZ/DRqlzZC9eJm1KA2haTnU9U2fXScdpfb
 mSLJeAiFUr5URCRtVC2BjD6UZYQLuLQf3b2E7xeFaWKEhhnzx5/s6p4v45xlYR9MumatD+t
 iEu3WlBJhND8W6i6zwp8UAOpjEcxAHw1FstWmL+aY9nOes5/hWVkKx67tpjys8ia2DSj5wa
 2DKKU5ipzMrMQxNclRoQA==
UI-OutboundReport: notjunk:1;M01:P0:INV2WIOvZNU=;2yz7jXSeHAs5DP82v9kGa74O+ZC
 KYO0nvyta2CKVkkUw3DHr7+CyE3u2fbJyxDopYAdmYKT6LqKARsgMVFTIattIbRc/gTVpH820
 ID/q+Xd6PWgpzTcT6x6KMcNYgI+yzJppAgaCEcYccrPEnT/203N3N983ck4mhJX3VIIwlMnMJ
 QWfUhiHvfef7NtT0VadGx+nl03FRYCH5QAepuXJvfHpTFIzifLWbr52dRelzi5fv4ClpKlCMD
 DqM2TmxYpIuyOntVoZWdnq94zKVr6SN8Z99S4JpWkQzSG5RGnn6HtQMvI3K33AbOU7RNaMxfQ
 RgPCl1HUXtaV2WI41zKJN2U1vLCGVLTM/mKVl5PXdv/zIMB/vc423oVIHxedNTAAZundptmAy
 lIK0FG4DaGpNqYtVYZUYTfIiakNJizUoqP3g5AQV6pV7cLRuYVffnRiVfHL6mul7GdNQZnL8z
 jikxssoDIXbZ8zAhf3rV71UCquFnTUnmtv/BQ8bG+VN5O2i06VL88DnADDVuLrVg/WRKIXv6v
 vTWAz3GnG5qSEnbT5R0vtzzxu988SdVKMHflcvCVfEzdlYl5EbAcHGExbGndzmDWXRGrczWGC
 VRDfRL9F3U59JkdqEJvMTt6BYCGRe32mor1hZUprq0Q9vGRQ8wXM7I0giypa0XGuF7SwqXxXy
 RN9MYvPKvdQKSLzmhQPk6+alVO1Of9a4RVx4bk/H1gtRGNC7sRT8U8IvOK4JgjDRIxfejJnE8
 toRNT+MP5uroGo5hUNvwBxv2d6ywWv+nB0lc4SIHVVUoL7BsTjxvcktIFTt7fkqbC/MkfkDgf
 LpOHY9lF97eS+WxlgHKyW8wo4NJhP6Zgq5xcVWuI4YOtc6SXJTE7l2in5xFzz5+qBFJRJp/o/
 CkCD5zTAUNavdoIFowuFig/VWTKAyIPEYHCbFad+jCVDXngz+mVM1NSyUKFizRPKNG9xwcJya
 96g8/OEiH7e1rCpRPkPb340YSKg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1704018598; x=1704623398; i=dalang@gmx.at;
 bh=seFBsTX3OmYlg+7RkF5cCfI6CZm3n109KwjoY2wvBy4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=o3NxwE5P1QaSyYctWOKuk1Uhg0tfWF25HU0GCJPqFkMN8q+0LNmmZTm9Fybd+BGE
 QobgIGKNannBg6Vl/faHQ/jrKBG7g74k+bwrhKHuFLoh0rqbsTO84LImz07zTfEqk
 k3V0ePyGfOHy2S/RGDdzP5U/g9XlXEYyJzmKIv6BiQJfzby+39vQi5hIfZIglRp/R
 eDG/+6GGpbSQoJTaBLW4YelFwFRMN37p41tluCrnCj5n5pJkpTc94esoA3VBQuu65
 57i9LBoP4fHfH51LRzv8f+/vH2iif2orNWwVaQBEExETyR9HIpbT++ynfPheF4gkd
 7XhIp7uqGZKCXq3pZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=o3NxwE5P
Subject: Re: [Buildroot] [PATCH v4 3/6] support/scripts/nvd_api_v2.py: new
 helper class
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

sorry for the long silence.

On 08.11.23 22:55, Thomas Petazzoni wrote:
> Hello Daniel,
>
> On Fri,  1 Sep 2023 21:27:11 +0200
> Daniel Lang <dalang@gmx.at> wrote:
>
>> The current NVD data feeds used for CVE and CPE checking will be retired
>> by 2023-12-05 [0]. Both have to be switched to the new v2 API. Since
>> fetching data from both sources workes the same, a common base class is
>> used to handle the API interaction.
>> With the new API JSON pages are downloaded, meaning that we have to come
>> up with a storage solution ourselves. Therefore nvd_api_v2.py manages a
>> generic set of methods to initialize and update a sqlite database.
>>
>> [0]: https://nvd.nist.gov/General/News/change-timeline
>>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>
> Thanks for working into this. I wanted to merge this, but taking a
> fresh look at this, I don't quite understand the SW design choices
> you've made when it comes to splitting between the NVD_API class and
> the CVE_API class.

My idea was to move code that is needed for CVEs and CPEs into a common
file since with the new API both endpoints are quit similar.

Therefore NVD_API contains code for querying the API, handling pagination,
querying meta information from the database. Additionally downloaded information
is passed to CVE_API or CPE_API via save_to_db().

Not sure, if that makes it clearer.

>
> The NVD_API class implements
>  - An actual init_db_meta() method
>  - A dummy init_db() method
>  - A dummy save_to_db() method
>  - An actual download() method
>  - An actual check_for_updates() method
>
> Then the CVE_API class inherits from NVD_API, which provides the actual
> implementation of init_db(), save_to_db() among others.
>
> What is the reasoning behind this? One could think that the NVD_API
> class was only related to calling the NVD HTTP API, but it does have
> knowledge of the local sqlite database.

Yes, it has knowledge of the local database to load and save meta information,
which is currently only "when was the last run".

>
> So I'm really not clear on this design. Could you provide some details?
>
> Now I see that the CPE_API class also inherits from NVD_API, but I'm
> still confused.

While implementing this I was going back and forth on whether to use a
database.
This version of the patch does, but I have since moved the code to GitLab
to try out GitLab Package Repositories for hosting the archives for each year.
During this move I switched back to using JSON files.
This makes it possible to query the data once for all buildroot users and filter
the data for the needed fields.
This means, that we end up with a couple of MB per year instead of a 400MB sqlite
database.
This approach could either be part of sources.buildroot.org or via GitLab.


>
> Thomas

Regards,
Daniel

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
