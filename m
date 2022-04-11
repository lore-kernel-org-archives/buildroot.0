Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7187C433FE
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 18:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4726C607D0;
	Mon, 11 Apr 2022 18:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzd2nPE9WTG1; Mon, 11 Apr 2022 18:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 850FF6059A;
	Mon, 11 Apr 2022 18:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E64771BF372
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5697600C5
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 18:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o_xMMmf3oKE for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 18:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE71F60E96
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 18:33:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e477:1938:276:3b86])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7516C7802D6;
 Mon, 11 Apr 2022 20:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649702000;
 bh=wQjH/Fe7yVwrn86WiyPhtaZ4hFd2m5OMqBl6rdRZSc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sDXcmVkWP2q6HRapN49AAEZf0t8ksY7xdARinOVOBiFvsj26Sc0Hf7p+oBVhxalyO
 I/u23rdDOJPedA4wrYCMfJwFsNBK15/LEX7PLqgJEefxyfMTzUNUh6lV57QamqWdfQ
 GcNGs8hhJSMOSUd0+PJ59/3AY3oSCqqMAW8R2dbrM/p9WvNrW9iR1Ojjo0Pl1m+D7E
 F03AezsDhYUq6Ngf18kiCv8Jioeha36vFxwub6dSJWNsyvuDY6R/65KG1J/Oxf7hM1
 Q9uzUzKN7HHZ/Mh/EXZN5eHhLTthajXc3hnCuoxwTo47CAJmjCR6vpWDQVQKUaUiPv
 dY9vIVV8NsUDw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 11 Apr 2022 20:33:16 +0200
