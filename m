Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B818C47DD9
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D9D60FF0;
	Mon, 22 Jan 2024 16:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D9D60FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5rneZcq23jv; Mon, 22 Jan 2024 16:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A55060FE2;
	Mon, 22 Jan 2024 16:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A55060FE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4031BF378
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 16:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23EF660FE2
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 16:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23EF660FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VxS9qpjusMa for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 16:34:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5983660FD0
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 16:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5983660FD0
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1rLdbE1NG5-00FlxD; Mon, 22
 Jan 2024 17:34:25 +0100
Date: Mon, 22 Jan 2024 17:34:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240122173424.666fd137@gmx.net>
In-Reply-To: <20240121134738.6f0d953b@gmx.net>
References: <PH0PR19MB540925F1A9987E1D7F58BB0DD0762@PH0PR19MB5409.namprd19.prod.outlook.com>
 <7E2BA7C4-0A2C-40FF-AF48-25BD637CFB7A@benettiengineering.com>
 <20240121134738.6f0d953b@gmx.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:roHC0uF+3WqJ0hRZayQLcm9DoKDvUJ/8ibgLAOx+PvzFCelGsd3
 Ss8aXMrWpU7VwpfcpPWqpQs/O4eN4Bjysnv3WdStcnXs5ZA4vjmAwvHhLRbwCxmkQ64Ih1M
 eSlg9lOv0Se06N7amD4Lx7at8DTOjPy0tHlSW0i3zZji3dEVx3FyiK2eb/Zta+F1Lc3Qp/G
 XeAyZw+Pq+fNHq+yF7iKA==
UI-OutboundReport: notjunk:1;M01:P0:edNlShZ3e9w=;g1A9melhqfArRrEsl6/EmtSuqhv
 K2EJ5KjDCnypvPCWem9JLl61Hp+nw8lVfWmUCBF4Q3qz4odkcd9vTZQs9xGjyYy/r5TTeAUbs
 QLOApVmG8UoO6ZJ+KkyHZQPcRK920z8HasIcvnzl6O/z41bKEa4eu6C+Yr1jr+VwPHR2Eqh7T
 6XVTrVbHcjQpC+qhgfjlf+9aiT+O8G+LWKj5WUK8g+EsEBiNtdGkQ073Qi2Y2oWZ9JGXrdRUw
 JS8885NJwei9X7Lo8HClr3jKq4WlC9oi/qSbYcRqoWDqR17qaImlUoa9AQAdVtIW50dO9m/88
 lBFactzcfIo+0TOFq25AiZ0hEj/j7Cgq6rx9sTq96C2h+9MqRFlaHR/wgANDJqxCldoPeGRRk
 ag2k5yPN3siNiWJPNOf/yifjmUzBzt3+m7GDXdV5s2gDg8Pjze+DX7KSA0DUUrBs3XgoC8zlO
 Rcbla8TcumQcoMBW/3ac+utoNAwtgpvmVxjBygXcIFjgjmJbx8rVSajRJFNJQD5XOKz721+OQ
 LPh8SnVftgx50I/dl0BzkiGvPu+GNai8tqSrNVbgDiFBGHKTNj66Jrk353rET6OsAvipcatq0
 LOXizVn3K0dmb4Lg+Dda+0M1Ge1N/eaMI36T0xG5ycQJXQgNQBpcwNzOsu0tMvkvJ2s3xPZWH
 NBfaLnjwc8ZaRHAMgnrx/TrlypCNbPKOTXzN2yReoszCAij2/fPz1KJvQPbvNJlW4PKRah8VZ
 pXu71GmMA1o6vWRLoLxoKStuTRtJC7XX7iUc3Dtdx6isXJlW0eiceT8PPpb2EJ5CGVY3FNRTP
 Lc4yMrU0eceFpYLId/Ewz2MPcMALVgIEOBGGqizzDA95Pw8kA/kdCx1u9NEFaa6ogtLbEX10N
 rMjTbWu+V1R8ZcqKGf/l7xJAwmIAGceOsVQoVKoOqZRvUiA/f5ceSbda58JK+H6o2w9BFVtB5
 ZQAngTm+sLwUx8pPQAxoKHCGdtE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1705941265; x=1706546065; i=ps.report@gmx.net;
 bh=Q8rib5mNWa5XJCDzXBLP2W6JJIB2A8tu2egfq8N1Uok=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=MIMRntRw/Ivx/Yf4TJ82k2E9MXdQ9/Sm4fjM/ZkhDwYrqE0gtibdhzoI1q879OFy
 zRSZj00S8qpIP/DAEK65BtVm52AgbID0xkZkmeW9iD27yybkkwaQOJTokAE+j7T7C
 L29ioKs71URvn17qbi6QdE4ctxmZ3S90as7g/vX+n3EmB0Hah3FpFsw0Njx0u0Gic
 Os82SoQCsOjnAI19skP+aX77nOuN5blF0qkiuyQFW8JT/GL0DmlO7x9t9hwr2FD0n
 K4LgDxO4b3Ypi5V1sZDuPL8bLXwxEdn/sfo6zPbyb4eBHibaj/m0i9RUDk/TSWP1c
 IAYYTKLwHW99X9MGCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MIMRntRw
