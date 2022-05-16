Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20DDC4332F
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 22:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A03174048F;
	Mon, 16 May 2022 22:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hzs2DtdbU258; Mon, 16 May 2022 22:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D8D640119;
	Mon, 16 May 2022 22:13:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 560FD1BF2CF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F75A41904
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTAKLoe8zfYZ for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 22:13:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD60041901
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:13:09 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l16so20357028oil.6
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0YLt+iRtOxjDp1URN6+U/WofKifZsKvdV0bNLRwkiRw=;
 b=o5MJ7VvrNqjzLGoUprxr7qup59sjqz++8jcoYuVXg1jw4K36BbGI1neMaGLFKePOW2
 9wcE7lUjlJE2IqUq4ZIM5hn2nvOD3hE7SG9YEphr0B1DtDkJ6aQPr9RrOpjckpG0e1QI
 iFA1oQirov0TXPP8M+OSg8CAzksUfpgnXUSS/bIWUj58kYh7F2tmuSIOep70HoKsiZgb
 7sBIot9EDDNB62KXsK8PY4BkuLuTy8p3Lzc6lDGppekw5/KVIYfT0AHDm6LV5z7w2z0m
 5t3QEI4LXAIBHqTLhlEI00Co71DgboFm2IqZZM3jP5eWwJt6YW6/YUP/Bt7mF7d5a5et
 5EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0YLt+iRtOxjDp1URN6+U/WofKifZsKvdV0bNLRwkiRw=;
 b=PsLM2CHv6b75Q3kq864QMujHoXvQNCnqC7vCN+Ywu6ZMFf9Nc2Irdwcz+cNzG5kATb
 PVn8En7mOHCvvwmI+vAqpdIAwwXKtOOckCCMs69aaug2y0h97x/KbOmyhZ0fowPCIzrn
 Ags3QfU/cTvlo1eFmOWjGM/nbl3q3oRmQC2BVdPCi7cjdXnb9KwZpXLqNE7+RAvhpLPz
 m4DqOD9PcGcECUxfy+pbbv1pd25eH+3QhFcqqnLXLmYD9N8HrK53rwR6VGJNkvSsEpqV
 qwMEwkEPB/WS0Olc3Rqx3/CDbV+jbZu3qOBPRRBmU8SGAe8dbafk3U6lNp9BDGHIAJbT
 EnDQ==
X-Gm-Message-State: AOAM532VNExeelK+lBhNENsYRwnoQmRMTlmlBTuNb5jcpIkELEg2TUmu
 8PCqbyuUv1gQqkEivBCubkWLf41Hsnb1mEv/yCpLcc5YoJ4=
X-Google-Smtp-Source: ABdhPJxwpHIF4h/M56jPpkwClokHmQjzMemvTK5TOPeM8ShSb5Rh+jB0541SI8yw4PpuTAo6DOvUD4lIoKCDZh0juC8=
X-Received: by 2002:a05:6808:1da:b0:325:bf8e:df25 with SMTP id
 x26-20020a05680801da00b00325bf8edf25mr9030425oic.99.1652739188752; Mon, 16
 May 2022 15:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJpxd07JQQ2_xZZqKQ9Oc4DG-nNRCsmH=MHdMOPJwMciEhocXA@mail.gmail.com>
