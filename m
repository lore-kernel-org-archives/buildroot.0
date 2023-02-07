Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A580C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB73081852;
	Tue,  7 Feb 2023 16:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB73081852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NoCTW2HekqU; Tue,  7 Feb 2023 16:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115FB813B2;
	Tue,  7 Feb 2023 16:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 115FB813B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6782B1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F60340168
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F60340168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOoKltwfbcOk for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD93B40120
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD93B40120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:26:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bk16so14095690wrb.11
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 08:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jhtzECDgxt4w175HNF7BUyOWOY7sgd92HW8BAw+LRY=;
 b=QZPxSYKQG6YtgWL1N1OVDgRbqYkY9Dq8iQlR889I7vHjIUDUNiBr5NXSElbkzqfDPH
 5ZrfCu62XUwDpetHZOXJc8cQaw1JkwXatjUjgxloK0t7Z8hg+jJ9WO8j1ATev5R838j+
 FK+aZBxQ1blP94B+quObXIZ2Uh0s94lXqQXHCEL7t6xwpjLHjIBpiZjSXt5hEencmKUK
 7LFHQBevprBKQ1zW5WKtbtM1ZHo4b7DRy+YHz34aKyzJCR+sJFMBHB8fKQ0gl8ruQStp
 7iM5dUa4u+bkCkLVBSEzJUwAB7eJvmNHMOLZwlWdaqMNjvOSk7IqyLVA2tIjY6bk+qcx
 /JCw==
X-Gm-Message-State: AO0yUKXB0ErYPa2bKoYElAplDj2mV2iaX4GNDGKHDz2SiSNe6ZEMAAa6
 VJsaXsoTw3Gy/q4etS9blPL6iw==
X-Google-Smtp-Source: AK7set/qqtwFElnUwnoUf9qqgBH3e0VymEBMQfmHrJNIvq6YHXdTIcRvCtbXS6NuUg8OpTCmyK1hww==
X-Received: by 2002:a5d:46d1:0:b0:2c3:f6d0:7012 with SMTP id
 g17-20020a5d46d1000000b002c3f6d07012mr2558810wrs.18.1675787166914; 
 Tue, 07 Feb 2023 08:26:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm11478710wrs.40.2023.02.07.08.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:26:06 -0800 (PST)
Message-ID: <e4b244f1-6f5c-7fac-7469-6a4f86b0dfdc@smile.fr>
Date: Tue, 7 Feb 2023 17:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: AndreiCherniaev <cherniaev.andrei@kairo.space>, buildroot@buildroot.org
References: <20230122123645.2903470-1-cherniaev.andrei@kairo.space>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230122123645.2903470-1-cherniaev.andrei@kairo.space>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jhtzECDgxt4w175HNF7BUyOWOY7sgd92HW8BAw+LRY=;
 b=NnjLf3Kw4HyL7fd3ruZ6HjJ8oTkN9Oy44b4PVcNaoUCrlcgcIXUN/4hgbdAyoouahE
 LzOTN93Ov4FQZYg6NYzVonzJUmyM/ibimLuIYY2AeAayYsKHu0k9y/VOQIkR0NFD1MQL
 6hvlWdlAXqoZWj+0PTEAZHgjGA40M/Nu96oFOpBverLeGk8g2F+jC022yZElz3wOITPD
 qcLfzEF4FaiWvgxPF5pfCWLrxV6M77Ml42YsU16k9bppgHyfBqB/LqreHxssnx5ETMg5
 3Gd3ufSTPjijrPjD42a6MjldlVbNys9sVUYkipUtZo858IEwMnTOgvcy1hlFreZ5qdxy
 abVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NnjLf3Kw
