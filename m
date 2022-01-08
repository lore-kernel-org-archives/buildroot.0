Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECADC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B7C60A9E;
	Sat,  8 Jan 2022 10:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8E9KPRfj97MC; Sat,  8 Jan 2022 10:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B1A60A73;
	Sat,  8 Jan 2022 10:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A965D1BF306
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A515F813F2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpKjYaf32tFu for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCC62813BA
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:56:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so16085823wra.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 02:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z+K2m+R6eOvogVJ7XZUY3x0sKusGnkzktNWmWEi4VeY=;
 b=zaGIjjSULdL7hyPKoYLMkFT14iIqV3xVCIS83TZnjHBLFgnx1IPWIyBqu3PzxHehTD
 DfLVZ11CpUGuGkJbAU8T4/Mrg+2ysMB3bOQZ6pUGs5HbtXd/oqd/05ph0nCLUTKtqCI4
 b4PgxbQTQHkbVV3HemKDo/qozP+yq6xVKSliTUk6DEP1vnPKbAgAOuqTZCi2EAOsoBGf
 kAOR5FX236HsH58d0YdEBEvQ1PpOf3BFu+eouOq3j72zUUAfTYbAT8Q1O3TaArXIbZYS
 REfTgO2pLe1bvXI1ifVZlynCaGNeQLQ9V+ve2mgHhgeSUyQyNWt48CSRj4SBDZUANisV
 5kIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z+K2m+R6eOvogVJ7XZUY3x0sKusGnkzktNWmWEi4VeY=;
 b=ov+S66kEH1UmXMwWs4dm/dIg/G/0gtEEj6gK/TtJPoSN26st6BwwUHuwlt0425ipyW
 sftPOhfP2ukUeYy4Omt3HFH1/ap4ZGKRxBTM7beL2cqNzlABThTfaTLSA6EW2j0tNdGT
 6EJ7lxFizDp+/TjeGJ0Eu4lEUCQuwQYEElfRcZWvounMMIWyTkTy2mXNWNGhEWj38NLY
 fIFYksqEiIhfNMxUFtrv/n2A9LQKa3RKZv5j63BIks3rJhu71Kqs2X5jbL7apJJIsP4+
 LIkz8c2cfVgz/3ntdKfHfhti9u/Q8Euc9vmDZzsOxvcx3JFOML9oTrQdSObM2rpLzUoj
 crWA==
X-Gm-Message-State: AOAM531rrcwp9YdL4MPS5KXe+cCmJO+WRIYRIkbjEE/2EvuZcf35HIgS
 XHq+eqfkXJu0XD4H3laiinrb3g==
X-Google-Smtp-Source: ABdhPJyCBFKPrYX4e1j968htT6XKCANn6vFIX5UeOh8zkjIX4gd72kzd7WeKfnl0jluHZplVy2xqBg==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr56555771wrx.266.1641639415160; 
 Sat, 08 Jan 2022 02:56:55 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id f6sm1342333wri.115.2022.01.08.02.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 02:56:54 -0800 (PST)
Message-ID: <90d1cd65-6cb7-d708-9b57-2089c5485d63@smile.fr>
Date: Sat, 8 Jan 2022 11:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
References: <20200915103806.13785-1-jugurtha.belkalem@smile.fr>
 <20200915165156.179380a9@windsurf.hq.k.grp>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20200915165156.179380a9@windsurf.hq.k.grp>
Subject: Re: [Buildroot] [PATH v2 1/1] docs/manual: add qemu defconfigs
 gitlab test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTUvMDkvMjAyMCDDoCAxNjo1MSwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IE9uIFR1ZSwgMTUgU2VwIDIwMjAgMTI6Mzg6MDYgKzAyMDAKPiBKdWd1cnRo
