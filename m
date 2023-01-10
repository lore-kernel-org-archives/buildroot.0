Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD57C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DCAB60FBD;
	Tue, 10 Jan 2023 12:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DCAB60FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnnHUzoDxu0X; Tue, 10 Jan 2023 12:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E4D60FB7;
	Tue, 10 Jan 2023 12:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E4D60FB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF7F41BF86B
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB08781388
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB08781388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjZ6YvCAhxcu for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:49:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2427D81349
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2427D81349
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:49:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso6362504wmb.3
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pj1pxyvLjDeVhQ+DLz11ydOhZbuN85H+OdlsBqaiqJ4=;
 b=qT5Mm4EagDpzXRJaXj+6hvRksdCKuGe5x8achkrQ/yEJlZ9zaT9Emo75SLhullgGHu
 XwTB9728oUnrfeF4yVCvjPJomnCYpFbgV1HQGYo//bGq6uOUSlW67UT2N2htPkgxvSWP
 1NB1YQa81f9UT+jC4E6uQyVwxnZ+13NFXVWlI4ywzUzoD3Gi+YA1nJ37+MneWIF80tvP
 abiGiWVSnVcsP6T3tl14Gzw5+ae3TOPgFF/wvac5svOtW4m/A6YuYpfSonYxhUwi8RuT
 IPmH5o2tI3c7jnkPdV8ryZ69q6WcNqSxHI9CN1Tp9rWM0XPX7S6+Ge3BaDZihLcE+W0H
 czKg==
X-Gm-Message-State: AFqh2kouY0IMPKeyO/gt4JkV7A6DUZsz7tRMN3Qru+5k6dw0drmlyk7c
 IO2z3u5tOgOvUfiYph4TM8Yt5w==
X-Google-Smtp-Source: AMrXdXvqIEucd6qZQkYaNWna/Z+9lpV5IYvNpKlQoyaRMaq/XoojgghdK2aTvkQB8014niMviit3ww==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id
 bh17-20020a05600c3d1100b003cf8b2276b3mr49700644wmb.0.1673354942316; 
 Tue, 10 Jan 2023 04:49:02 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm20663770wmo.24.2023.01.10.04.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 04:49:01 -0800 (PST)
Message-ID: <b70a1950-f42a-2a2a-6bc1-c2afb200375b@smile.fr>
Date: Tue, 10 Jan 2023 13:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20230109163017.1260911-1-yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230109163017.1260911-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pj1pxyvLjDeVhQ+DLz11ydOhZbuN85H+OdlsBqaiqJ4=;
 b=6gSAFOf2zBLA3MCW5sAvGjFINooEatNfLc/6MNSpQMmeOYAHdevGzfQy4BIh5kOZb/
 2XjT9bIObj402/zERU3VwTZqLceBR5hx3MmyWX4TJDA2PVbXFkTZbxAPf04jNewUiXm3
 i5al9U+AuPgGLzPTzNxuSIpwCjiF/U56T0XgjNcR8wdySjIRqVuaZKUxS4DKxz3h7gfg
 tb2KFa0zEFhpnWUg7vm0di7xTt8PxOxemAI/HJVEtwSrc6KHRpVbnjS/itJBjGFbNa3G
 2gqnkCxmswt0gC/oesjp5Wh08udhxeoweN0S9poswVd1d1wPZYv4uXl6Cex+CqSKbfdc
 Pacw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6gSAFOf2
