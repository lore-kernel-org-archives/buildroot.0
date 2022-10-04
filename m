Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E0C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40C760A7D;
	Tue,  4 Oct 2022 19:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40C760A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKHYcdu9q9Fp; Tue,  4 Oct 2022 19:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7249608A5;
	Tue,  4 Oct 2022 19:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7249608A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 263761BF405
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEAB2400BF
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEAB2400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYq12cvJvt3s for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:46:32 +0000 (UTC)
X-Greylist: delayed 00:05:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5373040125
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5373040125
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:46:31 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.23]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1oQipi1vM9-00Fg2y; Tue, 04
 Oct 2022 21:41:19 +0200
Date: Tue, 4 Oct 2022 21:41:17 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221004214117.32c7ef31@gmx.net>
In-Reply-To: <20221004085922.3c755666@gmx.net>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
 <20221001155615.GA30794@scaer>
 <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
 <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
 <20221002074028.GB30794@scaer> <20221004085922.3c755666@gmx.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:0FYrTg9BaajZsvvBxiS65hHvZl3Iqm+qBffLkAiZzFCXdcs/yqz
 z1zRAP08GTCbv0c6wmc8VrOeV1QqzVTOZ9exZK2wP49VI/yMV9OCvaqQX/mgiA/71+bKAk/
 zb5JkgMc5n3E7IEDsG1NuwK3Z8CLzUxilvHD600HKe6dnZdZaia/bd6d0WtPfTkyuzKTb/m
 TtA1hNWPixfrOZ7qNOogg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S3S3eyzdwmU=:nRr7MmlNWE26D0rNpJOScS
 NLcJI3v6EgzCyNUROXfZGMf+VmJw6cQPv5P5naaYVbiGtwRIILe2hvZkJBFWXG9v+Jgm41Lcy
 x8hUoFMGJWJRTJ46327iGkP4gkvtMWvupP1ZB9RyTJR3nUMZuK78UsSDVzXxeFuZsWDUC4A7B
 4BWmPNCPfUXS3LhQWIZ02gCSM4uNpbKgxAeVVuV9RlaNFIs0Y0PgTMvGH3VfpPs/oX/EyIzwG
 U+nbHQZihDW4sk98ZupL2deo2Qc+1tGDXEdLRpHcGB58PWTzZ5PYJH0eyudNZVdu2m/oPYH4S
 VeyzKBpWIf/UMBkD8SXunCZVSisFQA5uymKdweg6OeYL1Q4ubZwUgiuJyK0Qe1Q1FTLZQVUPi
 eLMRb4GXWAyAiqE+1JCg8ca68ThorvydTBfuCh62xdYylUXqffx7DvkUrnPkNhoFliwnK75q7
 cTCnIdE9S4gZ6iokgdQ96utdY8vDn2imuhuR0dVy7LIJ5cjMJtbCz19XlxR0pGnKDyKwR/pKe
 vrQpWFknsmMiv9+Jd8tTOSQvDRrdOfN2VRlB6zQ4OrnIeIA3BlRL4ZAbL0yFVJoelZz3jmrpJ
 pQ6KooTU78PBoiQ1kbA+83u8hqmPy4ZQBzykDB7OcIkANzB1jLuDcnAtKZknKLziq+za5SWxa
 Ogja99tb26EEMyH0WNMVxdl/PqvG4APzlu2/5+G+AyhVrCnfcihbrWuUUfgYuvRFQGKqok1G6
 s4t8Cirq1Wlpn/6ZMs62JLotBDEzGwizEV4apztb72BSCT1CmNo5akn/tIVO/xLNziak9rjp0
 pA5ZDqgFxZzf9hBVpgziz7bW5zVguo9Hu0xRHb0LFzvJY38navYUIrf5fyhZhzE1VeW0J2Pmh
 jA1VsWfQgFwxDVlMK35K1JOt0U/tI1lG4S1fAWj8brzqXVMY5otHtl7fU9TPRpD6vf0O4LYxt
 203Rw/7cII1/t4ZVebUgqXULtgqZhjnC0gc6k0Hje53MYzgavCjcOGqqedGwyFhYM9YEjqpll
 e1AuJkoMi58wCFoLNNEoKcVWTBNVvm3hOTg4SPJXK5eL2opGBLzKxQ8nESnXZkuCXm5kKl9NS
 rOb4atJBnc3ihlD8ljnLFKyNaAhZiauy4KNc1OaTBtgfk1L8FSd7NCfTzKZTgqk+LS1KOGZaX
 QhjZZCWZ6uwJDLxtTn3zEHky6h
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1664912789;
 bh=MReJghW7Ko+H/JWIkQ++k7rM1BQgq+kAR/OO/lyNyNE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YNgi/fbi/yeVXWUMxH/CjquXn1OUXaxtcoIt//U1ZjIDcMUeH0YXrdUi+cbFHOfBZ
 QZuxwIE1T5u153dIGvTJibryXbNtDZXsKbs7AOExVXIWUym0QmmvkPE5K7jLRHH3Cn
 VydF/zX2IzAvraQFI2GmjddOj8QHHkxrWZgtbl9Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=YNgi/fbi
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIFR1ZSwgNCBPY3QgMjAyMiAwODo1OToyMiArMDIwMCwgUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90ZToKCj4gSGVsbG8gKiwKPiAKPiBPbiBTdW4sIDIg
T2N0IDIwMjIgMDk6NDA6MjggKzAyMDAsICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4
QGZyZWUuZnI+IHdyb3RlOgo+IAo+IFsuLi5dICAKPiA+IAo+ID4gWWVzLCB3ZSByZWFsbHkgbmVl
ZCB0byB1bmRlcnN0YW5kIHdoeSBpdCBpcyBicm9rZW4gaW4gdGhlIGZpcnN0IHBsYWNlLAo+ID4g
dG8gZXZhbHVhdGUgd2hldGhlciB5b3VyIHBhdGNoIGlzIGNvcnJlY3QsIG9yIHdoZXRoZXIgd2Ug
c2hvdWxkIGNoYW5nZQo+ID4gdGhlIHdheSB3ZSBkbyB0aGluZ3MgaW4gQnVpbGRyb290LiBIaW50
OiBJIHRoaW5rIHdlIGRvIHNvbWV0aGluZyBpbgo+ID4gQnVpbGRyb290IHRoYXQgaXMgd3Jvbmcg
KG9yIGhhcyBiZWNvbWUgd3JvbmcgYXMgdGltZSBwYXNzZWQpLCBidXQgd2UKPiA+IGNvdWxkIG5v
dCBwaW5wb2ludCBpdCB5ZXQuLi4KPiA+ICAgCj4gPiA+ID5UbyBiZSBub3RlZCwgYW5kIGFzIFRo
b21hcyBub3RpY2VkLCBPcGVuRW1iZWRlZCBpcyBhbHNvIHVzaW5nIGEgZ2xpYmMKPiA+ID4gPjIu
MzYgY29tbWl0LCBhbmQgZXZlbiBvbmUgb2xkZXIgdGhhbiBvdXJzLCBidXQgdGhleSBkbyBub3Qg
c2VlbSB0byBoYXZlCj4gPiA+ID5pc3N1ZXMuICAgIAo+ID4gPiAgIAo+IAo+IFdpdGggYnVpbGRy
b290IHJhc3BiZXJyeXBpNF82NF9kZWZjb25maWc6Cj4gCj4gICBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi4uL2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1
ZGUvbGludXgvZnMuaDoxOSwKPiAgICAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi8uLi8uLi9s
aWJzYW5pdGl6ZXIvc2FuaXRpemVyX2NvbW1vbi9zYW5pdGl6ZXJfcGxhdGZvcm1fbGltaXRzX3Bv
c2l4LmNwcDo3NToKPiAgIC4uLi9ob3N0L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNy
b290L3Vzci9pbmNsdWRlL2xpbnV4L21vdW50Lmg6OTI6NjogZXJyb3I6IG11bHRpcGxlIGRlZmlu
aXRpb24gb2Yg4oCYZW51bSBmc2NvbmZpZ19jb21tYW5k4oCZCj4gICAgICA5MiB8IGVudW0gZnNj
b25maWdfY29tbWFuZCB7Cj4gICAgICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+ICAgSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uLy4uLy4uL2xpYnNhbml0aXplci9zYW5pdGl6ZXJfY29t
bW9uL3Nhbml0aXplcl9wbGF0Zm9ybV9saW1pdHNfcG9zaXguY3BwOjYyOgo+IC4uLi9idWlsZC9o
b3N0LWdjYy1maW5hbC0xMS4zLjAvYnVpbGQvZ2NjL2luY2x1ZGUtZml4ZWQvc3lzL21vdW50Lmg6
MjQ5OjY6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gaGVyZQo+ICAgICAyNDkgfCBlbnVtIGZz
Y29uZmlnX2NvbW1hbmQKPiAgICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gCj4gCj4g
Tm90ZSB0aGUgJ2luY2x1ZGUtZml4ZWQnIHBhdGgsIHNvIGRpZmYgdGhlIG9yaWdpbmFsIHZzLiB0
aGUgZml4ZWQ6Cj4gCj4gCSQgZGlmZiAtdSAuLi4vc3lzcm9vdC91c3IvaW5jbHVkZS9zeXMvbW91
bnQuaCAvaG9tZS9zZWlkZXJlci9Xb3JrL0J1aWxkcm9vdC9idWlsZF9ycGk0XzY0X2dsaWJjXzAw
MS9idWlsZC9ob3N0LWdjYy1maW5hbC0xMS4zLjAvYnVpbGQvZ2NjL2luY2x1ZGUtZml4ZWQvc3lz
L21vdW50LmggfCBjYXQKPiAtLS0gLi4uL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lzL21vdW50LmgJ
MjAyMi0xMC0wMyAxNjoxNzoxNS45MzQ2NDI1ODYgKzAyMDAKPiArKysgLi4uL2J1aWxkL2hvc3Qt
Z2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9zeXMvbW91bnQuaAkyMDIy
LTEwLTAzIDE2OjIwOjM1Ljg2Mjg4MjkzMCArMDIwMAo+IEBAIC0xLDMgKzEsMTIgQEAKPiArLyog
IERPIE5PVCBFRElUIFRISVMgRklMRS4KPiArCj4gKyAgICBJdCBoYXMgYmVlbiBhdXRvLWVkaXRl
ZCBieSBmaXhpbmNsdWRlcyBmcm9tOgo+ICsKPiArCSIuLi4vc3lzcm9vdC91c3IvaW5jbHVkZS9z
eXMvbW91bnQuaCIKPiArCj4gKyAgICBUaGlzIGhhZCB0byBiZSBkb25lIHRvIGNvcnJlY3Qgbm9u
LXN0YW5kYXJkIHVzYWdlcyBpbiB0aGUKPiArICAgIG9yaWdpbmFsLCBtYW51ZmFjdHVyZXIgc3Vw
cGxpZWQgaGVhZGVyIGZpbGUuICAqLwo+ICsKPiAgLyogSGVhZGVyIGZpbGUgZm9yIG1vdW50aW5n
L3VubW91bnQgTGludXggZmlsZXN5c3RlbXMuCj4gICAgIENvcHlyaWdodCAoQykgMTk5Ni0yMDIy
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgo+ICAgICBUaGlzIGZpbGUgaXMgcGFydCBv
ZiB0aGUgR05VIEMgTGlicmFyeS4KPiBAQCAtMjgsNyArMzcsNyBAQAo+ICAjaW5jbHVkZSA8c3lz
L2lvY3RsLmg+Cj4gIAo+ICAjaWZkZWYgX19oYXNfaW5jbHVkZQo+IC0jIGlmIF9faGFzX2luY2x1
ZGUgKCJsaW51eC9tb3VudC5oIikKPiArIyBpZiBfX2hhc19pbmNsdWRlICgiX19saW51eF9fL21v
dW50LmgiKQo+ICAjICBpbmNsdWRlICJsaW51eC9tb3VudC5oIgo+ICAjIGVuZGlmCj4gICNlbmRp
Zgo+IAo+IEFmdGVyIGNoYW5naW5nIGJhY2sgdGhlIGxpbmUKPiAKPiAJIyBpZiBfX2hhc19pbmNs
dWRlICgiX19saW51eF9fL21vdW50LmgiKQo+IAo+IHRvCj4gCj4gCSMgaWYgX19oYXNfaW5jbHVk
ZSAoImxpbnV4L21vdW50LmgiKQo+IAo+IHRoZSBidWlsZCBzdWNjZWVkcy4uLgo+IAo+IFNlZW1z
IGdjYyBmaXhpbmNsIGRvZXMgbm90IGhhbmRsZSB0aGUgJyMgaWYgX19oYXNfaW5jbHVkZScgcGF0
dGVybiB0aGUgcmlnaHQgd2F5Li4uCj4gCj4gU2FtZSBmb3IgYWxsIG90aGVyICdfX2hhc19pbmNs
dWRlJyB1c2FnZXM6Cj4gCj4gCSQgZ3JlcCAtUiBfX2hhc19pbmNsdWRlIGJ1aWxkL2hvc3QtZ2Nj
LWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC8KPiBidWlsZC9ob3N0LWdjYy1m
aW5hbC0xMS4zLjAvYnVpbGQvZ2NjL2luY2x1ZGUtZml4ZWQvYml0cy91bmlzdGRfZXh0Lmg6I2lm
ZGVmIF9faGFzX2luY2x1ZGUKPiBidWlsZC9ob3N0LWdjYy1maW5hbC0xMS4zLjAvYnVpbGQvZ2Nj
L2luY2x1ZGUtZml4ZWQvYml0cy91bmlzdGRfZXh0Lmg6IyBpZiBfX2hhc19pbmNsdWRlICgiX19s
aW51eF9fL2Nsb3NlX3JhbmdlLmgiKQo+IGJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWls
ZC9nY2MvaW5jbHVkZS1maXhlZC9iaXRzL3N0YXR4Lmg6ICAgX19oYXNfaW5jbHVkZSBhcmd1bWVu
dCAoR0NDIFBSIDgwMDA1KS4gICovCj4gYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1aWxk
L2djYy9pbmNsdWRlLWZpeGVkL2JpdHMvc3RhdHguaDojaWZkZWYgX19oYXNfaW5jbHVkZQo+IGJ1
aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9iaXRzL3N0
YXR4Lmg6IyBpZiBfX2hhc19pbmNsdWRlICgiX19saW51eF9fL3N0YXQuaCIpCj4gYnVpbGQvaG9z
dC1nY2MtZmluYWwtMTEuMy4wL2J1aWxkL2djYy9pbmNsdWRlLWZpeGVkL3N5cy9tb3VudC5oOiNp
ZmRlZiBfX2hhc19pbmNsdWRlCj4gYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1aWxkL2dj
Yy9pbmNsdWRlLWZpeGVkL3N5cy9tb3VudC5oOiMgaWYgX19oYXNfaW5jbHVkZSAoIl9fbGludXhf
Xy9tb3VudC5oIikKPiBidWlsZC9ob3N0LWdjYy1maW5hbC0xMS4zLjAvYnVpbGQvZ2NjL2luY2x1
ZGUtZml4ZWQvc3lzL3JzZXEuaDojaWZkZWYgX19oYXNfaW5jbHVkZQo+IGJ1aWxkL2hvc3QtZ2Nj
LWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9zeXMvcnNlcS5oOiMgaWYgX19o
YXNfaW5jbHVkZSAoIl9fbGludXhfXy9yc2VxLmgiKQoKQW5kIHRoZSBjb3JyZXNwb25kaW5nIGdj
YyBidWcgZW50cnkgKFsxXSkgYW5kIG1hc3RlciBicmFuY2ggcGF0Y2ggKFsyXSwgWzNdKS4uLgoK
UmVnYXJkcywKUGV0ZXIKClsxXSBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVn
LmNnaT9pZD05MTA4NQpbMl0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvZ2l0d2ViLmNnaT9wPWdj
Yy5naXQ7aD02YmYzODNjMzdlNjEzMWE4ZTI0N2U4YTA5OTdkNTVkNjVjODMwYjZkClszXSBodHRw
czovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9cGF0Y2g7aD02YmYzODNjMzdlNjEzMWE4
ZTI0N2U4YTA5OTdkNTVkNjVjODMwYjZkCgoKPiAKPiAKPiBSZWdhcmRzLAo+IFBldGVyCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
