Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83AAC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 19:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A6440150;
	Sat, 27 Apr 2024 19:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zOD5ujSf_I5; Sat, 27 Apr 2024 19:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B134019D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51B134019D;
	Sat, 27 Apr 2024 19:19:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B63931BF5A4
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 19:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF9134019D
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 19:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiYfr54DiZnC for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 19:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E1CF40150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E1CF40150
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E1CF40150
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 19:19:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1ruVvz1DGl-00GGJw; Sat, 27
 Apr 2024 21:19:40 +0200
Date: Sat, 27 Apr 2024 21:19:39 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20240427211939.520ab908@gmx.net>
In-Reply-To: <20240427015517.413015-1-gael.portay@rtone.fr>
References: <20240427015517.413015-1-gael.portay@rtone.fr>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:TzKsw2SpDq/7a/Pk/6DQenOghhTVaj+Ca1FZCwAzu9GgvOc0cfs
 LuSimsz6t/7PHC8Ixp8lVFzXpDbrvPDf1WFFEh3OqWXcob4OiwXq31pIcOVQqnCtXCvhtTC
 fen7E7BRIz0pX7PTMkGLIfoa3xRWQhM/8yp4EtpBqCDZFG+EBhjl0LLivCCID5DrTIO07xf
 2wzeAL8ggXZ9nJWlMGclg==
UI-OutboundReport: notjunk:1;M01:P0:cwkEYNgVBQs=;XZbgA0pwKs5lDtpY+iOQ63bdVN4
 DyNeaQ1vYhHi4IlclT7MiGNsjtWko7XjphTI9bmJnkMtaJuKG+mN0ODrbUFcY10lbUix4KuTO
 8efrA5VYBycvHEqvu8oRINh/BVDBWC5JAOfJVns/Z/73xV+OGyJ2Sd/8QRum425yAWOEix/c1
 6RldCVWp6LeuhqRJF7b0MEfHIMPa+JVBFLT4dmaNUtQA5AzqXPQmNWhgBS7+zLOQ6FTCUalW7
 TNYpvc5AFJWBsyfYogx12hMTQTred5iU8DyFY2/iHv4V5gKlJ4oQM5lWW36a7VF+9/vsItnre
 vw943zCrrYx/cOMz0IU0kLDDwcB4tnEiAvvXmJy0cgnlpnDY5cfbnxW3pOo6ZG2/E4xY5OTNv
 hlPz2fF5eeudkRHH7/FxbqILZO/WjOedWw7HojA5b4rfb4WvSyTaFo3cOUAihhFxBBlD0i0LO
 1KVz2Ul7Jwi9RGbkuZ8IBsnKlh3cKvO3VhO+1GasqwVQyp5RW8m/qWg+mm/zydokQfOGRjA+W
 +Qz0bhTDPo/Uo/FIfYZjF7kbZ9mLfl2V5bNzkJJZ/CiF5o05qz3TnnYt7tmHD+hcWp+8AUY7k
 J8/bS36aHFtpSrNR3RWNTWUIoySYOgmyjY0xLCn5ejrtJq/qNGntdKQg7sxN31bbG5IkSSQaS
 G7mQxfdlLONM55zKDjTi70/poCIR8km8wa0A76eUX03323niZrBusGwipEpVXwN6cKRAQhkFb
 2z44Wgvym9FIeGhKEmIOLbTBiTRacGSMF0gL96IOc9/bVQIf5XRPXv3OItgyIed/nN+unBIWZ
 hkkGbacUqvT3y9v78TPaAtCtZZK9mtJJApH/60Vb4Tygs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1714245580; x=1714850380; i=ps.report@gmx.net;
 bh=dCnP85yzTNsBYkUT0YPoo5ZLkyy/buHZ4PriWGeRPzs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YVgJL0HXbTjaniTK0qJNsBW3ZFDMNgRYZonTRy85TAeUhA0wviVYYm3ZZU21Yrlz
 027zzEQMI+m3+oH78w7+JNZu76ksTFPo2aMZNYoFqXjvBQquiH7PtDn35bTOglbXH
 /uyIDwIuQDDycKvN53z4bJ3HjDNKNW8hszvUfIzv9P3Vx5On5ZGNSZAjMMMqx0Rbi
 icB9FezDJRQVUrskWSxAODVMMZRHaQtWz4+i1ziay4iuWeHKKxwaQIPvD5XgroKGq
 GtoUOSESRWzdIcDUQI5FF1OWY2HAdDpSzl1dLvBF9BANezj76fT/cnUJN7z4DtCa2
 Lg+9JY7SkpPCqI2GmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=YVgJL0HX
