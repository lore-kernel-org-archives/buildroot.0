Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D750682C75;
	Sun,  5 Dec 2021 10:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqAWHZgHK8jB; Sun,  5 Dec 2021 10:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2967D82AED;
	Sun,  5 Dec 2021 10:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAD81BF96B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BBEC4045D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tn0JV-ceTnS6 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:09:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E15654045B
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:09:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v11so15806548wrw.10
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ugA03wUdd/LYw5pgjlGBtB4I8ru1cz7uIL7K2INMJ98=;
 b=lC28DcYMaekCvGTKE0jwJdNM2NFVxPGd/O2o6Xzi0RwzbHDi9rsPiV+7TYKyma2RgM
 tJH8jmSbUYdHrV36ZBJUduXYCXa2oVF1CUEwAyYCSAW/LHKQcUY6BEgiYioyBBqCuu1I
 Yb0SrCOkUXCb8MwxZ+D6lBD59nszNrDtuAaQ+bXKEGaiq44PtXoLn4dzZ5L/wqqleRse
 CEhdgKuZtC+j8/Cg5NhECsNaBRriOFX5hqT/njugq+MhSZQDaZ3bxIONm2L+nRbK2Mll
 g+6OfAqU8dZNlXsKLn/r08Iv5oAI016405TG8l9UlD0s5YnTtfIwdz94/6yXJI8rM8Q7
 EmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ugA03wUdd/LYw5pgjlGBtB4I8ru1cz7uIL7K2INMJ98=;
 b=YmiNABWDyyOYuvGOpV77/wRpwpZLW6TIP+km822lDESmFMnIzM1t0/AoJh0ymjEgpd
 O6azJ+DDcNEnRwVj9t5lLUQLuH/zatvHma/e/VxVDJ1BMf2ABWoM5KsrvFb+m5MGCAIh
 eBzsPxNySsgXgehffkv3UmUWZFMpYtEotka49MwgLhW/qB/FF31gY7IzDo7qZcaD9vsA
 MWE+lEC0gT653BdntRNpDqDyt7dk6XoT/JmENK2ntRIhQkla1SJvoEXTezZjnwytvbr3
 1eN/+6B8Hpwu06ts0CCQB3IB77KGZ5euN3uRHdRSxWiop+4Mu0AOr34NyroRazvV0U1p
 msqA==
X-Gm-Message-State: AOAM531DmYnKqDKwP0xL1lIqMEUbgSQ2bP+uQfavKkhwpdO0Sj9dCg83
 YoUuTOCZZL31Tr94bDCHAz9sGDoKLWQ=
X-Google-Smtp-Source: ABdhPJyfoO/HD4BhAMS6YDMmQu3WfPmLUKPHbQCmXG3iIXaAP2OE1U28YXlwsC4rP5b/Tj3Rtqu21w==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr36047255wri.355.1638698987956; 
 Sun, 05 Dec 2021 02:09:47 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:61fe:1eac:b67b:59f4])
 by smtp.gmail.com with ESMTPSA id e12sm10259959wrq.20.2021.12.05.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:09:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:09:42 +0100
