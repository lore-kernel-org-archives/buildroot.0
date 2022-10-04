Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC3BC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 06:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90E8340B13;
	Tue,  4 Oct 2022 06:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E8340B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5-KoAPNgK8F; Tue,  4 Oct 2022 06:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C0CA40424;
	Tue,  4 Oct 2022 06:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0CA40424
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1C41BF271
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 06:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7763E60E6B
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 06:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7763E60E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vilCrwAHfChb for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 06:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9012A60D78
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9012A60D78
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 06:59:33 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.23]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1oUuvZ0hhP-00CvNV; Tue, 04
 Oct 2022 08:59:26 +0200
Date: Tue, 4 Oct 2022 08:59:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221004085922.3c755666@gmx.net>
In-Reply-To: <20221002074028.GB30794@scaer>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
 <20221001155615.GA30794@scaer>
 <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
 <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
 <20221002074028.GB30794@scaer>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:3Dy5m3n7fKex+eteDq5x9f6XxEoOANSVgAnGMKoyLU/O9DsgVZZ
 SNGS7OSdHVcJkawQNXYqXoL9BpVa5AYE10XLU3Kj7+DZgFFqibVdJzQ28jmUIQXNvqYPOog
 ZrwsDvlY07XURlTAwvk3VczzP9j3g/va57ENLI8LWK5M3DXdlL/zLw1gZIOO2VCvW/MpO96
 nB00dqbSWlExk5M03kq5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RXcKgsTyIAg=:MdJdalSm1NtNPX1Z8v4MeN
 pHGEzwpcf0mToNrClhggRIEIyuBSC3ZX4gjreBIIUyK84mwhvAPtwMrNKniQoEJQnTmAh6Sin
 n8276WzJHIW8p79EAKVZDZXQrkbkIQ2OKQG5pkjw5lgpTtfdL2Mmnf16kCICBt9HiINgoC4SK
 +h/WnhCIq6CIfYv1lBwZoiww4WwjRNopFDwUSWrGCxk8UKXWBgJBrjNjbL5a2E/bWMjNh4MjL
 d1dyKQWhTbUMyCMvaSOpL5JmRoywV+T51PSgUjwoxCpYYRB7cm+ElJiIfUR7DQYcfGALrluT9
 38jj5Bb+LrPsDEtSYMytOZELbUZaRwpIuWReNTwtoXVGi1A8dmpChneQZ3BiZlmeGkOlFjbIw
 Q/8bHnKIJlu/V+8/UYqMlrFNaxrE4+h91MO6JkhYiJ495qrOqpTGGSmfBCNB8+9j1CLsluqVA
 TCYQOQgmRhbR+gZwLv1T6LW6Yct0uYlG3WT5NcLjWhSCnl3/csGh5nrzKmJ9gJHNDEDdnFeul
 2/mTOM1zfzFO/krikHRGitgxq1DOV/HhLQdCg8+enTobPEPegnlSm6u270VQ2R7BXfr/toujE
 cXVbDwXNambtuQ8ZfbHrCMN96ePUdZ53JW8YkHBmHPjl3JdZTizd0PZDkXul1Ggtq3dYYJhn6
 KkOPL6R6Ko8Fj9qr+CzYXpv8N4ilNni9qbBSmYIT5HS/5p08/fbAOJ+U0nAf0hmmhNXd20LJ0
 E7eVwnlyAhsAiizgCBKdEIdP+EA8uNjt/uK39l2KE92cNuJHp3T5iY0rQkkRcD4XIXPj7fw3C
 eCPZGl7UMNpVoL4qqFOrqnSwxiq3PnPtNcxrdZDP3Qy/a91sdo8J/cuoitIvDMb8mw5L4wAm+
 YAUCD33lul6DPcuiQPVBEtp4tquwrMUmYQgCJb8jhKgawEdSrbhb10FQJPRgl4eZXXSJKYg7+
 ZvYPGXZ7UUmQnOAtJhh2BjqxvLTZHAQQkBoA8JEdWwTKL5rMOjWnOZ57ztXhEvmtzdEBuHdvo
 V668ju9JXBlAhMHH0RPnlWT6lbMsgHgI26/aSqXF1c/W1Xp9a4f5pzV9qQp3J/pKnY7Ld04uG
 QDghIA764K6vpOWhGZ2rtADs7G+pp74ugCjdfHSDdUJuiFl+eN/jsersZ6apw2x+db4wvX614
 6SrTWRoJkyh/9hwI0feafqILBf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1664866766;
 bh=AQk2Dye3L25/GhgmKZR7FqvbPu1ROvSsvI6ThkbDjoc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=P4Oce5skFL5BDTh96F8W+w8TBV/Lt4mMbYXlWbqAbYNBx6disayKcEkIToTIlTeGu
 UNMvLkgYgprIW29ac6iK81qTlgqoopHTHzf8uZgTf+J4iOtBCiBf7lB4l+99OF8+cZ
 Dezo0iAApgXbTxMML78Uz1VM0MKrt4cQTAjoBxjY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=P4Oce5sk
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

