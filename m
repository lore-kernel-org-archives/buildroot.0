Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71408CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7154168F;
	Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJnwNz1JhwWk; Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF03F41720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF03F41720;
	Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 030CD1BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FBA608F1
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKueDSc1bNIH for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34346608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34346608E9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34346608E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41663330f9dso816485e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486116; x=1713090916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UpXG/DBoBxcrxSgtopykqvjlCkDgIZNngVDSzKxuqlc=;
 b=MXl3ecX+4pG1HMAELLG+NqfCRgHGdYXDwjcD1cGTltmV7Ik46DwrXLNgHI2jk/zgra
 z3PDAKr8cMdlFpdVSjMC0up9tplQ2SCjn62uAJFgzPyHhMv82HS3MRVVhKn6v13i6xax
 S1Bn+3qu/FFv19BzrONlJdM2ywiAF15aiPYJDT2FlDYtb6P9jHTIndDGes3DytIb2Uc/
 PiChSvhPM08CsuMyiySEwlBb6r5FvltCQjkVrI8S20vOPr/oD/M3yJNKAt/ZPvXotGe0
 qRYDMZnMz1Qvm3tE9zyX0ev0PkIhKtrjIRmCKKqiR7jm4h4u0C4Oda8Oa2G6alKLxvY9
 /vQQ==
X-Gm-Message-State: AOJu0YwP7ngjBZq6ruOYEiDJp/7LJ1MPyUJleGg1oivAStcJ7RoTK6g6
 PuHEvJ344HKCYcmLoku6iC5t7P+lxXC7k1C6kVuIqgsYbutyw70eMab9sL7fg5VCyaP1GvKp9XF
 E
X-Google-Smtp-Source: AGHT+IHq7KCcBng34/KSIXj7pwL5uDW70eLqN4WOPNfP1YjbvueoXJa1lfuDivVByTogxSLW6BibpA==
X-Received: by 2002:a05:600c:539b:b0:415:5732:65d3 with SMTP id
 hg27-20020a05600c539b00b00415573265d3mr5080407wmb.37.1712486115830; 
 Sun, 07 Apr 2024 03:35:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:15 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:53 +0200
Message-ID: <20240407103512.1112712-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486116; x=1713090916;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UpXG/DBoBxcrxSgtopykqvjlCkDgIZNngVDSzKxuqlc=;
 b=xZGdGvjt2/m0+y75uzPgBJT1X3FLGylXL2a2Have/4+qru5V/UW9qO6KN7ni49ptfJ
 NZz5OHX+/OjERCaBmcyj82V0s3lHRuH7IoShWy4RcsjCx6uTd0Nr4RQduVJRByhtyiVg
 fQIeJAZl5M0WWyFuTf/uHsdmKHHJQcb2nReylru72eXkWgbbJH3irpCaxwlIMbxxF5ni
 Pd6ZXuIilqoFXBEOiDoZhVec2Lk3Jq4LUR+2K112uAhfIUkVI7Ox3Z+ysq2+DhcrERWp
 BtlvZ6BvuykTlCk1b5YZzJ8koJKN0JLVaaEgj1WRAtIpwAC3GLv50FEFn+TtqOO4SzrJ
 AePg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xZGdGvjt
