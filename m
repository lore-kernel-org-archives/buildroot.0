Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970E6EB64DA
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 02:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06C081D24;
	Sun,  9 Jul 2023 02:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06C081D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLOB0-ncM18l; Sun,  9 Jul 2023 02:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B13381985;
	Sun,  9 Jul 2023 02:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B13381985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB75D1BF592
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 02:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4C9781985
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 02:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4C9781985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPUg0JJhA-jQ for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 02:45:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E6781959
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3E6781959
 for <buildroot@uclibc.org>; Sun,  9 Jul 2023 02:45:23 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b0156a1c4bso2085547fac.1
 for <buildroot@uclibc.org>; Sat, 08 Jul 2023 19:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688870722; x=1691462722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=20BgnixVGt3CJN+MGd9CyO4n2CiSAMM/qgGAjWXUmcU=;
 b=TpfEwgoNYNsN+YEgR6RsYum6T/Fy46JnEwl7ROXr5B0X7t0vn3pMAVHiaIYLEvTsrv
 gh76P6Bfdjf9u9GUnaEf3YTpa4y9N9awDH4LNhIltdKd4vGRSLBcTQophk9Ka6u7jz47
 rSr0U2aAAZS8dQF/vZ7cCMK6hfuzTNLUMXtvAOE6IjIXsUqM+VgZaXh1d/L0aebktAqW
 nZry8kqmz1Hn8TU04FtAjQx3g2i+/8EFB9iOLIJkXIxNFRAcnqtfY0Rg6NDUGQfsAR3z
 J0tARYonzECxZ5kruyJD99KagYFOdOc6WwxXOld4+k+EMLeSIJPEahVTefEZHsJm9IDc
 g2Nw==
X-Gm-Message-State: ABy/qLZ4BFS6V9ehBsDWM5+uXcfRnt+EVN26aW3ffMQDhTw5MT6tic8Q
 OC62AiRQAaRD6D74/6SM4unBOYI33z6g4BBmGJg=
X-Google-Smtp-Source: APBJJlH40ppamMr3BLT/UvYYcmNm8yjMmGXR65Zq48ZOtPUiwJkNKtgRF8VcWJkF06+84lmJJhVjfg==
X-Received: by 2002:a05:6870:7389:b0:1b3:d4fa:cf97 with SMTP id
 z9-20020a056870738900b001b3d4facf97mr8485112oam.5.1688870722065; 
 Sat, 08 Jul 2023 19:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:b403:f707:a7ba:636d:2087:71c7])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056870c38400b001b3d67934e9sm3209721oao.26.2023.07.08.19.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 19:45:21 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@uclibc.org
Date: Sat,  8 Jul 2023 23:45:06 -0300
Message-ID: <20230709024508.236859-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20221208.gappssmtp.com; s=20221208; t=1688870722; x=1691462722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=20BgnixVGt3CJN+MGd9CyO4n2CiSAMM/qgGAjWXUmcU=;
 b=bbIciZt23AaMxq11Eel5MB1sg7kFw61FcuKP7Dc2+J7MWBN25ObpWrcghaa5/n3Z4Z
 c+JbzAVMfY+kY22JkXiBeAxoBxhCr5AGCIenfnkkRKdU1Unuidn/tBZ/LFoTbFWsZRYE
 2iHcn/Y6veWHuINJcMLGdQuMfuMH8tcodOZ3FKAIvIVBbfjrTP30yibn2OXBpcKsORAW
 4grrjnDYkTRBhd4TRVD6D7b1DgQWeLvSPLoQqx6SL365Ohk04rEgU1me1UpZxGKyWYI1
 3DRCSXV6WlOg++dm0E4DCn/iaNaXjT5OB6n3gHL+ft4jm4Bj0koTihrbgREy2JlRoMAe
 opVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20221208.gappssmtp.com
 header.i=@newtesc-com-br.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=bbIciZt2
