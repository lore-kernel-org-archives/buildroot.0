Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7014BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D54AF60B3F;
	Sat, 30 Apr 2022 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDM4BjTjaHbg; Sat, 30 Apr 2022 10:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFAB560B29;
	Sat, 30 Apr 2022 10:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0881BF3AA
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B13860B29
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 10:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aigZXsqp772B for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 10:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C808E60B1F
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 10:31:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id p18so11635016edr.7
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=caLBEq5h9ViwCm9Lojt3nQ/NFr3Ak0CaDFxbtNN6GvU=;
 b=UIVIuf+Or06RV3y+gmaDYbmavndSGBX2pjXryRig7Xnf6M8BQVj7nXBOsbgiIhzxQW
 Ij3ePd3pr6JV/ELU1ES5tw6GVI6jxtE4Qxqk8OPiZCWDGNIv1rxbWv8WewROB0nrFpda
 nlrbEB94s6Va8MDDrt+PdquRVb9sPV7JBTldOiUKiNmvSRVMOlXf6RS0MIxwHkCXQe92
 Q73r++KVMu+xrxQvlMHtTaaDRqAy0X/vrWYgZs7E4x+UEs0qtoJZtbGPeo2CDS6VvNvH
 BOxDqBHcFz0WC2TbErCXIDBbzvi6OsWZ0Nlrdy7FFzBImgssJfWX5LxQ+CkuMEdJKOdO
 xs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=caLBEq5h9ViwCm9Lojt3nQ/NFr3Ak0CaDFxbtNN6GvU=;
 b=oSFFl9aedumGFcdBZI50h79g/EbUxYcMvMlD2ArU/QktaXL6+URZILsBUz7auR0MGY
 RvObHLkj7O0R/XxKNTWC4khzJN2SUiaJX64q0CHrupaYRZNCdNGnCadmM7fDfYwa5Kz/
 6xEUCq6Qlr+JD7ZBz8Y04z2yKPoZ7G0AkBM/f9DZVNBrmoSJssccEWKFKcM47utiQMk3
 HmHmxOfQAzsLZeC9upX7GU2qvVBNWixBk6tSbAsWHVt8PLREOa2NZ9JuHi5ocH0LlOy/
 0RhvpfgMaip1VZeuKd0wLfh9nCZbxCbkDBQWzB7mJHx4T9JvLkNapvr8c/BxR7EtAwp/
 PYGw==
X-Gm-Message-State: AOAM5323llT2D/aJOd1grKtncaOLMbbvvUweF8OdGqaVvB1fYImivktP
 JrUu5FAZMxPyZ4fLd08m2c+ARw==
X-Google-Smtp-Source: ABdhPJyBIMBG3C+T/ZvpaMkVnoW9/Y9j/wLedPoTNBOwxPWt+j3QlmGhNFDIg7XatrDKiJHlwK5rSA==
X-Received: by 2002:a05:6402:1254:b0:426:2439:ceb7 with SMTP id
 l20-20020a056402125400b004262439ceb7mr3823910edw.47.1651314677644; 
 Sat, 30 Apr 2022 03:31:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906845000b006f3ef214dc7sm1452294ejy.45.2022.04.30.03.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 03:31:17 -0700 (PDT)