Subject: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS devices
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYWltcyBpbml0aWFsbHkgdG8gZml4IEFNNjJ4LVNLIEhTLUZTIGRldmljZXMg
YnV0IGRvaW5nIHNvCndvdWxkIHJlcXVpcmVzIGFkZGluZyBhIFRJIGxlZ2FjeSB0b29sICJ0aS1r
My1jb3JlLXNlY2RldiIgaW50byBCdWlsZHJvb3QuCnRpLWszLWNvcmUtc2VjZGV2IGlzIHJlcGxh
Y2VkIGJ5IHUtYm9vdCdzIGJpbm1hbiB0b29sIHNpbmNlIHYyMDIzLjEwIHJlbGVhc2UKb2YgdS1i
b290LgoKSW5zdGVhZCwgd2UgYnVtcCB0aGUgQlNQIHRvIHVzZSB0aGUgbGF0ZXN0IHUtYm9vdCBy
ZWxlYXNlICgyMDI0LjAxKSB0byB1c2UKYmlubWFuLiBEb2luZyBzbyByZXF1aXJlcyB0byByZXdv
cmsgdGhlIFRJIEszIFNvQyBzdXBwb3J0IGluIEJ1aWxkcm9vdC4KClRoaXMgbmV3IHZlcnNpb24g
KHYxMikgb2YgdGhpcyBzZXJpZXMgcmVtb3ZlIHRoZSB0aS1rMyBwYWNrYWdlIGFuZAphbGwgU09D
IGFuZCBTRUNUWVBFIG9wdGlvbnMuIEFzIHN1Z2dlc3RlZCBieSBNaWNoYWVsIFdhbGxlLCBjb3B5
IHRoZQpkZWZhdWx0IHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIgKGlmIGFueSkgaWYgbm8gY3Vz
dG9tIGZpbGUgbmFtZSBpcwpwcm92aWRlZCBvbiB0aGUgZGVmY29uZmlnLiBTaW5jZSBzdWNoIGZp
bGUgbmFtZSBjYW4gYmUgY3VzdG9taXplZCwKdGhlIHVzZXIgbXVzdCBwcm92aWRlIHRoZSBjb21w
bGV0ZSBmaXJtd2FyZSBuYW1lIGlmIG5vdCB1c2luZyB0aGUKZGVmYXVsdCBvbmUuCgpodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI0LUFwcmlsLzY4ODk0My5o
dG1sCgpXaXRoIHRoZSBhZHZpY2Ugb2YgQW5kcmVhcyBEYW5uZW5iZXJnIChUSSBLMyBhcmNoaXRl
Y3QpLCB3ZSBzd2l0Y2gKQU02MngvQU02MkF4L0FNNjR4IHRvIEhTLUZTIGJ5IGRlZmF1bHQuCgpU
ZXN0cyBwZXJmb3JtZWQgb24gZWFybGllciByZXZpc2lvbiBvZiB0aGlzIHNlcmllczoKCiogY29t
cGlsZWQgdGlfYW02Mnhfc2tfZGVmY29uZmlnCiAgKiBzdWNjZXNzCiogYm9vdGVkIG9uIEFNNjJ4
IFNLIEVWTSAoRTMpCiAgKiBzdWNjZXNzCiAgKiBubyBvYnZpb3VzIGVycm9ycyBpbiBkbWVzZwoK
VGVzdGVkLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tlQGdyYW5kY2VudHJp
eC5uZXQ+CgpEYXJpbyBCaW5hY2NoaSAoMTApOgogIGJvb3QvdGktazMtcjUtbG9hZGVyOiBkcm9w
IGhhc2ggZm9yIHZlcnNpb24gMjAyMi4xMAogIGJvb3QvdGktazMtcjUtbG9hZGVyOiBhZGQgQlIy
X1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBvcHRpb24KICBib290L3Vib290OiBh
ZGQgQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOIG9wdGlvbgogIGJvb3QvdGktazMtcjUtbG9h
ZGVyOiBpbnN0YWxsIHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIgdG8KICAgIEJJTkFSSUVTX0RJ
UgogIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9vdCB2ZXJzaW9uIHRv
IDIwMjQuMDEKICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBMaW51eCB2ZXJz
aW9uIHRvIDYuNi4xOAogIGJvYXJkL3RpL2FtNjJ4LXNrOiBnZW5lcmFsaXplIHBvc3QtYnVpbGQu
c2gKICBib2FyZC90aS9hbTYyeC1zazogbW92ZSBwb3N0LWJ1aWxkLnNoIHRvIGJvYXJkL3RpL2Nv
bW1vbi9hbTZ4eAogIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnOiBidW1wIFUtQm9vdCB2
ZXJzaW9uIHRvIDIwMjQuMDEKICBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZzogYnVtcCBM
aW51eCB2ZXJzaW9uIHRvIDYuNi4xOAoKUm9tYWluIE5hb3VyICg2KToKICBib2FyZC90aS9hbTZ7
Miw0fXgtc2s6IGFkZCBhcm0tdHJ1c3RlZC1maXJtd2FyZSB2Mi43IGhhc2gKICBib290L3Vib290
OiByZW5hbWUgVElfSzNfRE0gb3B0aW9uIHRvIGNvdmVyIGZ1cnRoZXIgVEkgSzMgU29DcyBzdXBw
b3J0CiAgYm9vdC91Ym9vdDogcmVtb3ZlIEJSMl9UQVJHRVRfVUJPT1RfVElfSzNfRE1fU09DTkFN
RQogIGJvb3QvdGktazMtaW1hZ2UtZ2VuOiByZW1vdmUgcGFja2FnZQogIGJvb3QvdGktazMtcjUt
bG9hZGVyOiByZW1vdmUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTgogIHBh
Y2thZ2UvdGktazM6IHN3aXRjaCBBTTYyeC9BTTYyQXgvQU02NHggdG8gSFMtRlMgYnkgZGVmYXVs
dAoKIENvbmZpZy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsr
KysKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0K
IGJvYXJkL3RpL2FtNjJ4LXNrL2dlbmltYWdlLmNmZyAgICAgICAgICAgICAgICB8ICA3ICstCiAu
Li4vYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaCAgICAgICAgICAgICAgICAgfCAgMiArCiAuLi4v
cGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaCAgfCAgMSArCiBib2FyZC90
aS9hbTYyeC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggICAgfCAgMiArCiAuLi4vdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoICAgICAgfCAgMiArCiBib2FyZC90aS9hbTY0
eC1zay9nZW5pbWFnZS5jZmcgICAgICAgICAgICAgICAgfCAgNyArLQogLi4uL2FybS10cnVzdGVk
LWZpcm13YXJlLmhhc2ggICAgICAgICAgICAgICAgIHwgIDIgKwogLi4uL3BhdGNoZXMvbGludXgt
aGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggIHwgIDEgKwogYm9hcmQvdGkvYW02NHgtc2svcGF0
Y2hlcy9saW51eC9saW51eC5oYXNoICAgIHwgIDIgKwogLi4uL3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIuaGFzaCAgICAgIHwgIDEgKwogYm9hcmQvdGkvY29tbW9uL2FtNnh4L3Bvc3Qt
YnVpbGQuc2ggICAgICAgICAgIHwgNTggKysrKysrKysrKysrKysKIGJvb3QvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KIGJvb3QvdGktazMtaW1hZ2UtZ2Vu
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8IDc3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIGJvb3Qv
dGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoICAgICB8ICAzIC0KIGJvb3QvdGkt
azMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tayAgICAgICB8IDU0IC0tLS0tLS0tLS0tLS0K
IGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8IDMzICsrKysr
KysrCiBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCAgICAgfCAgMSAt
CiBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgICAgICAgfCA0MCArKysr
KysrKystCiBib290L3Vib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
NSArKysrKy0tLS0KIGJvb3QvdWJvb3QvdWJvb3QubWsgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEyICsrLQogY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgICAgICAgICAgICAgICAg
IHwgMjEgKystLS0KIGNvbmZpZ3MvdGlfYW02NHhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICAg
ICB8IDIwICsrKy0tCiAyNCBmaWxlcyBjaGFuZ2VkLCAyMjEgaW5zZXJ0aW9ucygrKSwgMTc4IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMv
YXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAogY3JlYXRlIG1v
ZGUgMTIwMDAwIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1o
ZWFkZXJzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVz
L2xpbnV4L2xpbnV4Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTYyeC1zay9w
YXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJt
LXRydXN0ZWQtZmlybXdhcmUuaGFzaAogY3JlYXRlIG1vZGUgMTIwMDAwIGJvYXJkL3RpL2FtNjR4
LXNrL3BhdGNoZXMvbGludXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib2FyZC90aS9hbTY0eC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIuaGFzaAogY3JlYXRlIG1vZGUgMTAwNzU1IGJvYXJkL3RpL2NvbW1vbi9h
bTZ4eC9wb3N0LWJ1aWxkLnNoCiBkZWxldGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1n
ZW4vQ29uZmlnLmluCiBkZWxldGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGkt
azMtaW1hZ2UtZ2VuLmhhc2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdl
bi90aS1rMy1pbWFnZS1nZW4ubWsKCi0tCjIuNDQuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
