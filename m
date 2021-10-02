Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA148C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8BF61B04
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C8BF61B04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E9740652;
	Sat,  2 Oct 2021 20:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOn_pi8Tmg4p; Sat,  2 Oct 2021 20:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD9B40682;
	Sat,  2 Oct 2021 20:28:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A1F81BF2B9
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE6F40682
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgkHoJd9vWbA for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 20:28:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEFB840652
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 20:28:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 68396B0053B;
 Sat,  2 Oct 2021 22:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633206491;
 bh=8YcBPEubQo/lqYYAEEyrYzUtRzGPDTd93c4qNnyAkdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAGe9fmOWCByG1acvI7KaVGX4moLV6mhxXob0vnXGWifgaF6oZNdyhJEBGYFliGys
 tbGoFwHo7qQypmDMqL9G/kK0bSyJO0ifImnmsApqm7L0462KXw8OwL222ICkbAVAZb
 cLlGs2Jf4jNUEYfmHHu/0lByj08OLTjGF703gDasU5Jh/h/FmlH9Nn5MNL7scwf1Dm
 sF7CqsqylGHf0dYFr4ltbv5PB1ykgddvQdHIXhdJ8i1Y2HvCAMXcolmEzL2NHDu/Mm
 k7eovvXl636lt+8hzG3rFjbqTFnnF9MgU/LY59a+D7IMCkZJzLjqqWMMU/smId9Gac
 ikjyVUf3iKHDQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Oct 2021 22:28:05 +0200
