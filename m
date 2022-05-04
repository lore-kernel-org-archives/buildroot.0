Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B50EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 22:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8916680B2D;
	Wed,  4 May 2022 22:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ia9E2hwW4pv; Wed,  4 May 2022 22:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D9C83F91;
	Wed,  4 May 2022 22:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7F21BF3C8
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 22:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6152583F91
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 22:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXDyz32-EFf3 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 22:21:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6799A83F90
 for <buildroot@buildroot.org>; Wed,  4 May 2022 22:21:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y32so4658719lfa.6
 for <buildroot@buildroot.org>; Wed, 04 May 2022 15:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=KBfqsK+gcO7iKMsezS23VB2pQI1TSBXlZT1tdI633Xg=;
 b=NXAHXtaB4ZRL9HOBk9gqzs53D4ONbc5TR208fNdFQ2t9vHKlNlvQKZtz2OG0qKON6s
 GS+luyZUdZVRNtmVuWU5EjdbdePKsRXYLlT+/SK8wbvfvZZMM5CRiFCXkvPxXqlVoURZ
 HDc6tNKDQo4zxcauemZ4YPoJDa2xtq8HQpzwXDgXU5mAH1t0RkPfHqTzZebVheMUJ8l+
 HJTwPsPOvh23ujTkPBWec80SiRaSf2Rob9/Qs6OCTmLaJ+MVoce95jlVzEQHKqzhMX4U
 YRn9/JMDv6sAanqDeAW4DrxIUvm5jGNNLPArLflQ71vQCe51lm+c3Idnkfsm/ILF+7qU
 fw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=KBfqsK+gcO7iKMsezS23VB2pQI1TSBXlZT1tdI633Xg=;
 b=NTH6wWDkqV7GdxQAMb34bSaIWjC4vQ01FIwVOYw0wP2mg00zgl4LJ1HP+sfQJc79Ep
 U91Ai7c0XAXu+3bckVgQdRHSYKQfI3JnshUTf1185ZXccrfoELVXbDpigHWaF6ojawL0
 AII9V0eb/eybAVvRhbFHS2KjOVS9d8tR/1zqXrGwn+DNclcBm8/Dap5cVzMMJovTp47D
 YV+pmuiPv9bhu1fmvPiFKoNMC+jp9syUesmxXgfx+rrcjUPrYwM3yeWS9ijUAvCuzDyt
 HX7rHpeGB3OiQx2J3Y9bKvMPJ1F04Rmjty5F3yjGwAYUd7Vl9gAcz2RMO//uIIfJSuIi
 HMag==
X-Gm-Message-State: AOAM530SeSg2W+eORcJbK/XdniBMUS9gJezC8JKH1jAGDifeFmqaZaT4
 WhgyJII1s2pPGJtXt4kSivkqQyr7md9ERK4bG04rLl50dX4xeL1X
X-Google-Smtp-Source: ABdhPJxZzA0KWAYP/sclL31OXpXViKSFfhymSfsYizj1Wh+NTKmaE0eCfK45n6XO15dPeQX8OF1SzflInVrpnoEpi0k=
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id
 p25-20020a056512139900b004489f0bbf4fmr15180610lfa.67.1651702877044; Wed, 04
 May 2022 15:21:17 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 4 May 2022 23:21:06 +0100
Message-ID: <CAEXMXLSha38Ybck+-p9Tnx4cQqPJbXfFQ17qFMDTrpvjh_tEeA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATC] package/google-breakpad: add option to build
 target tools
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

