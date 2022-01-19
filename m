Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E80DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70C5409A0;
	Wed, 19 Jan 2022 20:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYG3_Pt5mUFA; Wed, 19 Jan 2022 20:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 193CD4096F;
	Wed, 19 Jan 2022 20:54:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 961391BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8444B4098B
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I59Or1J1KiSd for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:54:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A163B4094E
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:54:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so8314964wmq.2
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 12:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q18w+PJ9LXQpAE1SM/kyW92ULfpPXSSPRrS4FpARq8A=;
 b=eI0c129ju5Betohblzmrpg/RyPYGwJTWSMDw7O7hm2yhFpk6OzzEzme9i8OOEve+QA
 6WclisfDhtOGNM6Eb3id/oy98Ts5JGP5q54e3mvanzvmPB0LLHskcb1bOyMDBWOFtGeC
 Ot/YgZFYeuEhYhDTc8rIwK98YCvf/b+4WTuqUp7iuJnlWHD9+y/CLtsj0q+QcXzYliZX
 yiq/s0CMu2vVCTBBU3ks6dY9xqMB/yw2gsi8aQ6CqxkwlzGxf4rliVRJESjosyZT1TqD
 iazBgELqrYcgwEE8/eRHia8v5Un9aYDcjvq72fc5IEQErW0HH9CvvV0qz4/bYdeCEw1m
 7bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q18w+PJ9LXQpAE1SM/kyW92ULfpPXSSPRrS4FpARq8A=;
 b=rq/DMQQT7c2Mvf17TtkcaZxhkX4tzRHUjvv68IW/QZGOxUW42r0ujjvCtvj8OvPSDE
 mYE/g7ze/yorzQC4BrdN+ufKfKVpCXXOAUDijdcRkaVgdyRkhN9dOU/xTAuJLtlq3mu9
 Dc3t398z75rj/G5PMTnB6w/VMb+2NzMIGTlCW2ssywNPwTNZ+Zjq3xl9CsdqUutSCI/q
 s3pm/joU+9kT4yR80gD/FTRjDwPWcxY+onnrUdKa0Amof3N2T3r56FS1FQgI4HB8exTB
 weTBx+VzgMMjdVYvUA6PqR032+NQPuONazdQgCb0vwJjqA7ZPeEywFA47OqkxO30v0su
 Kq8A==
X-Gm-Message-State: AOAM531i5ckvwotSBPAk3XJZFZtJzpC/nUaav1JFN7yl4BQNOyDw9Sv2
 dvd04W3+Eufl7fr+lnhSlFo+BUwoE8I=
X-Google-Smtp-Source: ABdhPJwP5SeAnIHNkZlY1Q/CPMj3T/zFHdH50IyI4ij1EJ6l9qIMXvzyei0o3JFgEAHh5krrZs9SmA==
X-Received: by 2002:adf:c3c7:: with SMTP id d7mr1183593wrg.253.1642625648843; 
 Wed, 19 Jan 2022 12:54:08 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id u5sm949740wrs.16.2022.01.19.12.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 12:54:08 -0800 (PST)
Message-ID: <4b9211c6-6858-37a2-ec04-e677178780da@gmail.com>
Date: Wed, 19 Jan 2022 21:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-7-patrickdepinguin@gmail.com>
 <CAAXf6LU949oVpaUvM=q8t8jZzTNXHWoLDu0gB3BdTEudK+6G7Q@mail.gmail.com>
 <13491b39-7995-1aa7-a2cb-5af43467bb95@gmail.com>
 <CAAXf6LViLChXOpjcprpPN61mYQ+Wxrf8nPtfj9k0ndCqkqkz8w@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CAAXf6LViLChXOpjcprpPN61mYQ+Wxrf8nPtfj9k0ndCqkqkz8w@mail.gmail.com>