In-Reply-To: <CAJpxd07JQQ2_xZZqKQ9Oc4DG-nNRCsmH=MHdMOPJwMciEhocXA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 May 2022 16:12:57 -0600
Message-ID: <CADvTj4qNoz1jWKTQBjVKedTUMJer7h1c85BXgjE60KuZjwaKew@mail.gmail.com>
To: bryce.schober@gmail.com
Subject: Re: [Buildroot] sources.buildroot.net busybox download errors
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBNYXkgMTYsIDIwMjIgYXQgNDowOSBQTSA8YnJ5Y2Uuc2Nob2JlckBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gT3VyIGJ1aWxkcyBoYXZlIGJlZW4gaGF2aW5nIGEgcHJvYmxlbSByZWNlbnRs
eSBpbiBkb3dubG9hZGluZyBmcm9tIGh0dHA6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvYnVzeWJv
eC4gSXQgYXBwZWFycyB0aGF0IGJ1c3lib3gtMS4zNS4wLnRhci5iejIgYW5kIHNvbWUgLyBtYW55
IG90aGVycyBoYXZlIGJlZW4gY29ycnVwdGVkLCBhbmQgY2F1c2UgYm90aCB1bmV4cGVjdGVkIGRv
d25sb2FkIGJlaGF2aW9yIGFuZCBjaGVja3N1bSBmYWlsdXJlczoKPgo+ICQgIHdnZXQgaHR0cDov
L3NvdXJjZXMuYnVpbGRyb290Lm5ldC9idXN5Ym94L2J1c3lib3gtMS4zNS4wLnRhci5iejIKPiAt
LTIwMjItMDUtMTYgMTQ6NDE6MzgtLSAgaHR0cDovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9idXN5
Ym94L2J1c3lib3gtMS4zNS4wLnRhci5iejIKPiBSZXNvbHZpbmcgc291cmNlcy5idWlsZHJvb3Qu
bmV0IChzb3VyY2VzLmJ1aWxkcm9vdC5uZXQpLi4uIDEwNC4yNi4xLjM3LCAxNzIuNjcuNzIuNTYs
IDEwNC4yNi4wLjM3LCAuLi4KPiBDb25uZWN0aW5nIHRvIHNvdXJjZXMuYnVpbGRyb290Lm5ldCAo
c291cmNlcy5idWlsZHJvb3QubmV0KXwxMDQuMjYuMS4zN3w6ODAuLi4gY29ubmVjdGVkLgo+IEhU
VFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAyMDAgT0sKPiBMZW5ndGg6IDI0
ODA2MjQgKDIuNE0pIFthcHBsaWNhdGlvbi94LWd0YXItY29tcHJlc3NlZF0KPiBTYXZpbmcgdG86
IOKAmGJ1c3lib3gtMS4zNS4wLnRhci5iejLigJkKPgo+IGJ1c3lib3gtMS4zNS4wLnRhci5iejIg
ICAgICAgICAgOTUlWz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0+ICAgXSAgIDIuMjZNICAtLS4tS0IvcyAgICBpbiA1LjhzCj4KPiAyMDIyLTA1LTE2IDE0OjQx
OjQ1UmVzb2x2ZWQgKENvbXBsZXRlZCkgKDQwMiBLQi9zKSAtIENvbm5lY3Rpb24gY2xvc2VkIGF0
IGJ5dGUgMjM3NDY3MS4gUmV0cnlpbmcuCgpMb29rcyBsaWtlIHlvdXIgZG93bmxvYWQgZGlkbid0
IGNvbXBsZXRlIGR1ZSB0byBjb25uZWN0aW9uCmludGVycnVwdGlvbiBvZiBzb21lIHNvcnQuCgo+
Cj4gLS0yMDIyLTA1LTE2IDE0OjQxOjQ2LS0gICh0cnk6IDIpICBodHRwOi8vc291cmNlcy5idWls
ZHJvb3QubmV0L2J1c3lib3gvYnVzeWJveC0xLjM1LjAudGFyLmJ6Mgo+IENvbm5lY3RpbmcgdG8g
c291cmNlcy5idWlsZHJvb3QubmV0IChzb3VyY2VzLmJ1aWxkcm9vdC5uZXQpfDEwNC4yNi4xLjM3
fDo4MC4uLiBjb25uZWN0ZWQuCj4gSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNl
Li4uIDQxNiBSZXF1ZXN0ZWQgcmFuZ2Ugbm90IHNhdGlzZmlhYmxlCgpBbmQgdGhlIHJlc3VtZSBz
ZWVtZWQgdG8gZmFpbC4KCj4KPiAgICAgVGhlIGZpbGUgaXMgYWxyZWFkeSBmdWxseSByZXRyaWV2
ZWQ7IG5vdGhpbmcgdG8gZG8uCj4KPiAkIHNoYTI1NnN1bSBidXN5Ym94LTEuMzUuMC50YXIuYnoy
Cj4gYTc0MzZjYWE2NWYwZDUxY2M1YzMzYTVkOWJlNmI0YjZkNjdlODVhZDFkZTEwNjc4NDkyMTg5
NTE3NmExNjRmYyAgYnVzeWJveC0xLjM1LjAudGFyLmJ6MgoKTG9va3MgZmluZSB3aGVuIEkgdHJp
ZWQgZG93bmxvYWRpbmcgaXQ6CiQgc2hhMjU2c3VtIGJ1c3lib3gtMS4zNS4wLnRhci5iejIKZmFl
ZWIyNDRjMzVhMzQ4YTMzNGY0YTU5ZTQ0NjI2ZWU4NzBmYjA3YjY4ODRkNjhjMTBhZThiYzE5Zjgz
YTY5NApidXN5Ym94LTEuMzUuMC50YXIuYnoyCgo+Cj4gJCBncmVwICdzaGEyNTYgLiogYnVzeWJv
eC0xLjM1LjAudGFyLmJ6MicgcGFja2FnZS9idXN5Ym94L2J1c3lib3guaGFzaAo+IHNoYTI1NiAg
ZmFlZWIyNDRjMzVhMzQ4YTMzNGY0YTU5ZTQ0NjI2ZWU4NzBmYjA3YjY4ODRkNjhjMTBhZThiYzE5
ZjgzYTY5NCAgYnVzeWJveC0xLjM1LjAudGFyLmJ6Mgo+Cj4gPD48ICA8PjwgIDw+PAo+IEJyeWNl
IFNjaG9iZXIKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
