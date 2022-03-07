Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36708C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A4560D57;
	Mon,  7 Mar 2022 22:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pvPjdhzjdqL; Mon,  7 Mar 2022 22:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDEB960B1B;
	Mon,  7 Mar 2022 22:25:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8581BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33BC160B1B
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DlxFvmqnQLS for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:25:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F0C06070A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:25:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y12so8442290edt.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vLvp9bpbN7pHIifEIFB15rKXRWAJee21oNJ4hIH7Guk=;
 b=W0lfG0D4VzSEpg0BUKTRfXXbuGEOTocpKICm4ulrG6yLLISpCHQL9z8yfy4XbiqO/x
 V+J1AhMiSLGhaapOMJbAhTZbYG3/03n4wZcWnNKz4Egga7c8R9Uk1ESuNMpsETycAwUY
 NkbZwzeWw1CB+5yhKMNgvzJGgAPHOC2QALpNNZVPdiYnJnUUCqKYMoPjvQ99ehCtztlN
 nI3TfCpq5YHlIJTg6Gn8dPKy7Ij7hPFBscJtvzxvu7YdPkZxkKIYkzJUBgW4tJ98QbeL
 VYy7rzDq+Ziaoh7LMc/xAM1BX7RlpBaw77c/5jhV+DSPasoYhV/RiBu7hL3SzY1b0CWW
 mOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vLvp9bpbN7pHIifEIFB15rKXRWAJee21oNJ4hIH7Guk=;
 b=KC5o4Fwzk2F7u6WwKTtuuPZKDYGaBkE4jQEUDSro2BpXHJDGLUVBGCh+QcNo7/+pfF
 cTZF+H4O7SkWSh2yElPh33QoIgAde0zfyv8bUZjw8Gbl4C4AsqRSvVYkYG9dtmxlqHN/
 AfsMWrGv9QjCUVkjqJgfB92WUEXqINa77h/tguchz4rBI27YS19MDXjBNmRVIiofLFPK
 zEFPHi82dxO5V47pBVwl3MOdyfYTFUQoq+NYInThUE2VxZwE8n6VwQ62BFxvK+EGJ8/M
 Rjy5iz8DefMwBmxJknRnOtslgGluDJVC5EXaVTDn/l8ZgHGwwb9LCDHm3fUSJ8ZkpUO/
 XNKA==
X-Gm-Message-State: AOAM531RNHqUJDQXNmAHi0VJfGqhdDzZJb0f5nIers+b1YXmfMsjWP/A
 jSN+B8bfNMsRuh/gfe+9EWtblg==
X-Google-Smtp-Source: ABdhPJz1kHg81wXD/M1kodZNHNrrKEGRvZjMazKNvacU3D5CMgMHY5lZllTLFBNKZelC6SWj968JQw==
X-Received: by 2002:a05:6402:3691:b0:415:ce4f:ac5a with SMTP id
 ej17-20020a056402369100b00415ce4fac5amr13007209edb.231.1646691940027; 
 Mon, 07 Mar 2022 14:25:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 me17-20020a170906aed100b006db0dcf6746sm2252812ejb.216.2022.03.07.14.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:25:39 -0800 (PST)
Message-ID: <9622b23e-22d8-c3c2-7255-d49feb46f552@mind.be>
Date: Mon, 7 Mar 2022 23:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220223202648.3398307-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223202648.3398307-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/ghostscript: disable tesseract without threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAyLzIwMjIgMjE6MjYsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gZ2hvc3RzY3Jp
cHQgZW1iZWRzIGEgbG9jYWwgY29weSBvZiB0ZXNzZXJhY3Qtb2NyIHdoaWNoIGlzIGVuYWJsZWQg
YnkKPiBkZWZhdWx0IHNpbmNlIHZlcnNpb24gOS41My4wIGFuZAo+IGh0dHBzOi8vZ2l0Lmdob3N0
c2NyaXB0LmNvbS8/cD1naG9zdHBkbC5naXQ7YT1jb21taXQ7aD03MzIyZWY4NzU0NmM1NWIyOTA1
NmMxZDk2ZDhiZGJiN2YzYmE1M2VmCj4KPiBTaW5jZSB2ZXJzaW9uIDkuNTUuMCBhbmQKPiBodHRw
czovL2dpdC5naG9zdHNjcmlwdC5jb20vP3A9Z2hvc3RwZGwuZ2l0O2E9Y29tbWl0O2g9NTQ1OWY3
YWNhMWRlZDNiN2NmOTZjMzM5YTI0MTlmNDE4YWE0MDZjNywKPiBnaG9zdHNjcmlwdCBleHBlY3Rz
IHRoYXQgdGVzc2VyYWN0IGlzIGRpc2FibGVkIGlmIHRocmVhZHMgYXJlIG5vdAo+IGF2YWlsYWJs
ZSByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHNpbmNlIGNvbW1pdAo+
IDdhNDk0NDU2OWNlODNiMGI3YjBjYWJkNmU4YWExODRiOGNiNzJhMjI6Cj4KPiBjb25maWd1cmU6
IGVycm9yOiBUaHJlYWRpbmcgZGlzYWJsZWQgb3Igbm90IGF2YWlsYWJsZS4gVGVzc2VyYWN0IE9D
UiByZWxpZXMgb24gdGhyZWFkaW5nLiBSZXJ1biBjb25maWd1cmUgd2l0aCAiLS13aXRob3V0LXRl
c3NlcmFjdCIgdG8gZXhjbHVkZSBPQ1IgZnJvbSB0aGUgYnVpbGQKPgo+IFNvIGRpc2FibGUgdGVz
c2VyYWN0IGlmIHRocmVhZHMgYXJlIG5vdCBhdmFpbGFibGUuIEl0IHNob3VsZCBiZSBub3RlZAo+
IHRoYXQgdGhlcmUgaXMgbm8gd2F5IHRvIHRlbGwgZ2hvc3RzY3JpcHQgdG8gdXNlIGEgc3lzdGVt
IHByb3ZpZGVkCj4gdGVzc2VyYWN0LW9jciBwYWNrYWdlLgo+Cj4gRml4ZXM6Cj4gICAtIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2ZkMzVhNDdiMmE3N2NmNTdjMjQzZWMx
Yzg4ODAyYjUzZGRjYThmNTIKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKIMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
CiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiBDaGFuZ2VzIHYyIC0+IHYzIChhZnRlciBy
ZXZpZXcgb2YgQXJub3V0IFZhbmRlY2FwcGVsbGUpOgo+ICAgLSBPbmx5IGRpc2FibGUgdGVzc2Vy
YWN0IHdpdGhvdXQgdGhyZWFkcwo+Cj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gVW5jb25kaXRp
b25hbGx5IGRpc2FibGUgdGVzc2VyYWN0Cj4KPiAgIHBhY2thZ2UvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHQubWsgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0Lm1rIGIvcGFja2Fn
ZS9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC5tawo+IGluZGV4IDI0YTBjNDg5YTguLjAyY2IzNWZj
ZmMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC5tawo+ICsr
KyBiL3BhY2thZ2UvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQubWsKPiBAQCAtODMsNCArODMsOCBA
QCBlbHNlCj4gICBHSE9TVFNDUklQVF9DT05GX09QVFMgKz0gLS13aXRob3V0LXgKPiAgIGVuZGlm
Cj4gICAKPiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTKSwpCj4gK0dIT1NUU0NS
SVBUX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtdGVzc2VyYWN0Cj4gK2VuZGlmCj4gKwo+ICAgJChl
dmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
