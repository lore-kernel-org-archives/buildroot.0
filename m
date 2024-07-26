Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F431C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 20:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A2D40BBB;
	Fri, 26 Jul 2024 20:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7Pj_iyKU3sg; Fri, 26 Jul 2024 20:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0564540CFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0564540CFB;
	Fri, 26 Jul 2024 20:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 726241BF348
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDF540CFB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrTWRT1v4dYM for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 20:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDB0140BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB0140BBB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB0140BBB
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 20:04:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.233.124]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1rseAI2zBT-00anMt; Fri, 26
 Jul 2024 22:04:05 +0200
Date: Fri, 26 Jul 2024 22:03:52 +0200
MIME-Version: 1.0
Message-Id: <20240726-s6-tests-v1-1-fb57b051e87f@gmx.net>
References: <20240726-s6-tests-v1-0-fb57b051e87f@gmx.net>
In-Reply-To: <20240726-s6-tests-v1-0-fb57b051e87f@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722024243; l=1141;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=va8QgnwrWItfM/svhjfqiyLb1ACZtpAmvFXUINywjSw=;
 b=Eg/nHW13IxyF9lk5UeReFRE1o+mHJ/asXuEh8NAijqMOMEFB1DjwSRKl7xCPFoiJ8z6L0Uk1V
 bGA7bLurzz2B2oalStdCy/fonQW4m2fgRuljnx3IWENGp5C+fEVQqZ8
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:3d/ta+yZlFCuyWwC72QZ79VEJEf+xhVGafnFB9vlddqRgILLxVO
 IcjQ4HrREwLyjQiX77690gwo8S9j1RGmMsleck2xZqI/U4VmEh7NO2HQ+anMPPIDY7kdAE8
 AnjKu3HiXU8oelTx2JDPm+lKtiS1tHoTW4fikzpQEcrAkvIpB6sv4ilohrqhFOOwsL2aLLI
 spzXMtGWctcilqYJFsWNg==
UI-OutboundReport: notjunk:1;M01:P0:niQDeJexEa0=;s2Qma4xiFJL/Dg+KITdoLi/Te87
 aOoWhsTCMlHtD42T3qOJc3HAwlD+HvzbJoVMX0hkOyUrAj3CH0Ko4S1SGKDr9BfbiMYhQ9gjl
 /bDPAEIsFuIf1N6qqK4akKhKyKKGASQh0ok5+xoXfyXszXM02dtMPWDB9Mq7zL1UZtyJDIrnO
 92Q4rp1zsfIVY8ClU8QGfKPhTzPNwwnAOhF69rIXDbyS7bMhgjoJdREWUGnZq5Z32zvJ+KO1c
 YHmFYRbVSq20We+lxuBoVjthgFz+dCGOqlqS+49EFyIyD3RiKXOUTb36sGSQdIJpIXkdkVvuO
 I9x8GQvX4Lvzu57+0yT7XRMfopQNU/2omW1eyf34ydysNq9T7kaD7OlLH4VPG/6M8jTKeAKOY
 AIGuibgpi0kU1yLPcA9Ry7BiWbAEJqkyBYxFXIQIgKgyyvKdIHGa2yBh16uzDiuD8Xhn2SiLn
 ShehGS2Hdjk6b8YFeWu24qbVyOzz2Jv5FTkIMISz41otbtfkKxWXJEMQYWNzAAm2Bj6eEmmIN
 bIVAVqwyksZvrbIBZdPl6pYsh3gak6KlAT54QzLw4SyKnZoxME9ZzDdMcgFtAd39bw7gzrVE+
 1Ge4ywqUeSaNKLU7nV54q28MHfxF5S0ChWeamdXZpAljt5WVukLsllf4fRpbmqoCtfLsKP1ZO
 DiIwOp8RWUYB5kZSnBYAZmWVrcrQAyyHKeVmlCG8R0q2MfqLw4FyIZggzgj1D7ir8S0TtFgX4
 0mTth8xligv0QWyqfJCVVDtqkW5SSEHD3Qqq0MVv9cZ4zWOTuwJy8YWmqLJgM45mthSBPVgk5
 6H4M6u7ys6EEkkJs9FZ3O6eQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722024245; x=1722629045; i=j.neuschaefer@gmx.net;
 bh=UBCpecajiKXwsMPD4tf/5l/qoNlKX0vp9Rk0shrXiPA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l+7JXzALlDXMCmXKibMW5eiI9FHEwKznnxAGg1aa4uRT43KRR5pD650tZBmyeZbM
 LJ8cV82fX1zh17l9ztt1izWoGjdB6dbN06tiWVPZJIDL2iUTOJt/zx6Km138rkNVn
 o1zqwe8fMzVF3LXkDAUduEU+11PRtV72flk91wu82dpcdj0NfQ8Q+3qahjs1M7lFE
 T/fOPW64u9J274+ea4LC39wnas1B+1SJpMD8cN3kFqCM7k6lfaYLnoWEy6IhLtcSy
 hvZrWq3RPhmJSMB1GipxInyi6o7IT2H/u5fgDLzEUzl02GTr4amiEMv0h21/Fz62B
 zU/DjkRgxkC42/rAIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=l+7JXzAL