Message-ID: <3bcef05e-2ddd-2929-8bc7-f16c7ef33cd1@mind.be>
Date: Sat, 30 Apr 2022 12:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Earthquake <earthquake.de@freenet.de>, buildroot@buildroot.org
References: <8043273d-730b-c378-fd91-21e6902081fa@freenet.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8043273d-730b-c378-fd91-21e6902081fa@freenet.de>
Subject: Re: [Buildroot] ACE + TAO with buildroot - GLIBC_2.28 not found
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wNC8yMDIyIDE2OjAyLCBFYXJ0aHF1YWtlIHdyb3RlOgo+IEhpLAo+IAo+IGludGVy
Z3JhdGluZyBBQ0Ugd2FzIHN1Y2Nlc3NmdWxsIHdpdGgKPiAKPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwNDEzMTM0MTM5LjEzMjgxLTEt
bWF0dGhldy53ZWJlckByb2Nrd2VsbGNvbGxpbnMuY29tLyAKPiAKPiAKPiBBQ0UgbGliIGlzIGJ1
aWx0Lgo+IAo+IFdoZW4gSSBpbnRlZ3JhdGUgVEFPIGluIHRoZSBhY2UubWsKPiAKPiBUQU9fTElC
UkFSSUVTICs9IFRBT19JREwKPiBUQU9fTElCUkFSSUVzICs9IHRhby9Qb3J0YWJsZVNlcnZlcgo+
ICQoZm9yZWFjaCBsaWIsJChUQU9fTElCUkFSSUVTKSwgQUNFX1JPT1Q9IiQoQEQpIiAkKFRBUkdF
VF9DT05GSUdVUkVfT1BUUykgCj4gJChNQUtFKSAtQyAkKEBEKS9UQU8vJChsaWIpIEFDRV9ST09U
PSIkKEBEKSIgVEFPX1JPT1Q9IiQoQEQpL1RBTyLCoCBhbGwgKQo+IAo+IFRoZSB0YW9faWRsIGNv
bXBsaWVyIHdpbGwgYmUgYnVpbHQuCj4gCj4gVGhlIFBvcnRhYmxlU2VydmVyIHVzZXMgdGhlIGNy
ZWF0ZWQgdGFvX2lkbCBjb21wbGllciBidXQgZXhpdCB3aXRoOgo+IAo+IC4uLy4uLy4uL2Jpbi90
YW9faWRsOiAvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYy5zby42OiB2ZXJzaW9uIGBHTElCQ18y
LjI4JyBub3QgCj4gZm91bmQgKHJlcXVpcmVkIGJ5IC4uLy4uLy4uL2xpYi9saWJBQ0Uuc28uNy4w
LjIpCj4gLi4vLi4vLi4vYmluL3Rhb19pZGw6IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNv
LjY6IHZlcnNpb24gYEdMSUJDXzIuMzInIG5vdCAKPiBmb3VuZCAocmVxdWlyZWQgYnkgLi4vLi4v
Li4vbGliL2xpYkFDRS5zby43LjAuMikKCiAgWW91IGNyZWF0ZWQgdGFvX2lkbCBmb3IgdGhlIHRh
cmdldCwgYnV0IGFyZSB0cnlpbmcgdG8gcnVuIGl0IG9uIHRoZSBob3N0LiBUaGUgCmxpYmMgdmVy
c2lvbnMgb24gdGFyZ2V0IGFuZCBob3N0IGFyZSBub3QgY29tcGF0aWJsZS4KCiAgVGhpcyBwcm9i
YWJseSBtZWFucyB0aGF0IHRoZSB0YW8gYnVpbGQgc3lzdGVtIGlzIG5vdCBjcm9zcy1jb21waWxh
dGlvbiAKZnJpZW5kbHkuIFBlcmhhcHMgaXQgZG9lcyBzdXBwb3J0IGNyb3NzLWNvbXBpbGF0aW9u
IGJ1dCB5b3UgbmVlZCBzb21lIG90aGVyIApvcHRpb24gdG8gcGFzcyB0aGUgaG9zdCBjb21waWxl
ciAod2UgcGFzcyBDQ19GT1JfQlVJTEQ9IiQoSE9TVENDKSIgYmVjYXVzZSAKQ0NfRk9SX0JVSUxE
IGlzIHRoZSB2YXJpYWJsZSB1c2VkIGJ5IGF1dG90b29scywgYnV0IHdpdGggYSBjdXN0b20gTWFr
ZWZpbGUgdGhleSAKbWF5IGV4cGVjdCBhIGRpZmZlcmVudCB2YXJpYWJsZSkuCgogIElmIGl0IHJl
YWxseSBkb2Vzbid0IHN1cHBvcnQgY3Jvc3MtY29tcGlsYXRpb24sIHRoZW4geW91IHNob3VsZCBt
YWtlIGEgCmhvc3QtYWNlIHBhY2thZ2UgdGhhdCBidWlsZHMgdGFvX2lkbCBhbmQgaW5zdGFsbHMg
aXQgaW4gJChIT1NUX0RJUikvYmluLCBhbmQgCnRoZW4gY2FsbCB0aGF0IG9uZS4KCiAgUmVnYXJk
cywKICBBcm5vdXQKCj4gCj4gV3Jvbmcgd2F5IHRvIGNhbGw/Cj4gCj4gCj4gVGhhbmtzIGZvciBz
dXBwb3J0LAo+IAo+IEFsZXgKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
