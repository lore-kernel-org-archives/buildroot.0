Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E6AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE3E4030F;
	Sun,  9 Jan 2022 13:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIKxdAQ_sRw9; Sun,  9 Jan 2022 13:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C4040295;
	Sun,  9 Jan 2022 13:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 393371BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2555B401B2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqIVou47fqmT for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:42:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1104A4010F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:42:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id u21so20232358edd.5
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dIhZ2MpHpUF08In3QMdKJUzOCe7zhDNmX9A2iG/HY1g=;
 b=H0TCEfLxspIzTcv85m6RlEJ06XVbwitDWh62Gz2/yoyRd3dYXNOPdU6vbt4340DsF9
 GQLCRkgdrETZm8NHT7r+3hDD/bwEzENhbwqGVXGSMF/iFrAzfSkR86+q6NwtAq0f/4y2
 TzY3tOsauG6eLP8Hg68pucGaEV0S20nUGpOcPznhKaADyecFNW7txUv2GgJ/9wN9lT1y
 TOWBnmVxPuLXHYgNjm8SWBlSZw9I92qwmRr3GToKdvC2XxS9qJ8ke8+vKeYdxg8an26b
 J36Iv6Cg+7637G1gJJP1JZe8S6ZbQSXUAwew7awr+o8DYGlr6aiqoiNFJh6ndpRptJyq
 jJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dIhZ2MpHpUF08In3QMdKJUzOCe7zhDNmX9A2iG/HY1g=;
 b=6l1Wf3vAk8INau4RG+xhYR5QolPA8h4nSnqrnV9w2ZEJj6AZFAHdn16U+8fGyi1WLp
 FrC7x0U/yWpwYR/bxNkTajEm+gxmAVLCz0ep5cIamXm0CPD/UQK/exnVIhX2wDcLuS45
 oX6d70nSQe1vs/iR6Ynrc5ycVQcclVfUzW22ZNq8WfM2IVaNyk8eZB986M1SWkcyL8cU
 tF+/bt7yK63L3viRj5DmYHiHrjf8Ja1yX/ezA6FFfaif7s7q9fxIZQHeagwtCUnxuNqq
 TA6ABW8I13+3Oc/zUUpCfeYKhmckY9Qi5mowyI18qaPbI5WRfmfLVNvSkITqTk5zzopA
 YTKA==
X-Gm-Message-State: AOAM533n7PWP3XK9S3Od6V23Vt+YL3RPpEFZ05znEdWD4x2Jh0WxyJQg
 pfkKhaNIiDiBmv0myPKgGvH0YrsaoLxfqTSKytK0+2vS
X-Google-Smtp-Source: ABdhPJxHf6rc7fFL5lRI7jnfZ2e480Hh8irEuBaBs6CGR90PoTjxLBlmALCFl91BsRpj96JKj6XsuBpfETO8/3IAYd4=
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr69267963edd.393.1641735767335; 
 Sun, 09 Jan 2022 05:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 <874k6egvrm.fsf@dell.be.48ers.dk>
 <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
 <87zgo6f9sa.fsf@dell.be.48ers.dk>
 <CAPi7W83EtcjmXsa++4J6cyVK7muHf84Ckq2G_gGYDA_AUBJ+Uw@mail.gmail.com>
 <87a6g6f7vl.fsf@dell.be.48ers.dk>