Message-Id: <20211205100942.1324791-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/pc_x86_64_bios_defconfig: fix image
 generation after grub2 rework
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDgyZDFlOGM2MjhjYyAoYm9vdC9ncnViMjogdXNlIG5vbmUgcGxhdGZvcm0gd2hlbiBi
dWlsZGluZyBmb3IKaG9zdCkgY2hhbmdlZCBob3N0LWdydWIyIHRvIG9ubHkgaW5zdGFsbCB0aGUg
dG9vbHMsIG5vdCB0aGUgYWN0dWFsCmJvb3Rsb2FkZXIgb3IgaXRzIG1vZHVsZXMsIGFzIHRoZXkg
YXJlIG9mIG5vIHVzZSBvbiB0aGUgaG9zdC4KCkl0IHNvIGhhcGVubmVkIHRoYXQsIHdoZW4gbm90
IGlzbnRydWN0ZWQgdG8gYnVpbHQgZm9yIGEgc3BlY2lmaWMKcGxhdGZvcm0sIHRoZSBncnViMiBi
dWlsZHN5c3RlbSB3b3VsZCBkZWZhdWx0IHRvIGJ1aWxkIHRoZSBsZWdhY3kgYmlvcwpwbGF0Zm9y
bSAoYXQgbGVhc3Qgd2hlbiB0aGUgYnVpbGQgaGFwcGVucyBvbiBhbiB4ODYgb3IgeDg2XzY0IGhv
c3QpLgoKSG93ZXZlciwgYmVjYXVzZSB0aGUgaG9zdCBpcyBtb3JlIG9mdGVuIHRoYW4gbm90IGFu
IHg4NiBvciB4ODZfNjQsIHdoZW4KdGhlIHRhcmdldCB3YXMgYWxzbyBhbiB4Njggb3IgeDg2XzY0
LCB0aGUgbW9kdWxlcyBidWlsdCBmb3IgdGhlIGhvc3QKY291bGQgYmUgcmUtdXNlZCBmb3IgdGhl
IHRhcmdldCwgYW5kIHRoaXMgaXMgd2hhdCB3YXMgZG9uZSBmb3Igb3VyCnBjX3g4Nl82NF9iaW9z
X2RlZmNvbmZpZy4KCkJ1dCBub3cgdGhhdCB3ZSBleHBsaWNpdGx5IHRlbGwgdGhlIGdydWIyIGJ1
aWxkc3lzdGVtIHRvIG5vdCBidWlsZCBhbnkKcGxhdGZvcm0gd2hlbiB3ZSBidWlsZCBob3N0LWdy
dWIyLCB3ZSBubyBsb25nZXIgaGF2ZSBhY2Nlc3MgdG8gdGhlIGdydWIyCm1vZHVsZXMgZnJvbSB0
aGUgaG9zdCBkaXJlY3RvcnksIGFkbiB0aGUgYnVpbGQgZmFpbHMgd2hlbiBhc3NlbWJsaW5nIHRo
ZQpmaW5hbCBpbWFnZS4KCldlIGZpeCB0aGF0IGluIHR3byB3YXkuCgpGaXJzdCwgd2UgZW5zdXJl
IHRoYXQgaW5kaXZpZHVhbCBtb2R1bGVzIGZyb20gdGhlIHRhcmdldCBncnViMiBnZXQKaW5zdGFs
bGVkIGluIHRhcmdldC87IHdlIGNhbiBvbmx5IGRvIHRoYXRpZiB0aGUgdGFyZ2V0IGdydWIyIHRv
b2xzIGFyZQphbHNvIGluc3RhbGxlZCwgc28gd2UgZW5hYmxlIHRoYXQgaW4gdGhlIGNvbmZpZ3Vy
YXRpb24uCgpTZWNvbmQsIHdlIGZpeCB0aGUgcG9zdC1idWlsZCBzY3JpcHQgdG8gbG9vayBpbiB0
YXJnZXQvIHJhdGhlciB0aGFuIGluCmhvc3QvLgoKQWxsIHRoYXQsIGp1c3QgZm9yIHRoZSA1MTIt
Ynl0ZSBib290LmltZyBib290c3RyYXAsIHdoaWNoIHB1bGxzIGluIGFsbAp0aGUgb3RoZXIgbW9k
dWxlcyAoNC4zTWlCKSwgdGhlIHRvb2xzICg4LjhNaUIpLi4uIEJ1dCB3ZSBhcmUgbm90IGdvaW5n
CnRvIGNoZXJyeS1waWNrIGluZGl2aWR1YWwgbW9kdWxlczsgdGhpcyBpcyBlcnJvciBwcm9uZSBh
bmQKdW5tYWludGFpbmFibGUuLi4KClJlcG9ydGVkLWJ5OiBBZGFtIER1c2tldHQgPGFkdXNrZXR0
QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4
QGZyZWUuZnI+CkNjOiBLw7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4K
LS0tCiBib2FyZC9wYy9wb3N0LWJ1aWxkLnNoICAgICAgICAgICB8IDIgKy0KIGNvbmZpZ3MvcGNf
eDg2XzY0X2Jpb3NfZGVmY29uZmlnIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3BjL3Bvc3QtYnVpbGQuc2gg
Yi9ib2FyZC9wYy9wb3N0LWJ1aWxkLnNoCmluZGV4IGRiMjM3OTVlMjcuLmM3NmRlZTI2NzYgMTAw
NzU1Ci0tLSBhL2JvYXJkL3BjL3Bvc3QtYnVpbGQuc2gKKysrIGIvYm9hcmQvcGMvcG9zdC1idWls
ZC5zaApAQCAtMTEsNSArMTEsNSBAQCBlbHNlCiAgICAgY3AgLWYgIiRCT0FSRF9ESVIvZ3J1Yi1i
aW9zLmNmZyIgIiRUQVJHRVRfRElSL2Jvb3QvZ3J1Yi9ncnViLmNmZyIKIAogICAgICMgQ29weSBn
cnViIDFzdCBzdGFnZSB0byBiaW5hcmllcywgcmVxdWlyZWQgZm9yIGdlbmltYWdlCi0gICAgY3Ag
LWYgIiRIT1NUX0RJUi9saWIvZ3J1Yi9pMzg2LXBjL2Jvb3QuaW1nIiAiJEJJTkFSSUVTX0RJUiIK
KyAgICBjcCAtZiAiJFRBUkdFVF9ESVIvbGliL2dydWIvaTM4Ni1wYy9ib290LmltZyIgIiRCSU5B
UklFU19ESVIiCiBmaQpkaWZmIC0tZ2l0IGEvY29uZmlncy9wY194ODZfNjRfYmlvc19kZWZjb25m
aWcgYi9jb25maWdzL3BjX3g4Nl82NF9iaW9zX2RlZmNvbmZpZwppbmRleCAzMjkwYTFkZGEwLi5k
ZjU5ODhkNzVlIDEwMDY0NAotLS0gYS9jb25maWdzL3BjX3g4Nl82NF9iaW9zX2RlZmNvbmZpZwor
KysgYi9jb25maWdzL3BjX3g4Nl82NF9iaW9zX2RlZmNvbmZpZwpAQCAtMTMsNiArMTMsNyBAQCBC
UjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkKIAogIyBCb290bG9hZGVyCiBCUjJfVEFSR0VUX0dS
VUIyPXkKK0JSMl9UQVJHRVRfR1JVQjJfSU5TVEFMTF9UT09MUz15CiAKICMgRmlsZXN5c3RlbSAv
IGltYWdlCiBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