Subject: Re: [Buildroot] [PATCH] board/qemu: add echo for errors
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
Cc: AndreiCherniaev <glscene2010@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVpLAoKTGUgMjIvMDEvMjAyMyDDoCAxMzozNiwgQW5kcmVpQ2hlcm5pYWV2IGEg
w6ljcml0wqA6Cj4gRnJvbTogQW5kcmVpQ2hlcm5pYWV2IDxnbHNjZW5lMjAxMEBnbWFpbC5jb20+
Cj4gCgpZb3VyIFNpZ25lZC1vZmYtYnkgaXMgbWlzc2luZywgc28gd2UgY2FuJ3QgYXBwbHkgdGhl
IHBhdGNoIGFzIGlzIFsxXS4KCkknbSBtYWtpbmcgaXQgYXMgIkNoYW5nZXMgcmVxdWVzdGVkIi4K
Ck1heWJlIGEgc21hbGwgY29tbWVudCBleHBsYWluaW5nIHdoeSB5b3Ugd2FudCB0byBjaGFuZ2Ug
dGhlIHNjcmlwdCB3b3VsZCBiZSBncmVhdC4KClsxXSBodHRwczovL25pZ2h0bHkuYnVpbGRyb290
Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKCj4gLS0tCj4gIGJvYXJkL3FlbXUv
cG9zdC1pbWFnZS5zaCB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9wb3N0LWlt
YWdlLnNoIGIvYm9hcmQvcWVtdS9wb3N0LWltYWdlLnNoCj4gaW5kZXggODhmMDQxMzQ5Ni4uOTFk
NWI4OGIwMyAxMDA3NTUKPiAtLS0gYS9ib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2gKPiArKysgYi9i
b2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2gKPiBAQCAtNiw4ICs2LDggQEAgUkVBRE1FX0ZJTEVTPSIk
e1FFTVVfQk9BUkRfRElSfS8qL3JlYWRtZS50eHQiCj4gIFNUQVJUX1FFTVVfU0NSSVBUPSIke0JJ
TkFSSUVTX0RJUn0vc3RhcnQtcWVtdS5zaCIKPiAgCj4gIGlmIFtbICIke0RFRkNPTkZJR19OQU1F
fSIgPX4gXiJxZW11XyoiIF1dOyB0aGVuCj4gLSAgICAjIE5vdCBhIFFlbXUgZGVmY29uZmlnLCBj
YW4ndCB0ZXN0Lgo+IC0gICAgZXhpdCAwCj4gKyAgICBlY2hvICJOb3QgYSBRZW11IGRlZmNvbmZp
ZywgY2FuJ3QgdGVzdCIKPiArICAgIGV4aXQgMQoKSW5pdGlhbGx5IGV4aXQgMCB3YXMgaW50ZW5k
ZWQgdG8gbm90IGZhaWwgdGhlIGJ1aWxkIGZvciBub24gcWVtdSBkZWZjb25maWcgaW4KZ2l0bGFi
LWNpLiBCdXQgYm9hcmQvcWVtdS9wb3N0LWltYWdlLnNoIGluIG9ubHkgdXNlZCBieSBxZW11IGRl
ZmNvbmZpZyBzbyBldmVuCnRoZSB0ZXN0IGRvZXNuJ3Qgc2VlbXMgbm90IHJlcXVpcmVkIGFueW1v
cmUuCgo+ICBmaQo+ICAKPiAgIyBTZWFyY2ggZm9yICIjIHFlbXVfKl9kZWZjb25maWciIHRhZyBp
biBhbGwgcmVhZG1lLnR4dCBmaWxlcy4KPiBAQCAtMTUsOCArMTUsOCBAQCBmaQo+ICBRRU1VX0NN
RF9MSU5FPSQoc2VkIC1yICc6YTsgL1xcJC9OOyBzL1xcXG4vLzsgcy9cdC8gLzsgdGE7IC8jICck
e0RFRkNPTkZJR19OQU1FfSckLyFkOyBzLyMuKi8vJyAke1JFQURNRV9GSUxFU30pCj4gIAo+ICBp
ZiBbIC16ICIke1FFTVVfQ01EX0xJTkV9IiBdOyB0aGVuCj4gLSAgICAjIE5vIFFlbXUgY21kIGxp
bmUgZm91bmQsIGNhbid0IHRlc3QuCj4gLSAgICBleGl0IDAKPiArICAgIGVjaG8gIk5vIFFlbXUg
Y21kIGxpbmUgZm91bmQsIGNhbid0IHRlc3QiCj4gKyAgICBleGl0IDEKPiAgZmkKCklJUkMsIHNv
bWUgcWVtdSBkZWZjb25maWcgd2FzIG5vdCBnaXRsYWItcmVhZHkgc28gZXhpdCAwIHdhcyBoZXJl
IHRvIG5vdCBmYWlsCnRoZSBnaXRsYWItY2kgam9iIGlmIG5vIHFlbXUgY29tbWFuZCBsaW5lIHdh
cyBwcm92aWRlZC4gT25seSBhIGJ1aWxkIHRlc3QgaXMKZG9uZSBpbiB0aGlzIGNhc2UuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gIAo+ICAjIFJlbW92ZSBvdXRwdXQvaW1hZ2VzIHBhdGggc2lu
Y2UgdGhlIHNjcmlwdCB3aWxsIGJlIGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
