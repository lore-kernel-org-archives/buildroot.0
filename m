Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61651C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C6A41726;
	Sat, 23 Apr 2022 15:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKRIhIqT6L0y; Sat, 23 Apr 2022 15:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C336E41682;
	Sat, 23 Apr 2022 15:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA7C1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D8BC814B5
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDgH3PbSM01z for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:05:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E636C8134C
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:05:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k23so21602035ejd.3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=TKEIkTT4A22I5LX2sA2TbP9cm04mJbocOE8v/t9uBLI=;
 b=gSuxA1BVY6cW6LkTR9lRJ8Ne3H4wMdP2ifh0NkvgCXj8Runofxg5WFh6dQoTWVLuPH
 fncMdKBofT3LPCaX6X78ao8ryB52KwZXS/QsdKS1bPXmcMawq5J1RqH9R4KkY7qwwJsp
 d0oU+xsMVBehou8+F+JQecbhi5Ip9BKeM4OVMYPr+XLZsacN2uqif77lrsQ5WLXTsqQ0
 zLycFIq3TQ0HZC6YKjicD6rHlhH27qmRKSHrL93SUMzcVQe6hrxGxCSix69nJ1Kkw3xe
 XvPPB4bF2JziKNaiodmx6yKSkatw6sMkwIE3j9D8eSlG5mOdL5j9pKYgwenQje115HqJ
 Z8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TKEIkTT4A22I5LX2sA2TbP9cm04mJbocOE8v/t9uBLI=;
 b=t+BhDk9gCAVXWBwropQdHUtxIi5306Vlz8/hJp+2T1i0L9wXQZbbC/HQBcutS+l6Jo
 2j/q42z/DmnU5egZ0Y3Tu3D8N/ND6XFyRKthKoLBfM29t9WWWotxlCXAakDPy5tabzKd
 0eY1xqnsaF7nH0mghSDIKJrUOfjkK0tp5MzWpW1G3dk2u6dRf+pX0pYPv3TyTGycMLhp
 n8L5qOk7oZmZ6hUn8ps4V9pVyHE8qOC5F/Cziqg3E30UT8QwksANLfdWyqIVRtwo/OTi
 GgoxK7cvspIioy2hB6SQY2vNQzM7tpx4sa07NUUH55ecEeqfdmH6gsb2RmHIjIDAuRbD
 EmjQ==
X-Gm-Message-State: AOAM533KLcD6NfoZaxiWl/AD/iMyPWRs3KCjBF68zMfLY/nRh5nExwgr
 zYJM1DcCnHqTPvrNA0jijki51A==
X-Google-Smtp-Source: ABdhPJySFffWwYmg+Vn/gvVzMcBWTcZWeFPx1m2fHbG+QMYc2kdHNPvCuyGxxBJxVsDaT3JDaPHNdA==
X-Received: by 2002:a17:907:970e:b0:6ef:ef30:bfa3 with SMTP id
 jg14-20020a170907970e00b006efef30bfa3mr8871374ejc.54.1650726313085; 
 Sat, 23 Apr 2022 08:05:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a50c313000000b0041fb0f2e155sm2368936edb.20.2022.04.23.08.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:05:12 -0700 (PDT)
Message-ID: <e3773cae-4423-89ed-8f47-bef87d335043@mind.be>
Date: Sat, 23 Apr 2022 17:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419090055.2029170-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419090055.2029170-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/trinity: fix musl build
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

