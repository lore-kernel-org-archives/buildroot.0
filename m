Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8522C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FF283089;
	Tue, 10 May 2022 21:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMQhdS3Iz0ta; Tue, 10 May 2022 21:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9C881D16;
	Tue, 10 May 2022 21:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B18931BF421
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 21:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86F040383
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 21:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRQdTFdCOLtZ for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 21:49:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D11F2402F5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 21:49:44 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 y22-20020a4acb96000000b0035eb01f5b65so217757ooq.5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 14:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fD43jhbWQht78KGziKdbYtCJldlnxIhJCMN6ci3N5Tw=;
 b=eER9UAgFrHnL4kfyuurVQAlk3pwv6OA8SoezWTWOT3KrKHjykHvbN/8H6zNp3EaGva
 gjIqV5OuhofsHOxlcneaMI10hmd/qQG+rOtnGahTqPgLvAzQX0GqDydYQyy+zqnE6H7D
 2quetTJZTHv6q7KvKn78yUCKNEmJTgX2yBYUPU0MJOAmfdQT6eyUYx5noRT65X4xXOo9
 gxcpZwLBvzUUXZAs/9Bq0aNqgG+l6Kv7XpGk9wF/8oA5c0caY6wZlvht+iyoLgT+BCtT
 2pkmxm/Ck5wNqPz8LvfJpdVwxqyQiUx2J9DiQbZ9RY0MLqMy3oMBuZEN4xQf067vaFU4
 rbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fD43jhbWQht78KGziKdbYtCJldlnxIhJCMN6ci3N5Tw=;
 b=5/udfnDn/xr5nmbF/FjMv5aqpjehnN5xxdmiPFrKniTUF8rtok8j1SqtKNaCH4Gcr/
 TI2as4SZJbwz7jO5t1DBwocBFu7gcPNBzlSHFkbZ7huf7gYyx2LYhy5Au9rVaDfURMt7
 TDvGx4j6wHpiGwuEFov3bkDpOnN0kboZm8ymshKhyyjO9byNc0azPnJn4Za4ozs2hdqR
 uSCLdWTzVB7oIXCNsdY+GIkFqNr82lIe3F4tRIJSVfL5BpPIwOjIb1DLUm+nWEnM2Xhl
 TUnEarhBJ9s8DqsWPaF1a+U9ka5DlIp25Vfus6+DY6K2mFF/37HzjSx3naDLJgN3IMcF
 Yy0Q==
X-Gm-Message-State: AOAM533cAS0vlOfaMJ5Wzw2gsaeOGhVyWERW7rjVYM5+FuzFrY2Na470
 rVBaJxDqlIeIefKavFs1evULkga74NRR9huWRvs=
X-Google-Smtp-Source: ABdhPJw84eH8bD7/aeA3Mgke85SBvR53UFj46pT7W5xNznZxNgiEUoyWJSdaDFtZAB5NfcoL3MdOMlbqPmI8VbjmzGw=
X-Received: by 2002:a4a:e1b4:0:b0:35f:5299:9b43 with SMTP id
 20-20020a4ae1b4000000b0035f52999b43mr8562198ooy.37.1652219383843; Tue, 10 May
 2022 14:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <YnrH/mfbuJHRpYnw@pevik>
