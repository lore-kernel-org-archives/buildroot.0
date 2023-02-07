Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7A1C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19713812EB;
	Tue,  7 Feb 2023 16:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19713812EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0nJwRyLsDOx; Tue,  7 Feb 2023 16:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FE381241;
	Tue,  7 Feb 2023 16:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FE381241
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1292B1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0A9A61009
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A9A61009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6V0Buv-n1YC7 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99A96100E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E99A96100E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:51:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1A1E113F86A;
 Tue,  7 Feb 2023 17:51:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 17:51:09 +0100
Date: Tue, 7 Feb 2023 17:51:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20230207165109.GJ4124@scaer>
References: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012164831.10476-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675788672;
 bh=+by1WzYUGuWP8nzqPBpXIUNt+4zvGHAHJTNRDAYkqFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ajq1qTv/kkXc0eCIW97phs3ODJNKbZnA1I5z6+174POm+xidXQco2jZUtH+pTK9g4
 VxiBpkVAoRIUCb7VUkGrCA8vXs8Ni734lte0VQjRLE3nRTMqYV579DlEDaxkeUTa+c
 tICkuEHrhqfU8QT6EDoSt4u+MWABiYfdW7zpEcSwME2nUkPL/MzZq0rseuGb6hr3WA
 9dFUpdFTz+Dc3q6qmMiucos3MlXGxmrbBpzutv2NhV8cLEg2yKYH0oG1DBztU+UBT5
 MbYKa/gNoN3t1NN1UhKvxQm9f+hGtgoWcBKN0xIV3L6VQifE9P4Ije8AjaNs+s7VLl
 iUqa8DLbtxclQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ajq1qTv/
Subject: Re: [Buildroot] [PATCH 1/1] utils/test-pkg: proper output on host
 without jq installed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMi0xMC0xMiAxODo0OCArMDIwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IE9uIGhvc3Qgd2l0aG91dCBqcSBpbnN0YWxsZWQsIHRl
c3QtcGtnJ3Mgb3V0cHV0IGlzIGFzIGZvbGxvd2luZzoKPiAKPiAkIC4vdXRpbHMvdGVzdC1wa2cg
LXAgbW1jLXV0aWxzCj4gICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBb
MS82XTogd2hpY2g6IG5vIGpxIGluICgvdXNyL2xvY2FsL3NiaW46L3Vzci9sb2NhbC9iaW46L3Vz
ci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L29wdC9iaW46L3Vzci9saWIvbGx2bS8xNC9iaW46
L3Vzci9saWIvbGx2bS8xMy9iaW46L3Vzci9saWI2NC9vcGVuY2FzY2FkZS9iaW4pCj4gSlEgSVMK
PiBPSwo+ICAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IHdo
aWNoOiBubyBqcSBpbiAoL3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2Jpbjov
dXNyL2Jpbjovc2JpbjovYmluOi9vcHQvYmluOi91c3IvbGliL2xsdm0vMTQvYmluOi91c3IvbGli
L2xsdm0vMTMvYmluOi91c3IvbGliNjQvb3BlbmNhc2NhZGUvYmluKQo+IEpRIElTCj4gT0sKPiAg
ICAgICAgICAgICAgICAgICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiB3aGljaDogbm8g
anEgaW4gKC91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2JpbjovdXNyL3NiaW46L3Vzci9iaW46
L3NiaW46L2Jpbjovb3B0L2JpbjovdXNyL2xpYi9sbHZtLzE0L2JpbjovdXNyL2xpYi9sbHZtLzEz
L2JpbjovdXNyL2xpYjY0L29wZW5jYXNjYWRlL2JpbikKPiAuLi4KPiAKPiBTaW5jZSB0ZXN0LXBr
ZyBoYW5kbGVzIHRoaXMgY2FzZSB3ZSBjYW4gaGlkZSB0aGlzIGVycm9yIG1lc3NhZ2UgYW5kIGhh
dmUKPiBwcm9wZXIgb3V0cHV0Ogo+IAo+ICQgLi91dGlscy90ZXN0LXBrZyAtcCBtbWMtdXRpbHMK
PiAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiBPSwo+ICAg
ICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjctZ2xpYmMgWzIvNl06IE9LCj4gICAgICAg
ICAgICAgICAgICAgIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBbMy82XTogT0sKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCj4gLS0tCj4gIHV0aWxzL3Rlc3QtcGtnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvdGVzdC1w
a2cgYi91dGlscy90ZXN0LXBrZwo+IGluZGV4IDRlYmZkOWFmNjYuLmU3ZjU0NjQ4MTcgMTAwNzU1
Cj4gLS0tIGEvdXRpbHMvdGVzdC1wa2cKPiArKysgYi91dGlscy90ZXN0LXBrZwo+IEBAIC0yMDEs
NyArMjAxLDcgQEAgYnVpbGRfb25lKCkgewo+ICAKPiAgICAgICMgVmFsaWRhdGUgdGhhdCB3ZSBn
ZW5lcmF0ZSBwcm9wZXIganNvbiBhcyBzaG93LWluZm8KPiAgICAgIHsgdHB1dCBzbXNvOyBwcmlu
dGYgJz4+PiBSdW5uaW5nIHNob3ctaW5mb1xuJzsgdHB1dCBybXNvOyB9ID4+ICIke2Rpcn0vbG9n
ZmlsZSIgMj4gL2Rldi9udWxsOwo+IC0gICAgSlE9IiQod2hpY2gganEpIgo+ICsgICAgSlE9IiQo
d2hpY2gganEgMj4gL2Rldi9udWxsKSIKPiAgICAgIGlmIFsgLXogIiR7SlF9IiBdOyB0aGVuCj4g
ICAgICAgICAgbWFrZSBPPSIke2Rpcn0iIGhvc3QtanEgPj4gIiR7ZGlyfS9sb2dmaWxlIiAyPiYx
Cj4gICAgICAgICAgSlE9IiR7ZGlyfS9ob3N0L2Jpbi9qcSIKPiAtLSAKPiAyLjM3LjMKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