Subject: [Buildroot] [PATCH] configs: asus_tinker-s_rk3288: new config for
 the "S" variant of the Tinkerboard
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgZHVwbGljYXRlcyB0aGUgYXN1c190aW5rZXJfcmszMjg4X2RlZmNvbmZpZyBj
aGFuZ2luZzoKCiAgLSBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRSB0byByazMyODgt
dGlua2VyLXMKICAtIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHIHRvIHRpbmtlci1z
LXJrMzI4OAogIC0gZXh0bGludXguY29uZiBkZXZpY2V0cmVlIHRvIC9ib290L3JrMzI4OC10aW5r
ZXItcy5kdGIKICAtIHJvb3QgZGV2aWNlIGZvcm1hdCB0byA8bWFqb3I+OjxtaW5vcj4gaW4gb3Jk
ZXIgdG8gcHJldmVudCB0aGUga2VybmVsIHRvIG1vdW50IHJvb3RmcwogICAgZnJvbSB0aGUgd3Jv
bmcgZGV2aWNlCgpTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpv
c0BuZXd0ZXNjLmNvbS5icj4KLS0tCiBib2FyZC9hc3VzL3Rpbmtlci1zL2V4dGxpbnV4LmNvbmYg
ICAgICB8ICA0ICsrKwogYm9hcmQvYXN1cy90aW5rZXItcy9wb3N0LWJ1aWxkLnNoICAgICAgfCAg
OSArKysrKwogYm9hcmQvYXN1cy90aW5rZXItcy9yZWFkbWUudHh0ICAgICAgICAgfCA0MyArKysr
KysrKysrKysrKysrKysrKysrKysKIGNvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29u
ZmlnIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTAy
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3VzL3Rpbmtlci1zL2V4
dGxpbnV4LmNvbmYKIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC9hc3VzL3Rpbmtlci1zL3Bvc3Qt
YnVpbGQuc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3VzL3Rpbmtlci1zL3JlYWRtZS50
eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNv
bmZpZwoKZGlmZiAtLWdpdCBhL2JvYXJkL2FzdXMvdGlua2VyLXMvZXh0bGludXguY29uZiBiL2Jv
YXJkL2FzdXMvdGlua2VyLXMvZXh0bGludXguY29uZgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi41YTJkMDViODExCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYXN1cy90
aW5rZXItcy9leHRsaW51eC5jb25mCkBAIC0wLDAgKzEsNCBAQAorbGFiZWwgVGlua2VyIGxpbnV4
CisgIGtlcm5lbCAvYm9vdC91SW1hZ2UKKyAgZGV2aWNldHJlZSAvYm9vdC9yazMyODgtdGlua2Vy
LXMuZHRiCisgIGFwcGVuZCBjb25zb2xlPXR0eVMyLDExNTIwMG44IHJvb3Q9MTc5OjEgcm9vdHdh
aXQKZGlmZiAtLWdpdCBhL2JvYXJkL2FzdXMvdGlua2VyLXMvcG9zdC1idWlsZC5zaCBiL2JvYXJk
L2FzdXMvdGlua2VyLXMvcG9zdC1idWlsZC5zaApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAw
MDAwMDAwMDAwLi5mZmJiY2RlYjU4Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYXN1cy90aW5r
ZXItcy9wb3N0LWJ1aWxkLnNoCkBAIC0wLDAgKzEsOSBAQAorIyEvYmluL3NoCisKK01LSU1BR0U9
JEhPU1RfRElSL2Jpbi9ta2ltYWdlCitCT0FSRF9ESVI9IiQoZGlybmFtZSAkMCkiCisKKyRNS0lN
QUdFIC1uIHJrMzI4OCAtVCBya3NkIC1kICRCSU5BUklFU19ESVIvdS1ib290LXRwbC5iaW4gJEJJ
TkFSSUVTX0RJUi91LWJvb3QtdHBsLmltZworY2F0ICRCSU5BUklFU19ESVIvdS1ib290LXRwbC5p
bWcgJEJJTkFSSUVTX0RJUi91LWJvb3Qtc3BsLWR0Yi5iaW4gPiAkQklOQVJJRVNfRElSL3UtYm9v
dC10cGwtc3BsLWR0Yi5pbWcKKworaW5zdGFsbCAtbSAwNjQ0IC1EICRCT0FSRF9ESVIvZXh0bGlu
dXguY29uZiAkVEFSR0VUX0RJUi9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKZGlmZiAtLWdp
dCBhL2JvYXJkL2FzdXMvdGlua2VyLXMvcmVhZG1lLnR4dCBiL2JvYXJkL2FzdXMvdGlua2VyLXMv
cmVhZG1lLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zZGZmYTEy
YjQ1Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvYXN1cy90aW5rZXItcy9yZWFkbWUudHh0CkBA
IC0wLDAgKzEsNDMgQEAKK1RpbmtlciBTIFJLMzI4OAorPT09PT09PT09PT09PQorCitUaW5rZXIg
Qm9hcmQgaXMgYSBTaW5nbGUgQm9hcmQgQ29tcHV0ZXIgKFNCQykgaW4gYW4gdWx0cmEtc21hbGwg
Zm9ybQorZmFjdG9yIHRoYXQgb2ZmZXJzIGNsYXNzLWxlYWRpbmcgcGVyZm9ybWFuY2Ugd2hpbGUg
bGV2ZXJhZ2luZyBvdXRzdGFuZGluZworbWVjaGFuaWNhbCBjb21wYXRpYmlsaXR5LiBUaGUgIlMi
IHZhcmlhbnQgb2YgdGhlIFRpbmtlciBCb2FyZCBoYXMgZU1NQworCitUaW5rZXIgbGluazoKK2h0
dHBzOi8vd3d3LmFzdXMuY29tL2JyL21vdGhlcmJvYXJkcy1jb21wb25lbnRzL3NpbmdsZS1ib2Fy
ZC1jb21wdXRlci9hbGwtc2VyaWVzL3Rpbmtlci1ib2FyZC1zLworCitXaWtpIGxpbms6CitodHRw
czovL29wZW5lZGV2LmFtYXJ1bGFzb2x1dGlvbnMuY29tL2Rpc3BsYXkvT0RXSUtJL1RpbmtlcitS
SzMyODgKKworSG93IHRvIGJ1aWxkIGl0Cis9PT09PT09PT09PT09PT0KKworICAkIG1ha2UgYXN1
c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCisKK1RoZW4geW91IGNhbiBlZGl0IHRoZSBidWls
ZCBvcHRpb25zIHVzaW5nCisKKyAgJCBtYWtlIG1lbnVjb25maWcKKworQ29tcGlsZSBhbGwgYW5k
IGJ1aWxkIHJvb3RmcyBpbWFnZToKKworICAkIG1ha2UKKworUHJlcGFyZSB5b3VyIFNEQ2FyZAor
PT09PT09PT09PT09PT09PT09PQorCitCdWlsZHJvb3QgZ2VuZXJhdGVzIGEgcmVhZHktdG8tdXNl
IFNEIGNhcmQgaW1hZ2UgdGhhdCB5b3UgY2FuIGZsYXNoIGRpcmVjdGx5IHRvCit0aGUgY2FyZC4g
VGhlIGltYWdlIHdpbGwgYmUgaW4gb3V0cHV0L2ltYWdlcy9zZGNhcmQuaW1nLgorWW91IGNhbiB3
cml0ZSB0aGlzIGltYWdlIGRpcmVjdGx5IHRvIGFuIFNEIGNhcmQgZGV2aWNlIChpLmUuIC9kZXYv
eHh4KToKKworICAkIHN1ZG8gZGQgaWY9b3V0cHV0L2ltYWdlcy9zZGNhcmQuaW1nIG9mPS9kZXYv
eHh4CisgICQgc3VkbyBzeW5jCisKK0ZpbmFsbHksIHlvdSBjYW4gaW5zZXJ0IHRoZSBTRCBjYXJk
IHRvIHRoZSBUaW5rZXIgUkszMjg4IGJvYXJkIGFuZCBib290IGl0LgorCitOT1RFOgorVVNCIHBv
d2VyIHN1cHBseSByZXF1aXJlcyBtb3JlIHRoYW4gdGhlIHN0YW5kYXJkIDUwMG1BIFVTQiBjdXJy
ZW50LCBzbwordGhpcyBib2FyZCBtdXN0IGJlIHN1cHBsaWVkIGZyb20gYSBjYXBhYmxlIHBvcnQg
b3IgZnJvbSBhbiBleHRlcm5hbAorQUMvREMgYWRhcHRlci4gT3RoZXJ3aXNlIGl0IHdpbGwgaGFu
ZyBmb3JldmVyIHdoaWxlIGxvYWRpbmcgdGhlIGtlcm5lbAoraW1hZ2UuCmRpZmYgLS1naXQgYS9j
b25maWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXN1c190aW5r
ZXItc19yazMyODhfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLjI5MTMzM2YyZGEKLS0tIC9kZXYvbnVsbAorKysgYi9jb25maWdzL2FzdXNfdGlua2VyLXNf
cmszMjg4X2RlZmNvbmZpZwpAQCAtMCwwICsxLDQ2IEBACisjIEFyY2hpdGVjdHVyZQorQlIyX2Fy
bT15CitCUjJfY29ydGV4X2ExNz15CitCUjJfQVJNX0ZQVV9ORU9OX1ZGUFY0PXkKKworIyBMaW51
eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuMSBzZXJpZXMKK0JSMl9QQUNLQUdFX0hPU1Rf
TElOVVhfSEVBREVSU19DVVNUT01fNl8xPXkKKworIyBCb290bG9hZGVyCitCUjJfVEFSR0VUX1VC
T09UPXkKK0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQorQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSIyMDIyLjEwIgorQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9InRpbmtl
ci1zLXJrMzI4OCIKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKK0JSMl9UQVJHRVRfVUJP
T1RfTkVFRFNfUFlUSE9OMz15CitCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRUPXkKK0JS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNTTD15CitCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9E
VEJfSU1HPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMPXkKK0JSMl9UQVJHRVRfVUJPT1RfU1BMX05B
TUU9InNwbC91LWJvb3Qtc3BsLWR0Yi5iaW4gdHBsL3UtYm9vdC10cGwuYmluIgorCisjIEtlcm5l
bAorQlIyX0xJTlVYX0tFUk5FTD15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkK
K0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS4yIgorQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9Im11bHRpX3Y3IgorQlIyX0xJTlVYX0tFUk5FTF9VSU1BR0U9eQor
QlIyX0xJTlVYX0tFUk5FTF9VSU1BR0VfTE9BREFERFI9IjB4MDIwMDAwMDAiCitCUjJfTElOVVhf
S0VSTkVMX0RUU19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJy
azMyODgtdGlua2VyLXMiCitCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKKworIyBG
aWxlc3lzdGVtCitCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9InRpbmtlci1yazMyODgtcyIK
K0JSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0byBUSU5LRVIgUyBSSzMyODghIgor
QlIyX1RBUkdFVF9ST09URlNfRVhUMj15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQorQlIy
X1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSI1MTJNIgorQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RP
T0xTPXkKK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQorQlIyX1BBQ0tBR0VfSE9TVF9NVE9P
TFM9eQorQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUz15CitCUjJfUk9PVEZTX1BPU1RfSU1B
R0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCitCUjJfUk9PVEZTX1BPU1Rf
U0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2FzdXMvdGlua2VyL2dlbmltYWdlLmNmZyIKK0JSMl9ST09U
RlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL2FzdXMvdGlua2VyLXMvcG9zdC1idWlsZC5zaCIK
LS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