SGVsbG8gKiwKCk9uIFN1biwgMiBPY3QgMjAyMiAwOTo0MDoyOCArMDIwMCwgIllhbm4gRS4gTU9S
SU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6CgpbLi4uXSAgCj4gCj4gWWVzLCB3
ZSByZWFsbHkgbmVlZCB0byB1bmRlcnN0YW5kIHdoeSBpdCBpcyBicm9rZW4gaW4gdGhlIGZpcnN0
IHBsYWNlLAo+IHRvIGV2YWx1YXRlIHdoZXRoZXIgeW91ciBwYXRjaCBpcyBjb3JyZWN0LCBvciB3
aGV0aGVyIHdlIHNob3VsZCBjaGFuZ2UKPiB0aGUgd2F5IHdlIGRvIHRoaW5ncyBpbiBCdWlsZHJv
b3QuIEhpbnQ6IEkgdGhpbmsgd2UgZG8gc29tZXRoaW5nIGluCj4gQnVpbGRyb290IHRoYXQgaXMg
d3JvbmcgKG9yIGhhcyBiZWNvbWUgd3JvbmcgYXMgdGltZSBwYXNzZWQpLCBidXQgd2UKPiBjb3Vs
ZCBub3QgcGlucG9pbnQgaXQgeWV0Li4uCj4gCj4gPiA+VG8gYmUgbm90ZWQsIGFuZCBhcyBUaG9t
YXMgbm90aWNlZCwgT3BlbkVtYmVkZWQgaXMgYWxzbyB1c2luZyBhIGdsaWJjCj4gPiA+Mi4zNiBj
b21taXQsIGFuZCBldmVuIG9uZSBvbGRlciB0aGFuIG91cnMsIGJ1dCB0aGV5IGRvIG5vdCBzZWVt
IHRvIGhhdmUKPiA+ID5pc3N1ZXMuICAKPiA+IAoKV2l0aCBidWlsZHJvb3QgcmFzcGJlcnJ5cGk0
XzY0X2RlZmNvbmZpZzoKCiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLi9ob3N0L2FhcmNoNjQt
YnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2xpbnV4L2ZzLmg6MTksCiAg
ICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uLy4uLy4uL2xpYnNhbml0aXplci9zYW5pdGl6ZXJf
Y29tbW9uL3Nhbml0aXplcl9wbGF0Zm9ybV9saW1pdHNfcG9zaXguY3BwOjc1OgogIC4uLi9ob3N0
L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2xpbnV4L21v
dW50Lmg6OTI6NjogZXJyb3I6IG11bHRpcGxlIGRlZmluaXRpb24gb2Yg4oCYZW51bSBmc2NvbmZp
Z19jb21tYW5k4oCZCiAgICAgOTIgfCBlbnVtIGZzY29uZmlnX2NvbW1hbmQgewogICAgICAgIHwg
ICAgICBefn5+fn5+fn5+fn5+fn5+CiAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uLy4uLy4u
L2xpYnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nhbml0aXplcl9wbGF0Zm9ybV9saW1pdHNf
cG9zaXguY3BwOjYyOgouLi4vYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1aWxkL2djYy9p
bmNsdWRlLWZpeGVkL3N5cy9tb3VudC5oOjI0OTo2OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9u
IGhlcmUKICAgIDI0OSB8IGVudW0gZnNjb25maWdfY29tbWFuZAogICAgICAgIHwgICAgICBefn5+
fn5+fn5+fn5+fn5+CgoKTm90ZSB0aGUgJ2luY2x1ZGUtZml4ZWQnIHBhdGgsIHNvIGRpZmYgdGhl
IG9yaWdpbmFsIHZzLiB0aGUgZml4ZWQ6CgoJJCBkaWZmIC11IC4uLi9zeXNyb290L3Vzci9pbmNs
dWRlL3N5cy9tb3VudC5oIC9ob21lL3NlaWRlcmVyL1dvcmsvQnVpbGRyb290L2J1aWxkX3JwaTRf
NjRfZ2xpYmNfMDAxL2J1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVk
ZS1maXhlZC9zeXMvbW91bnQuaCB8IGNhdAotLS0gLi4uL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lz
L21vdW50LmgJMjAyMi0xMC0wMyAxNjoxNzoxNS45MzQ2NDI1ODYgKzAyMDAKKysrIC4uLi9idWls
ZC9ob3N0LWdjYy1maW5hbC0xMS4zLjAvYnVpbGQvZ2NjL2luY2x1ZGUtZml4ZWQvc3lzL21vdW50
LmgJMjAyMi0xMC0wMyAxNjoyMDozNS44NjI4ODI5MzAgKzAyMDAKQEAgLTEsMyArMSwxMiBAQAor
LyogIERPIE5PVCBFRElUIFRISVMgRklMRS4KKworICAgIEl0IGhhcyBiZWVuIGF1dG8tZWRpdGVk
IGJ5IGZpeGluY2x1ZGVzIGZyb206CisKKwkiLi4uL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lzL21v
dW50LmgiCisKKyAgICBUaGlzIGhhZCB0byBiZSBkb25lIHRvIGNvcnJlY3Qgbm9uLXN0YW5kYXJk
IHVzYWdlcyBpbiB0aGUKKyAgICBvcmlnaW5hbCwgbWFudWZhY3R1cmVyIHN1cHBsaWVkIGhlYWRl
ciBmaWxlLiAgKi8KKwogLyogSGVhZGVyIGZpbGUgZm9yIG1vdW50aW5nL3VubW91bnQgTGludXgg
ZmlsZXN5c3RlbXMuCiAgICBDb3B5cmlnaHQgKEMpIDE5OTYtMjAyMiBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIEluYy4KICAgIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5
LgpAQCAtMjgsNyArMzcsNyBAQAogI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgogCiAjaWZkZWYgX19o
YXNfaW5jbHVkZQotIyBpZiBfX2hhc19pbmNsdWRlICgibGludXgvbW91bnQuaCIpCisjIGlmIF9f
aGFzX2luY2x1ZGUgKCJfX2xpbnV4X18vbW91bnQuaCIpCiAjICBpbmNsdWRlICJsaW51eC9tb3Vu
dC5oIgogIyBlbmRpZgogI2VuZGlmCgpBZnRlciBjaGFuZ2luZyBiYWNrIHRoZSBsaW5lCgoJIyBp
ZiBfX2hhc19pbmNsdWRlICgiX19saW51eF9fL21vdW50LmgiKQoKdG8KCgkjIGlmIF9faGFzX2lu
Y2x1ZGUgKCJsaW51eC9tb3VudC5oIikKCnRoZSBidWlsZCBzdWNjZWVkcy4uLgoKU2VlbXMgZ2Nj
IGZpeGluY2wgZG9lcyBub3QgaGFuZGxlIHRoZSAnIyBpZiBfX2hhc19pbmNsdWRlJyBwYXR0ZXJu
IHRoZSByaWdodCB3YXkuLi4KClNhbWUgZm9yIGFsbCBvdGhlciAnX19oYXNfaW5jbHVkZScgdXNh
Z2VzOgoKCSQgZ3JlcCAtUiBfX2hhc19pbmNsdWRlIGJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMu
MC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC8KYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1
aWxkL2djYy9pbmNsdWRlLWZpeGVkL2JpdHMvdW5pc3RkX2V4dC5oOiNpZmRlZiBfX2hhc19pbmNs
dWRlCmJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9i
aXRzL3VuaXN0ZF9leHQuaDojIGlmIF9faGFzX2luY2x1ZGUgKCJfX2xpbnV4X18vY2xvc2VfcmFu
Z2UuaCIpCmJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhl
ZC9iaXRzL3N0YXR4Lmg6ICAgX19oYXNfaW5jbHVkZSBhcmd1bWVudCAoR0NDIFBSIDgwMDA1KS4g
ICovCmJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9i
aXRzL3N0YXR4Lmg6I2lmZGVmIF9faGFzX2luY2x1ZGUKYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEu
My4wL2J1aWxkL2djYy9pbmNsdWRlLWZpeGVkL2JpdHMvc3RhdHguaDojIGlmIF9faGFzX2luY2x1
ZGUgKCJfX2xpbnV4X18vc3RhdC5oIikKYnVpbGQvaG9zdC1nY2MtZmluYWwtMTEuMy4wL2J1aWxk
L2djYy9pbmNsdWRlLWZpeGVkL3N5cy9tb3VudC5oOiNpZmRlZiBfX2hhc19pbmNsdWRlCmJ1aWxk
L2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9zeXMvbW91bnQu
aDojIGlmIF9faGFzX2luY2x1ZGUgKCJfX2xpbnV4X18vbW91bnQuaCIpCmJ1aWxkL2hvc3QtZ2Nj
LWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVkZS1maXhlZC9zeXMvcnNlcS5oOiNpZmRlZiBf
X2hhc19pbmNsdWRlCmJ1aWxkL2hvc3QtZ2NjLWZpbmFsLTExLjMuMC9idWlsZC9nY2MvaW5jbHVk
ZS1maXhlZC9zeXMvcnNlcS5oOiMgaWYgX19oYXNfaW5jbHVkZSAoIl9fbGludXhfXy9yc2VxLmgi
KQoKClJlZ2FyZHMsClBldGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
