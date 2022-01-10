Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17848C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 16:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D52B4042F;
	Mon, 10 Jan 2022 16:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ep5t0_4AwgK1; Mon, 10 Jan 2022 16:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C29714038C;
	Mon, 10 Jan 2022 16:23:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B776D1BF369
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 16:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5C1400B9
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osYUZi0xTrIt for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 16:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F3A840018
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 16:23:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so27815087wra.6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cmt7Ad25CyuanXb1MsVtK7zfUuIBELFyVYcw561bx84=;
 b=ezbksRxXYv2PWhTK1WU4bgiK0UOy4kBLaW0g/r0J6stVSyaTZcj5aUxYH2JANftKYt
 6W9W1tG0VYgNXLBlgrh3ohMSf/Peb5grS0+BFI2GbbesQvKSBvHybykYMW0td83kXb2S
 psdAQBe4BgRLQji0C+TzIxCrmBC0F+cvDSHdC1c0KGF8CQV+V2WsOkn8/ICiw6B/A32l
 igljIPRoRK+NlgMwsJrSV+ill3dYkWYwvCEU6ljRrh2GDPIT30Ns8lN+V+5mUOsgqk5E
 OQ14c5aVvjPz7zoUpTg0coVz92PQGkVkNtWDH4IPK74aX0hIOyJjr4ydsaHQO1EBwOam
 6L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cmt7Ad25CyuanXb1MsVtK7zfUuIBELFyVYcw561bx84=;
 b=c1kBj9G+OwmQhhxd/IQIaKutSFGfyGjlu074AEONZWsOQJwPYsBpNC9sU0PP2IxXKo
 5FRmcCbVqApZN+rAcGuE9F5N7Q0SIUWl0fuVzeqvTJJvAQMLRayQ0UibnHPTdUAZ3TFM
 zX75syOwT3dRM9RN3Xo8RYrNgrPfHYnfR9InqX67ZD7c2mEThlVMsro9NVjAPrYjKtoy
 3cI+4NQeex+DMklQYlBZzqdGM80XO7Q3M69PVc1vI7bfIsAyP/8HNA5PG6+oXWWzp3C8
 7MZ4I76km46wiQCB8lveU02m2a9+wLOItLN21aZ0PdteR9E9BH9R09yCXvnkv2LMJ18b
 uNQw==
X-Gm-Message-State: AOAM5339hhlbvoSFMb7nmMvTDs2Md6gqE50v7Vcsc/RIsuei1IrMKH5W
 oWGZtFu5GVQtDvObE93JMGVcN1qUYjs=
X-Google-Smtp-Source: ABdhPJyTHOAesW3Ium594tGaEkYj/M7BCCh6oTsaYGNEzQV2jrhL/qZKUoVtHLbh3XNFvgt84OimCw==
X-Received: by 2002:a05:6000:1191:: with SMTP id
 g17mr330928wrx.512.1641831803956; 
 Mon, 10 Jan 2022 08:23:23 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 by smtp.gmail.com with ESMTPSA id m39sm7130464wms.33.2022.01.10.08.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:23:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 17:23:19 +0100
