Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B99FC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB46A400D7;
	Sat, 11 Feb 2023 09:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB46A400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNCbuDC3Yl-V; Sat, 11 Feb 2023 09:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDC7B4029F;
	Sat, 11 Feb 2023 09:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC7B4029F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83901BF279
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C624029F
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1C624029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojfHw2-DVj7R for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 09:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DF59400D7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DF59400D7
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:33:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z13so5503620wmp.2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 01:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2UkePbqWIADKfmuX0+zKR9oZ9cEQf5O+fCDrA330aA=;
 b=P5LhlorAxNrbf2edAcemzg2L0ctYRZbBEQ4sC0sfTkC4wtuG0+iqA5/IoM3Z2V5jMW
 0H2htxrMvgpu3IAkVGlao9u9o1haghKYkUcXY2XCQLNTpmORD8cQ6MW9L8nlA8gzT2bV
 ZBxBu/Ut3RudORvNof6h9IdFe8oam6wQd6dlAtchm+tTWU/N0r6VBDhar0UiY9vmmvdP
 +zVnO2RdUsrCoQ/PWB6nIcukhb3ZeJjIkTQPUdiSjHrstth99bLR0NuoDkrzdSu+tj5H
 O7/2+m6qU3LElQihIXw+KSADsnl/JO/Pk321A9q6UJzn5Fs28on7KLLTUUuF2AKivChs
 7VAA==
X-Gm-Message-State: AO0yUKVZ0L6bALKDPVTtCp5CakRveojveZd2nSV3c0Y7wxwLKr8oDX0p
 WUsZpksacRlZlvWj0mvrAzyglw==
X-Google-Smtp-Source: AK7set8IQ4RLevzPPla7oc3ePe2BVhrhPecYkxR3N6Senfdr2iStxSvpLRBtvaTpQ+jrfLzQI9N82w==
X-Received: by 2002:a05:600c:1684:b0:3d0:761b:f86 with SMTP id
 k4-20020a05600c168400b003d0761b0f86mr14616986wmn.28.1676107986131; 
 Sat, 11 Feb 2023 01:33:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003de664d4c14sm8624785wmq.36.2023.02.11.01.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 01:33:05 -0800 (PST)
Message-ID: <e22f405b-5dba-66e6-f40e-8a8fb5cd2b4a@smile.fr>
Date: Sat, 11 Feb 2023 10:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208192425.GA2677@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230208192425.GA2677@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q2UkePbqWIADKfmuX0+zKR9oZ9cEQf5O+fCDrA330aA=;
 b=2H9YThb/94dS0Hb6RQhoFFCtWv8eGJJTTxPoi8bbZr2cZfTQHKWucQh0KoKlJ8lym6
 6wd3q1c0Ok1RtOqcc3Uye0Y+h2T0sWejBJ5+ZUj03DuVtuFtqukAF318zyv8fq8UoJbL
 ntrKs4abY8PcYK2JaAbVnpHYkYPAIZQrnV/e7sBKSfFj8Ul/CamcNf24VUeYlPcccD3G
 oZg4aMh+yzY3Um9Z0sa+2IX6lftR9uUC7FtpWZLjj7N11ArGPbUxNV+GbdNQ+MUDIBbK
 wBJV3wu/+75gQLe90kkq2T2kStCNZC16ojg7ueGf9KgT6FjNz8ivnrZeQiMV3e//XCnD
 b1rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2H9YThb/
Subject: Re: [Buildroot] [PATCH 1/5] package/pkg-waf.mk: drop bundled
 waf/waflib when external waf is used
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

