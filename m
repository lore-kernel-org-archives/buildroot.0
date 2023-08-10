Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED8C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4110C41DA4;
	Thu, 10 Aug 2023 20:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4110C41DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUJGeJ_xJmmh; Thu, 10 Aug 2023 20:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C23D41DA6;
	Thu, 10 Aug 2023 20:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C23D41DA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA2CA1BF5DF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0ECD61034
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0ECD61034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_O0nOXVonNi for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:12:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E343160E3F
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E343160E3F
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.222.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1pbZKY1zf1-00yOJW; Thu, 10
 Aug 2023 22:12:37 +0200
Message-ID: <88f0eecd-cde8-4069-a750-ee2cbab679fb@gmx.at>
Date: Thu, 10 Aug 2023 22:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <143fe7eb-b3ed-55f0-f1b7-9ea9d4582d50@mind.be>
 <20230809225901.470e0270@windsurf>
 <b1d7fd7a-4959-419b-b7ff-0778b1e99722@gmx.at>
 <20230810090721.1e052f35@windsurf>
 <12cfcd50-66e4-4c03-febd-b9a259bf10d7@mind.be>
 <20230810154241.3faee0fc@windsurf>
 <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <2dce28a5-8e0d-f240-9b11-d3ff08604e88@mind.be>
X-Provags-ID: V03:K1:udjIMMKv/L2K5cSKCfaOwap/2FFf+Z9nDEavdkioq52AzhvDw0B
 HuM3lTy9FjneQjdxkq9I4X1CV9wIPIbCwtATrDlPe3ajW9yJcQ7AORXmN1sCHZZvTaRL76c
 qElsfc+kbwfp6h9SFaZVOfdfrNat6QVMPKUCI/hQG7mBZnGpYe7O6toDKKNRNK4ox4x/VGt
 LSS5VxKmWUrLS+GpttrNw==
