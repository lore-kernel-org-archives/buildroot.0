Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A773C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C6441477;
	Sat, 12 Mar 2022 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYAl952_GQ89; Sat, 12 Mar 2022 17:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BAA341296;
	Sat, 12 Mar 2022 17:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A424E1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 936D082456
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zrZ6M7DPHhx for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:07:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B39D82451
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:07:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r29so5352537edc.0
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Nzw3Fsq9wDHYStsI5g5E9wxJeuaOTTtAkSsROoXzznk=;
 b=LiZxA5bIKS6SFprrUjtCtpixV4L3wxpUMWxOWg1YBdEp3QdjmYEbYL3sV99JzPjmVh
 Q6zbBG17ZLOx37tauV7CcmznzL5wzjxLPXDiGzWl5+bbsM3zbEUTJ/Ry0p5+YxPTmkNo
 PJ1wwjadVv9FQmJs/oONVFnhG4qNNs1xKdnPsVdGloM53yHddOPaeevYswQB8mnXLJw+
 H4Rt1tCGkTkjyze7y4rOpsbfjEdRv7PwCZUozePvZwJG5YchMaFiXYHl6cxY27GYat6C
 HYkFrtqt0ZdHThJZKglhWKQT0YlPuiX3YeEsaLz+k66Heek7Jm4Bi3KESzJOYI1PbJhm
 sXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nzw3Fsq9wDHYStsI5g5E9wxJeuaOTTtAkSsROoXzznk=;
 b=oQNxiNgS7Q+rLEegonZVYXItoFl/rNu3JgcrzdR+cPqN0UNY/oQUWaywiHrBde95y1
 g8g1fChoqedWc3PpnaNeZ1N0HvZcQ6zlD0FU0bwvBtH6GckGawpSwlK42jhnE7ecp6Yr
 YA0qhNONcMQt5Qct+6nLDaolFrapWrXQEg7zEnf1yJ7kJoL0XDAGGtfio9EukqrVMHR+
 UixiUjMkXYEPg2JTreJ/RjWqV3h6aaS6QX1jf5frX+70DjDbes3l2QW8fYTK9196pAFG
 B9GFt6diQ2i++o08GALj194h1T3441v2MXRNBLWr6UMnygSUCHSn7h7fBYHWxCk9RxfQ
 oSOg==
X-Gm-Message-State: AOAM532tzdCMT8W9IIjOP4P2AFDeGDYxcCHKc5RVXJef/h2Ov/Ph8T+X
 tu3W8tzNZQV+1/CSi3u83X3YPQ==
X-Google-Smtp-Source: ABdhPJxoVzwkpRW8UDeY/YeeKm/w12dFXaqs6MFw5pvlL23PUc2uyfnWOOIviVHE1CnkagNHLPlqkw==
X-Received: by 2002:a05:6402:c12:b0:415:c5cb:f06c with SMTP id
 co18-20020a0564020c1200b00415c5cbf06cmr13577626edb.92.1647104851155; 
 Sat, 12 Mar 2022 09:07:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a1709060a8d00b006dabeaf86c7sm4496133ejf.137.2022.03.12.09.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:07:30 -0800 (PST)
Message-ID: <d685e4b2-2237-bec6-3a68-3dfc62c25e7b@mind.be>
Date: Sat, 12 Mar 2022 18:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222113336.2608916-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222113336.2608916-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-pillow: bump to version 9.0.1
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

Ck9uIDIyLzAyLzIwMjIgMTI6MzMsIEFuZ2VsbyBDb21wYWdudWNjaSB3cm90ZToKPiBTaWduZWQt
b2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsb0BhbWFydWxhc29sdXRpb25zLmNvbT4K
CiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4g
LS0tCj4gICBwYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5oYXNoIHwgNCArKy0t
Cj4gICBwYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5tayAgIHwgNCArKy0tCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5oYXNoIGIvcGFj
a2FnZS9weXRob24tcGlsbG93L3B5dGhvbi1waWxsb3cuaGFzaAo+IGluZGV4IGYzY2E4ZTYwMTQu
Ljg4YTVkN2NhZGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcGlsbG93L3B5dGhvbi1w
aWxsb3cuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lmhh
c2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvcGlsbG93L2pzb24KPiAtbWQ1ICBjNWFmNmU0MTNkMmZlOTI0N2NmMTZjZTI1Yzgx
NmIxNCAgUGlsbG93LTkuMC4wLnRhci5nego+IC1zaGEyNTYgIGVlNmUyOTYzZTkyNzYyOTIzOTU2
ZmU1ZDM0NzliMWZkYzNiNzZjODNmMjkwYWFkMTMxYTJmOThjM2RmMDU5M2UgIFBpbGxvdy05LjAu
MC50YXIuZ3oKPiArbWQ1ICA4ZGVmZmNjYjRmNDAyZGYxNTRmZDJmZDUwNGQ4NDg3YyAgUGlsbG93
LTkuMC4xLnRhci5nego+ICtzaGEyNTYgIDZjOGJjODIzOGE3ZGZkYWY3YTc1ZjVlYzVhNjYzZjQx
NzNmOGMzNjdlNWEzOWY4N2U3MjA0OTVlMWVlZDc1ZmEgIFBpbGxvdy05LjAuMS50YXIuZ3oKPiAg
IAo+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAgYTY1
NTRjYjczN2JhNmM5YjQ3ZDMzMDFmNzhkZTAzYjRlZDBkM2YwOGQ2Y2Y5NDAwNzE0ZjNkNGM4OTRm
Njk0MyAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9u
LXBpbGxvdy5tayBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCj4gaW5k
ZXggMmYyZTgxNzg4Mi4uOTAxODc2ZTBlZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1w
aWxsb3cvcHl0aG9uLXBpbGxvdy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRo
b24tcGlsbG93Lm1rCj4gQEAgLTQsOCArNCw4IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAgCj4gLVBZVEhPTl9QSUxMT1dfVkVSU0lPTiA9IDkuMC4wCj4gLVBZVEhPTl9Q
SUxMT1dfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9iMC80
My8zZTI4NmM5M2I5ZmEyMGUyMzNkNTM1MzJjYzQxOWI1YWFkOGE0NjhkOTEwNjVkYmVmNGM4NDYw
NTg4MzQKPiArUFlUSE9OX1BJTExPV19WRVJTSU9OID0gOS4wLjEKPiArUFlUSE9OX1BJTExPV19T
SVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzAzL2EzL2Y2MWE5
YTdmZjc5NjljZGVmMmE2ZTAzODNhMzQ2ZWIzMjc0OTVkMjBkMjVhMmRlNWEwODhkYmI1NDNhNgo+
ICAgUFlUSE9OX1BJTExPV19TT1VSQ0UgPSBQaWxsb3ctJChQWVRIT05fUElMTE9XX1ZFUlNJT04p
LnRhci5nego+ICAgUFlUSE9OX1BJTExPV19MSUNFTlNFID0gSFBORAo+ICAgUFlUSE9OX1BJTExP
V19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
