Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCECC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D130C60C05;
	Mon,  5 Feb 2024 16:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D130C60C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08n2hgS5caBQ; Mon,  5 Feb 2024 16:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A96460AD2;
	Mon,  5 Feb 2024 16:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A96460AD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D448A1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9ED582978
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9ED582978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSo4-qThdLlt for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:32:31 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB1FE82298
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB1FE82298
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-42a99202ae0so19152761cf.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150750; x=1707755550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5JkGgGsqfG6QagKFC8xHcSbY5TPKDtaq35+kfJDKlQ=;
 b=ksF5FbFX79dey0JRYWvZuTEqtgtv7Bb0n8EjREyI7+A1eykUPeK5nqeD8lf4JAMsnH
 INrAu+wTs18XeltIuptlPgWmNNeqPGDTmcxYMwsl/Crf98RPD+UL1zDBHVlYG4HSQmGz
 rEesHjMyPs+WhwXxncKLDaMoNoc+zOGHiB1Ec/2QuSH0d/i27CnogFKLEbVexvGam4tU
 XoIjSXwPiyjmSFIHRZp7AE+C57JHlkYd1OgGR+ipveO9oPFjvGBkYmbefB5P8RJUvPLe
 GdwGtUA12Sqm51UEi8Fm/Iakjm91rIgfTy9dWGBO0BZl1xmYDZU3kHLw0o53Jc7+WHBi
 9vVw==
X-Gm-Message-State: AOJu0Ywh4loxl9exXH69PJ8HdDja+menRZWprIPc8r5pPrt1kb44NJQz
 sp3gEEcYL1JyCQwLip0s+q9hIG35rMrQzvIYhbuKFakjSlT8KaYqWfEPWGzeVa+favnueamagtj
 MRtj40Mi52K1AO5PBpbfsqTukmn35bNJ2Xeo=
X-Google-Smtp-Source: AGHT+IEloiocZO/8f7uSNsKz/bxaxWhFWx85rWC08PJv4uESiLGt3tmzi2AN6lUKAyvN5R414Mku6E+uLM3OaFR/PCg=
X-Received: by 2002:ac8:5a95:0:b0:42c:29fc:b2cd with SMTP id
 c21-20020ac85a95000000b0042c29fcb2cdmr3234659qtc.14.1707150750468; Mon, 05
 Feb 2024 08:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20240111053157.2928259-1-james.hilliard1@gmail.com>
 <87plxbta1d.fsf@48ers.dk>
