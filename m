Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67869C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D5D940890;
	Sat, 12 Mar 2022 17:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQe-JgnNNUlj; Sat, 12 Mar 2022 17:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F97940867;
	Sat, 12 Mar 2022 17:03:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4355F1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DB52605AD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhxCwllqQBx7 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:03:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 640DB605AB
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:03:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hw13so24546276ejc.9
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yrmocSOSbJMMxn6wRkWzcsVAfJgktc97Rg0kJQZ9z58=;
 b=GPNSS1b0+lA6SLE9myWbTxe5hUmFFrEi0htIqDK5tJ+Jok7PctWrXsO3jCvagWlg1Z
 FroceOnAT+5mQNgcDrnVD+O1DOst+LSLSE/M/g7r+W6goG0sfMgkwZc0xhtvZpYiuWU3
 IxY9AWxPD85Po6iyxMI1BObtjPxhGlrHmLT/PaA6II6xTOW2c86iT2Kl9rzNtT8NnRuy
 Jmh2pMtOQgQBd0KEMtfmWvm6+FfDbmZ723gicw27tZLSC+04OTXJ6dbNX+5+kTRPgepn
 lOZjnI/qyvDoelkIborZnZWbKFzeGjqwNrXRTYFYJVW4qnOO0tcCN1wZ3r+deR+/hUe7
 5yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yrmocSOSbJMMxn6wRkWzcsVAfJgktc97Rg0kJQZ9z58=;
 b=Q2TXuTt8+iD9eNVMpo2Dbmwcn6vJ95malQX+ixBHvTjHn0gh7vKeuxR0VtlAppzsyV
 KweyUWEbG0o7xsRdBzeJ/urJhyN+kwzqcBpnTFiM/5hddSR41RFX8cNwLfILhf8Cu5S3
 OMABPcjJf8e0nXc/ek3Lk4hEqRNQoILfU285dJUiqvJURb58NnON2Jv0v9dFbqH6CDFs
 N+C8nByRV+khgPhU9+9ThIVlhhZjCCHV6yMHdnU8KnTMUK/kjHbz9lF9x66Sez3ALuP9
 QMSBFPJJxil1V7ZUks2azCCMp2Hh88ITx1FHnVo9xhm9TV5IfijC+dSUnoF+1pan80gB
 E76Q==
X-Gm-Message-State: AOAM532vH4PN4C4fozp3NICr+pSHqw0DggqUMdM623cI2mnxWDM6g9Zt
 AJdDmYpycMtqesYTGPOV7vkgIw==
X-Google-Smtp-Source: ABdhPJwx+d2eGL7KQe/1u8U/sF1vAuMvN3uGBRf+U99KcVdsPsfvlsYeeXd6qr9LFCn2Gj7axg6g9A==
X-Received: by 2002:a17:906:40a:b0:6db:3e2a:a7ce with SMTP id
 d10-20020a170906040a00b006db3e2aa7cemr12566635eja.255.1647104603582; 
 Sat, 12 Mar 2022 09:03:23 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z10-20020aa7cf8a000000b004160af67840sm4901326edx.66.2022.03.12.09.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:03:23 -0800 (PST)
Message-ID: <e01228e1-fa9c-3e23-2b3b-2cc153be918d@mind.be>
Date: Sat, 12 Mar 2022 18:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222094913.2217366-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222094913.2217366-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/cups: bump to version 2.4.1
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

Ck9uIDIyLzAyLzIwMjIgMTA6NDksIEFuZ2VsbyBDb21wYWdudWNjaSB3cm90ZToKPiBOT1RJQ0Ug
aGFzaCBpcyBjaGFuZ2VkIGR1ZSB0byBhIGNvcHlyaWdodCB5ZWFyIHVwZGF0ZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvQGFtYXJ1bGFzb2x1dGlvbnMuY29t
PgoKIMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoK
PiAtLS0KPiAgIHBhY2thZ2UvY3Vwcy9jdXBzLmhhc2ggfCA0ICsrLS0KPiAgIHBhY2thZ2UvY3Vw
cy9jdXBzLm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2N1cHMvY3Vwcy5oYXNoIGIv
cGFja2FnZS9jdXBzL2N1cHMuaGFzaAo+IGluZGV4IGIwZTM2NTRiM2QuLjgzMDhiN2I4MDMgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9jdXBzL2N1cHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvY3Vwcy9j
dXBzLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkOgo+IC1z
aGEyNTYgIDlhYmVjZWMxMjhjYTY4NDdjNWJiMmQzZTNkMzBjODdiNzgyYzA2OTdiOWFjZjI4NGQx
NmZhMzhmODBhM2E2ZGUgIGN1cHMtMi40LjAtc291cmNlLnRhci5nego+ICtzaGEyNTYgIGM3MzM5
Zjc1ZjhkNGYyZGVjNTBjNjczMzQxYTQ1ZmMwNmI2ODg1YmI2ZDQzNjZkNmJmNTlhNGU2YzEwYWUx
NzggIGN1cHMtMi40LjEtc291cmNlLnRhci5nego+ICAgc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQz
MWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNFTlNF
Cj4gLXNoYTI1NiAgYTJhNDZkMDI0ZTRkNzhkZDI0NzVkODlmMmYzZDkwNTU3OGVkZmVjYTdkY2Iw
NDFlMWQwYmEwNzlkOWE4N2I0OCAgTk9USUNFCj4gK3NoYTI1NiAgN2E3YmQ2MzllM2E4NDU3YWU0
MGIwZGNmYjc0ZWEzY2M2YTgxMzJiMDZjNzI2MTQyZTk5MzYyNWQzM2ViNmRlNSAgTk9USUNFCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3Vwcy9jdXBzLm1rIGIvcGFja2FnZS9jdXBzL2N1cHMubWsK
PiBpbmRleCBlNDA2ZDNiYzY0Li4yOThhNmVkODc5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY3Vw
cy9jdXBzLm1rCj4gKysrIGIvcGFja2FnZS9jdXBzL2N1cHMubWsKPiBAQCAtNCw3ICs0LDcgQEAK
PiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtQ1VQU19WRVJTSU9OID0g
Mi40LjAKPiArQ1VQU19WRVJTSU9OID0gMi40LjEKPiAgIENVUFNfU09VUkNFID0gY3Vwcy0kKENV
UFNfVkVSU0lPTiktc291cmNlLnRhci5nego+ICAgQ1VQU19TSVRFID0gaHR0cHM6Ly9naXRodWIu
Y29tL09wZW5QcmludGluZy9jdXBzL3JlbGVhc2VzL2Rvd25sb2FkL3YkKENVUFNfVkVSU0lPTikK
PiAgIENVUFNfTElDRU5TRSA9IEFwYWNoZS0yLjAgd2l0aCBHUEwtMi4wL0xHUEwtMi4wIGV4Y2Vw
dGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