Date: Sat, 2 Oct 2021 22:28:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211002202805.GX1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-6-kory.maincent@bootlin.com>
 <20210930202810.GP1504958@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930202810.GP1504958@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 5/7] support/testing/infra/emulator.py:
 update encoding when calling qemu
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMzAgMjI6MjggKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+ID4gV2l0aCBVVEYtOCBnb3QgaXNzdWUgd2l0aCB3cm9uZyBjaGFyYWN0ZXIg
cmV0dXJuZWQgYnkgUWVtdSB3aGVuIHVzaW5nIEVGSQo+ID4gQklPUy4gVGhpcyBicmVha3MgdGhl
IHRlc3QgcHJvY2VzcyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IuIFVwZGF0ZSB0bwo+ID4gSVNP
LTg4NTktMSBlbmNvZGluZyB0byBhdm9pZCBpdC4KPiBJIGFtIGFsd2F5cyBza2VwdGljYWwgYWJv
dXQgc3dpdGNoaW5nIGF3YXkgZnJvbSBVVEYtOC4gUmF0aGVyLCBJJ2QgbGlrZQo+IHRvIHVuZGVy
c2FuZCB3aHkgdGhhdCBpcyB0aGUgY2FzZS4KWy0tU05JUC0tXQo+IDB4ZGEgaW4gaXNvODg1OS0x
NSBpcyDDmiAoTEFUSU4gQ0FQSVRBTCBMRVRURVIgVSBXSVRIIEFDVVRFKS4gVGhpcyBpcyBhCj4g
d2VpcmQgY2hhcmFjdGVyIHRvIHNlZS4uLiBBbmQgaGlzIGlzIHRoZSBmaXJzdCBieXRlLi4uIElz
IGVkazIganVzdAo+IHNwaXR0aW5nIGFjdHVhbCBiaW5hcnk/CgpJdCdzIG5vdCB0aGUgZmlyc3Qg
Ynl0ZTsgYW5kIGl0J3Mgbm90IGVkazIsIGJ1dCBncnViMjoKCiAgICAwMDAwMDE1MCAgNmQgMWIg
NWIgMzQgMzAgNmQgMWIgNWIgIDMwIDMyIDNiIDMzIDMwIDQ4IDQ3IDRlICB8bS5bNDBtLlswMjsz
MEhHTnwKICAgIDAwMDAwMTYwICA1NSAyMCA0NyA1MiA1NSA0MiAyMCAyMCAgNzYgNjUgNzIgNzMg
NjkgNmYgNmUgMjAgIHxVIEdSVUIgIHZlcnNpb24gfAogICAgMDAwMDAxNzAgIDMyIDJlIDMwIDM0
IDBhIDBkIDBhIDBkICAxYiA1YiAzMCAzNCAzYiAzMCAzMiA0OCAgfDIuMDQuLi4uLlswNDswMkh8
CiAgICAwMDAwMDE4MCAgZGEgYzQgYzQgYzQgYzQgYzQgYzQgYzQgIGM0IGM0IGM0IGM0IGM0IGM0
IGM0IGM0ICB8Li4uLi4uLi4uLi4uLi4uLnwKICAgIDAwMDAwMTkwICBjNCBjNCBjNCBjNCBjNCBj
NCBjNCBjNCAgYzQgYzQgYzQgYzQgYzQgYzQgYzQgYzQgIHwuLi4uLi4uLi4uLi4uLi4ufAogICAg
MDAwMDAxYTAgIGM0IGM0IGM0IGM0IGM0IGM0IGM0IGM0ICBjNCBjNCBjNCBjNCBjNCBjNCBjNCBj
NCAgfC4uLi4uLi4uLi4uLi4uLi58CiAgICAwMDAwMDFiMCAgYzQgYzQgYzQgYzQgYzQgYzQgYzQg
YzQgIGM0IGM0IGM0IGM0IGM0IGM0IGM0IGM0ICB8Li4uLi4uLi4uLi4uLi4uLnwKICAgIDAwMDAw
MWMwICBjNCBjNCBjNCBjNCBjNCBjNCBjNCBjNCAgYzQgYzQgYzQgYzQgYzQgYmYgMWIgNWIgIHwu
Li4uLi4uLi4uLi4uLi5bfAogICAgMDAwMDAxZDAgIDMwIDM1IDNiIDMwIDMyIDQ4IGIzIDFiICA1
YiAzMCAzNSAzYiAzNyAzOSA0OCBiMyAgfDA1OzAySC4uWzA1Ozc5SC58CgpTbywgd2hhdCBpcyB0
aGlzICJkYSBjNC4uLmM0IGJmIiBzZXF1ZW5jZT8gSXQgbG9va3MgYSBiaXQgbW9yZSBvYnZpb3Vz
CndoZW4gbG9va2luZyBhdCB0aGUgZm9sb3dpbmcgbGluZXM6CgogICAgMDAwMDAxZDAgIDMwIDM1
IDNiIDMwIDMyIDQ4IGIzIDFiICA1YiAzMCAzNSAzYiAzNyAzOSA0OCBiMyAgfDA1OzAySC4uWzA1
Ozc5SC58CiAgICAwMDAwMDFlMCAgMWIgNWIgMzAgMzYgM2IgMzAgMzIgNDggIGIzIDFiIDViIDMw
IDM2IDNiIDM3IDM5ICB8LlswNjswMkguLlswNjs3OXwKICAgIDAwMDAwMWYwICA0OCBiMyAxYiA1
YiAzMCAzNyAzYiAzMCAgMzIgNDggYjMgMWIgNWIgMzAgMzcgM2IgIHxILi5bMDc7MDJILi5bMDc7
fAogICAgMDAwMDAyMDAgIDM3IDM5IDQ4IGIzIDFiIDViIDMwIDM4ICAzYiAzMCAzMiA0OCBiMyAx
YiA1YiAzMCAgfDc5SC4uWzA4OzAySC4uWzB8CiAgICAwMDAwMDIxMCAgMzggM2IgMzcgMzkgNDgg
YjMgMWIgNWIgIDMwIDM5IDNiIDMwIDMyIDQ4IGIzIDFiICB8ODs3OUguLlswOTswMkguLnwKICAg
IDAwMDAwMjIwICA1YiAzMCAzOSAzYiAzNyAzOSA0OCBiMyAgMWIgNWIgMzEgMzAgM2IgMzAgMzIg
NDggIHxbMDk7NzlILi5bMTA7MDJIfAogICAgMDAwMDAyMzAgIGIzIDFiIDViIDMxIDMwIDNiIDM3
IDM5ICA0OCBiMyAxYiA1YiAzMSAzMSAzYiAzMCAgfC4uWzEwOzc5SC4uWzExOzB8CiAgICAwMDAw
MDI0MCAgMzIgNDggYjMgMWIgNWIgMzEgMzEgM2IgIDM3IDM5IDQ4IGIzIDFiIDViIDMxIDMyICB8
MkguLlsxMTs3OUguLlsxMnwKICAgIDAwMDAwMjUwICAzYiAzMCAzMiA0OCBiMyAxYiA1YiAzMSAg
MzIgM2IgMzcgMzkgNDggYjMgMWIgNWIgIHw7MDJILi5bMTI7NzlILi5bfAogICAgMDAwMDAyNjAg
IDMxIDMzIDNiIDMwIDMyIDQ4IGIzIDFiICA1YiAzMSAzMyAzYiAzNyAzOSA0OCBiMyAgfDEzOzAy
SC4uWzEzOzc5SC58CiAgICAwMDAwMDI3MCAgMWIgNWIgMzEgMzQgM2IgMzAgMzIgNDggIGIzIDFi
IDViIDMxIDM0IDNiIDM3IDM5ICB8LlsxNDswMkguLlsxNDs3OXwKICAgIDAwMDAwMjgwICA0OCBi
MyAxYiA1YiAzMSAzNSAzYiAzMCAgMzIgNDggYjMgMWIgNWIgMzEgMzUgM2IgIHxILi5bMTU7MDJI
Li5bMTU7fAogICAgMDAwMDAyOTAgIDM3IDM5IDQ4IGIzIDFiIDViIDMxIDM2ICAzYiAzMCAzMiA0
OCBiMyAxYiA1YiAzMSAgfDc5SC4uWzE2OzAySC4uWzF8CiAgICAwMDAwMDJhMCAgMzYgM2IgMzcg
MzkgNDggYjMgMWIgNWIgIDMxIDM3IDNiIDMwIDMyIDQ4IGIzIDFiICB8Njs3OUguLlsxNzswMkgu
LnwKICAgIDAwMDAwMmIwICA1YiAzMSAzNyAzYiAzNyAzOSA0OCBiMyAgMWIgNWIgMzEgMzggM2Ig
MzAgMzIgNDggIHxbMTc7NzlILi5bMTg7MDJIfAogICAgMDAwMDAyYzAgIGMwIGM0IGM0IGM0IGM0
IGM0IGM0IGM0ICBjNCBjNCBjNCBjNCBjNCBjNCBjNCBjNCAgfC4uLi4uLi4uLi4uLi4uLi58CiAg
ICAwMDAwMDJkMCAgYzQgYzQgYzQgYzQgYzQgYzQgYzQgYzQgIGM0IGM0IGM0IGM0IGM0IGM0IGM0
IGM0ICB8Li4uLi4uLi4uLi4uLi4uLnwKICAgIDAwMDAwMmUwICBjNCBjNCBjNCBjNCBjNCBjNCBj
NCBjNCAgYzQgYzQgYzQgYzQgYzQgYzQgYzQgYzQgIHwuLi4uLi4uLi4uLi4uLi4ufAogICAgMDAw
MDAyZjAgIGM0IGM0IGM0IGM0IGM0IGM0IGM0IGM0ICBjNCBjNCBjNCBjNCBjNCBjNCBjNCBjNCAg
fC4uLi4uLi4uLi4uLi4uLi58CiAgICAwMDAwMDMwMCAgYzQgYzQgYzQgYzQgYzQgYzQgYzQgYzQg
IGM0IGM0IGM0IGM0IGM0IGQ5IDFiIDViICB8Li4uLi4uLi4uLi4uLi4uW3wKICAgIDAwMDAwMzEw
ICAzMSAzOSAzYiAzMCAzMiA0OCAxYiA1YiAgMzIgMzAgM2IgMzAgMzIgNDggMjAgMjAgIHwxOTsw
MkguWzIwOzAySCAgfAoKT0ssIHNvIHRoZXJlIGFyZSBhIGxvdCBvZiBBTlNJIEVzY2FwZSBTZXF1
ZW5jZXMsIHdoaWNoIGFyZSBDU0kgY29tbWFuZHM6CgogICAgMWIgNWIgMzAgMzUgM2IgMzcgMzkg
NDggICAgIC0gRVNDIFsgMDUgOyA3OSBICgpUaGlzIGlzIENTSSBmb3IgIkN1cnNvciBQb3NpdGlv
biIsIGkuZS4gbW92ZSBzdXJzb3IgdG8gcm93IDUsIGNvbHVtbiA3OS4KT0ssIGl0IGlzIGRyYXdp
bmcgYSBib3ghIGRhIGlzIHRvcC1sZWZ0IGNvcm5lciwgYzQgaXMgaG9yaXpvbnRhbCBsaW5lLApi
ZiBpcyB0b3AtcmlnaHQgY29ybmVyLCBiMyBpcyB2ZXJ0aWNhbCBsaW5lLCBjMCBpZCBsb3dlci1s
ZWZ0IGNvcm5lciwKYW5kIGQ5IGlzIGxvd2VyLXJpZ2h0IGNvcm5lci4KClRoaXMgaXMgZGVmaW5p
dGVseSBub3QgSVNPLTg4NTktMTU7IGl0IGlzIENQNDM3IFswXToKICAgIGh0dHBzOi8vZW4ud2lr
aXBlZGlhLm9yZy93aWtpL0NvZGVfcGFnZV80MzcKClNvLCB0aGUgc29sdXRpb24gdG8gc3dpdGNo
IG92ZXIgdG8gaXNvLTg4NTktMTUgaXMgbm90IHRoZSBwcm9wZXIKc29sdXRpb24uIFdlIGRvbid0
IHdhbnQgdG8gc3dpdGNoIHRvIENQNDM3IGVpdGhlciEKCldoYXQgSSBzdWdnZXN0LCBpbnN0ZWFk
LCBpcyB0aGF0IHdlIHRlbGwgcGV4cGVjdC5zcGF3biB0byBqdXN0IGZpeCBhbnkKbm9uLWRlY29k
YWJsZSBjaGFyYWN0ZXIsIGJ5IHBhc3NpbmcgdGhlIHBhcmFtZXRlcjoKICAgIGNvZGVjX2Vycm9y
cz0ncmVwbGFjZScKCkF0IGxlYXN0LCBpdCBtYWtlcyB0aGUgdHdvIEVGSSBydW4tdGVzdCBzdWNj
ZWVkIQoKSWYgdGhhdCBpcyBPSywgSSBjYW4gZG8gdGhhdCB3aGVuIGFwcGx5aW5nLCBhbmQgZml4
IHRoZSBjb21taXQgbG9nCmFjY29yZGluZ2x5LgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KClsw
XSBPaCBib3ksIGRvZXMgdGhhdCBicmluZyBmb25kIG1lbW9yaWVzLi4uIDstKQoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