In-Reply-To: <87plxbta1d.fsf@48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Feb 2024 09:32:18 -0700
Message-ID: <CADvTj4qsjwpZ8XUw7jqfn_EdwVN7azCOcRwwP7Nu-Gmh+JnsBw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707150750; x=1707755550; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5JkGgGsqfG6QagKFC8xHcSbY5TPKDtaq35+kfJDKlQ=;
 b=HZrlJ46bJiQHwK/ZwkuAjLCby4zsKxmavWWg3VSifWafWG9FvTPqHaey/UiUi/7Uxn
 K9p49IK/SWx2n41/EWmj5dUYV+3/Ld4knn7Hz4ukQVrbmE0d3Fx0glhl0mGwAAUpxpH+
 X1kQDiBDZFypDXXZZJWw30KSeg8CupzENwIRwvgFte292TvMa7Noj9V0q4Qi7gj9M9Dz
 9BYiUkHRYn6eQOrJ724FhlpHouFppCD9tgBTVDqRZ5sdtKhcmX069s3LxDg7TBM3h1ch
 w7ljAtptiSPej2f19iGs+0HHVeDjLxt8qdb3psV6M2g55kTCl/psp853YVteTZUAmCqL
 YWuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HZrlJ46b
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.18.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA0OjM54oCvQU0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJKYW1lcyIgPT0gSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyaXRlczoKPgo+ICA+IExpY2Vuc2UgaGFzaCBj
aGFuZ2VkIGR1ZSB0byB5ZWFyIHVwZGF0ZToKPiAgPiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9w
L3J1YW1lbC15YW1sL2NvZGUvY2kvNTZiM2UyNjY2ZmIyNzVkZWFiM2VlYzk5MTkzYzEwM2U0ZWRm
OTNiYi8KPgo+ICA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+ICA+IC0tLQo+ICA+ICBwYWNrYWdlL3B5dGhvbi1ydWFtZWwteWFtbC9w
eXRob24tcnVhbWVsLXlhbWwuaGFzaCB8IDYgKysrLS0tCj4gID4gIHBhY2thZ2UvcHl0aG9uLXJ1
YW1lbC15YW1sL3B5dGhvbi1ydWFtZWwteWFtbC5tayAgIHwgNCArKy0tCj4gID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLXJ1YW1lbC15YW1sL3B5dGhvbi1ydWFtZWwteWFtbC5oYXNoIGIv
cGFja2FnZS9weXRob24tcnVhbWVsLXlhbWwvcHl0aG9uLXJ1YW1lbC15YW1sLmhhc2gKPiAgPiBp
bmRleCAyOTg1MmE1MWVkLi43YjVkYzFlMjlhIDEwMDY0NAo+ICA+IC0tLSBhL3BhY2thZ2UvcHl0
aG9uLXJ1YW1lbC15YW1sL3B5dGhvbi1ydWFtZWwteWFtbC5oYXNoCj4gID4gKysrIGIvcGFja2Fn
ZS9weXRob24tcnVhbWVsLXlhbWwvcHl0aG9uLXJ1YW1lbC15YW1sLmhhc2gKPiAgPiBAQCAtMSw1
ICsxLDUgQEAKPiAgPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9y
ZmMzOTg3L2pzb24KPiAgPiAtbWQ1ICAyMDZiZGEwZjMzYWIyYzJmNjM3Nzc2MzYyMDA3NDhiNyAg
cnVhbWVsLnlhbWwtMC4xNy4yMS50YXIuZ3oKPiAgPiAtc2hhMjU2ICA4YjdjZTY5N2EyZjIxMjc1
MmEzNWMxYWM0MTQ0NzFkYzE2YzQyNGM5NTczYmU0OTI2YjU2ZmYzZjVkMjNiN2FmICBydWFtZWwu
eWFtbC0wLjE3LjIxLnRhci5nego+ICA+ICttZDUgIDI0ZmFjMzU0NGEzYzdiZDdlZWFmNmU0Zjcw
NGEwNTZlICBydWFtZWwueWFtbC0wLjE4LjUudGFyLmd6Cj4gID4gK3NoYTI1NiAgYmE0NTYyOWFi
YjcwMjI5NDkxNDhjZTY1ZGU0YTU5ZTdlZTE2NGQzMGM5NDQ1MDM4OWE2YWZkZDNlYmU0ZTllMCAg
cnVhbWVsLnlhbWwtMC4xOC41LnRhci5nego+Cj4KPiBIbW0sIEkgZ2V0IGEgZGlmZmVyZW50IGhh
c2g6Cj4KPiBydWFtZWwueWFtbC0wLjE4LjUudGFyLmd6OiBPSyAobWQ1OiAyNGZhYzM1NDRhM2M3
YmQ3ZWVhZjZlNGY3MDRhMDU2ZSkKPiBFUlJPUjogd2hpbGUgY2hlY2tpbmcgaGFzaGVzIGZyb20g
cGFja2FnZS9weXRob24tcnVhbWVsLXlhbWwvL3B5dGhvbi1ydWFtZWwteWFtbC5oYXNoCj4gRVJS
T1I6IHJ1YW1lbC55YW1sLTAuMTguNS50YXIuZ3ogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgo+IEVS
Uk9SOiBleHBlY3RlZDogYmE0NTYyOWFiYjcwMjI5NDkxNDhjZTY1ZGU0YTU5ZTdlZTE2NGQzMGM5
NDQ1MDM4OWE2YWZkZDNlYmU0ZTllMAo+IEVSUk9SOiBnb3QgICAgIDogNjE5MTdlM2EzNWE1Njlj
MTEzM2E4Zjc3MmUxMjI2OTYxYmY1YTExOThiZWE3ZTIzZjA2YTA4NDFkZWExYWIwZQo+IEVSUk9S
OiBJbmNvbXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNr
CgpMb29rcyBsaWtlIEkgdHlwbydkIHRoZSBwYWNrYWdlIGhhc2goY29weSBwYXN0ZWQgbGljZW5z
ZSBoYXNoIHRvCnBhY2thZ2UgaGFzaCksIGZpeGVkIGluIHYyOgpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjA1MTYzMDI0LjUwMDU5OS0x
LWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4gQW55IGlkZWFzPwo+Cj4gLS0KPiBCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