Subject: Re: [Buildroot] [Help] Run Chocolate-doom
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
Cc: franco ariel <fran.millocs@live.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIFN1biwgMjEgSmFuIDIwMjQgMTM6NDc6MzggKzAxMDAsIFBldGVyIFNlaWRl
cmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cgo+IE9uIFN1biwgMjEgSmFuIDIwMjQgMTI6
MjI6NDYgKzAxMDAsIEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPiB3cm90ZToKPiAKPiA+IEhpIEZyYW5jbywKPiA+ICAgCj4gPiA+IElsIGdpb3Ju
byAyMSBnZW4gMjAyNCwgYWxsZSBvcmUgMDc6NDgsIGZyYW5jbyBhcmllbCA8ZnJhbi5taWxsb2Nz
QGxpdmUuY29tLmFyPiBoYSBzY3JpdHRvOgo+ID4gPiAKPiA+ID4g77u/Cj4gPiA+IEhlbGxvLAo+
ID4gPiBJJ20gdHJ5aW5nIHRvIHRha2UgbXkgZmlyc3Qgc3RlcHMgb24gYnVpbGRyb290IHVzaW5n
IG15IFJhc3BiZXJyeSBwaSA0IGFuZCBJJ20ganVzdCB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cg
dG8gcnVuIHRoZSBDaG9jb2xhdGUtRG9vbSwgSSBhbHJlYWR5IGluc3RhbGxlZCBhbmQgd2hlbiBJ
IHRyeSB0byBydW4gaXQsIGl0IHRocm93cyB0aGUgZm9sbG93aW5nIGVycm9yOgo+ID4gPiBGYWls
ZWQgdG8gaW5pdGlhbGl6ZSB2aWRlbzogTm8gYXZhaWxhYmxlIHZpZGVvIGRldmljZS4gICAgCj4g
PiAKPiA+IEkgdGhpbmsgeW91IGhhdmUgbm8gcmVnaXN0ZXJlZCB2aWRlbyBvdXRwdXQuCj4gPiBZ
b3UgY2FuIGNoZWNrIHRoaXMgYnkgY2hlY2tpbmcgZG1lc2cuCj4gPiBUaGlzIGNvdWxkIGhhcHBl
biBpZiB5b3UgZG9u4oCZdCBidWlsZCBldWRldiBvciBtZGV2IHRvIGxldCBidXN5Ym94IHRvIGF1
dG9tYXRpY2FsbHkgcmVnaXN0ZXIgZGV2aWNlIGRyaXZlcnMgd2hlbiBkZXZpY2VzIGFyZSBmb3Vu
ZC4KPiA+IFNvIHlvdSBjb3VsZCB0cnkgdG8gcmVidWlsZCBmcm9tIHNjcmF0Y2ggdXNpbmcgYSBk
eW5hbWljIGRldmljZSBoYW5kbGluZyhldWRldikuICAKPiAKPiBBZGQgYWRkCj4gCj4gZHRvdmVy
bGF5PXZjNC1rbXMtdjNkLXBpNAo+IAo+IHRvIHlvdXIgYm9vLXBhdGl0aW9uIGNvbmZpZy50eHQg
ZmlsZQoKU29ycnkgbm90IG5lZWRlZCAoc2VlbXMgZGVmYXVsdCBycGkgZnJhbWUgYnVmZmVyIGlz
IGVub3VnaCksIHRoZSBmb2xsb3dpbmcKUlBpNCBkZWZjb25maWcgd29ya3MgZm9yIG1lIChtYXli
ZSBCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgYW5kCkJSMl9QQUNLQUdFX1NETDJfT1BFTkdMRVMg
YXJlIG5vdCBuZWVkZWQpIHRvIHJ1biBjaG9jb2xhdGUtZG9vbToKCkJSMl9hcm09eQpCUjJfY29y
dGV4X2E3Mj15CkJSMl9BUk1fRlBVX05FT05fVkZQVjQ9eQpCUjJfUEFDS0FHRV9IT1NUX0xJTlVY
X0hFQURFUlNfQ1VTVE9NXzZfMT15CkJSMl9CSU5VVElMU19WRVJTSU9OXzJfNDFfWD15CkJSMl9H
Q0NfVkVSU0lPTl8xM19YPXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKQlIyX1BBQ0tB
R0VfSE9TVF9HREI9eQpCUjJfR0RCX1ZFUlNJT05fMTQ9eQpCUjJfRU5BQkxFX0RFQlVHPXkKQlIy
X1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CkJSMl9TWVNURU1fREhDUD0i
ZXRoMCIKQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvcmFzcGJlcnJ5cGk0L3Bv
c3QtYnVpbGQuc2giCkJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJy
eXBpNC9wb3N0LWltYWdlLnNoIgpCUjJfTElOVVhfS0VSTkVMPXkKQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVEFSQkFMTD15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049
IiQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksbGludXgsMTdmMTM1Yjc0MmM0ZWRiMzQwYWZiMzY1
ODczYzNhNTc0ZjdlMTZjYikvbGludXgtMTdmMTM1Yjc0MmM0ZWRiMzQwYWZiMzY1ODczYzNhNTc0
ZjdlMTZjYi50YXIuZ3oiCkJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY20yNzExIgpCUjJf
TElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05B
TUU9ImJjbTI3MTEtcnBpLTQtYiIKQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9
eQpCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTPXkKQlIyX1BBQ0tBR0VfWFo9eQpCUjJf
UEFDS0FHRV9DSE9DT0xBVEVfRE9PTT15CkJSMl9QQUNLQUdFX0RPT01fV0FEPXkKQlIyX1BBQ0tB
R0VfRElSRUNURkI9eQpCUjJfUEFDS0FHRV9TREwyX0RJUkVDVEZCPXkKQlIyX1BBQ0tBR0VfU0RM
Ml9PUEVOR0xFUz15CkJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CkJSMl9QQUNLQUdFX1JQSV9G
SVJNV0FSRV9WQVJJQU5UX1BJND15CkJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklM
RT0iYm9hcmQvcmFzcGJlcnJ5cGk0L2NvbmZpZ180LnR4dCIKQlIyX1BBQ0tBR0VfUlBJX1VTRVJM
QU5EPXkKQlIyX1BBQ0tBR0VfUlBJX1VTRVJMQU5EX0hFTExPPXkKQlIyX1BBQ0tBR0VfS01PRF9U
T09MUz15CkJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9
eQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCiMgQlIyX1RBUkdFVF9ST09URlNf
VEFSIGlzIG5vdCBzZXQKQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKQlIyX1BBQ0tBR0Vf
SE9TVF9HRU5JTUFHRT15CkJSMl9QQUNLQUdFX0hPU1RfS01PRF9YWj15CkJSMl9QQUNLQUdFX0hP
U1RfTVRPT0xTPXkKClJlZ2FyZHMKUGV0ZXIKCj4gCj4gUmVnYXJkcywKPiBQZXRlcgo+IAo+IAo+
ID4gCj4gPiBPdGhlcndpc2UgY2FuIHlvdSBwYXN0ZWJpbiB5b3VyIGRlZmNvbmZpZz8KPiA+IAo+
ID4gQmVzdCByZWdhcmRzCj4gPiBHaXVsaW8KPiA+ICAgCj4gPiA+IAo+ID4gPiBJIGFscmVhZHkg
aW5zdGFsbGVkIGFsbCB0aGUgR3JhcGhpY3MgbGlicmFyaWVzLCBTREwyLCBkaXJlY3RmYiwgZXRj
Lgo+ID4gPiBNYXliZSBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLgo+ID4gPiAKPiA+ID4gVGhhbmsg
eW91LAo+ID4gPiBGcmFuY28uIAo+ID4gPiAKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QgICAgCj4gPiAKPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290ICAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