Subject: [Buildroot] [PATCH 1/2] support/testing: Fix s6-portable-utils test
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

czYtdGVzdCB3YXMgcmVtb3ZlZCBpbiBzNi1wb3J0YWJsZS11dGlscyAyLjMuMC4wLCBhbmQgcmVw
bGFjZWQgd2l0aAplbHRlc3QgKGZyb20gZXhlY2xpbmUpLiBUaGlzIGNoYW5nZSBicm9rZSB0aGUg
ZXhpc3RpbmcgcnVudGltZSB0ZXN0cwp3aXRoIGNvbW1pdCA0MmZhZDAzMTgyICgicGFja2FnZXM6
IGJ1bXAgc2thbGlicy1yZWxhdGVkIHBhY2thZ2VzIikuCgpJbnN0ZWFkIG9mIHM2LXRlc3Qgc2lt
cGx5IHVzZSB0aGUgc2hlbGwgYnVpbHQtaW4gInRlc3QiLCB3aGljaCBwcm92aWRlcwpzdWZmaWNp
ZW50IGZ1bmN0aW9uYWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PgotLS0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
czZfcG9ydGFibGVfdXRpbHMucHkgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3M2X3BvcnRhYmxlX3V0aWxzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9zNl9wb3J0YWJsZV91dGlscy5weQppbmRleCAzNzJlM2JhODEyLi5kNGRmNzBj
ZDUxIDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3M2X3Bv
cnRhYmxlX3V0aWxzLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
czZfcG9ydGFibGVfdXRpbHMucHkKQEAgLTI4LDUgKzI4LDUgQEAgY2xhc3MgVGVzdFM2UG9ydGFi
bGVVdGlscyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgoKICAgICAgICAgXywgZXhpdF9jb2RlID0g
c2VsZi5lbXVsYXRvci5ydW4oInM2LW1rZmlmbyB0ZXN0cGlwZSIpCiAgICAgICAgIHNlbGYuYXNz
ZXJ0RXF1YWwoZXhpdF9jb2RlLCAwKQotICAgICAgICBfLCBleGl0X2NvZGUgPSBzZWxmLmVtdWxh
dG9yLnJ1bigiczYtdGVzdCAtcCB0ZXN0cGlwZSIpCisgICAgICAgIF8sIGV4aXRfY29kZSA9IHNl
bGYuZW11bGF0b3IucnVuKCJ0ZXN0IC1wIHRlc3RwaXBlIikKICAgICAgICAgc2VsZi5hc3NlcnRF
cXVhbChleGl0X2NvZGUsIDApCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
