Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E44C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 23:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43D440362;
	Mon, 17 Jan 2022 23:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7ypoiNTGTZA; Mon, 17 Jan 2022 23:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0409E4033D;
	Mon, 17 Jan 2022 23:46:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035261BF286
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 23:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF586813A3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 23:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpufgyEkS5uW for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 23:45:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D74768139F
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 23:45:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso1743176wmj.0
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 15:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Ik0DPa0emjJa2oMdpb9J8+HhjddGBwCbqUvArefdHuw=;
 b=S36bVvxQgCypXyLNf4XPhFe1fvkYdAGe5jiJ7p/b12btn/nHXVT0YCFTRdVewPgfrK
 ciJ6uTu6HIw5DsvyAl4mfoHQ/Z66LUr2vSvjwGr7Eb0lXGBqoIDy+01mE3bY/ylWTjXb
 66CM/9TMkIaMiDlofPdvBHZTVzmb4FFK5PBqxIQ6T5wHOBM3/aRnDAK88JgFvSFRgWsH
 vVfyir6TsveVsENmADrJO8oxq/1HI0HWFfMMdk4QAybyvSoyMZvMIaS2BC0yn42IIWap
 lHRqqxg/sYmF1eKLxvuUuQl7+fjg+KHaqKGXI6vOZXZXXa2kVKTccfdVTANwmj7Q5BIZ
 LKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :in-reply-to:references:organization:mime-version
 :content-transfer-encoding;
 bh=Ik0DPa0emjJa2oMdpb9J8+HhjddGBwCbqUvArefdHuw=;
 b=zEfdsyG4nDcZ0jDhf9x0CWNqvCW53uKoXO+b9yA70yP1Piwc1q28e9ziJxC0pZ7J89
 4wTC3SPjEeaFLq7Ysl7i5y9cl3AxhIArxq0zXHNSBRB+FwPUvU6N4m9hi9SVnbnZUyeL
 mp8EIRj26bXzBR62/tFmkRyoezzHkKQYqhoIUWqSwg0t4Zpka8J+4XYk3lbmDGFdEJI2
 1f1KJzjp5KI3qp6POvcz5gcCbtDtcVLskgkCXTiwraHBJN9kqbiQN1YjhqWhpS+O2bbR
 QK26XofLcdWZlJ7vluw9gE1J/PP3SjFbeBxlZWDNlDuFSkQbh1ROveaxmMzCdDj0h5A9
 t3bA==
X-Gm-Message-State: AOAM531l6Cy765d1wl+a3vPnZdamHL1oHL2TXLaZjUMIDXaGdbuWNTLw
 Zb2naFUJ4lCjXDeUp9D8BA==
X-Google-Smtp-Source: ABdhPJyU+WYbbkT+FAFmkED7LHujsgG3JVOTxKH/kSyWbfaGDD5Vh6+1U1JKdd/BuJ4hH2qBbcLaWQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr29649991wmj.169.1642463155958; 
 Mon, 17 Jan 2022 15:45:55 -0800 (PST)
Received: from localhost (cpc155795-brmb11-2-0-cust469.1-3.cable.virginm.net.
 [80.6.125.214])
 by smtp.gmail.com with ESMTPSA id o13sm7397383wrc.5.2022.01.17.15.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 15:45:55 -0800 (PST)
Date: Mon, 17 Jan 2022 23:45:54 +0000
From: Richard Ash <richard@audacityteam.org>
To: =?UTF-8?B?VG9tYcW+IFNtb2RpxaE=?= <tomazsmodis73@hotmail.com>
Message-ID: <20220117234554.39996df0@audacityteam.org>
In-Reply-To: <VI1PR03MB3677C9B45913A7CCF071B6B8A9579@VI1PR03MB3677.eurprd03.prod.outlook.com>
References: <VI1PR03MB3677C9B45913A7CCF071B6B8A9579@VI1PR03MB3677.eurprd03.prod.outlook.com>
Organization: Audacity Development Team
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] buildroot Qt Raspberry Pi3b+
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