UI-OutboundReport: notjunk:1;M01:P0:aB1XTWxv5ws=;yOkEdCHqao9TzE2B9yaBteIWag4
 FagIA8+zrNghKyKahdS9prgRy1at1iUFc4p8fRpzWbyJxv1jEt3imCqnstQvWFwrjOR8wYYRy
 AMoV/XbZ2pf6UheDmyWasMHRg5U3kG8hcJKl6t5i8GcPejXCPICkMZ6SXl1ncyFkdt71+i8D5
 +Pg8uCgv48VLBCjWRp16QdvYaTDyhUe7Cg/KWYKG3c904rTwWjJvgf48ZxXHkZdlgPaHXJitu
 xu+NQphVQ+Ps+fvwxIjR1sexhgAawGc7W7i/1w/V3zggza/+osYYV7G51Avk2Asm6RrAEGsxi
 vmApcPUdjyj9r07vl+jUwoV4BBvlDHSOI7eclCr3LYh6CMt6rp9JA0vLsHFNptsFlLnCbj770
 vfOontvDZzdyNp2rPBIdhZNsxYtfqBlTG3VCF33qk6JJuyUrsvKtgWOYNvp07rWmb7qFmnckn
 VPJYzlq73hYmfyFIjegt87K4o/uU3hyjkf8VxLHndYRP96XlAu6Oq136ZcFH8yDtoJjn7xXil
 zIA+02Hr2+cP4YjOdhibsbJLLI76tGvQvmS2r08MxDLslftCh1RnBt86RowFL3xRkyUEfsrcU
 mil1Ck6UBK0NdMT8C64cWDAGxxzfUHRapjYrI0C6rKGs8A5qSa9as+ij98QKArUPKwEqUTSSV
 mhbmgMQBoZ0dMzgdN4Cj9+qd4aSCjeiU9P+ZNZYTt1abemiON/KCjwGwkRl08GM+QCWKJhrEL
 tHr9omFr0SDRF3x1TjQ2sSHOu1WpchGHDV5pBIo89aQvJx287Z2h4w7Y0OI6jgatee5yltY+6
 TwaEH8NTHfVscTpUo5vGqGyAFe2TlOgU1s1sCOr+J0LRM1Wcs4GHd6f3SckuIXGVsGjix/agF
 8TGrTVgyTMY5SWIqZUyT8i5P/mnoIQEpQ8OqzhcA9WzceEPT7BevB+bUQ3klr8L8fYCWcHMvY
 6olxTRlU2Xp/rEG2IE8Koqvfhjs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691698357; x=1692303157; i=dalang@gmx.at;
 bh=AvIQF2oME8VGUey2D9aM1TcK/t6KQtTls4jmcB6qoTk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=is9KF25QCdQZlP1QlLaZNrCca4OUDxKsaI/ANK/ShlPhPm5A76STyVmKbItCMQpRRZ4E5Ow
 CNoAuB8Sxu+PiIfIzu3NnnyEScxQGN/rMkbOs8tFOXX7d9Ja1fMt4nl+N+QxVdXoYMc34n8x2
 aJ3g4EhsJAo5dPrVipJ5Cxt8FJGDhAAp4eAh3XEpI8vCbV5lYtn+QVrwxND/Fy+mz+3hs0mGU
 qgXHIq+1wmrxj6/c8xWyn/FUswdw1sOO3aSj8mtBp7jlfF4yW4N13ItH6LnpoECV8rm+2VlMy
 iwKaVScFkrl25l41yikFUUT9sHqqdwgastg9e+Eyjh7rkvCtIidA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=is9KF25Q
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: buildroot@buildroot.org, clement.ramirez@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAuMDguMjMgMTY6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBPbiAx
MC8wOC8yMDIzIDE1OjQyLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiBPbiBUaHUsIDEwIEF1
ZyAyMDIzIDE1OjE4OjQyICswMjAwCj4+IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWlu
ZC5iZT4gd3JvdGU6Cj4+Cj4+IE1heWJlIEknbSBkcmVhbWluZyBoZXJlLCBidXQgaWYgaXQgZG9l
c24ndCB3b3JrIGxpa2UgdGhpcywgaXQgYmFzaWNhbGx5Cj4+IG1lYW5zIHRoYXQgZm9yIGFueSBw
YWNrYWdlIGluIEJ1aWxkcm9vdCB0aGF0IG5ldmVyIGhhZCBhbnkgQ1ZFLCB3ZSBoYXZlCj4+IGFi
c29sdXRlbHkgbm8gZ3VhcmFudGVlIHRoYXQgd2Ugd2lsbCBwcm9wZXJseSBub3RpY2Ugd2hlbiB0
aGUgZmlyc3QgQ1ZFCj4+IGdldHMgcmVwb3J0ZWQuIE1heWJlIHRoYXQncyBsaWZlIGFuZCB3ZSBo
YXZlIHRvIGxpdmUgd2l0aCBpdCwgYnV0IGl0Cj4+IGtpbmRhIHN1Y2tzLgoKV2Ugc3RpbGwgbWF0
Y2ggYWdhaW5zdCAqOjxwa2cgbmFtZT4gaWYgdGhlIENQRSBpcyB1bmtub3duLgpUaGF0J3Mgd2h5
IENWRS0yMDIxLTQ1NDY0IGlzIGxpc3RlZCBmb3Iga3ZtdG9vbCBldmVuIHRob3VnaCBubyBDUEUg
SUQKaXMga25vd24uClNvIHRoZXJlIGlzIGhvcGUsIHRoYXQgYSBDVkUgZ2V0IGxpc3RlZCBldmVu
IGlmIHRoZSBwYWNrYWdlIGhhcyBubyBDUEUKSUQgbGlzdGVkLgoKPgo+IMKgWXVwLiBUaGF0J3Mg
d2h5IEkgY2xhaW1lZCBpbiBteSBFT1NTLUVMQyB0YWxrIHRoYXQgdGhlIENQRSBhcHByb2FjaCBp
cyBicm9rZW4gOi0pCgpXb3JraW5nIHdpdGggdGhlIGRhdGEsIEkgaGF2ZSB0byB0aGUgYWdyZWUu
IFRoZXJlIGlzIGEgbG90IG9mCmluY29uc2lzdGVuY3kgYW5kIHdlaXJkbmVzcy4KVGhlIHRoaW5n
IHRoYXQncyByZWxldmFudCBmb3IgbWUgaW4gdGhlIGN1cnJlbnQgcGF0Y2hzZXQgWzBdOgpEbyB3
ZSB3YW50IHRvIGtlZXAgZ2VuLW1pc3NpbmctY3BlIG9yIGRyb3AgaXQ/CkknbSBhc2tpbmcgYmVj
YXVzZSBhIGxvdCBvZiBhZGRpdGlvbmFsIGRhdGEgbmVlZHMgdG8gYmUgc3RvcmVkCnRvIHRoZSBk
YXRhYmFzZSBmb3IgZ2VuLW1pc3NpbmctY3BlIHRvIHdvcmsgKHRpdGxlLCByZWZlcmVuY2UgdXJs
cy4uLikuCkRyb3BwaW5nIHRoYXQgc2NyaXB0IHdvdWxkIGFsc28gbWVhbiBzaW1wbGlmeWluZyB0
aGUgZGF0YWJhc2UsCndoaWNoIGlzIGVhc2llciBub3cgdGhhbiBvbmNlIHRyYW5zaXRpb24gaGFw
cGVuZWQuCgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0CgpEYW5pZWwKClswXTogaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzY4MTcy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
