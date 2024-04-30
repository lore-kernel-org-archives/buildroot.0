Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6BCC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1E0400EA;
	Tue, 30 Apr 2024 22:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuNu8cjMN1Ak; Tue, 30 Apr 2024 22:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 399E84011E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399E84011E;
	Tue, 30 Apr 2024 22:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B790D1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C4560AD8
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FopzfCEz-a47 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 890DA60A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890DA60A7D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 890DA60A7D
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:33:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34da84cb755so479604f8f.2
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 15:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714516406; x=1715121206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZQi+GXn2oh5xf8qCtEHR96H37QYvRB/4SQ/wbld5WE=;
 b=VkSR7I+N+rA05jGl2wW2pjvQcw2spLkpbPmVOpw8I5WJbzCfPwfDTVR9dsmZd8eodV
 Fk082WeYWQonWnqJIm7RZHGNN2wuV+3r6evoWUuTAzVjie4auo/54eLBLeZ7TQFG0Rt8
 Hic32Zld4ydrKTtxxQI2VZSBxUscjPItba7df36JWpQ0CvLNCws5JHLkmtnLdlgWvZd2
 lyyB/cjlj1E5Fvk1pjptSYBNP48otDuJifWFTI6trkUsCDxc+AtwSQv1BGS9+ieTXx7a
 e1GNmV5IGPz/yx45KFAAQS1SH5Rspc8hnf1XKkkoSks2qtJt5uvpWYPGpQGKlq9vAXLF
 JHTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrVRKo+H9rZB8wCOyBsElPu0aG/fNBQtfsGtPjEar6Zr+LmUD7+IJN1kaL6U9yNQl2FoPLoBmCDosTWmMVU9q93WR/6MYHqg==
X-Gm-Message-State: AOJu0YynSmluq+u2+IF/tEo69j6Wf6xNbYpo9Qo9Z5+IK7Wr8EAp1o6K
 T9iE4j2s0Z68xwTuIK3YLjGA08sT9xCWhBl4n16eO1HkkVZgYVF6/Rm0gAHGAAI4QCCt2YITnHS
 U
X-Google-Smtp-Source: AGHT+IGagxOwT88EUFtH259N7sJfJQ36twLPmt8/l13t66NpVtKZ+OoXbZMVqxH8mu3mSbHqXtIsQg==
X-Received: by 2002:a5d:640d:0:b0:343:e52a:f51e with SMTP id
 z13-20020a5d640d000000b00343e52af51emr644779wru.47.1714516406274; 
 Tue, 30 Apr 2024 15:33:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d4dcf000000b0034ccf959d6asm8121514wru.74.2024.04.30.15.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 15:33:26 -0700 (PDT)
Message-ID: <d6c440b1-f00b-4557-8cf9-067f15e9d3a1@smile.fr>
Date: Wed, 1 May 2024 00:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20240419232011.959938-1-festevam@gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240419232011.959938-1-festevam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714516406; x=1715121206;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tZQi+GXn2oh5xf8qCtEHR96H37QYvRB/4SQ/wbld5WE=;
 b=PR9K/L3rnCzkbGWkCkgQB0u42SwUwEmjGC3STakWeUksaZO57Tk4hKqoIbvJXKTIZQ
 vNa+gEhR8LKtP49KSffMhPFMjOc6gcMUjnfkvYx7nDyfDsGb8El+Vhnpfl9B2n+WtDJu
 c2PkzdxKpiIT94UT7dmK7bn+xJg7FC7aQOJyXiRhQkE5do8QNn/20eLc0BiKDV3IA4vP
 BUcksl45Q81LLVSz7s57qyait8FVQznChBm8m3k/7SRflZURxAbngLHS7Wl1a6l/ZeEG
 vhZtgaTsdu+FDMh+vWWVbzhLR8HRgIkVSyLX10NzrxV7FxXHtTte+n7SdIV0qYxizs0J
 PaPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=PR9K/L3r
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabresd: update U-Boot and
 kernel
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

