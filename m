Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EDFC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0990B41B60;
	Thu, 21 Dec 2023 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0990B41B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWRjg02gS0lH; Thu, 21 Dec 2023 16:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D32741D70;
	Thu, 21 Dec 2023 16:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D32741D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 441591BF33F
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 16:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A85A61058
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 16:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A85A61058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MgTk9H_Pd1Z for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 16:11:42 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E68A61056
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 16:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E68A61056
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1rfp0h1Hbp-00RrkV; Thu, 21
 Dec 2023 17:11:38 +0100
Date: Thu, 21 Dec 2023 17:11:37 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231221171137.3876fce7@gmx.net>
In-Reply-To: <20231220105004.ED87487BE7@busybox.osuosl.org>
References: <20231220105004.ED87487BE7@busybox.osuosl.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:f6ZWshYfKcSFYIsacVqQrCwJH955Jj1Abwv+aFduzmOCxKwm3KN
 J1tqdNzmudkjPAbhGiEo/7TCPScYHc0b/wYKq/aaTu5C6/cbuN9sRpK3EuO+YO3AqWymdLu
 +1utcsitiGtgxN/4cCA3x5crxRhOpD/GWx7CtJRF94gfxOl4QOrCY0vpBBKGlJtGT3PYBkV
 lYDdklmBZDU9SRh7jmyuQ==
UI-OutboundReport: notjunk:1;M01:P0:4WLe6sAVo+U=;WXBUrJ5rwjKeJlmXud9Z+W1K2BG
 nXVoynRFQhSVT9zwBzk6kAk5bWG7sCFrAcs0G9fqcmwbf4rpxHu3LtT2EopGt1/VIT8I1GLc/
 q6ey+ymcGpTacMeB/dYI1T3GPPIFGqR7ACHSk93WYLTykBX+7GDyuOQafHPrTCtpnxPubA/oU
 dyNxZA0lMCkXTVCP8RCPTN8yMnzuUCL2FHmCedfhzJM7EiMFfi2EUpcLJ0EXoWc6MRJ2b/NO9
 QqyrR3qhyoa9Wdnmq6fzW5T8qZ83wGBkBZW3ouoUC/la1k3IFe4lCNFxRI6A8A1QsmBGMT6hm
 Z7E7din7gOltDq2vGqoxdcYivP0aF+ulM++yQJDBD6L8QqyduCTgb9gzRFJ3B6rU79fZGIcdY
 2vIKi87DsexuGXfgI4a9SjsTPuuOe4BGIE/05EJAc9HnjkNizrIxSKk6Y79uZkYHQ98ppCWwc
 +A8FZWVYXxQqAMsi5eCaaPirbvGFAvV1G+pAtbAGV+9MlpXVvPs6aWqaDALa/s/x1mrwH1y3h
 t6rfwm0X3XQEjVNpqH5m0Fw4kwh0oHqk35YAJlRysz416C4Hh2pvLi0Q4FpeQgJopn8J70Plu
 BYiQZmA9gtE6p0cf1VoaZRh+2SjVmfT0gcBUe0KljqXgfXtPOL7oBtXhJCIgEST6HN3/pbebr
 pufB/KHaDzLMwEK9a0qEtxRkDWUzLrYivNkYysBXxFn8F+VcuTtihy+WeAytixor5F1UB1qte
 FbJkv+m2IRySM+HydJY5P5/QyG1q2WH4roA/OKihVcVfmv+320a2Yyo+Un8dxQGdDvs4kZqI6
 fdjc7JU9oga5fRae/hqF4CpXaIPJOvZiQfnE/7+DUJU4XBg6Fl3cL+3iLklZe2RnAezUG+/NJ
 aimf6KpOX/X3KAH02vnRPZTAzLWcps/io4e66Fig2hCxHeQPcNQgV1u3edcihOt163IAF+oTE
 pKL5zPOyEsdrx6ws6bBq2CuAzc0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1703175098; x=1703779898; i=ps.report@gmx.net;
 bh=g7dvbBFvkidUpMkyDbJkqjMrqESqJiIJyBr+gzSDhoc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=VUM+hFCr3VlWu4/NHa+uM3bXUM/V7pkurq4lId3y/iMZspBxSpIA4JLRf5Ub0oR+
 fa1M0NIyRqJy//6Q5zhnpUuxPKnKGrn1WJh3MEITYkxmKsAQ3Y4cGW6rhDN7nXwkx
 p+LoOyneGf2XvoJMrYFG5g0vQ9s8YzvsAZ8xplrrCUtv8M3wXhxmcKGP4v8JCcixK
 l/PV7KnGi7YptRQ8fq0WwmMD1GV/yzsoTEHYeEQQ6581s8m/2GFXiN2fS0pa+mrzg
 +Qs/h11SpJyLj8YAT6ecIy2RxTjAEJuN537mRjz9w26dwzZmY6J9RHTXyJs9HMbnE
 zy/EHFrccrVTcGds3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=VUM+hFCr