VGhpcyB0b29scyBhcmUgcmVxdWlyZWQgZm9yIGRlYnVnIHNjZW5hcmlvcyB3aGVyZSB0aGUgZGVi
dWcKaGFwcGVucyBpbi10YXJnZXQuCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIEdvbsOnYWx2ZXMgPG51
bm9qcGdAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZpZy5pbiAg
ICAgICAgICB8IDEyICsrKysrKysrKysrKwogcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xl
LWJyZWFrcGFkLm1rIHwgIDUgKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0Nv
bmZpZy5pbgpiL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZpZy5pbgppbmRleCAwN2M0OTk5
NmRkLi4wY2I4ODFhNGM5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC9Db25m
aWcuaW4KKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvQ29uZmlnLmluCkBAIC0zNCw2ICsz
NCwxOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFLUEFECgogICAgaHR0cHM6Ly9j
aHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2JyZWFrcGFkL2JyZWFrcGFkCgoraWYgQlIyX1BBQ0tB
R0VfR09PR0xFX0JSRUFLUEFECitjb25maWcgQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFLUEFEX1RP
T0xTCisgYm9vbCAiQnVpbGQgdGFyZ2V0IHRvb2xzIgorIGhlbHAKKyAgICBCdWlsZCBwcm9jZXNz
b3IgYW5kIHRvb2xzIGZvciB0YXJnZXQgYXMgZHVtcF9zeW1zLCBtaW5pZHVtcF9zdGFja3dhbGsK
KyAgICBhbmQgbWljcm9kdW1wX3N0YWNrd2Fsay4KKworICAgIFRoaXMgdG9vbHMgYXJlIGluc3Rh
bGxlZCB0byB0aGUgc3RhZ2luZyBmb2xkZXIgb25seSwgc28gbm90IHBhcnQgb2YKKyAgICB0aGUg
dGFyZ2V0IGltYWdlIGJ5IGRlZmF1bHQuCisKK2VuZGlmICMgQlIyX1BBQ0tBR0VfR09PR0xFX0JS
RUFLUEFECisKIGNvbW1lbnQgImdvb2dsZS1icmVha3BhZCByZXF1aXJlcyBhIGdsaWJjIG9yIHVD
bGliYyB0b29sY2hhaW4gdy8Kd2NoYXIsIHRocmVhZCwgQysrLCBnY2MgPj0gNC44IgogIGRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFLUEFEX0FSQ0hfU1VQUE9SVFMKICBkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX0hPU1RfR09PR0xFX0JSRUFLUEFEX0FSQ0hfU1VQUE9SVFMKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL2dvb2dsZS1icmVha3BhZC5tawpiL3BhY2th
Z2UvZ29vZ2xlLWJyZWFrcGFkL2dvb2dsZS1icmVha3BhZC5tawppbmRleCBjYWZlMTM1OWYzLi5k
YzQxN2Y0NjM3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC9nb29nbGUtYnJl
YWtwYWQubWsKKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLm1r
CkBAIC03LDcgKzcsNiBAQAogR09PR0xFX0JSRUFLUEFEX1ZFUlNJT04gPSBjODVlYjRhNTliNjE4
ZjNiZWFhZDU0NDVjZWIxZjg2NWZmYThlZmRmCiBHT09HTEVfQlJFQUtQQURfU0lURSA9IGh0dHBz
Oi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9icmVha3BhZC9icmVha3BhZAogR09PR0xFX0JS
RUFLUEFEX1NJVEVfTUVUSE9EID0gZ2l0Ci1HT09HTEVfQlJFQUtQQURfQ09ORl9PUFRTID0gLS1k
aXNhYmxlLXByb2Nlc3NvciAtLWRpc2FibGUtdG9vbHMKICMgT25seSBhIHN0YXRpYyBsaWJyYXJ5
IGlzIGluc3RhbGxlZAogR09PR0xFX0JSRUFLUEFEX0lOU1RBTExfVEFSR0VUID0gTk8KIEdPT0dM
RV9CUkVBS1BBRF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKQEAgLTM4LDUgKzM3LDkgQEAgZGVmaW5l
IEdPT0dMRV9CUkVBS1BBRF9FWFRSQUNUX1NZTUJPTFMKIGVuZGVmCiBHT09HTEVfQlJFQUtQQURf
VEFSR0VUX0ZJTkFMSVpFX0hPT0tTICs9IEdPT0dMRV9CUkVBS1BBRF9FWFRSQUNUX1NZTUJPTFMK
CitpZmVxICgkKEJSMl9QQUNLQUdFX0dPT0dMRV9CUkVBS1BBRF9UT09MUyksKQorR09PR0xFX0JS
RUFLUEFEX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS1wcm9jZXNzb3IgLS1kaXNhYmxlLXRvb2xzCitl
bmRpZgorCiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCiAkKGV2YWwgJChob3N0LWF1dG90
b29scy1wYWNrYWdlKSkKLS0gCjIuMzIuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
