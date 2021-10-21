Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4B6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 06:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69C06128E
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 06:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A69C06128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 424EE405AC;
	Thu, 21 Oct 2021 06:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNwTZ-gspU09; Thu, 21 Oct 2021 06:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AA5405B9;
	Thu, 21 Oct 2021 06:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74F111BF279
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 06:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635DB40129
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 06:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jk-z7Mglas77 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 06:41:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF4244010B
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 06:41:02 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 58419C807C72;
 Thu, 21 Oct 2021 08:41:00 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 21 Oct 2021 06:41:00 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: =?UTF-8?Q?Esa=C3=AFe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>
In-Reply-To: <CA+eej5O8-SgiWzvPYd4YOGGTL_r87iNvy1VFVgmXb00_drvWhg@mail.gmail.com>
References: <mailman.16364.1634462006.241441.buildroot@buildroot.org>
 <1641d5624553f991bb7abf9808e6bf99@umbiko.net>
 <CA+eej5PtS6iCJ+W1b6W0mZXk-fQJcB1hhr20_D7cE=fja8NzTw@mail.gmail.com>
 <3f8142a1afd59acc55e141f2d8a95e66@umbiko.net>
 <CA+eej5N4SBtyNcs-hUEsviA4X6wAk-XvqzmxkCVpiizzupm4FQ@mail.gmail.com>
 <c194f15a324b57b85e12c06b21dda4fd@umbiko.net>
 <CA+eej5O8-SgiWzvPYd4YOGGTL_r87iNvy1VFVgmXb00_drvWhg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <568e5010d412f9f5412f4a0e7afa2fd9@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] how can i implement my kernel module and debug it
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRXNhw69lLAoKY2hlY2sgdGhlIHZhcmlhYmxlcyBpbiBrZXJuZWxfbW9kdWxlX3Rlc3QubWsu
IFRoZXkgbmVlZCB0byBiZSBwcmVmaXhlZCAKd2l0aCBLRVJORUxfTU9EVUxFX1RFU1QuCgpPbiAy
MDIxLTEwLTIxIDA3OjU4LCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3RlOgo+IE9r
YXkgLi4uCj4gSSB0aGluayBJIGhhdmUgYSBuZXcgZm9ybSBvZiBlcnJvciwgSSB0aGluayBpdCBp
cyB3aGlsZSBjb21waWxpbmcuCj4gCj4gYnVpbGRyb290IyBtYWtlIGtlcm5lbF9tb2R1bGVfdGVz
dC1kaXJjbGVhbgo+IHJtIC1SZgo+IC9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291
dHB1dC9idWlsZC9rZXJuZWxfbW9kdWxlX3Rlc3QKPiAKPiAvYnVpbGRyb290IyBtYWtlCj4+Pj4g
a2VybmVsX21vZHVsZV90ZXN0ICBFeHRyYWN0aW5nCj4+Pj4ga2VybmVsX21vZHVsZV90ZXN0ICBQ
YXRjaGluZwo+Pj4+IGtlcm5lbF9tb2R1bGVfdGVzdCAgQ29uZmlndXJpbmcKPj4+PiBrZXJuZWxf
bW9kdWxlX3Rlc3QgIEJ1aWxkaW5nCj4+Pj4ga2VybmVsX21vZHVsZV90ZXN0ICBCdWlsZGluZyBr
ZXJuZWwgbW9kdWxlKHMpCj4gUEFUSD0iL2hvbWUvbGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3Qv
b3V0cHV0L2hvc3QvYmluOi9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1dC9o
b3N0L3NiaW46L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jp
bjovc2JpbjovYmluOi91c3IvbG9jYWwvZ2FtZXM6L3Vzci9nYW1lcyIKPiBQS0dfQ09ORklHPSIv
aG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vcGtnLWNvbmZp
ZyIKPiBQS0dfQ09ORklHX1NZU1JPT1RfRElSPSIvIiBQS0dfQ09ORklHX0FMTE9XX1NZU1RFTV9D
RkxBR1M9MQo+IFBLR19DT05GSUdfQUxMT1dfU1lTVEVNX0xJQlM9MQo+IFBLR19DT05GSUdfTElC
RElSPSIvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvcGtn
Y29uZmlnOi9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1dC9ob3N0L3NoYXJl
L3BrZ2NvbmZpZyIKPiBCUl9CSU5BUklFU19ESVI9L2hvbWUvbGVkb3V4L0RvY3VtZW50cy9idWls
ZHJvb3Qvb3V0cHV0L2ltYWdlcwo+IEtDRkxBR1M9LVduby1hdHRyaWJ1dGUtYWxpYXMgL3Vzci9i
aW4vbWFrZSAtajMgLUMKPiAvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQv
YnVpbGQvbGludXgtNS4xMC43Mwo+IEhPU1RDQz0iL3Vzci9iaW4vZ2NjIC1PMgo+IC1JL2hvbWUv
bGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvaW5jbHVkZQo+IC1ML2hvbWUv
bGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliCj4gLVdsLC1ycGF0aCwv
aG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIiCj4gQVJDSD14
ODZfNjQKPiBJTlNUQUxMX01PRF9QQVRIPS9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290
L291dHB1dC90YXJnZXQKPiBDUk9TU19DT01QSUxFPSIvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4veDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtIgo+
IERFUE1PRD0vaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9zYmlu
L2RlcG1vZAo+IElOU1RBTExfTU9EX1NUUklQPTEKPiBQV0Q9L2hvbWUvbGVkb3V4L0RvY3VtZW50
cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2tlcm5lbF9tb2R1bGVfdGVzdC8uCj4gTT0vaG9tZS9s
ZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQva2VybmVsX21vZHVsZV90ZXN0
Ly4KPiBtb2R1bGVzCj4gbWFrZVsxXSA6IG9uIGVudHJlIGRhbnMgbGUgcsOpcGVydG9pcmUgwqsK
PiAvaG9tZS9sZWRvdXgvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvbGludXgtNS4x
MC43MyDCuwo+IHNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDQ6Cj4gL2hvbWUvbGVkb3V4L0RvY3Vt
ZW50cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2tlcm5lbF9tb2R1bGVfdGVzdC8uL01ha2VmaWxl
Ogo+IEF1Y3VuIGZpY2hpZXIgb3UgZG9zc2llciBkZSBjZSB0eXBlCj4gbWFrZVsyXTogKioqIEF1
Y3VuZSByw6hnbGUgcG91ciBmYWJyaXF1ZXIgbGEgY2libGUgwqsKPiAvaG9tZS9sZWRvdXgvRG9j
dW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQva2VybmVsX21vZHVsZV90ZXN0Ly4vTWFrZWZp
bGUKPiDCuy4gQXJyw6p0Lgo+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTgyMiA6Cj4gL2hvbWUv
bGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2tlcm5lbF9tb2R1bGVfdGVz
dC8uXQo+IEVycmV1ciAyCj4gbWFrZVsxXSA6IG9uIHF1aXR0ZSBsZSByw6lwZXJ0b2lyZSDCqwo+
IC9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1dC9idWlsZC9saW51eC01LjEw
LjczIMK7Cj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI5NSBbNF0gOgo+IC9o
b21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1dC9idWlsZC9rZXJuZWxfbW9kdWxl
X3Rlc3QvLnN0YW1wX2J1aWx0XQo+IEVycmV1ciAyCgo8Y3V0PgoKS2luZCByZWdhcmRzLApBbmRy
ZWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