YSBCRUxLQUxFTSA8anVndXJ0aGEuYmVsa2FsZW1Ac21pbGUuZnI+IHdyb3RlOgo+IAo+PiArPT09
IEFkZGluZyBxZW11IGRlZmNvbmZpZyBnaXRsYWIgdGVzdAo+PiArCj4+ICtCdWlsZHJvb3QgcHJv
dmlkZXMgYSB0ZXN0IHNjcmlwdCAoc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weSkK
Pj4gK3RvIHZhbGlkYXRlIGFsbCBkZWZjb25maWdzIHVuZGVyICtib2FyZC9xZW11Ly4gRXZlcnkg
c3VwcG9ydGVkIHFlbXUKPj4gK2FyY2hpdGVjdHVyZSBzaG91bGQgYXBwZW5kIHRoZSBjb21tZW50
IDogIyBxZW11X0FSQ0hfZGVmY29uZmlnCj4+ICthdCB0aGUgZW5kIG9mIGl0cyBjb21tYW5kIGxp
bmUgZW50cnkgaW4gYm9hcmQvcWVtdS9BUkNIL3JlYWRtZS50eHQgKGZvcgo+PiArZXhhbXBsZSBh
YXJjaDY0LXZpcnQgaW5jbHVkZXMgOiAjIHFlbXVfYWFyY2g2NF92aXJ0X2RlZmNvbmZpZykuCj4+
ICtPbmNlIGEgd2VlaywgZXZlcnkgZGVmY29uZmlnIGlzIHRlc3RlZCB1bmRlciBnaXRsYWIncyBw
aXBlbGluZXMgOgo+PiArKiBMYXVuY2hlcyBhIHFlbXUgaW5zdGFuY2UuCj4+ICsqIEVudGVycyBy
b290IGNyZWRlbnRpYWxzIGFuZCBjaGVja3MgaWYgbG9naW4gc2hlbGwgaXMgYXZhaWxhYmxlLgo+
PiArKiBQb3dlcnMgb2ZmIHRoZSBpbnN0YW5jZS4KPj4gK1RoZSBqb2IgZmFpbHMgaWYgb25lIG9m
IGFib3ZlIHN0ZXBzIHJldHVybnMgdW5zdWNjZXNzZnVsIHN0YXR1cyBjb2RlLgo+PiArdG8gdHJp
Z2dlciBxZW11IGRlZmNvbmZpZ3MgdGVzdCBqb2JzOgo+PiArCj4+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gKyAkIGdpdCBwdXNoIGdpdGxhYiBIRUFEOjxuYW1lPl9kZWZjb25maWcKPj4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFdoaWxlIEkgdW5kZXJzdGFuZCB0aGUgaWRlYSBvZiBk
b2N1bWVudGluZyB0aGlzLCBJIGFtIHdvbmRlcmluZyBpZiB0aGUKPiBCdWlsZHJvb3QgbWFudWFs
IGlzIHJlYWxseSB0aGUgcmlnaHQgcGxhY2UgZm9yIHRoaXMuIEluZGVlZCwgdGhpcyBiaXQKPiBv
ZiBkb2N1bWVudGF0aW9uIGlzIHJlYWxseSBvbmx5IHVzZWZ1bCBmb3IgdGhlIHZlcnkgc3BlY2lm
aWMvbmFycm93IHVzZQo+IGNhc2Ugb2YgcWVtdSBkZWZjb25maWdzLgo+IAo+IFNob3VsZCB0aGlz
IGJlIGluIGJvYXJkL3FlbXUvcmVhZG1lLnR4dCA/IEknbSBub3Qgc3VyZS4KCk1heWJlIHRoZSBt
YW51YWwgbmVlZHMgYSBuZXcgY2hhcHRlciBhYm91dCB0aGUgZ2l0bGFiLWNpIGluIGdlbmVyYWwg
YW5kIGRvY3VtZW50CmFsbCBwaXBlbGluZSB0cmlnZ2VyIHN1cHBvcnRlZC4KCkZvciBhIG5ldyBx
ZW11IGRlZmNvbmZpZ3MsIHdlIG5lZWQgdG8gdGFrZSBjYXJlIG9mOgoKLSBkZWZpbmUgIiMgcWVt
dV9BUkNIX2RlZmNvbmZpZyIgdGFnIGluIHRoZSBmaWxlIGJvYXJkL3FlbXUvQVJDSC9yZWFkbWUu
dHh0CgotIFVzZSBib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2ggcG9zdCBpbWFnZSBzY3JpcHQgYW5k
IHByb3ZpZGUgdGhlIG5hbWUgb2YgdGhlCmRlZmNvbmZpZyBhcyBhcmd1bWVudCBvZiB0aGlzIHNj
cmlwdDoKICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1h
Z2Uuc2giCiAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIkKEJSMl9ERUZDT05GSUcpIgoK
LSBFbmFibGUgaG9zdC1xZW11IHRvIHVzZSBxZW11IGJ1aWx0IGJ5IEJ1aWxkcm9vdCBmb3IgdGhl
IGhvc3Q6CiAgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKICBCUjJfUEFDS0FHRV9IT1NUX1FFTVVf
U1lTVEVNX01PREU9eQoKQmVpbmcgaW4gdGhlIG1hbnVhbCB3b3VsZCBwcm9tb3RlIGdpdGxhYi1j
aSB0ZXN0aW5nIHdpdGggUWVtdS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaG9tYXMK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
