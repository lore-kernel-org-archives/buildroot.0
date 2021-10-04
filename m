Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A7DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:46:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D429061501
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D429061501
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B3B7606EF;
	Mon,  4 Oct 2021 20:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dP7BtH7GI6R6; Mon,  4 Oct 2021 20:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F161D60668;
	Mon,  4 Oct 2021 20:46:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8C2B1BF97D
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E535560668
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsauEzjMt8mv for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:46:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BE836060D
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:46:12 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:a0fc:72f4:49cf:858e] (unknown
 [IPv6:2a01:e0a:947:6e20:a0fc:72f4:49cf:858e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C7C5CC01C7
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 22:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1633380369;
 bh=H0PSlAfUP20JiSf1RyvsrDp6vzl7kMapBdZ6X+Yi60U=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=euYz+ZKNtYYiZz0LlmQC+GVFIx5c0r5gsBK3Z0toyN7r2c3bb8MGHxT6lEx4rqgWP
 1RVPsDfPOMqIpqHfD5ZKwj9scaqpsAnbPYibmljeJsKvLzdJxKs6DvQt+gwVlDFPuy
 PmnY8WXZHkvsXGSDUjhETr50lj+IavFGEseeU7L+pmZYOLbU27Fr2wmDHTT4YOVxaI
 UFosqxrrbQtFMJRcv1KGdpwpqNTR0ybzYSjIXp3DLaDD0CYOiOvKFC1js3h74zhm0S
 28MqTrRwLEx3w3bOrd4ONilox1LQ/TIUKSuYCk8Vp35Wf0PU3jw1PYa3E6C9YauGno
 zFpN0WYMq1JXw==
To: buildroot@buildroot.org
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
 <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
 <878rz9j97a.fsf@dell.be.48ers.dk>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <d39a8eba-8e49-a9a2-6ec3-62c6969a0af9@grenoble.cnrs.fr>
Date: Mon, 4 Oct 2021 22:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <878rz9j97a.fsf@dell.be.48ers.dk>
Content-Language: en-US
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpBcyBJIHN1Z2dlc3RlZCB0aGF0IHRoZSB3cmFwcGluZyBjb3VsZCBiZSBwcmV2ZW50
ZWQgYnkgc2V0dGluZyB0aGUKIkNPTFVNTlMiIGVudmlyb25tZW50IHZhcmlhYmxlIHRvIGEgbGFy
Z2UgdmFsdWUgKGJ1dCBubyBsYXJnZXIgdGhhbgoyOTk5OSksIFBldGVyIEtvcnNnYWFyZCB3cm90
ZToKCj4gMjk5OTkgY2hhcnMgc2hvdWxkIGJlIGVub3VnaCBmb3IgYW55Ym9keSAodG0pIDspCj4K
PiBDYXJlIHRvIHNlbmQgYSBwYXRjaCBmb3IgdGhpcz8KCkkgd291bGQgYmUgaGFwcHkgdG8gZG8g
c28uIEhvd2V2ZXIsIGFzIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhpcyB3aG9sZQp0ZXN0aW5n
IGluZnJhc3RydWN0dXJlLCB0aGUgcGF0Y2ggd291bGQgbmVlZCB0byBiZSB0ZXN0ZWQgYnkgc29t
ZW9uZQplbHNlLgoKUmlnaHQgbm93IEkgYW0gdHJ5aW5nIHRvIGNoZWNrIG15IGh5cG90aGVzaXMg
dGhhdCBzZXR0aW5nIENPTFVNTlM9Mjk5OTkKaXMgZW5vdWdoIHRvIG1ha2UgYXNoIChCdXN5Ym94
J3Mgc2hlbGwpIGJlaGF2ZSBwcm9wZXJseS4gQW5kIEkgZm91bmQgYQpsaXR0bGUgc3VycHJpc2U6
IHRoZSBjb21tYW5kCgogICAgZXhwb3J0IENPTFVNTlM9Mjk5OTkKCmRvZXMgX25vdF8gYWRkIHRo
ZSBDT0xVTU5TIHZhcmlhYmxlIHRvIHRoZSBzaGVsbCdzIGVudmlyb25tZW50LiBUaGUKdmFyaWFi
bGUgaXMgYWRkZWQgdG8gdGhlIGVudmlyb25tZW50IG9mIHRoZSBwcm9jZXNzZXMgc3RhcnRlZCBi
eSB0aGUKc2hlbGwsIGJ1dCBpdCBpcyBub3QgaW4gdGhlIGVudmlyb25tZW50IG9mIHRoZSBzaGVs
bCBpdHNlbGYuIEl0IGRvZXNuJ3QKcHJldmVudCB0aGUgc2hlbGwgZnJvbSB3cmFwcGluZyB0aGUg
Y29tbWFuZHMgYXQgODDCoGNvbHVtbnMuCgpSaWdodCBub3cgdGhlIGZpeCBJIGhhdmUgaW4gbWlu
ZCBpcyB0byBydW4KCiAgICBDT0xVTU5TPTI5OTk5IGV4ZWMgc2gKCmFmdGVyIGxvZ2dpbmcgaW4s
IGF0IHRoZSBlbmQgb2YgdGhlIGxvZ2luKCkgbWV0aG9kLiBJIGp1c3QgY2hlY2tlZCB0aGF0CnJl
bG9hZGluZyBhc2ggaW4gdGhpcyB3YXkgZG9lcyBwdXQgdGhlIHZhcmlhYmxlIGluIHRoZSBzaGVs
bCdzCmVudmlyb25tZW50LCBhbmQgZG9lcyBmaXggdGhpcyB3cmFwcGluZyBiZWhhdmlvci4gQXQg
bGVhc3Qgb24gdGhlIGNvcHkKb2YgQnVzeWJveCBJIGNvbXBpbGVkIG9uIG15IFVidW50dSwgSSBz
dGlsbCBoYXZlIHRvIHRlc3QgaXQgb24gYQpCdWlsZHJvb3QgZW52aXJvbm1lbnQuCgpEb2VzIHRo
aXMgc291bmQgbGlrZSBhbiBhcHByb3ByaWF0ZSBmaXg/CgpSZWdhcmRzLAoKRWRnYXIuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