SGVsbG8sCgpMZSAwOC8wMi8yMDIzIMOgIDIwOjI0LCBZYW5uIEUuIE1PUklOIGEgw6ljcml0wqA6
Cj4gUGV0ZXIsIEFsbCwKPiAKPiBPbiAyMDIzLTAyLTA4IDE5OjE5ICswMTAwLCBQZXRlciBLb3Jz
Z2FhcmQgc3Bha2UgdGh1c2x5Ogo+PiBXYWYgcmVxdWlyZXMgdGhhdCB0aGUgdmVyc2lvbiBvZiB0
aGUgd2FmIHNjcmlwdCBtYXRjaGVzIHRoZSB2ZXJzaW9uIG9mCj4+IHdhZmxpYiwgc28gZHJvcCBh
bnkgYnVuZGxlZCB3YWYvd2FmbGliIGlmIF9ORUVEU19FWFRFUk5BTF9XQUYgaXMgdXNlZCwgYXMK
Pj4gb3RoZXJ3aXNlIHdhZiBlcnJvcnMgb3V0IHdpdGggZXJyb3JzIGxpa2U6Cj4+Cj4+IFdhZiBz
Y3JpcHQgJzIuMC4yNCcgYW5kIGxpYnJhcnkgJzEuOS4zJyBkbyBub3QgbWF0Y2gKPj4KPj4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+PiAtLS0K
Pj4gIHBhY2thZ2UvcGtnLXdhZi5tayB8IDggKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLXdhZi5tayBiL3Bh
Y2thZ2UvcGtnLXdhZi5tawo+PiBpbmRleCBlMDkwYWZhOWU2Li5hMDY3ZTY5YzliIDEwMDY0NAo+
PiAtLS0gYS9wYWNrYWdlL3BrZy13YWYubWsKPj4gKysrIGIvcGFja2FnZS9wa2ctd2FmLm1rCj4+
IEBAIC0zOCw2ICszOCwxMyBAQCBXQUZfT1BUUyA9ICQoaWYgJChWRVJCT1NFKSwtdikgLWogJChQ
QVJBTExFTF9KT0JTKQo+PiAgCj4+ICBkZWZpbmUgaW5uZXItd2FmLXBhY2thZ2UKPj4gIAo+PiAr
IyBUaGUgdmVyc2lvbiBvZiB3YWZsaWIgaGFzIHRvIG1hdGNoIHdpdGggdGhlIHZlcnNpb24gb2Yg
d2FmLAo+PiArIyBvdGhlcndpc2Ugd2FmIGVycm9ycyBvdXQgd2l0aDoKPj4gKyMgV2FmIHNjcmlw
dCAnWCcgYW5kIGxpYnJhcnkgJ1knIGRvIG5vdCBtYXRjaAo+PiArZGVmaW5lIFdBRl9QQUNLQUdF
X1JFTU9WRV9XQUZfTElCCj4+ICsJJChSTSkgLWZyICQoQEQpL3dhZiAkKEBEKS93YWZsaWIKCldl
IG5lZWQgbW9yZSAkJCBoZXJlIDopCgpPdGhlcndpc2U6Cgo+Pj4gYXViaW8gMC40LjkgUGF0Y2hp
bmcKcm0gLWYgLWZyIC93YWYgL3dhZmxpYgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+PiArZW5k
ZWYKPj4gKwo+PiAgIyBXZSBuZWVkIGhvc3QtcHl0aG9uMyB0byBydW4gd2FmCj4+ICAkKDIpX0RF
UEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbjMKPj4gIAo+PiBAQCAtNDcsNiArNTQsNyBAQCAkKDIp
X05FRURTX0VYVEVSTkFMX1dBRiA/PSBOTwo+PiAgaWZlcSAoJCQoJCgyKV9ORUVEU19FWFRFUk5B
TF9XQUYpLFlFUykKPj4gICQoMilfREVQRU5ERU5DSUVTICs9IGhvc3Qtd2FmCj4+ICAkKDIpX1dB
RiA9ICQkKEhPU1RfRElSKS9iaW4vd2FmCj4+ICskKDIpX1BSRV9DT05GSUdVUkVfSE9PS1MgKz0g
V0FGX1BBQ0tBR0VfUkVNT1ZFX1dBRl9MSUIKPiAKPiBJdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gbWFrZSB0aGF0IGVpdGhlciBhIHBvc3QtZXh0cmFjdCBvciBhCj4gcG9zdC1wYXRjaCBob29r
Lgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gIGVsc2UKPj4gICQoMilfV0FG
ID89IC4vd2FmCj4+ICBlbmRpZgo+PiAtLSAKPj4gMi4zMC4yCj4+Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