In-Reply-To: <87a6g6f7vl.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 9 Jan 2022 14:41:29 +0100
Message-ID: <CAPi7W82RJ9Jb=Sec-4oVGqxWyhvw4+8fbEEiMQsvis4dZenCjQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTg6MzUsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiBIaSwKPgo+ICA+
PiBGb3IgdGhlIHF1ZXN0aW9uIGlmIHdlIG5lZWQgdG8gbWFpbnRhaW4gYm90aCAyLjI4LnggYW5k
IDMueCBpbgo+ICA+PiBwYXJhbGxlbCBJIGd1ZXNzIGl0IHJlYWxseSBkZXBlbmRzIG9uIGlmIHRo
ZSBwYWNrYWdlcyB3ZSBoYXZlIGRlcGVuZGluZwo+ICA+PiBvbiBtYmVkdGxzIChFLkcuIGJjdG9v
bGJveCwgYm14NywgbW9uZ3JlbDIsIHNoYWRvd3NvY2tzLWxpYmV2KSBjYW4gKGJlCj4gID4+IHBh
dGNoZWQgdG8pIHdvcmsgd2l0aCBtYmVkdGxzIDMueCBvciBub3Q/Cj4KPiAgPiBJdCBpcyByZWFs
bHkgdW5saWtlbHkgdGhhdCBhbGwgdGhlc2UgcGFja2FnZXMgd2lsbCBiZSBwYXRjaGVkIHRvIHdv
cmsKPiAgPiB3aXRoIG1iZWR0bHMgMy54Lgo+ICA+IFRvIG15IGtub3dsZWRnZSwgb25seSBoaWF3
YXRoYSBhbmQgY3VybCBoYXZlIGJlZW4gcGF0Y2hlZCB0byBzdXBwb3J0Cj4gID4gbWJlZHRscyAz
LnguCj4gID4gYW5kIGl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGN1cmwgc3VwcG9ydHMgbWJlZHRs
cyAyLnggYW5kIDMueDoKPiAgPiBodHRwczovL2dpdGh1Yi5jb20vY3VybC9jdXJsL2NvbW1pdC8z
ZjEyNjEzOGJlM2M0NTlhMjc5NGQzNWY4MTcwZTkyZTY1YTUwZGFkCj4gID4gbGlnaHR0cGQgaXMg
dHJ5aW5nIHRvIG1pZ3JhdGUgYnV0IGhhcyBhIGxvdCBvZiBpc3N1ZXM6Cj4gID4gaHR0cHM6Ly9n
aXRodWIuY29tL0FSTW1iZWQvbWJlZHRscy9pc3N1ZXMvNTMzMQo+Cj4gT2ssIHRoYW5rcy4KPgo+
ICA+PiBJZiB0aGV5IGNhbiAob3IgYXJlIG5vIGxvbmdlciBtYWludGFpbmVkIHVwc3RyZWFtKSwg
dGhlbiBJIHdvdWxkIHByZWZlcgo+ICA+PiB0byBvbmx5IHN1cHBvcnQgbWJlZHRscyAzLnggZ29p
bmcgZm9yd2FyZC4gSWYgb24gdGhlIG90aGVyIGhhbmQgbWJlZHRscwo+ICA+PiAzLnggaXNuJ3Qg
cmVhbGx5IHN0YWJsZSB5ZXQgYW5kIG9ubHkgbmVlZGVkIGZvciBoaWF3YXRoYSwgdGhlbiBpbmRl
ZWQgd2UKPiAgPj4gc2hvdWxkIHBlcmhhcHMganVzdCBwb3N0cG9uZSBpdCBhIGJpdCBhbmQgdXNl
IHRoZSBpbnRlcm5hbCBtYmVkdGxzIGNvcHkKPiAgPj4gaW4gaGlhd2F0aGEgb3IgZG93bmdyYWRl
IC8gZHJvcCBUTFMgc3VwcG9ydC4KPgo+ICA+IDMueCBpcyBtb3JlICJzZWN1cmUiIGJlY2F1c2Ug
bWFueSBvYnNvbGV0ZSBjcnlwdG9ncmFwaGljIG1lY2hhbmlzbXMgYW5kCj4gID4gVExTIHByb3Rv
Y29sIHZlcnNpb25zIGFuZCBvcHRpb25zIGhhdmUgYmVlbiByZW1vdmVkLiBIb3dldmVyLCBpdCBp
cyBwcm9iYWJseQo+ICA+IG9rIHRvIHBvc3Rwb25lIHRoZSBhZGRpdGlvbiBvZiBtYmVkdGxzIDMu
eCB1bnRpbCBtb3JlIHBhY2thZ2VzIHN1cHBvcnQgaXQuCj4KPiBZZXMsIEkgYWdyZWUuIFdoYXQg
d2lsbCB3ZSBkbyBhYm91dCBoaWF3YXRoYT8gUGF0Y2ggaXQgdG8gd29yayB3aXRoIDIueAo+IGFz
IHdlbGwsIG1vdmUgdG8gdGhlIGludGVybmFsIG1iZWR0bHMgY29weSBvciByZXZlcnQgdGhlIGJ1
bXA/IERpZCB5b3UKPiB0cnkgY29udGFjdGluZyB1cHN0cmVhbSBhYm91dCB0aGUgaXNzdWU/Ckkg
ZGlkbid0IHRyeSB0byBjb250YWN0IGhpYXdhdGhhIGJ1dCBJIHRoaW5rIHRoZSBlYXNpZXN0IGNv
dXJzZSBvZgphY3Rpb24gd291bGQgYmUgdG8gdXNlIHRoZSBpbnRlcm5hbCBjb3B5LiBJIHNlbnQg
YSBwYXRjaC4KPgo+Cj4gID4gSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgd2UnbGwgaGF2ZSB0aGUg
c2FtZSBpc3N1ZS9xdWVzdGlvbiB3aXRoIG9wZW5zc2wgMy54IC4uLgo+Cj4gSW5kZWVkLCB0aGF0
IGlzIGFub3RoZXIgY2FuIG9mIHdvcm1zIHRoYXQgaGFzIGJlZW4gb24gbXkgVE9ETyBsaXN0IGZv
ciBhCj4gd2hpbGUuLi4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKQmVzdCBSZWdhcmRz
LAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