In-Reply-To: <YnrH/mfbuJHRpYnw@pevik>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 May 2022 23:47:27 +0200
Message-ID: <CAPi7W80OTx7DuKHba8Y3Zr4vUJ-SnLGTesHyYCf-Gjw2z2hnNg@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC] iputils (meson build system) has git version
 from buildroot instead of iputils
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Dagg Stompler <daggs@gmx.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ciwKCkxlIG1hci4gMTAgbWFpIDIwMjIgw6AgMjI6MTYsIFBldHIgVm9yZWwgPHBldHIu
dm9yZWxAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBhbGwsCj4KPiBtZXNvbi5idWlsZCBb
MV0gdXNlcyBnaXQtdmVyc2lvbi5oLm1lc29uIFsyXSB0byBwcm9kdWNlIEJVSUxEX0RJUkVDVE9S
WS9naXQtdmVyc2lvbi5oLgo+Cj4gQnVpbGRpbmcgZnJvbSBzb3VyY2VzIChub3QgaW4gQnVpbGRy
b290KSBpdCB3b3JrczoKPiAkIGhlYWQgLTEgYnVpbGRkaXIvZ2l0LXZlcnNpb24uaAo+ICNkZWZp
bmUgUEFDS0FHRV9WRVJTSU9OICIyMDIxMTIxNS0xNS1nMzA5ZjI4NSIKPgo+IEJ1dCBidWlsZGlu
ZyBpbiBCdWlsZHJvb3QgaXQgZ2V0cyBnaXQgdmVyc2lvbiBmcm9tIEJ1aWxkcm9vdDoKPiAkIGhl
YWQgLTEgb3V0cHV0L2J1aWxkL2lwdXRpbHMtMjAyMTEyMTUvYnVpbGQvZ2l0LXZlcnNpb24uaAo+
ICNkZWZpbmUgUEFDS0FHRV9WRVJTSU9OICIyMDIyLjAyLTg3Ni1nM2VmMDk2Nzg2YSIKPgo+IElz
IGl0IGEgYnVnIGluIGlwdXRpbHMgb3IgaW4gQnVpbGRyb290IG1lc29uPwoKVGhpcyBpc3N1ZSBp
cyByYWlzZWQgYmVjYXVzZSwgaW4gdGhlIGNvbnRleHQgb2YgYnVpbGRyb290LCBpcHV0aWxzIGlz
CnJldHJpZXZlZCBhcyBhIHRhcmJhbGwsIG5vdCBhIGdpdCBjbG9uZS4KU28gbWVzb24ncyB2Y3Nf
dGFnIHdpbGwgcmV0cmlldmUgdGhlIGdpdCBpbmZvcm1hdGlvbiBmcm9tIGJ1aWxkcm9vdAphbmQg
d2lsbCBub3QgdXNlIGl0cyBmYWxsYmFjayAoaS5lLiBtZXNvbi5wcm9qZWN0X3ZlcnNpb24oKSku
CgpUbyBmaXggaXQsIHRoZXJlIGlzIHRocmVlICJzaW1wbGUiIG9wdGlvbnM6CiAtIGFsbG93IGJ1
aWxkcm9vdCB0byBjb25maWd1cmUgdGhlIHZlcnNpb24gKGFzIGFscmVhZHkgZG9uZSBpbgpvcGVu
NjI1NDEgcGFja2FnZSkKIC0gZG9uJ3QgdXNlIHZjc190YWcgYW5kIGFsd2F5cyBzZXQgcGFja2Fn
ZV92ZXJzaW9uIHRvCm1lc29uLnByb2plY3RfdmVyc2lvbigpIG91dHNpZGUgb2YgYSAiZGV2ZWwi
IG1vZGUgYXMgZG9uZSBmb3IgZXhhbXBsZQppbiBnbm9tZSBjb25zb2xlIFsxXQogLSBvdmVycmlk
ZSB0aGUgZGVmYXVsdCB2Y3MgY29tbWFuZCBpbiB2Y3NfdGFnIGNhbGwgKGUuZy4gY29tbWFuZDoK
J2dpdCAtLWdpdC1kaXI9LmdpdCBkZXNjcmliZSAtLWRpcnR5PSsnKQoKQW5vdGhlciBvcHRpb24g
d291bGQgYmUgdG8gcGF0Y2ggbWVzb24gc28gdmNzX3RhZyBpcyBhbHdheXMgcnVuIHdpdGgKIi0t
Z2l0LWRpcj0uZ2l0Ii4KVGhpcyBpcyBwcm9iYWJseSB0aGUgbW9yZSBjb3JyZWN0IG9wdGlvbiBh
cyB0aGlzIGlzc3VlIGlzIHByb2JhYmx5CmFmZmVjdGluZyBvdGhlciBwYWNrYWdlcyB0aGFuIGlw
dXRpbHMuCkhvd2V2ZXIsIGZyb20gbXkgZXhwZXJpZW5jZSBpbiBtZXNvbiwgZ2V0dGluZyBzb21l
dGhpbmcgbWVyZ2VkCnVwc3RyZWFtIGNhbiB0YWtlIGEgdmVyeSB2ZXJ5IGxvbmcgdGltZSAoZS5n
LiBtb3JlIHRoYW4gdHdvIHllYXJzIGZvcgphIHByZWZlcl9zdGF0aWMgb3B0aW9uIFsyXSkKSSBk
b24ndCBrbm93IGlmIHRoaXMgaXMgY29tcGxldGVseSByZWxhdGVkIGJ1dCB0aGlzIGlzc3VlIG9u
IHZjc190YWcKaXMgb3BlbmVkIGZvciBtb3JlIHRoYW4gb25lIHllYXIgWzNdIC4uLgoKPiBBbnkg
aWRlYSBob3cgdG8gZml4IGl0Pwo+Cj4gS2luZCByZWdhcmRzLAo+IFBldHIKPgo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vaXB1dGlscy9pcHV0aWxzL2Jsb2IvbWFzdGVyL21lc29uLmJ1aWxkI0wx
NAo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vaXB1dGlscy9pcHV0aWxzL2Jsb2IvbWFzdGVyL2dp
dC12ZXJzaW9uLmgubWVzb24KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKClsxXSBodHRwczovL2dp
dGxhYi5nbm9tZS5vcmcvR05PTUUvY29uc29sZS8tL2Jsb2IvbWFpbi9tZXNvbi5idWlsZCNMMzUK
WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL3B1bGwvNjYyOQpbM10gaHR0
cHM6Ly9naXRodWIuY29tL21lc29uYnVpbGQvbWVzb24vaXNzdWVzLzg1NjcKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