T24gTW9uLCAxNyBKYW4gMjAyMiAxOToyOTo0OSArMDEwMApUb21hxb4gU21vZGnFoSA8dG9tYXpz
bW9kaXM3M0Bob3RtYWlsLmNvbT4gd3JvdGU6Cgo+IEhJCj4gCj4gSSBhbSB0cnlpbmcgdG8gYnVp
bGQgUXQgZXZlcnl3aGVyZSA1LjEyLjUgYWdhaW5zdCBidWlsZHJvb3QgUmFzcGJlcnJ5IAo+IFBp
M2IrIGltYWdlL3N5c3Jvb3QuIEkgdXNlIGxpbmFybyA3LjUgY29tcGlsZXIuCkRpZCB5b3UgY29u
ZmlndXJlIGFuZCBidWlsZCBidWlsZHJvb3QgdXNpbmcgdGhlIGxpbmFybyBjb21waWxlcj8gSWYK
bm90LCB0aGVuIGl0J3MgdmVyeSB1bmxpa2VseSB0byB3b3JrLgoKPiBJIHJzeW5jIHRoZSBzZCBj
YXJkIHJvb3RmcyBpbnRvIHN5c3Jvb3Qgb24gbXkgaG9zdCBjb21wdXRlci4KClRoYXQncyBub3Qg
dGhlIHN5c3Jvb3QgYXQgYWxsLiBUaGUgU0QgY2FyZCBjb250ZW50cyBvbmx5IGhhcyB0aGUKcnVu
dGltZSBsaWJyYXJpZXMgbmVlZGVkIHRvIHJ1biBiaW5hcmllcy4gSXQgZG9lcyBub3QgaGF2ZSB0
aGUgaGVhZGVycwphbmQgc3RhdGljIGxpYnJhcmllcyBuZWVkZWQgdG8gY29tcGlsZSBzb2Z0d2Fy
ZS4gVGhleSBhcmUgZm91bmQgaW4gdGhlCm91dHB1dC9zdGFnaW5nIGRpcmVjdG9yeSBmcm9tIGJ1
aWxkcm9vdCAod2hpY2ggeW91IHdpbGwgbm90aWNlIGlzIGEgbG90CmJpZ2dlciB0aGFuIHRoZSB0
YXJnZXQgZGlyZWN0b3J5IQoKQXMgYSBtaW5pbXVtLCB5b3UgbmVlZCB0byBiZSB1c2luZyB0aGUg
YnVpbGRyb290IHN0YWdpbmcgZGlyZWN0b3J5IGFzCnlvdXIgc3lzcm9vdC4gQnV0IHRoZSBiaWdn
ZXIgcXVlc3Rpb24gaXMgIndoeSBib3RoZXIiPyBCdWlsZHJvb3QgaGFzCnBhY2thZ2VzIGZvciBx
dDUgc28geW91IGNhbiBqdXN0IGdldCBidWlsZHJvb3QgdG8gY29tcGlsZSB3aGljaGV2ZXIKYml0
cyBvZiBRVCB5b3UgbmVlZCBhcyBwYXJ0IG9mIHRoZSBzeXN0ZW0sIHdpdGhvdXQgaGF2aW5nIHRv
IGRvIGl0IGJ5CmhhbmQuCmh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1aWxkcm9vdC90cmVlL3Bh
Y2thZ2UvcXQ1CgpSaWNoYXJkCgogVGhlbiBJCj4gcnVuOgo+IAo+IC4vY29uZmlndXJlIC1yZWxl
YXNlIC1vcGVuZ2wgZXMyIC1kZXZpY2UgbGludXgtcmFzcC1waS1nKysgCj4gLWRldmljZS1vcHRp
b24gCj4gQ1JPU1NfQ09NUElMRT1+L1Jhc3BiZXJyeVBpRUdMRlMvdG9vbHNORVcvYmluL2FybS1s
aW51eC1nbnVlYWJpaGYtIAo+IC1zeXNyb290IH4vUmFzcGJlcnJ5UGlFR0xGUy9zeXNyb290IC1v
cGVuc291cmNlIC1jb25maXJtLWxpY2Vuc2UKPiAtc2tpcCBxdHdheWxhbmQgLXNraXAgcXRsb2Nh
dGlvbiAtc2tpcCBxdHNjcmlwdCAtbWFrZSBsaWJzIC1wcmVmaXggCj4gL3Vzci9sb2NhbC9xdDVw
aSAtZXh0cHJlZml4IH4vUmFzcGJlcnJ5UGlFR0xGUy9xdDVwaSAtaG9zdHByZWZpeCAKPiB+L1Jh
c3BiZXJyeVBpRUdMRlMvcXQ1IC1uby11c2UtZ29sZC1saW5rZXIgLXYgLW5vLWdibQo+IAo+IEl0
IHN0YXJ0cyB0byBjb25maWd1cmUgYnV0IEkgZ290IGVycm9yOgo+IAo+IFJ1bm5pbmcgY29uZmln
dXJhdGlvbiB0ZXN0cy4uLgo+IAo+ICAgKgo+IC9ob21lL3RvbWF6L1Jhc3BiZXJyeVBpRUdMRlMv
dG9vbHMvYXJtLWJjbTI3MDgvZ2NjLWxpbmFyby1hcm0tbGludXgtZ251ZWFiaWhmLXJhc3BiaWFu
LXg2NC9iaW4vYXJtLWxpbnV4LWdudWVhYmloZi1nKysKPiAtZHVtcG1hY2hpbmUKPiAKPiAgICAg
YXJtLWxpbnV4LWdudWVhYmloZgo+ICAgICBDaGVja2luZyBmb3IgdmFsaWQgbWFrZXNwZWMuLi4K
PiAKPiAgICogY2QKPiAgICAgL2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xGUy9xdC1ldmVyeXdo
ZXJlLXNyYy01LjEyLjUvY29uZmlnLnRlc3RzL3ZlcmlmeXNwZWMKPiAgICAgJiYKPiAgICAgL2hv
bWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xGUy9xdC1ldmVyeXdoZXJlLXNyYy01LjEyLjUvcXRiYXNl
L2Jpbi9xbWFrZQo+ICAgICAiQ09ORklHIC09IHF0IGRlYnVnX2FuZF9yZWxlYXNlIGFwcF9idW5k
bGUgbGliX2J1bmRsZSIgIkNPTkZJRyArPQo+ICAgICBzaGFyZWQgd2Fybl9vZmYgY29uc29sZSBz
aW5nbGVfYXJjaCIgIlFNQUtFX0NGTEFHUyArPQo+ICAgICAtLXN5c3Jvb3Q9L2hvbWUvdG9tYXov
UmFzcGJlcnJ5UGlFR0xGUy9zeXNyb290IiAiUU1BS0VfQ1hYRkxBR1MgKz0KPiAgICAgLS1zeXNy
b290PS9ob21lL3RvbWF6L1Jhc3BiZXJyeVBpRUdMRlMvc3lzcm9vdCIgIlFNQUtFX0xGTEFHUyAr
PQo+ICAgICAtLXN5c3Jvb3Q9L2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xGUy9zeXNyb290IiAt
ZWFybHkgIkNPTkZJRyArPQo+ICAgICBjcm9zc19jb21waWxlIgo+ICAgICAvaG9tZS90b21hei9S
YXNwYmVycnlQaUVHTEZTL3F0LWV2ZXJ5d2hlcmUtc3JjLTUuMTIuNS9xdGJhc2UvY29uZmlnLnRl
c3RzL3ZlcmlmeXNwZWMKPiAgICogY2QKPiAgICAgL2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xG
Uy9xdC1ldmVyeXdoZXJlLXNyYy01LjEyLjUvY29uZmlnLnRlc3RzL3ZlcmlmeXNwZWMKPiAgICAg
JiYgTUFLRUZMQUdTPSAvdXNyL2Jpbi9tYWtlIGNsZWFuICYmIE1BS0VGTEFHUz0gL3Vzci9iaW4v
bWFrZQo+IAo+ICAgICBybSAtZiB2ZXJpZnlzcGVjLm8KPiAgICAgcm0gLWYgKn4gY29yZSAqLmNv
cmUKPiAgICAgL2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xGUy90b29scy9hcm0tYmNtMjcwOC9n
Y2MtbGluYXJvLWFybS1saW51eC1nbnVlYWJpaGYtcmFzcGJpYW4teDY0L2Jpbi9hcm0tbGludXgt
Z251ZWFiaWhmLWcrKwo+ICAgICAtYyAtcGlwZSAtbWFybSAtbWZwdT12ZnAgLW10dW5lPWFybTEx
NzZqemYtcyAtbWFyY2g9YXJtdjZ6awo+ICAgICAtbWFiaT1hYXBjcy1saW51eCAtbWZsb2F0LWFi
aT1oYXJkCj4gICAgIC0tc3lzcm9vdD0vaG9tZS90b21hei9SYXNwYmVycnlQaUVHTEZTL3N5c3Jv
b3QgLU8yIC1zdGQ9Z251KysxMSAtdwo+ICAgICAtZlBJQwo+ICAgICAtSS9ob21lL3RvbWF6L1Jh
c3BiZXJyeVBpRUdMRlMvcXQtZXZlcnl3aGVyZS1zcmMtNS4xMi41L3F0YmFzZS9jb25maWcudGVz
dHMvdmVyaWZ5c3BlYwo+ICAgICAtSS4KPiAgICAgLUkvaG9tZS90b21hei9SYXNwYmVycnlQaUVH
TEZTL3F0LWV2ZXJ5d2hlcmUtc3JjLTUuMTIuNS9xdGJhc2UvbWtzcGVjcy9kZXZpY2VzL2xpbnV4
LXJhc3AtcGktZysrCj4gICAgIC1vIHZlcmlmeXNwZWMubwo+ICAgICAvaG9tZS90b21hei9SYXNw
YmVycnlQaUVHTEZTL3F0LWV2ZXJ5d2hlcmUtc3JjLTUuMTIuNS9xdGJhc2UvY29uZmlnLnRlc3Rz
L3ZlcmlmeXNwZWMvdmVyaWZ5c3BlYy5jcHAKPiAgICAgL2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlF
R0xGUy90b29scy9hcm0tYmNtMjcwOC9nY2MtbGluYXJvLWFybS1saW51eC1nbnVlYWJpaGYtcmFz
cGJpYW4teDY0L2Jpbi9hcm0tbGludXgtZ251ZWFiaWhmLWcrKwo+ICAgICAtbWZsb2F0LWFiaT1o
YXJkIC0tc3lzcm9vdD0vaG9tZS90b21hei9SYXNwYmVycnlQaUVHTEZTL3N5c3Jvb3QKPiAgICAg
LVdsLC1PMQo+ICAgICAtV2wsLXJwYXRoLWxpbmssL2hvbWUvdG9tYXovUmFzcGJlcnJ5UGlFR0xG
Uy9zeXNyb290L29wdC92Yy9saWIKPiAgICAgLVdsLC1ycGF0aC1saW5rLC9ob21lL3RvbWF6L1Jh
c3BiZXJyeVBpRUdMRlMvc3lzcm9vdC91c3IvbGliL2FybS1saW51eC1nbnVlYWJpaGYKPiAgICAg
LVdsLC1ycGF0aC1saW5rLC9ob21lL3RvbWF6L1Jhc3BiZXJyeVBpRUdMRlMvc3lzcm9vdC9saWIv
YXJtLWxpbnV4LWdudWVhYmloZgo+ICAgICAtbyB2ZXJpZnlzcGVjIHZlcmlmeXNwZWMubwo+ICAg
ICAvaG9tZS90b21hei9SYXNwYmVycnlQaUVHTEZTL3Rvb2xzL2FybS1iY20yNzA4L2djYy1saW5h
cm8tYXJtLWxpbnV4LWdudWVhYmloZi1yYXNwYmlhbi14NjQvYmluLy4uL2xpYi9nY2MvYXJtLWxp
bnV4LWdudWVhYmloZi80LjguMy8uLi8uLi8uLi8uLi9hcm0tbGludXgtZ251ZWFiaWhmL2Jpbi9s
ZDoKPiAgICAgY2Fubm90IGZpbmQgLWxtCj4gICAgIGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJu
ZWQgMSBleGl0IHN0YXR1cwo+ICAgICBtYWtlOiAqKiogW01ha2VmaWxlOjY4OiB2ZXJpZnlzcGVj
XSBFcnJvciAxCj4gICAgIE5vdGU6IEFsc28gYXZhaWxhYmxlIGZvciBMaW51eDogbGludXgtY2xh
bmcgbGludXgtaWNjCj4gCj4gRVJST1I6IENhbm5vdCBjb21waWxlIGEgbWluaW1hbCBwcm9ncmFt
LiBUaGUgdG9vbGNoYWluIG9yIFFNYWtlU3BlYwo+IGlzIGJyb2tlbi4KPiAKPiAKPiBNaW5pbWFs
IHByb2dyYW0/IFdoYXQgYW0gSSBtaXNzaW5nPwo+IAo+IFRob21hcwo+IAo+IHAucy4gSWYgSSBy
c3luYyBmdWxsIE9TIEJ1c3RlciBpbWFnZS9yb290ZnMgaW50byBzeXNyb290IG9uIG15IGhvc3QK
PiBpdCBjb25maWd1cmVzIG9rLiBJIGNhbiBtYWtlIGFuZCBtYWtlIGluc3RhbGwgdGhlIFF0IGJp
bmFyaWVzLiBJIGNhbiAKPiBjb21waWxlIFF0IGFwcCBhZ2FpbnN0IEJ1c3Rlci9SYXNwYmlhbiBz
eXNyb290LiBUaGVuIEkgcnVuIGJ1aWxkcm9vdCAKPiBSYXNwYmVycnkgUGkgT1MgdGhhdCBJIGhh
dmUgYnVpbGQgYW5kIHdydHRlbiBvbiBhbm90aGVyIHNjIGNhcmQgYW5kCj4gaXQgcnVucy9sb2Fk
cyBvay4gVGhlIEkgY29weSBteSBRdCBlbGYgZmlsZSB0byBidWlsZHJvb3RzIGRpcmVjdG9yeQo+
IGFuZCBJIGdldCBsZC5zby9saWJjLnNvL2ludGVycHJldGVyIHByb2JsZW0hIEkgdW5kZXJzdGFu
ZCB0aGlzIGlzc3VlCj4gYW5kIEkgdGhpbmsgaWYgSSBjb3VsZCBidWlsZCBRdCBldmV5d2hlcmUg
YWdhaW5zdCBidWlsZHJvb3RzIHJvb3Rmcwo+IGl0IHdvdWxkIGJlIG9rIT8KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