CgpPbiAxOS8wNC8yMDIyIDExOjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgb24gbXVzbDoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gL252bWVkYXRhL2F1dG9idWlsZC9pbnN0YW5jZS0xNy9vdXRwdXQtMS9ob3N0L3Bvd2VycGM2
NC1idWlsZHJvb3QtbGludXgtbXVzbC9zeXNyb290L3Vzci9pbmNsdWRlL2FzbS9pb2N0bC5oOjEy
LAo+ICAgICAgICAgICAgICAgICAgIGZyb20gL252bWVkYXRhL2F1dG9idWlsZC9pbnN0YW5jZS0x
Ny9vdXRwdXQtMS9ob3N0L3Bvd2VycGM2NC1idWlsZHJvb3QtbGludXgtbXVzbC9zeXNyb290L3Vz
ci9pbmNsdWRlL2xpbnV4L2lvY3RsLmg6NSwKPiAgICAgICAgICAgICAgICAgICBmcm9tIC9udm1l
ZGF0YS9hdXRvYnVpbGQvaW5zdGFuY2UtMTcvb3V0cHV0LTEvaG9zdC9wb3dlcnBjNjQtYnVpbGRy
b290LWxpbnV4LW11c2wvc3lzcm9vdC91c3IvaW5jbHVkZS9saW51eC9mcy5oOjE0LAo+ICAgICAg
ICAgICAgICAgICAgIGZyb20gaW9jdGxzL3Zmcy5jOjM6Cj4gaW9jdGxzL3Zmcy5jOjEwOTozNTog
ZXJyb3I6ICdsb2ZmX3QnIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pOyBkaWQg
eW91IG1lYW4gJ29mZl90Jz8KPiAgICAxMDkgfCAgeyAubmFtZSA9ICJGSU9RU0laRSIsIC5yZXF1
ZXN0ID0gRklPUVNJWkUsIH0sCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+Cj4gCj4gRml4ZXM6Cj4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy9yZXN1bHRzL2I3ZjQ2MDcyNzUxYThkNzBmYTAyZjFjNjI1YzUyNzlmNzBiZWM4NTMK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdt
YWlsLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gLS0tCj4gICAuLi4vMDAwMy1Vc2UtZmNudGwtaC1mb3ItZGV2X3QtbW9kZV90LnBhdGNo
ICAgfCA0NiArKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0
aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdHJpbml0eS8wMDAzLVVzZS1m
Y250bC1oLWZvci1kZXZfdC1tb2RlX3QucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90
cmluaXR5LzAwMDMtVXNlLWZjbnRsLWgtZm9yLWRldl90LW1vZGVfdC5wYXRjaCBiL3BhY2thZ2Uv
dHJpbml0eS8wMDAzLVVzZS1mY250bC1oLWZvci1kZXZfdC1tb2RlX3QucGF0Y2gKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmM0ZDk4MTFiOGEKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS90cmluaXR5LzAwMDMtVXNlLWZjbnRsLWgtZm9yLWRldl90LW1v
ZGVfdC5wYXRjaAo+IEBAIC0wLDAgKzEsNDYgQEAKPiArRnJvbSBiMWEwYWVmOTk3OGQ0YTQxZTdl
NjAxYzI3N2Q0ZmIxYjBjZmJlZDg5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBE
YXZlIEpvbmVzIDxkYXZlakBjb2RlbW9ua2V5Lm9yZy51az4KPiArRGF0ZTogVGh1LCAyNiBBdWcg
MjAyMSAxMToxNzozNCAtMDQwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIFVzZSBmY250bC5oIGZvciBk
ZXZfdCAmIG1vZGVfdAo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+
ICsKPiArU2hvdWxkIGZpeDoKPiArCj4gK0luIGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1
ZGUvYml0cy9zdGF0eC5oOjMxLAo+ICsgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9pbmNsdWRl
L3N5cy9zdGF0Lmg6NDQ2LAo+ICsgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9maWxlcy5o
OjMsCj4gKyAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL3NobS5oOjYsCj4gKyAgICAgICAg
ICAgICAgICAgZnJvbSBzeXNjYWxscy94ODYvbW9kaWZ5X2xkdC5jOjEyOgo+ICsvdXNyL2luY2x1
ZGUvbGludXgvc3RhdC5oOjU3OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3M2NOKA
mQo+ICsgIF9fczY0IHR2X3NlYzsKPiArICBefn5+fgo+ICsvdXNyL2luY2x1ZGUvbGludXgvc3Rh
dC5oOjU4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3UzMuKAmQo+ICsgIF9fdTMy
IHR2X25zZWM7Cj4gKyAgXn5+fn4KPiArL3Vzci9pbmNsdWRlL2xpbnV4L3N0YXQuaDo1OToyOiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX19zMzLigJkKPiArICBfX3MzMiBfX3Jlc2VydmVk
Owo+ICsgIF5+fn5+Cj4gKy91c3IvaW5jbHVkZS9saW51eC9zdGF0Lmg6MTAxOjI6IGVycm9yOiB1
bmtub3duIHR5cGUgbmFtZSDigJhfX3UzMuKAmQo+ICsgIF9fdTMyIHN0eF9tYXNrOyAvKiBXaGF0
IHJlc3VsdHMgd2VyZSB3cml0dGVuIFt1bmNvbmRdICovCj4gKwo+ICtbUmV0cmlldmVkIGZyb206
Cj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWxzbGFja2VyL3RyaW5pdHkvY29tbWl0L2IxYTBh
ZWY5OTc4ZDRhNDFlN2U2MDFjMjc3ZDRmYjFiMGNmYmVkODldCj4gK1NpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICstLS0KPiArIGlu
Y2x1ZGUvZmlsZXMuaCB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2luY2x1ZGUvZmlsZXMuaCBiL2luY2x1
ZGUvZmlsZXMuaAo+ICtpbmRleCAyYThlMGUyZC4uYmEzY2M5OGYgMTAwNjQ0Cj4gKy0tLSBhL2lu
Y2x1ZGUvZmlsZXMuaAo+ICsrKysgYi9pbmNsdWRlL2ZpbGVzLmgKPiArQEAgLTEsNiArMSw2IEBA
Cj4gKyAjcHJhZ21hIG9uY2UKPiArCj4gKy0jaW5jbHVkZSA8c3lzL3N0YXQuaD4KPiArKyNpbmNs
dWRlIDxmY250bC5oPgo+ICsgI2luY2x1ZGUgImZkLmgiCj4gKwo+ICsgdW5zaWduZWQgbG9uZyBn
ZXRfb19mbGFncyh2b2lkKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