Subject: Re: [Buildroot] [PATCHv2 6/7] configs: add new qemu defconfig
 'x86_multilib'
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTGUgMTgvMDEvMjAyMiDDoCAxMzowMiwgVGhvbWFzIERlIFNjaGFtcGhlbGVp
cmUgYSDDqWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gRWwgbWFyLCAxOCBlbmUgMjAyMiBhIGxh
cyAxMjo1MSwgUm9tYWluIE5hb3VyCj4gKDxyb21haW4ubmFvdXJAZ21haWwuY29tPikgZXNjcmli
acOzOgo+Pgo+PiBIZWxsbyBUaG9tYXMsCj4+Cj4+IExlIDE4LzAxLzIwMjIgw6AgMTI6MTksIFRo
b21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6ljcml0IDoKPj4+IEhpLAo+Pj4KPj4+IEVsIHPDoWIs
IDE1IGVuZSAyMDIyIGEgbGFzIDIxOjAzLCBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZQo+Pj4gKDxw
YXRyaWNrZGVwaW5ndWluQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPj4+Pgo+Pj4+IEZyb206IFRo
b21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+
Cj4+Pj4KPj4+PiBBZGQgYSBuZXcgcWVtdSBkZWZjb25maWcgZm9yIGFuIHg4Nl82NCB0YXJnZXQg
dGhhdCB3aWxsIHJ1biBhbiB4ODZfNjQga2VybmVsCj4+Pj4gYnV0IHVzZXJzcGFjZSBpbiAzMi1i
aXQgKHg4NikgbW9kZSwgdXNpbmcgQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgPHRob21hcy5kZV9zY2hhbXBo
ZWxlaXJlQG5va2lhLmNvbT4KPj4+PiAtLS0KPj4+Pgo+Pj4+IE5vdGUgdGhhdCB0aGUgZGVmY29u
ZmlnIHJlZmVycyB0byBhIHRvb2xjaGFpbiBhdAo+Pj4+IGF1dG9idWlsZC5idWlsZHJvb3Qub3Jn
LCBidXQgaXMgbm90IHlldCBwcmVzZW50IGF0IHRoYXQgbG9jYXRpb24uCj4+Pj4gSSB1cGxvYWRl
ZCB0aGUgdG9vbGNoYWluIHRlbXBvcmFyaWx5IHRvOgo+Pj4+IGh0dHA6Ly9wYXRyaWNrZGVwaW5n
dWluLmNvbS9jdG5nLTY3MzdjZmFhOGNlNi14ODZfbXVsdGlsaWItZ2xpYmMtZ2NjMTEudGFyLnh6
Cj4+Pj4gbWQ1c3VtOmIwODVjMGQ4ZjEzN2MwNzhmOGYwOWQxMTZkODM2NGY4Cj4+Pj4gc2hhMjU2
c3VtIDJhNTI0MWQ5Mjc0MjM5NTMyZTQ0ZDM3YzY1NTA5OTMxZmJjMTIwZGI1OTkxNDEyZjk0NmVi
MzgxNzZkYjRkYzIKPj4+Pgo+Pj4+Cj4+Pgo+Pj4gUm9tYWluIE5hb3VyIG5vdGlmaWVkIG1lIHRo
YXQgdGhpcyB0b29sY2hhaW4gZG9lcyBub3QgcnVuIG9uIHRoZSBHQ0MKPj4+IEZhcm0gKElsbGVn
YWwgaW5zdHJ1Y3Rpb24pIHNvIEkgbWFkZSBhIG5ldyB2ZXJzaW9uLCBjdXJyZW50bHkgdXBsb2Fk
ZWQKPj4+IGF0Ogo+Pj4gaHR0cDovL3BhdHJpY2tkZXBpbmd1aW4uY29tL2N0bmctNjczN2NmYWE4
Y2U2LXg4Nl9tdWx0aWxpYi1nbGliYy1nY2MxMS0yLnRhci54ego+Pj4gbWQ1c3VtOiAgM2NlZTY0
ZjgyNjc1NDQ2YWQyNTVmNmMxNjU3ODZlYjUKPj4+IHNoYTI1NnN1bTogNjcxNWJmYmMxOTU1ODhi
NjQ4M2QzOWU5ZWM2ZDcwNjExY2FjM2I5OWJmMmRkMzRmZWRiZWQwZDRlNmM3ZWRjMQo+Pgo+PiBU
aGlzIHRvb2xjaGFpbiBkb2Vzbid0IHdvcmsgZWl0aGVyLgo+Pgo+PiBEaWQgeW91IHRyaWVkIHdp
dGggQ1RfRVhUUkFfQ0ZMQUdTX0ZPUl9CVUlMRD0iLW1hcmNoPXg4Ni02NCIgPwo+PiBXaXRoIENU
X0VYVFJBX0NYWEZMQUdTX0ZPUl9CVUlMRCBtYXliZSBvciBib3RoLgo+IAo+IFNvIHlvdSBnZXQg
dGhlIHNhbWUgZXJyb3Igb2YgJ0lsbGVnYWwgaW5zdHJ1Y3Rpb24nID8KPiAKPiBGb2xsb3dpbmcg
Y29uZmlnIHdhcyB1c2VkIChib3RoIHRoZSBjb25maWcgYXMgdGhlIGJ1aWxkIGxvZyBhcmUgcGFy
dAo+IG9mIHRoZSBhcmNoaXZlKToKPiAKPiBDVF9DT05GSUdfVkVSU0lPTj0iMyIKPiAjIENUX1BS
RUZJWF9ESVJfUk8gaXMgbm90IHNldAo+IENUX0VYVFJBX0NGTEFHU19GT1JfQlVJTEQ9Ii1tYXJj
aD14ODYtNjQiCj4gQ1RfRVhUUkFfQ1hYRkxBR1NfRk9SX0JVSUxEPSItbWFyY2g9eDg2LTY0Igo+
IENUX0FSQ0hfWDg2PXkKPiBDVF9NVUxUSUxJQj15Cj4gQ1RfQVJDSF82ND15Cj4gQ1RfU1RBVElD
X1RPT0xDSEFJTj15CgpJIGRpZG4ndCBlbmFibGVkIHN0YXRpYyB0b29sY2hhaW4gb3B0aW9uLiBD
YW4geW91IHRyeSB3aXRob3V0IGl0LgoKTm90ZXM6IEFsbCBCb290bGluIHRvb2xjaGFpbiB1c2Ug
Z2xpYmMgaW5zdGFsbGVkIG9uIHRoZSBob3N0LCBzbyB3ZSBjYW4ndCB1c2UKcmVhbGx5IG9sZCBz
eXN0ZW1zLgoKPiBDVF9UQVJHRVRfVkVORE9SPSJtdWx0aWxpYiIKPiBDVF9LRVJORUxfTElOVVg9
eQo+IENUX0dMSUJDX0tFUk5FTF9WRVJTSU9OX05PTkU9eQo+ICMgQ1RfQ1JFQVRFX0xEU09fQ09O
RiBpcyBub3Qgc2V0Cj4gQ1RfQ0NfR0NDX01VTFRJTElCX0xJU1Q9Im02NCxtMzIiCj4gQ1RfQ0Nf
R0NDX0xOS19IQVNIX1NUWUxFX0JPVEg9eQo+IENUX0NDX0xBTkdfQ1hYPXkKPiBDVF9ERUJVR19H
REI9eQo+IENUX1pMSUJfTkVFREVEPXkKPiAKPiAKPiAKPj4KPj4gQWxzbywgYnVpbGRpbmcgd2l0
aCBhIERlYmlhbiBqZXNzaWUgZG9ja2VyIGNvbnRhaW5lciB3b3VsZCBhbGxvdyB0byBydW4gdGhl
Cj4+IHRvb2xjaGFpbiB3aXRoIG9sZCBHbGliYy4KPiAKPiBUaGUgdG9vbGNoYWluIGlzIGJ1aWx0
IHN0YXRpY2FsbHksIHNvIHRoZSBnbGliYyB2ZXJzaW9uIG9uIHRoZSBob3N0Cj4gZG9lcyBub3Qg
bWF0dGVyLgo+IFBlcmhhcHMgSSBtaXN1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIHlvdSBhcmUgcmVm
ZXJyaW5nIHRvPwoKSSBtaXNzZWQgdGhhdCB5b3VyIHRvb2xjaGFpbiB3YXMgYnVpbGQgc3RhdGlj
YWxseS4KVXN1YWxseSBvdGhlciBwcmVidWlsdCB0b29sY2hhaW4gYXJlIG5vdCBidWlsdCBzdGF0
aWNhbGx5LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcywKPiBUaG9tYXMKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