Subject: Re: [Buildroot] [git commit] package/openssh: security bump to
 version 9.6p1
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIFdlZCwgMjAgRGVjIDIwMjMgMTE6NDI6MDYgKzAxMDAsIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cgo+IGNvbW1pdDogaHR0cHM6Ly9naXQu
YnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0zYzA0N2VhNDYzZTI3Y2VhYWZkZTc2
ZDY0NDA2ODYyYzMzMjJkYWEwCj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1
aWxkcm9vdC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4gCj4gT3BlblNTSCA5LjYgd2Fz
IHJlbGVhc2VkIG9uIDIwMjMtMTItMTguCj4gCj4gVGhpcyByZWxlYXNlIGNvbnRhaW5zIGZpeGVz
IGZvciBhIG5ld2x5LWRpc2NvdmVyZWQgd2Vha25lc3MgaW4gdGhlCj4gU1NIIHRyYW5zcG9ydCBw
cm90b2NvbCAodGhlICJUZXJyYXBpbiIgYXR0YWNrKSwgYSBsb2dpYyBlcnJvciByZWxhdGluZwo+
IHRvIGNvbnN0cmFpbmVkIFBLQ1MjMTEga2V5cyBpbiBzc2gtYWdlbnQoMSkgYW5kIGNvdW50ZXJt
ZWFzdXJlcyBmb3IKPiBwcm9ncmFtcyB0aGF0IGludm9rZSBzc2goMSkgd2l0aCB1c2VyIG9yIGhv
c3RuYW1lcyBjb250YWluaW5nIGludmFsaWQKPiBjaGFyYWN0ZXJzLgo+IAo+IGh0dHBzOi8vd3d3
Lm9wZW5zc2guY29tL3R4dC9yZWxlYXNlLTkuNgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+IC0tLQo+ICBwYWNrYWdlL29wZW5zc2gv
b3BlbnNzaC5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayAgIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2guaGFzaCBiL3BhY2thZ2Uvb3Bl
bnNzaC9vcGVuc3NoLmhhc2gKPiBpbmRleCA0MDYwYjk1ZTliLi42MThiMTMxMzNkIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLmhhc2gKPiArKysgYi9wYWNrYWdlL29wZW5z
c2gvb3BlbnNzaC5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICMgRnJvbSBodHRwczovL3d3dy5v
cGVuc3NoLmNvbS90eHQvcmVsZWFzZS05LjRwMQo+IC1zaGEyNTYgIDM2MDhmZDkwODhkYjIxNjNj
ZWIzZTYwMGM4NWFiNzlkMGRlM2QyMjFlNTkxOTJlYTE5MjNlMjMyNjM4NjZhODUgIG9wZW5zc2gt
OS40cDEudGFyLmd6Cj4gK3NoYTI1NiAgOTEwMjExYzA3MjU1YThjNWFkNjU0MzkxYjQwZWU1OTgw
MDcxMGRkODExOWRkNTM2MmRlMDkzODVhYTdhNzc3YyAgb3BlbnNzaC05LjZwMS50YXIuZ3oKCkNv
bW1lbnQvVVJMIGRvZXMgbm90IGxvbmdlciBtYXRjaCB3aXRoIHRoZSB2ZXJzaW9uLi4uLiwgYnV0
OgoKLSAwZWIzOTdkMzBlIHBhY2thZ2Uvb3BlbnNzaDogYnVtcCB0byB2ZXJzaW9uIDkuNHAxCgog
IC0jIEZyb20gaHR0cHM6Ly93d3cub3BlbnNzaC5jb20vdHh0L3JlbGVhc2UtOS4zcDIKICAtc2hh
MjU2ICAyMDBlYmUxNDdmNmNiM2YxMDFmZDBjZGY5ZTAyNDQyYWY3ZGRjYTI5OGRmZmQ5ZjQ1Njg3
OGU3Y2NhYzY3NmU4ICBvcGVuc3NoLTkuM3AyLnRhci5negogICsjIEZyb20gaHR0cHM6Ly93d3cu
b3BlbnNzaC5jb20vdHh0L3JlbGVhc2UtOS40cDEKICArc2hhMjU2ICAzNjA4ZmQ5MDg4ZGIyMTYz
Y2ViM2U2MDBjODVhYjc5ZDBkZTNkMjIxZTU5MTkyZWExOTIzZTIzMjYzODY2YTg1ICBvcGVuc3No
LTkuNHAxLnRhci5negoKCSQgd2dldCBodHRwczovL3d3dy5vcGVuc3NoLmNvbS90eHQvcmVsZWFz
ZS05LjNwMgoJWy4uLl0KCTIwMjMtMTItMjEgMTc6MDY6MDUgKDE3LDAgS0IvcykgLSDigJhyZWxl
YXNlLTkuM3AyLjPigJkgc2F2ZWQgWzI1OTIvMjU5Ml0KCgkkIHdnZXQgaHR0cHM6Ly93d3cub3Bl
bnNzaC5jb20vdHh0L3JlbGVhc2UtOS40LnAxCgktLTIwMjMtMTItMjEgMTc6MDU6NTAtLSAgaHR0
cHM6Ly93d3cub3BlbnNzaC5jb20vdHh0L3JlbGVhc2UtOS40LnAxCglSZXNvbHZpbmcgd3d3Lm9w
ZW5zc2guY29tICh3d3cub3BlbnNzaC5jb20pLi4uIDI2MjA6M2Q6YzAwMDoxNzg6OjgwLCAxOTku
MTg1LjE3OC44MAoJQ29ubmVjdGluZyB0byB3d3cub3BlbnNzaC5jb20gKHd3dy5vcGVuc3NoLmNv
bSl8MjYyMDozZDpjMDAwOjE3ODo6ODB8OjQ0My4uLiBjb25uZWN0ZWQuCglIVFRQIHJlcXVlc3Qg
c2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gNDA0IE5vdCBGb3VuZAoJMjAyMy0xMi0yMSAxNzow
NTo1MSBFUlJPUiA0MDQ6IE5vdCBGb3VuZC4KClNvICdodHRwczovL3d3dy5vcGVuc3NoLmNvbS90
eHQvcmVsZWFzZS05LjQucDEnIHNlZW1zIGFscmVhZHkgaW5jb3JyZWN0LCBmb3IgdGhlIGN1cnJl
bnQKcmVsZWFzZSAnaHR0cHM6Ly93d3cub3BlbnNzaC5jb20vdHh0L3JlbGVhc2UtOS42JyBpcyB0
aGUgY29ycmVjdC93b3JraW5nIFVSTC4uLgoKUmVnYXJkcywKUGV0ZXIKCgo+ICAjIExvY2FsbHkg
Y2FsY3VsYXRlZAo+ICBzaGEyNTYgIDA1YzMwNDQ2YmE3Mzg5MzRiM2YxZWZhOTY1YjQ1NGMxMjJj
YTI2Y2M0YjI2OGU1YWU2ODQzZjU4Y2NkMWIxNmQgIExJQ0VOQ0UKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9vcGVuc3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+IGlu
ZGV4IDM1OGVmNDJiNmUuLmVjOWU2NjEzYjAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuc3No
L29wZW5zc2gubWsKPiArKysgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+IEBAIC00LDcg
KzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1PUEVOU1NIX1ZF
UlNJT05fTUFKT1IgPSA5LjQKPiArT1BFTlNTSF9WRVJTSU9OX01BSk9SID0gOS42Cj4gIE9QRU5T
U0hfVkVSU0lPTl9NSU5PUiA9IHAxCj4gIE9QRU5TU0hfVkVSU0lPTiA9ICQoT1BFTlNTSF9WRVJT
SU9OX01BSk9SKSQoT1BFTlNTSF9WRVJTSU9OX01JTk9SKQo+ICBPUEVOU1NIX0NQRV9JRF9WRVJT
SU9OID0gJChPUEVOU1NIX1ZFUlNJT05fTUFKT1IpCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