SGVsbG8gRmFiaW8sCgpMZSAyMC8wNC8yMDI0IMOgIDAxOjIwLCBGYWJpbyBFc3RldmFtIGEgw6lj
cml0wqA6Cj4gVXBkYXRlIHRvIFUtQm9vdCAyMDI0LjA0IGFuZCBrZXJuZWwgNi42LjI4IHZlcnNp
b25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNv
bT4KPiAtLS0KPiAgY29uZmlncy9pbXg2LXNhYnJlc2RfZGVmY29uZmlnICAgICB8IDEwICsrKysr
LS0tLS0KPiAgY29uZmlncy9pbXg2LXNhYnJlc2RfcXQ1X2RlZmNvbmZpZyB8IDEwICsrKysrLS0t
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9pbXg2LXNhYnJlc2RfZGVmY29uZmlnIGIvY29uZmln
cy9pbXg2LXNhYnJlc2RfZGVmY29uZmlnCj4gaW5kZXggYzIzN2MyZGM3YzVhLi5kMzg0NzhhNmRm
MDcgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9pbXg2LXNhYnJlc2RfZGVmY29uZmlnCj4gKysrIGIv
Y29uZmlncy9pbXg2LXNhYnJlc2RfZGVmY29uZmlnCj4gQEAgLTQsOCArNCw4IEBAIEJSMl9BUk1f
RU5BQkxFX05FT049eQo+ICBCUjJfQVJNX0VOQUJMRV9WRlA9eQo+ICBCUjJfQVJNX0ZQVV9WRlBW
Mz15Cj4gIAo+IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xNSBzZXJpZXMK
PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPiArIyBMaW51
eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuNiBzZXJpZXMKPiArQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9eQo+ICAKPiAgIyBTeXN0ZW0KPiAgQlIyX1RBUkdF
VF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eW14YzAiCj4gQEAgLTI0LDcgKzI0LDcgQEAgQlIyX1RB
UkdFVF9ST09URlNfRVhUMl80PXkKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRf
VUJPT1RfQk9BUkROQU1FPSJteDZzYWJyZXNkIgo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9W
RVJTSU9OPXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4w
NCIKPiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wNCIKPiAg
QlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfSU1HPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQo+
ICBCUjJfVEFSR0VUX1VCT09UX1NQTF9OQU1FPSJTUEwiCj4gQEAgLTMzLDggKzMzLDggQEAgQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKPiAgIyBLZXJuZWwKPiAgQlIyX0xJTlVYX0tF
Uk5FTD15Cj4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjQxIgo+ICtCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMjgiCj4gIEJSMl9MSU5VWF9LRVJORUxfREVGQ09O
RklHPSJpbXhfdjZfdjciCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+IC1CUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iaW14NnEtc2FicmVzZCBpbXg2ZGwtc2FicmVz
ZCBpbXg2cXAtc2FicmVzZCIKPiArQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9Im54
cC9pbXgvaW14NnEtc2FicmVzZCBueHAvaW14L2lteDZkbC1zYWJyZXNkIG54cC9pbXgvaW14NnFw
LXNhYnJlc2QiCj4gIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9pbXg2LXNhYnJlc2RfcXQ1X2RlZmNvbmZpZyBiL2NvbmZpZ3MvaW14
Ni1zYWJyZXNkX3F0NV9kZWZjb25maWcKPiBpbmRleCBlMzg1ZTg2YjgxYjYuLjU2NDcwZTI3YTlj
MyAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2lteDYtc2FicmVzZF9xdDVfZGVmY29uZmlnCj4gKysr
IGIvY29uZmlncy9pbXg2LXNhYnJlc2RfcXQ1X2RlZmNvbmZpZwo+IEBAIC00LDggKzQsOCBAQCBC
UjJfQVJNX0VOQUJMRV9ORU9OPXkKPiAgQlIyX0FSTV9FTkFCTEVfVkZQPXkKPiAgQlIyX0FSTV9G
UFVfVkZQVjM9eQo+ICAKPiAtIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDUuMTUg
c2VyaWVzCj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15Cj4g
KyMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA2LjYgc2VyaWVzCj4gK0JSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPiAgCj4gICMgQWRkaXRpb25hbCBm
ZWF0dXJlcyBuZWVkZWQgZm9yIHBhY2thZ2VzCj4gIEJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NY
WD15Cj4gQEAgLTI5LDcgKzI5LDcgQEAgQlIyX1JPT1RGU19PVkVSTEFZPSJib2FyZC9mcmVlc2Nh
bGUvaW14Ni1zYWJyZXNkL3Jvb3Rmc19vdmVybGF5Igo+ICBCUjJfVEFSR0VUX1VCT09UPXkKPiAg
QlIyX1RBUkdFVF9VQk9PVF9CT0FSRE5BTUU9Im14NnNhYnJlc2QiCj4gIEJSMl9UQVJHRVRfVUJP
T1RfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSIyMDIyLjA0Igo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIy
MDI0LjA0Igo+ICBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+ICBCUjJfVEFSR0VUX1VC
T09UX1NQTD15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUU9IlNQTCIKPiBAQCAtMzgsMTAg
KzM4LDEwIEBAIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15Cj4gICMgS2VybmVsCj4g
IEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkK
PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNS40MSIKPiArQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjI4Igo+ICBCUjJfTElOVVhf
S0VSTkVMX0RFRkNPTkZJRz0iaW14X3Y2X3Y3Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQ
T1JUPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImlteDZxLXNhYnJlc2Qg
aW14NmRsLXNhYnJlc2QgaW14NnFwLXNhYnJlc2QiCj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVF
X0RUU19OQU1FPSJueHAvaW14L2lteDZxLXNhYnJlc2QgbnhwL2lteC9pbXg2ZGwtc2FicmVzZCBu
eHAvaW14L2lteDZxcC1zYWJyZXNkIgo+ICBCUjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVO
VF9GSUxFUz0iYm9hcmQvZnJlZXNjYWxlL2lteDYtc2FicmVzZC9saW51eF9xdDUuZnJhZ21lbnQi
Cj4gIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAgCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