Date: Mon, 11 Apr 2022 20:33:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220411183316.GB4029883@scaer>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBNYXJjdXMsIEFsbCwKCk9uIDIwMjItMDQtMTEgMTk6MDMgKzAyMDAsIEFybm91dCBW
YW5kZWNhcHBlbGxlIHNwYWtlIHRodXNseToKPiBPbiAxMS8wNC8yMDIyIDE0OjI4LCBNYXJjdXMg
SG9mZm1hbm4gd3JvdGU6Cj4gPk9uIDA1LjA0LjIyIDE5OjI4LCBQZXRlciBLb3JzZ2FhcmQgd3Jv
dGU6Cj4gPj5jb21taXQ6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1p
dC8/aWQ9MjY0MmVkYjBhZjA4ZjA0ZmI5OGY0Y2I1Zjg4ODk1ZmFkZWQ0YjMyNQo+ID4+Cj4gPj5i
cmFuY2g6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVm
cy9oZWFkcy9tYXN0ZXIKPiA+Pgo+ID4+Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1
ZXM6Cj4gPj4KPiA+Pi0gQ1ZFLTIwMjItMjM2NDg6IGNvbnRhaW5lcmQgQ1JJIHBsdWdpbjogSW5z
ZWN1cmUgaGFuZGxpbmcgb2YgaW1hZ2Ugdm9sdW1lcwo+ID4+aHR0cHM6Ly9naXRodWIuY29tL2Nv
bnRhaW5lcmQvY29udGFpbmVyZC9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtY3JwMi1xcnI1LThw
cTcKPiA+Pgo+ID4+LSBDVkUtMjAyMi0yNDc2OTogRGVmYXVsdCBpbmhlcml0YWJsZSBjYXBhYmls
aXRpZXMgZm9yIGxpbnV4IGNvbnRhaW5lcgo+ID4+wqDCoCBzaG91bGQgYmUgZW1wdHkKPiA+Pmh0
dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvc2VjdXJpdHkvYWR2aXNvcmll
cy9HSFNBLWM5Y3AtOWM3NS05djhjCj4gPj4KPiA+PlNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KPiA+Pi0tLQo+ID4+wqAgcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaCB8IDIgKy0KPiA+PsKgIHBhY2thZ2UvY29udGFpbmVyZC9jb250
YWluZXJkLm1rwqDCoCB8IDIgKy0KPiA+PsKgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj5kaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaAo+ID4+Yi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5o
YXNoCj4gPj5pbmRleCBkNWFhZmUyZTcwLi4yM2RhY2RlZDg4IDEwMDY0NAo+ID4+LS0tIGEvcGFj
a2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAo+ID4+KysrIGIvcGFja2FnZS9jb250YWlu
ZXJkL2NvbnRhaW5lcmQuaGFzaAo+ID4+QEAgLTEsMyArMSwzIEBACj4gPj7CoCAjIENvbXB1dGVk
IGxvY2FsbHkKPiA+Pi1zaGEyNTbCoAo+ID4+NDBjOTc2N2FmM2U4N2YyYzM2YWRmMmY1NjNmMGE4
Mzc0ZTgwYjMwYmQyYjdhYTgwMDU4Yzg1OTEyNDA2Y2VmNAo+ID4+Y29udGFpbmVyZC0xLjUuOS50
YXIuZ3oKPiA+PitzaGEyNTbCoAo+ID4+NmEyODk0MDZjMWMwNTgzNzYzZTVhOTc1NGUzMWExZWNl
ZDU1Y2Q1ZjE2MmE3YmMyYTNhMzE1ZDVlYjA1YzdhMQo+ID4+Y29udGFpbmVyZC0xLjUuMTEudGFy
Lmd6Cj4gPkkgZ2V0IGEgZGlmZmVyZW50IGhhc2ggZm9yIHRoaXMgZG93bmxvYWQsIGJvdGggd2l0
aGluIGJ1aWxkcm9vdCBhcyB3ZWxsIGFzCj4gPmRvd25sb2FkaW5nIHRoZSBmaWxlIG1hbnVhbGx5
IGZyb20gZ2l0aHViOgo+ID5FUlJPUjogY29udGFpbmVyZC0xLjUuMTEudGFyLmd6IGhhcyB3cm9u
ZyBzaGEyNTYgaGFzaDoKPiA+RVJST1I6IGV4cGVjdGVkOiA2YTI4OTQwNmMxYzA1ODM3NjNlNWE5
NzU0ZTMxYTFlY2VkNTVjZDVmMTYyYTdiYzJhM2EzMTVkNWViMDVjN2ExCj4gPkVSUk9SOiBnb3TC
oMKgwqDCoCA6IDAyYjc5ZDVlMmIwN2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDky
M2E5YWI5MzAyMmIxNDhiZTYKPiA+RVJST1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1p
bi10aGUtbWlkZGxlIChNSVRNKSBhdHRhY2sKPiA+RGlkIHRoZSBmaWxlIGNoYW5nZSBpbiB0aGUg
bWVhbnRpbWUgb3IgZGlkIHNvbWV0aGluZyBlbHNlIGdvIHdyb25nIGhlcmU/Cj4gIEl0IGFsc28g
Z29lcyB3cm9uZyBpbiB0aGUgYXV0b2J1aWxkZXJzICh0aGlzIG9uZSBvbiBtYXN0ZXIsIGJlZm9y
ZSBJIG1lcmdlZAo+IHRoZSBidW1wIHRvIDEuNi4yKSBbMV0KCk5vdGUgdGhhdCBnb2xhbmcgcGFj
a2FnZXMgYXJlIHN1c2NlcHRpYmxlIHRvIGhhc2ggY2hhbmdlcyBpZm9uZSBvZiB0aGVpcgpkZXBl
bmRlbmNpZXMgaXMgY2hhZ25lZC4gRm9yIGV4YW1wbGUsIGlmIGEgZ28gcGFja2FnZSBkZXBlbmRz
LCBkaXJlY3RseQpvciB0cmFuc2l0aXZlbHksIG9uIGEgcGFja2FnZSBmb28gYXQgc29tZS10YWcs
IGJ1dCBmb28gZ290IHJlLXRhZ2dlZCwgb3IKdGhlIHJlcG9zaXRvcnkgaGFzIG1vdmVkLCB0aGVu
IHRoZSB2ZW5kb3Jpbmcgd2lsbCBnZXQgYSBkaWZmZXJlbnQgY29udGVudAp0aGFuIHByZXZpb3Vz
bHkuCgpGb3IgZXhhbXBsZSwgZG9ja2VyJ3MgImRpc3RyaWJ1dGlvbiIgcmVwb3NpdG9yeSBoYXMg
bW92ZWQgZnJvbSB1bmRlcgoiZG9ja2VyIiBvdXQgdG8gaXRzIG93biAiZGlzdHJpYnV0aW9uIiBu
YW1lc3BhY2U6CgogICAgaHR0cHM6Ly9naXRodWIuY29tL2RvY2tlci9kaXN0cmlidXRpb24Kbm93
IHJlZGlyZWN0cyB0bzoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9kaXN0cmlidXRpb24vZGlzdHJp
YnV0aW9uCgo+ID5TaG91bGQgc2VuZCBhIHBhdGNoIGNoYW5naW5nIHRoZSBoYXNoIHRvCj4gPjAy
Yjc5ZDVlMmIwN2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIx
NDhiZTY/Cj4gIExldCdzIGZpcnN0IGFsbG93IFBldGVyIHRvIGNoZWNrIHdoYXQgZXhhY3RseSB3
ZW50IHdyb25nLiBIZSBzaG91bGQgaGF2ZSBhCj4gbG9jYWwgZG93bmxvYWQgd2l0aCB0aGUgaGFz
aCBoZSBwdXNoZWQgc28gaGUgY2FuIGNvbXBhcmUgd2hhdCBjaGFuZ2VkLgo+ICBJIGxvb2tlZCBh
dCB0aGUgZ2l0aHViIHJlcG8sIGFuZCBpdCBzYXlzIHRoYXQgaXQgd2FzIHRhZ2dlZCBvbiBNYXJj
aCAyNCwKPiBpLmUuIGJlZm9yZSBQZXRlciBkaWQgdGhlIGJ1bXAgdG8gMS41LjExLiBTbyBpdCBk
b2Vzbid0IGxvb2sgbGlrZSB0aGV5Cj4gdXBkYXRlZCB0aGUgdGFnLgo+IAo+IDFdIGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2I1ZC9iNWRjZDU2NDkwZTgwN2RiOWU5MmUz
YmJiZDY3NTM3MzgxMzJkYjU3L2J1aWxkLWVuZC5sb2cKCkkgdGhpbmsgdGhlIGVycm9yIGlzIHNv
ZW1oaW5nIGVsc2UgaW4gdGhpcyBjYXNlOgogICAgdGFyOiBzdGRvdXQ6IHdyaXRlIGVycm9yCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