Subject: Re: [Buildroot] [RESEND PATCH 1/1] board/raspberrypi_{3_qt5we,
 cm4io*}: autoprobe of bluetooth driver
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgpPbiBTYXQsIDI3IEFwciAyMDI0IDAzOjU1OjE3ICswMjAwLCBHYcOrbCBQ
T1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPiB3cm90ZToKCj4gVGhlIGNvbmZpZy50eHQgb2Yg
dGhlIFJhc3BlcnJ5IFBpJ3Mgc3VwcG9ydGluZyBXaS1GaSBhbmQgQmx1ZXRvb3RoIChpLmUuCj4g
emVybyBXLCB6ZXJvIDIgVywgMywgYW5kIDQpIHN3aXRjaCB0aGUgQmx1ZXRvb3RoIGZ1bmN0aW9u
IHRvIHVzZSB0aGUKPiBtaW5pLVVBUlQgKHR0eVMwKSBhbmQgcmVzdG9yZSBVQVJUMCAodHR5QU1B
MCkgb3ZlciB0aGUgR1BJT3MgMTQgYW5kIDE1Cj4gKGFzIHBlciBtaW5pdWFydC1idC1vdmVybGF5
LmR0c1sxXSkuIEFsbCBvZiB0aGVtIHR1cm4gb24gdGhlIHBhcmFtZXRlcgo+IGtybmJ0IHRvIGF1
dG9wcm9iZSB0aGUgYmx1ZXRvb3RoIGRyaXZlci4KPiAKPiBIb3dldmVyLCB0aGUgY29uZmlnLnR4
dCBmb3IgUGkgMyAoUXQ1IFdlYkVuZ2luZSkgYW5kIHRoZSBDb21wdXRlIE1vZHVsZQo+IDQgSU8g
KDMyLWJpdCBhbmQgNjQtYml0KSBhZGQgdGhlIG1pbml1YXJ0LWJ0IG92ZXJsYXkgYXMgd2VsbCBi
dXQgZG8gbm90Cj4gdHVybiBvbiB0aGUgcGFyYW1ldGVyIGtybmJ0Lgo+IAo+IFRoaXMgYWRkcyB0
aGUgbWlzc2luZyBkdHBhcmFtPWtybmJ0PW9uIGZvciB0aGVzZSBjb25maWcudHh0IGZvciB0aGUK
PiBiZWF1dHkgb2YgY29uc2lzdGVuY3kuCgpPciByZW1vdmUgdGhlIHRoZSBrcm5idCBwYXJhbWV0
ZXIgZnJvbSBhbGwgUlBpIGRlZmNvbmZpZ3MgYXMgdGhlCmRlZmF1bHQgY2hhbmdlZCBzaW5jZSBs
aW51eCBrZXJuZWwgNi4xLngsIHNlZSBbMl0uLi4KClJlZ2FyZHMsClBldGVyCgpbMl0gaHR0cHM6
Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2NvbW1pdC9lYzA4ZTkzODM3ZWZhMmU3NWU1
Y2FiNGQ4MDQyN2ZkZjdlYTIzZGExCgoKPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnlwaS9saW51eC9ibG9iL3JwaS01LjEwLnkvYXJjaC9hcm0vYm9vdC9kdHMvb3ZlcmxheXMv
bWluaXVhcnQtYnQtb3ZlcmxheS5kdHMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkg
PGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+IC0tLQo+ICBib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
M19xdDV3ZS50eHQgICAgIHwgMyArKysKPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlv
LnR4dCAgICAgICB8IDMgKysrCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTRpb182NGJp
dC50eHQgfCAzICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfM19xdDV3ZS50eHQgYi9ib2FyZC9y
YXNwYmVycnlwaS9jb25maWdfM19xdDV3ZS50eHQKPiBpbmRleCA3NTIzMTBiMTc5Li5mNjhhMWYy
OGY1IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zX3F0NXdlLnR4dAo+
ICsrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ18zX3F0NXdlLnR4dAo+IEBAIC0yNCwzICsy
NCw2IEBAIGdwdV9tZW1fMTAyND0yMDAKPiAKPiAgIyBmaXhlcyBycGkgKDNCLCAzQissIDNBKywg
NEIgYW5kIFplcm8gVykgdHR5QU1BMCBzZXJpYWwgY29uc29sZQo+ICBkdG92ZXJsYXk9bWluaXVh
cnQtYnQKPiArCj4gKyMgZW5hYmxlIGF1dG9wcm9iaW5nIG9mIEJsdWV0b290aCBkcml2ZXIgd2l0
aG91dCBuZWVkIG9mIGhjaWF0dGFjaC9idGF0dGFjaAo+ICtkdHBhcmFtPWtybmJ0PW9uCj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTRpby50eHQgYi9ib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfY200aW8udHh0Cj4gaW5kZXggY2Y3ZTZkZjFhMS4uZDM2Nzk1YzRmZiAx
MDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdfY200aW8udHh0Cj4gKysrIGIv
Ym9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvLnR4dAo+IEBAIC0yNSw2ICsyNSw5IEBAIGdw
dV9tZW1fMTAyND0xMDAKPiAgIyBmaXhlcyBycGkgKDNCLCAzQissIDNBKywgNEIgYW5kIFplcm8g
VykgdHR5QU1BMCBzZXJpYWwgY29uc29sZQo+ICBkdG92ZXJsYXk9bWluaXVhcnQtYnQKPiAKPiAr
IyBlbmFibGUgYXV0b3Byb2Jpbmcgb2YgQmx1ZXRvb3RoIGRyaXZlciB3aXRob3V0IG5lZWQgb2Yg
aGNpYXR0YWNoL2J0YXR0YWNoCj4gK2R0cGFyYW09a3JuYnQ9b24KPiArCj4gICMgZW5hYmxlIFJU
Qwo+ICBkdHBhcmFtPWkyY192Yz1vbgo+ICBkdG92ZXJsYXk9aTJjLXJ0YyxwY2Y4NTA2M2EsaTJj
X2NzaV9kc2kKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnX2NtNGlvXzY0
Yml0LnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ19jbTRpb182NGJpdC50eHQKPiBpbmRl
eCA4MTNmNmViYTdiLi5iNWQ4NDA2ZTY5IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3Jhc3BiZXJyeXBp
L2NvbmZpZ19jbTRpb182NGJpdC50eHQKPiArKysgYi9ib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
Y200aW9fNjRiaXQudHh0Cj4gQEAgLTI1LDYgKzI1LDkgQEAgZ3B1X21lbV8xMDI0PTEwMAo+ICAj
IGZpeGVzIHJwaSAoM0IsIDNCKywgM0ErLCA0QiBhbmQgWmVybyBXKSB0dHlBTUEwIHNlcmlhbCBj
b25zb2xlCj4gIGR0b3ZlcmxheT1taW5pdWFydC1idAo+IAo+ICsjIGVuYWJsZSBhdXRvcHJvYmlu
ZyBvZiBCbHVldG9vdGggZHJpdmVyIHdpdGhvdXQgbmVlZCBvZiBoY2lhdHRhY2gvYnRhdHRhY2gK
PiArZHRwYXJhbT1rcm5idD1vbgo+ICsKPiAgIyBlbmFibGUgUlRDCj4gIGR0cGFyYW09aTJjX3Zj
PW9uCj4gIGR0b3ZlcmxheT1pMmMtcnRjLHBjZjg1MDYzYSxpMmNfY3NpX2RzaQo+IC0tCj4gMi40
NC4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
