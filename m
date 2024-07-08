Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30748C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC92D40493;
	Mon,  8 Jul 2024 22:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fB5UpjI1dhE; Mon,  8 Jul 2024 22:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A42404A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A42404A9;
	Mon,  8 Jul 2024 22:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDD031BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAC0840562
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8XUQC1MMZrw for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C27D403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C27D403C4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C27D403C4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCK6-1slns60Sn6-00MgfT; Tue, 09
 Jul 2024 00:45:06 +0200
Date: Tue, 9 Jul 2024 00:45:05 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zoxr8QnP1nwHEa20@probook>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
 <20240708231344.0cb2c06e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708231344.0cb2c06e@windsurf>
X-Provags-ID: V03:K1:IAt+XNC7iV0yZ+egtI6yGu8s6yI/2UUgOcjb/R5PSgxi3rFBHGS
 db0J8peNF6uf1Pn/Fh7hOnw7CC5zaXAipd+TRtEsk3RjNDgcjxYFV2CnhDtet3CD5CsdHUh
 awRLY5toTrZGR+YhPtbIv6VRz6dKxtTjH/OsryVfukwopQzbrS8gHrVmSFr5pBDw961lfZg
 LvBOgZNsILL1vgje+XqcQ==
UI-OutboundReport: notjunk:1;M01:P0:klntKcTIMAU=;AzIwcM7XHf7YEFsKp491QixfBcW
 IpOwosIJGVRxhIbU2rmIzEnToIqBRY5Pbe2vqRoju5AsrU2hzNxYTdqZINpOup5qbIMlNL7Qx
 tcxOGL3dcErAzFjldRh3ILlgiEi4J05o4tWy8iObCRjb8bzFOg12bDufW6kRAaHQZWZhezWhj
 nPAfFI6ISoi/sH8Oz7v3TfyJ9boBHGI1234IHbHzCTOKsThsbIgyeWqnSgsps49r2kWB8QliK
 Lh0nffEkMh3yKGI9D3hvpsn05OyoQmgl/PXIXF4SvIbBCB7xUD7FI7/0tUqrnSJP4kYEC1Rbm
 lpRDU9GAI40jbeY31u90/eeOatrDBsRU1fWRu2YR4M6pSA19Xtc9hmTD9Zfo6LzarV7lju2Y7
 nF8g7AvccVXZI82I9ai5jITmh7eQTIULUgP97E4YKmGycvrWJD7mgbLgJyA8L+SoDP2/q4vFx
 HbUnqzDY5bPOnICnUoU5fU/AloVK9nJAnusY7VvG4P3tiy5A1VlArPV914MJrw7Fy9iBmBk5B
 cMsK81QjBSwb4TDG3pwYqRfvhdEjv9/fwcAB6qLaPLt7MDvDvoe3fHZsNa9ni1wbnLvOBAlO1
 G5YJ1+2aVYpaYamXs+XoXHLDOG2pJBjiB682G7Pz6czynR1dX5SdQgbInNpcfMTRbBob42GFn
 PEFVtIv4yhhIfrDrOmBgW40caD5Y9IYoOb6WdxBilHfUJft6ff0tiatrmedgrjhfTZZK/SZk8
 yz3KZV6iIVtq3bOqc1VlC9ybNjbTQgBde6j12C2GjWgZ4EAL8tRIm8YShWSuaY2w6SliL5ZD4
 ao1BDfN8MM5uXthZMRTwHEZRaAXlPPJvJ0cuc5MLUHs3k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478706; x=1721083506; i=j.neuschaefer@gmx.net;
 bh=qDY3age0gbXDq47w7xqxOLCOPkA7p8SyZBhxWt20c8g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=t9gzPeGEguA1W3gUKn4cnCxWL4V6jNNOcf+O4cYD6cuTBljwTzoRM36m3oOEl982
 MwjyH6DUUEkO83Fz9h1lTkERxs14PQH2jM1gm45QK9SaLwqgTqFoyneKcN5J4zsyN
 or325Wm80FTGAKFdcIiSdtvvCXIo/kVx09QE7WqFaUhhDO51jbucFxqePUlkFhcXT
 No4s518qk5ti6p1PGGWPE3e8V86uTE+jp+Fd2Hyf+r7eEo51BRSri1k9yzMeAN9h5
 QSTQkjpoMW9kaIyWHjr7njHlEajBhyXVAm+75rK9nxxx4NFj3+p6pY6tRhDomfDmX
 d6h1DgugwY0cIygU5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=t9gzPeGE
Subject: Re: [Buildroot] [PATCH 0/8] Various skarnet.org updates and new
 tipidee package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMDgsIDIwMjQgYXQgMTE6MTM6NDRQTSArMDIwMCwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiBIZWxsbywKPgo+IE9uIFRodSwgMDQgSnVsIDIwMjQgMjE6NDA6MjYgKzAyMDAK
PiBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4g
d3JvdGU6Cj4KPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Cj4gPiAtLS0KPiA+IEouIE5ldXNjaMOkZmVyICg4KToKPiA+ICAgICAgIHNrYWxp
YnM6IGJ1bXAgdG8gdmVyc2lvbiAyLjE0LjIuMAo+ID4gICAgICAgczY6IGJ1bXAgdG8gdmVyc2lv
biAyLjEzLjAuMQo+ID4gICAgICAgZXhlY2xpbmU6IGJ1bXAgdG8gdmVyc2lvbiAyLjkuNi4wCj4g
PiAgICAgICBzNi1uZXR3b3JraW5nOiBidW1wIHRvIHZlcnNpb24gMi43LjAuMwo+ID4gICAgICAg
czYtcmM6IGJ1bXAgdG8gdmVyc2lvbiAwLjUuNC4zCj4gPiAgICAgICBtZGV2ZDogYnVtcCB0byB2
ZXJzaW9uIDAuMS42LjQKPiA+ICAgICAgIHM2LWRuczogYnVtcCB0byB2ZXJzaW9uIDIuMy43LjIK
PiA+ICAgICAgIHRpcGlkZWU6IG5ldyBwYWNrYWdlCj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gg
c2VyaWVzLiBVbmZvcnR1bmF0ZWx5IG5vbmUgb2YgdGhlIHBhdGNoZXMsIGV4Y2VwdAo+IDEvOCBh
bmQgOC84IGhhdmUgeW91ciBTaWduZWQtb2ZmLWJ5IGxpbmUuIENvdWxkIHlvdSByZXNlbmQgd2l0
aCB5b3VyCj4gU2lnbmVkLW9mZi1ieSBsaW5lIGFkZGVkPwoKWWVwLCBJIGZvcmdvdCB0aG9zZS4g
V2lsbCBkby4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
