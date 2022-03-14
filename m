Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE49C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F90E60AD5;
	Mon, 14 Mar 2022 17:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyGYK2b5hGpa; Mon, 14 Mar 2022 17:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44717606CB;
	Mon, 14 Mar 2022 17:23:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD8FF1BF34C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 17:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C202408CB
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 17:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qp_sPaYpDfOk for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 17:23:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA9BE4030B
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 17:23:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bg10so35655128ejb.4
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1HZaBb9/2TM7tiHNhla8F1D6hrVoVmNXNQfQeAvYjik=;
 b=SvbUwcdsWZUdH+OKPCdqQnat//YcyIKvJD3hhQDpFXWYQ23aiiShLFVP1WLXJ1ewcl
 9JPaN89CYnbVmmyJM5yq/SasDyrSC83HCzRcX8QqTbbO3kza5oxuPih4HX0FL83N8I8E
 GVcLLbAncs4s9U1l74WfVYFulHizM458O2QG7/W/u5cXldi/VuhdY4Gyh501uX+n7z7D
 b1+fs4OJmJZ5n1P3MX3KKzBkwlHtt/lcaJfdTIgTEEdioN1aPxPjagxg0rJmYXZKjX5e
 AMTBvLPBfiXDw8lpomZmGD/yMms4VlTlpDuWHER9S7KwUpamQa7nZ53dKEkdM/klGFyp
 fUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1HZaBb9/2TM7tiHNhla8F1D6hrVoVmNXNQfQeAvYjik=;
 b=lvL3cuN8pQUEsg7c8YOb4vwwWTpjZaYpJDbS3AeV0VN2bNp/J31WpyVuRlQefOeQ8k
 LaXRRy9wYY0zqL/HmrNdGBCZPj06TMNVYcPuu/fv3EYQsuBPauwjuxT6mr2WfQlNlLDl
 dwlQ5IhKLQA+uH20USDPQvpZ0494tZW1rd/1xYm1fXPX/v1TpR07VzBfYnZ8R/m+6vNo
 X+stOl8Pjv1IGyIFyObgv0hO2k2Rc3PlZedYcAE58fkBo+E46tZ/73+7xJkdES0UsT1O
 6otqH7vm2O46Z3XGK88WPnTkyZV7ASAEH3zRlPqoznr1uWk4Hmd3/EJLaICMvBrHyksC
 L1jA==
X-Gm-Message-State: AOAM530hex+B5gsVBqXnSokdGYDjTp611l67ZOliwO7C0+oq8fr7Q0AG
 YZ6h+TI1n7vzroMFxqPsOKZ0B3r6Y94BReCK+1+xgQ==
X-Google-Smtp-Source: ABdhPJzKflYUNQd4eUNcf95J4cCJq0kjxMW4DsWSn1v0oUBCiCjtG64zUuPpKKZB8KRfS1CpxEukWO5znDOSIZNtq98=
X-Received: by 2002:a17:906:2811:b0:6ce:eacf:5210 with SMTP id
 r17-20020a170906281100b006ceeacf5210mr20125930ejc.618.1647278629892; Mon, 14
 Mar 2022 10:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-2-clement.leger@bootlin.com>
In-Reply-To: <20220314153111.1390512-2-clement.leger@bootlin.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 14 Mar 2022 18:23:39 +0100
Message-ID: <CAN5uoS8Z6e24-HbrN6V0ryNK=oL=-_ktjd8vDJrrpgXQjDHTKg@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [Buildroot] [PATCH v4 1/8] boot/optee-os: add option to select
 DTC dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBNb24sIDE0IE1hciAyMDIyIGF0IDE2OjMyLCBDbMOpbWVudCBM
w6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gU29tZSBwbGF0Zm9y
bXMgKHN0bTMyLCBzYW0pIG5lZWRzIERUQyB0byBidWlsZCB0aGUgcGxhdGZvcm0KPiBkZXZpY2Ut
dHJlZXMuIEFkZCBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX0RUQyBjb25maWd1cmF0aW9uCj4g
b3B0aW9uIHRvIHNlbGVjdCBob3N0LWR0YyBwYWNrYWdlIHdoZW4gYnVpbGRpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4g
LS0tCj4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgfCA3ICsrKysrKysKPiAgYm9vdC9vcHRl
ZS1vcy9vcHRlZS1vcy5tayB8IDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0
ZWUtb3MvQ29uZmlnLmluCj4gaW5kZXggMDk3NDU3ODQ4NC4uMmY2MTQzZjFmNCAxMDA2NDQKPiAt
LS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmln
LmluCj4gQEAgLTQ4LDYgKzQ4LDEzIEBAIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RP
TV9SRVBPX1ZFUlNJT04KPgo+ICBlbmRpZgo+Cj4gK2NvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09T
X05FRURTX0RUQwo+ICsgICAgICAgYm9vbCAiT1AtVEVFIE9TIG5lZWRzIGR0YyIKPiArICAgICAg
IHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0RUQwo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBT
ZWxlY3QgdGhpcyBvcHRpb24gaWYgeW91ciBPUC1URUUgT1MgcGxhdGZvcm0gY29uZmlndXJhdGlv
bgo+ICsgICAgICAgICByZXF1aXJlcyB0aGUgRGV2aWNlIFRyZWUgY29tcGlsZXIgdG8gYmUgYXZh
aWxhYmxlLgo+ICsKPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfVkVSU0lPTgo+ICAgICAg
ICAgc3RyaW5nCj4gICAgICAgICBkZWZhdWx0ICIzLjE1LjAiICAgICAgICBpZiBCUjJfVEFSR0VU
X09QVEVFX09TX0xBVEVTVAo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL29wdGVlLW9zLm1r
IGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+IGluZGV4IDE2NmI1ZTY5M2MuLjlmNzZkODQ1
MGUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+ICsrKyBiL2Jvb3Qv
b3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiBAQCAtMjMsNiArMjMsMTAgQEAgZW5kaWYKPgo+ICBPUFRF
RV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24zIGhvc3QtcHl0aG9u
LXB5Y3J5cHRvZG9tZXggaG9zdC1weXRob24tcHllbGZ0b29scwo+Cj4gK2lmZXEgKCQoQlIyX1RB
UkdFVF9PUFRFRV9PU19ORUVEU19EVEMpLHkpCj4gK09QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBo
b3N0LWR0Ywo+ICtlbmRpZgo+ICsKPiAgIyBPbiA2NGJpdCB0YXJnZXRzLCBPUC1URUUgT1MgY2Fu
IGJlIGJ1aWx0IGluIDMyYml0IG1vZGUsIG9yCj4gICMgY2FuIGJlIGJ1aWx0IGluIDY0Yml0IG1v
ZGUgYW5kIHN1cHBvcnQgMzJiaXQgYW5kIDY0Yml0Cj4gICMgdHJ1c3RlZCBhcHBsaWNhdGlvbnMu
IFNpbmNlIGJ1aWxkcm9vdCBjdXJyZW50bHkgcmVmZXJlbmNlcwo+IC0tCj4gMi4zNC4xCj4KCkFj
a2VkLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