Subject: Re: [Buildroot] [PATCH] support/download: fix cargo vendoring
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Richter <simon.richter@ptwdosimetry.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDkvMDEvMjAyMyDDoCAxNzozMCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IENvbW1pdCBkZTRjZjI1Mzc1MmQgKHBhY2thZ2Uve3J1c3QsIHJ1c3QtYmlu
fTogYnVtcCB0byB2ZXJzaW9uIDEuNjYuMCkKPiBmb3Jnb3QsIGRlc3BpdGUgdGhlIGJpZyBjb21t
ZW50IGFib3ZlIHRoZSB2ZXJzaW9uIHN0cmluZ3MsIHRvIGNvbmZpcm0KPiB0aGF0IHRoZSB2ZW5k
b3Jpbmcgd2FzIHN0aWxsIHdvcmtpbmcuCj4gCj4gUHJldmlvdXNseSwgd2Ugd2VyZSBhZGRpbmcg
dGhlIHZlbmRvcmluZyBlcXVpdmFsZW5jZSBtYW51YWxseSwgYnV0IGluCj4gY29tbWl0IDA0MTU0
YTY1MTcyOSAoc3VwcG9ydC9kb3dubG9hZC9jYXJnby1wb3N0LXByb2Nlc3M6IGNhcmdvIG91dHB1
dAo+IGZvciB2ZW5kb3IgY29uZmlnKSwgd2Ugc3dpdGNoZWQgdG8gdXNpbmcgdGhlIG91dHB1dCBv
ZiAidmFyZ28gdmVuZG9yIgoKdmFyZ28vY2FyZ28KCj4gKG9uIHN0ZG91dCkgdG8gc3VwcG9ydCBj
YXhzZXMgd2VyZSB0aGUgdmVuZG9yaW5nIGVxdWl2YWxlbmNlIHdvdWxkIGJlCgpjYXhzZXMvY2Fz
ZXMKCj4gbW9yZSBjb21wbGV4IChlLmcuIHdoZW4gdXNpbmcgY3JhdGVzIG5vdCBob3N0ZWQgb24g
Y3JhdGVzLmlvKS4KPiAKPiBXaXRoIHJ1c3QgdW50aWwgYW5kIGluY2x1ZGluZyAxLjY1LjAsICJj
YXJnbyB2ZW5kb3IiIHdvdWxkIG91dHB1dCAoZm9yCj4gY3JhdGVzLmlvIGNyYXRlcykgdGhlIHNh
bWUgb3V0cHV0IGFzIG91ciBtYW51YWwgZml4dXBzLCBleGNlcHQgaXQgd2FzCj4gcHJlY2VkZWQg
YnkgYW4gZW1wdHkgbGluZS4gU28sIHRvIGF2b2lkIHJlY29tcHRpbmcgYWxsIG91ciBoYXNoZXMs
IHdlCj4gYWRkZWQgYSB0d2VhayB0byBzdHJpcCBhd2F5IHRoZSBsZWFkaW5nIGVtcHR5IGxpbmUg
aW4gMDQxNTRhNjUxNzI5Lgo+IAo+IEJ1dCBydXN0IDEuNjYuMCBpbmNsdWRlcyBbMF0gd2hpY2gg
Y2hhbmdlcyB0aGUgb3V0cHV0IChvbiBzdGRvdXQpIG9mCj4gImNhcmdvIHZlbmRvciIsIHdoZXJl
IHRoZSBmaXJzdCBlbXB0eSBsaW5lIGlzIG5vIGxvbmdlciBlbWl0dGVkLgo+IAo+IFRoaXMgbWVh
bnMgdGhhdCBvdXIgdHdlYWsgZm9yIHJ1c3QgMS42NS4wIG5vdyBzdHJpcHMgb3V0IGFuIGltcG9y
dGFudAo+IHBhcnQgb2YgdGhlIGNhcmdvIHZlbmRvciBvdXRwdXQsIHdoaWNoIHJlbmRlcnMgdGhl
IGFyY2hpdmVzIGludmFsaWQsIGFuZAo+IHRodXMgZ2VuZXJhdGVzIGRpZmZlcmVudCBhcmNoaXZl
cywgd2hpY2ggZmFpbCB0byB2YWxpZGF0ZSBhZ2FpbnN0IG91cgo+IGhhc2hlcy4KPiAKPiBGaXgg
dGhpcyBieSBkb2luZyB3aGF0IHRoZSBjb21tZW50IGluIHRoZSBwb3N0LXByb2Nlc3MgaGVscGVy
IHN0YXRlcywKPiBhbmQganVzdCBrZWVwIHRoZSB3aG9sZSBvdXRwdXQgb2YgImNhcmdvIHZlbmRv
ciIsIGJ5dCBqdXN0IHJlbW92aW5nIHRoZQoKYnl0L2J5Cgo+ICJ0YWlsIC0tbGluZXM9KzIiLiBT
aW5jZSB0aGF0IGNvbW1lbnQgaXMgbm8gbG9uZ2VyIG1lYW5pbmdmdWwsIHdlIGRyb3AKPiBpdCB0
b28uCj4gCj4gTm93LCBhbGwgb3VyIDYgY2FyZ28tYmFzZWQgcGFja2FnZXMgY2FuIGJlIHZlbmRv
cmVkIGFnYWluLCB3aXRob3V0Cj4gY2hhbmdpbmcgb3VyIGhhc2hlcywgYnV0IG1vc3QgaW1wb3J0
YW50bHksIHdpdGggdmFsaWQgYXJjaGl2ZXMuCj4gCj4gU3RpbGwsIHdlIGtlZXAgdGhlIGNvbW1l
bnQgYWJvdmUgdGhlIHZlcnNpb25zIHN0cmluZ3MsIGluIHRoZSBob3BlIHRoYXQKPiBhIGZ1dHVy
ZSBidW1wZXIgd2lsbCBub3RpY2UgYW5kIGJlIG1vcmUgY2FyZWZ1bCBhdCB2YWxpZGF0aW5nIHRo
ZQo+IHZlbmRvcmluZy4KPiAKPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jYXJn
by9wdWxsLzExMjczCgpXZSBoYXZlIHNvbWUgcnVudGltZSB0ZXN0IGZvciBnaXRsYWIvZ2l0aHVi
IGRvd25sb2FkIHdyYXBwZXIsIGRvIHdlIHdhbnQgYSB0ZXN0CmZvciBjYXJnbyB2ZW5kb3IgdG9v
PwoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgpUZXN0
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRz
LApSb21haW4KCj4gCj4gRml4ZXM6Cj4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzL2JlYS9iZWFjNzY3NGJiYzlmZDJmODc3N2I1ODYxZjY1YWZlZTljNDg1NzUzLyAg
KGJhdCkKPiAgICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDFlL2Qx
ZWMxZWJiZGUxMTU2MjhhNGI4YjkwOTk1NDQzNDcyNDJhOTdjMWMvICAoZHVzdCkKPiAgICAgaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZjk2L2Y5NjhiZTg5NWJlOWNhOThi
MzE0ZmRkNjg4ZWY4ZDNiZGY0ZTVkZmIvICAoaHllcmZpbmUpCj4gICAgIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2EwYy9hMGNkYjZjYzk0OTNmNTI0OGQ5OGY5OGIxM2Rh
ODU0ZTEyYWRjMmJlLyAgKHJpcGdyZXApCj4gICAgIC4uLiBhbmQgc28gbWFueSBvdGhlcnMuLi4K
PiAKPiBSZXBvcnRlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+
IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiBDYzogU2lt
b24gUmljaHRlciA8c2ltb24ucmljaHRlckBwdHdkb3NpbWV0cnkuY29tPgo+IC0tLQo+ICBzdXBw
b3J0L2Rvd25sb2FkL2NhcmdvLXBvc3QtcHJvY2VzcyB8IDE2ICstLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvc3VwcG9ydC9kb3dubG9hZC9jYXJnby1wb3N0LXByb2Nlc3MgYi9zdXBwb3J0L2Rv
d25sb2FkL2NhcmdvLXBvc3QtcHJvY2Vzcwo+IGluZGV4IDE4NmU5ZWI2OWIuLjIxYTZiZThkYmUg
MTAwNzU1Cj4gLS0tIGEvc3VwcG9ydC9kb3dubG9hZC9jYXJnby1wb3N0LXByb2Nlc3MKPiArKysg
Yi9zdXBwb3J0L2Rvd25sb2FkL2NhcmdvLXBvc3QtcHJvY2Vzcwo+IEBAIC0yNSwyNSArMjUsMTEg
QEAgcG9zdF9wcm9jZXNzX3VucGFjayAiJHtiYXNlX25hbWV9IiAiJHtvdXRwdXR9Igo+ICBwdXNo
ZCAiJHtiYXNlX25hbWV9IiA+IC9kZXYvbnVsbAo+ICAKPiAgIyBDcmVhdGUgdGhlIGxvY2FsIC5j
YXJnby9jb25maWcgd2l0aCB2ZW5kb3IgaW5mbwo+IC0jCj4gLSMgVGhlIGZpcnN0IGxpbmUgb2Yg
dGhlIG91dHB1dCB0byBzdGRvdXQgaXMgZW1wdHkuCj4gLSMgU28gc2tpcCBpdCB0byBoYXZlIHRo
ZSBmaWxlIHN0YXJ0IHdpdGggdGhlIHZlbmRvcmluZwo+IC0jIGNvbmZpZ3VyYXRpb24gKGB0YWls
IC0tbGluZXM9KzJgKS4KPiAtIwo+IC0jIE5PVEU6Cj4gLSMgICBUaGVyZSBpcyAgYSBwYXRjaCBm
b3IgY2FyZ28gdG8gcmVtb3ZlIHRoZSBmaXJzdCBlbXB0eSBsaW5lOgo+IC0jICAgU2VlOiBodHRw
czovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2NhcmdvL3B1bGwvMTEyNzMKPiAtIwo+IC0jICAgVGhl
IHBhdGNoIGFscmVhZHkgbGFuZGVkIGluICtuaWdodGx5IGFuZCB3aWxsIGVuZCB1cAo+IC0jICAg
aW4gK3N0YWJsZSBzb29uLgo+IC0jCj4gLSMgLT4gIFdoZW4gdXBkYXRpbmcgcnVzdC9jYXJnbywg
dGhlIGNhbGwgdG8gYHRhaWxgIG11c3QgYmUgcmVtb3ZlZC4KPiAtIwo+ICBta2RpciAtcCAuY2Fy
Z28vCj4gIGNhcmdvIHZlbmRvciBcCj4gICAgICAtLW1hbmlmZXN0LXBhdGggJHtCUl9DQVJHT19N
QU5JRkVTVF9QQVRILUNhcmdvLnRvbWx9IFwKPiAgICAgIC0tbG9ja2VkIFZFTkRPUiBcCj4gLSAg
ICB8IHRhaWwgLS1saW5lcz0rMiB8IHRlZSAuY2FyZ28vY29uZmlnCj4gKyAgICB8IHRlZSAuY2Fy
Z28vY29uZmlnCj4gIAo+ICBwb3BkID4gL2Rldi9udWxsCj4gIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