Message-Id: <20220110162319.294088-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/download: drop support for the 'none'
 hash
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDFiYTg1YjdmODc0ZCAoc3VwcG9ydC9kb3dubG9hZDogYWRkIGV4cGxpY2l0IG5vLWhh
c2ggc3VwcG9ydCkKaW50cm9kdWNlZCB0aGUgJ25vbmUnIGhhc2ggdHlwZSwgaW4gYW4gYXR0ZW1w
dCB0byBtYWtlIGhhc2ggZmlsZXMKbWFuZGF0b3J5LCBidXQgbm90IGZhaWxpbmcgb24gYXJjaGl2
ZXMgbG9jYWx5IGdlbmVyYXRlZCwgbGlrZSB0aG9zZQpmb3IgZ2l0IG9yIHN2biByZXBvc2l0b3Jp
ZXMsIGVzcGVjaWFsbHkgZm9yIHRob3NlIHBhY2thZ2VzIHdoZXJlIGEKdmVyc2lvbiBjaG9pY2Ug
d2FzIHByZXNlbnQsIHdoaWNoIHdvdWxkIGFsbG93IGZvciBlaXRoZXIgcmVtb3RlCmFyY2hpdmVz
IGZvciB3aGljaCB3ZSdkIGhhdmUgYSBoYXNoIG9yIFZDUyB0cmVlcyBmb3Igd2hpY2ggd2UgY291
bGQKbm90IGhhdmUgYSBoYXNoIGZvciB0aGUgbG9jYWx5IGdlbmVyYXRlZCBhcmNoaXZlLgoKSW5k
ZWVkLCBiYWNrIGluIHRoZSB0aW1lLCB3ZSBkaWQgbm90IGhhdmUgYSBtZWFuIHRvIGdlbmVyYXRl
CnJlcHJvZHVjaWJsZSBhcmNoaXZlcywgc28gaGF2aW5nIGEgaGFzaCBmaWxlIHdpdGhvdXQgYSBo
YXNoIGZvcgp0aG9zZWwgb2NhbGx5IGdlbmVyYXRlZCBhcmNoaXZlcyB3b3VsZCB0cmlnZ2VyIGFu
IGVycm9yIGluIHRoZQpoYXNoMC1jaGVja2luZyBtYWNoaW5lcnkuCgpCdXQgbm93LCBsb3ctYW5k
LWJlaG9sZCwgd2UgZG8ga25vdyBob3cgdG8gZ2VuZXJhdGUgdGhvc2UgYXJjaGl2ZXMsCmFuZCB3
ZSBoYXZlIGEgbWVjaGFuaXNtIHRvIGV4cGxpY2l0bHkgZXhjbHVkZSBzb21lIGFyY2hpdmVzIGZy
b20gYmVpbmcKaGFzaC1jaGVja2VkIChlLmcuIHdoZW4gdGhlIHZlcmlzb24gc3RyaW5nIGl0c2Vs
ZiBjYW4gYmUgdXNlci1wcm92aWRlZCkuCgpBcyBzdWNoLCB0aGUgJ25vbmUnIGhhc2ggdHlwZSBu
byBsb25nZXIgaGFzIGFueSByYWlzb24gZCfDqnRyZSwgd2UgZG8gbm90CnVzZSBpdCBpbi10cmVl
LCBhbmQgaXRzIHVzZSBpbiBhIGJyMi1leHRlcm5hbCB0cmVlIGlzIG1vc3QgcHJvYmFibHkKaW5l
eGlzdGVudCAoYXMgaXMgdGhlIHVzZSBvZiBoYXNoIGZpbGVzIGFsb3RnZXRoZXIgbW9zdCBwcm9i
YWJseSkuCgpTbyB3ZSBzaW1wbHkgZHJvcCB0aGUgc3VwcG9ydCBmb3IgdGhhdC4KClNpZ25lZC1v
ZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgotLS0KIGRvY3Mv
bWFudWFsL2FkZGluZy1wYWNrYWdlcy1kaXJlY3RvcnkudHh0IHwgOSArLS0tLS0tLS0KIHN1cHBv
cnQvZG93bmxvYWQvY2hlY2staGFzaCAgICAgICAgICAgICAgIHwgNCAtLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2Nz
L21hbnVhbC9hZGRpbmctcGFja2FnZXMtZGlyZWN0b3J5LnR4dCBiL2RvY3MvbWFudWFsL2FkZGlu
Zy1wYWNrYWdlcy1kaXJlY3RvcnkudHh0CmluZGV4IDRjZWIzZmQ3NzIuLjZjNjhkN2FhNjcgMTAw
NjQ0Ci0tLSBhL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1kaXJlY3RvcnkudHh0CisrKyBi
L2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1kaXJlY3RvcnkudHh0CkBAIC00NjQsOSArNDY0
LDggQEAgVGhlIGZvcm1hdCBvZiB0aGlzIGZpbGUgaXMgb25lIGxpbmUgZm9yIGVhY2ggZmlsZSBm
b3Igd2hpY2ggdG8gY2hlY2sgdGhlCiBoYXNoLCBlYWNoIGxpbmUgd2l0aCB0aGUgZm9sbG93aW5n
IHRocmVlIGZpZWxkcyBzZXBhcmF0ZWQgYnkgdHdvIHNwYWNlczoKIAogKiB0aGUgdHlwZSBvZiBo
YXNoLCBvbmUgb2Y6Ci0qKiArbWQ1KywgK3NoYTErLCArc2hhMjI0KywgK3NoYTI1NissICtzaGEz
ODQrLCArc2hhNTEyKywgK25vbmUrCisqKiArbWQ1KywgK3NoYTErLCArc2hhMjI0KywgK3NoYTI1
NissICtzaGEzODQrLCArc2hhNTEyKwogKiB0aGUgaGFzaCBvZiB0aGUgZmlsZToKLSoqIGZvciAr
bm9uZSssIG9uZSBvciBtb3JlIG5vbi1zcGFjZSBjaGFycywgdXN1YWxseSBqdXN0IHRoZSBzdHJp
bmcgK3h4eCsKICoqIGZvciArbWQ1KywgMzIgaGV4YWRlY2ltYWwgY2hhcmFjdGVycwogKiogZm9y
ICtzaGExKywgNDAgaGV4YWRlY2ltYWwgY2hhcmFjdGVycwogKiogZm9yICtzaGEyMjQrLCA1NiBo
ZXhhZGVjaW1hbCBjaGFyYWN0ZXJzCkBAIC01MDAsOSArNDk5LDYgQEAgdGFyZ2V0IHJ1bi4gRm9y
IGEgcGFja2FnZSB3aXRoIG11bHRpcGxlIHZlcnNpb25zIChsaWtlIFF0NSksCiBjcmVhdGUgdGhl
IGhhc2ggZmlsZSBpbiBhIHN1YmRpcmVjdG9yeSArPHBhY2thZ2V2ZXJzaW9uPisgb2YgdGhhdCBw
YWNrYWdlCiAoc2VlIGFsc28geHJlZjpwYXRjaC1hcHBseS1vcmRlcltdKS4KIAotVGhlICtub25l
KyBoYXNoIHR5cGUgaXMgcmVzZXJ2ZWQgdG8gdGhvc2UgYXJjaGl2ZXMgZG93bmxvYWRlZCBmcm9t
IGEKLXJlcG9zaXRvcnksIGxpa2UgYSAnZ2l0IGNsb25lJywgYSAnc3VidmVyc2lvbiBjaGVja291
dCcuLi4KLQogVGhlIGV4YW1wbGUgYmVsb3cgZGVmaW5lcyBhICtzaGExKyBhbmQgYSArc2hhMjU2
KyBwdWJsaXNoZWQgYnkgdXBzdHJlYW0gZm9yCiB0aGUgbWFpbiArbGliZm9vLTEuMi4zLnRhci5i
ejIrIHRhcmJhbGwsIGFuICttZDUrIGZyb20gdXBzdHJlYW0gYW5kIGEKIGxvY2FsbHktY29tcHV0
ZWQgK3NoYTI1NisgaGFzaGVzIGZvciBhIGJpbmFyeSBibG9iLCBhICtzaGEyNTYrIGZvciBhCkBA
IC01MjAsOSArNTE2LDYgQEAgc2hhMjU2ICAwMWJhNDcxOWM4MGI2ZmU5MTFiMDkxYTdjMDUxMjRi
NjRlZWVjZTk2NGUwOWMwNThlZjhmOTgwNWRhY2E1NDZiICBsaWJmb28KICMgTG9jYWxseSBjb21w
dXRlZDoKIHNoYTI1NiAgZmY1MjEwMWZiOTBiYmZjM2ZlOTQ3NWU0MjU2ODhjNjYwZjQ2MjE2ZDdl
NzUxYzRiYmRiMWRjODVjZGNjYWNiOSAgbGliZm9vLWZpeC1ibGFibGEucGF0Y2gKIAotIyBObyBo
YXNoIGZvciAxMjM0Ogotbm9uZSAgeHh4ICBsaWJmb28tMTIzNC50YXIuZ3oKLQogIyBIYXNoIGZv
ciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICBhNDVhODQ1MDEyNzQyNzk2NTM0ZjdlOTFmZTYyMzI2
MmNjZmI5OTQ2MGEyYmQwNDAxNWJkMjhkNjZmYmE5NWI4ICBDT1BZSU5HCiBzaGEyNTYgIDAxYjFm
OWYyYzhlZTY0OGE3YTU5NmExYWJlOGFhNGVkNzg5OWIxYzllNTU1MWJkYTA2ZGE2ZTQyMmIwNGFh
NTUgIGRvYy9DT1BZSU5HLkxHUEwKZGlmZiAtLWdpdCBhL3N1cHBvcnQvZG93bmxvYWQvY2hlY2st
aGFzaCBiL3N1cHBvcnQvZG93bmxvYWQvY2hlY2staGFzaAppbmRleCBmZTljMTA1NzBlLi41YTQ3
ZjQ5YmMzIDEwMDc1NQotLS0gYS9zdXBwb3J0L2Rvd25sb2FkL2NoZWNrLWhhc2gKKysrIGIvc3Vw
cG9ydC9kb3dubG9hZC9jaGVjay1oYXNoCkBAIC01MywxMSArNTMsNyBAQCBjaGVja19vbmVfaGFz
aCgpIHsKICAgICAjIE5vdGU6IG1kNSBpcyBzdXBwb3J0ZWQsIGJ1dCB1bmRvY3VtZW50ZWQgb24g
cHVycG9zZS4KICAgICAjIE5vdGU6IHNoYTMgaXMgbm90IHN1cHBvcnRlZCwgc2luY2UgdGhlcmUg
aXMgY3VycmVudGx5IG5vIGltcGxlbWVudGF0aW9uCiAgICAgIyAgICAgICAodGhlIE5JU1QgaGFz
IHlldCB0byBwdWJsaXNoIHRoZSBwYXJhbWV0ZXJzKS4KLSAgICAjIE5vdGU6ICdub25lJyBtZWFu
cyB0aGVyZSBpcyBleHBsaWNpdGx5IG5vIGhhc2ggZm9yIHRoYXQgZmlsZS4KICAgICBjYXNlICIk
e19ofSIgaW4KLSAgICAgICAgbm9uZSkKLSAgICAgICAgICAgIHJldHVybiAwCi0gICAgICAgICAg
ICA7OwogICAgICAgICBtZDV8c2hhMSkgICAgICAgICAgICAgICAgICAgICAgIDs7CiAgICAgICAg
IHNoYTIyNHxzaGEyNTZ8c2hhMzg0fHNoYTUxMikgICAgOzsKICAgICAgICAgKikgIyBVbmtub3du
IGhhc2gsIGV4aXQgd2l0aCBlcnJvcgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
