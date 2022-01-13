Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 23:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03ABA40A84;
	Thu, 13 Jan 2022 23:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsJJQusUWX5m; Thu, 13 Jan 2022 23:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C22940A73;
	Thu, 13 Jan 2022 23:15:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93ABB1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FDFC60A70
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amBm2_dScIGy for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 23:14:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F82C60A6E
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 23:14:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u25so28744909edf.1
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 15:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KLCTf+eG8GDIY5uynj/Ly2ZfHuhT+VTB7/b7sm8dWk=;
 b=WcOIwlODElBuu3s8YgVlwtYqjr+mwKSA5YbQhgc/QIoMi2g07Z7Q83jipfyTkekX9N
 r+fexFPc9L2DD3V4tUQdKND2LWsyEqRSqhzgKswkNtGUvUXU6Wa87HHc5TNxd+ianCV0
 V4u/6dNniDpmhv5f8xAWfwCh8u7vorM4U4T7YZ5ixmGmkGegTIhax4Skalh6m6MmcIYq
 xeAoWIlPLzx4mOyEfa1dp0X7rdyxBBF1bBDCLs6H6eueGbEgBf0cXPVlHtp71VRq/vwB
 M08o7/VPes24pu7AIA7tbvltp0LlytQd6bGMRprOq08hDsSyi9OtFOLq65q8oZgF3UHq
 97Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KLCTf+eG8GDIY5uynj/Ly2ZfHuhT+VTB7/b7sm8dWk=;
 b=6q0F41DLxDHT3ad48PVrpfte8mIOdFZoZV6ZWa1vrNBlRJPd7KGOmxNuACtbcqqtO6
 VgF9e2PDIMZjrRrBmQpYDDiaZce/6qobwIse15v2AEZYDvE1R9TQTuTFWOrn7HntPnKS
 oEAD1M3cfwr0i0IMAPgkbT/HExsQ16rvLkPkbEcO6zg8SAtQr1b1yhH9BTfg2qLm1x/q
 6TYRcdtXxnSLHsoy2HnU2cgS2uuMKZCNOTqgm+BIjQtFD6QD1CT105pkUPsgIEBT7Ce4
 J+AYaokHkZ229ZRwksqylyhCIi9dKownBC5TAiHt+jZkO/EuVpBMe0BmrLTWfcyizb9x
 olGA==
X-Gm-Message-State: AOAM530JHEWl0Ls+0TUrE2pv6KA49QbfUGkV8Ck5hLMi6ZI1uqEns2zI
 f8oceiDa4xdA8EEQs9ci1KrvFoVi4Z5FIPoX5G1hHeJsiSKYIA==
X-Google-Smtp-Source: ABdhPJwhNR0+TRkKGw48ZB8X6WH4gqkoW9GZsdUw4NZWRMTaUY8AjAvjX6feJFycrspJo0SI0q+OW1dnPqMaOh8L4F4=
X-Received: by 2002:a17:907:2d0c:: with SMTP id
 gs12mr5193568ejc.4.1642115697581; 
 Thu, 13 Jan 2022 15:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20220112184821.916646-1-heiko.thiery@gmail.com>
 <20220113220057.1db30808@windsurf>
In-Reply-To: <20220113220057.1db30808@windsurf>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Jan 2022 20:14:46 -0300
Message-ID: <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="000000000000d5bfe905d57edab8"
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 buildroot <buildroot@buildroot.org>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000d5bfe905d57edab8
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

On Thu, Jan 13, 2022 at 6:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Have you considered using extlinux.conf ? This is generally much easier
> than a boot script, and removes the need to generate the boot script.

I used your patch as a reference and modified it as per Thomas'
suggestions to add Buildroot support for imx8mm-evk using only
upstream components.

Please find attached the patch.

I haven't submitted it formally yet because the kernel does not always boot.

Usually, it hangs at:

mmc1 is current device
Scanning mmc 1:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
1:      imx8mm-evk-buildroot
Retrieving file: /boot/Image
append: root=/dev/mmcblk0p1 rootwait rw
Retrieving file: /boot/imx8mm-evk.dtb
Moving Image from 0x40480000 to 0x40600000, end=42770000
## Flattened Device Tree blob at 43000000
   Booting using the fdt blob at 0x43000000
   Loading Device Tree to 000000004fff5000, end 000000004ffffd6b ... OK

Starting kernel ...
(hangs here)

Looks like a U-Boot issue that I need to investigate.

Thanks for your patch and hope this helps.

--000000000000d5bfe905d57edab8
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-imx8mmevkmainline.patch"
Content-Disposition: attachment; filename="0001-imx8mmevkmainline.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kydl74t40>
X-Attachment-Id: f_kydl74t40

RnJvbSAwOGY2YjQ3NTdmODgxOGQ2NjRkMjdjNjc3MDY3NDYzZTA1YTc3YTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkRh
dGU6IFRodSwgMTMgSmFuIDIwMjIgMjA6MDA6NTkgLTAzMDAKU3ViamVjdDogW1BBVENIXSBjb25m
aWdzL2lteDhtbWV2azogbmV3IGRlZmNvbmZpZwoKQWRkIHN1cHBvcnQgZm9yIGlteDhtbWV2a19k
ZWZjb25maWcgdGhhdCBhbGxvd3MgYm9vdGluZyBrZXJuZWwsIFUtQm9vdCBhbmQKVEZBIGZyb20g
dGhlIHVwc3RyZWFtIHJlcG9zaXRvcmllcy4KClNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBib2FyZC9mcmVlc2NhbGUvaW14OG1tZXZrL2dlbmltYWdl
LmNmZyAgICAgICAgfCAxNiArKysrKysKIGJvYXJkL2ZyZWVzY2FsZS9pbXg4bW1ldmsvcmVhZG1l
LnR4dCAgICAgICAgICB8ICA2ICsrCiAuLi4vYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mICAg
ICAgICAgICAgICAgfCAgNCArKwogY29uZmlncy9pbXg4bW1ldmtfZGVmY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4NCBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2
ay9nZW5pbWFnZS5jZmcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9mcmVlc2NhbGUvaW14OG1t
ZXZrL3Jvb3Rmc19vdmVybGF5L2Jvb3QvZXh0bGludXgvZXh0bGludXguY29uZgogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmZpZ3MvaW14OG1tZXZrX2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL0RFVkVM
T1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDEyNzc3ZThkNjEuLmUxOTA3MmExNGUgMTAwNjQ0Ci0t
LSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtODM5LDYgKzgzOSw3IEBAIEY6CWNv
bmZpZ3MvaW14NnVsbGV2a19kZWZjb25maWcKIEY6CWNvbmZpZ3MvaW14NnVscGljb19kZWZjb25m
aWcKIEY6CWNvbmZpZ3MvaW14N2Qtc2RiX2RlZmNvbmZpZwogRjoJY29uZmlncy9pbXg3ZHBpY29f
ZGVmY29uZmlnCitGOgljb25maWdzL2lteDhtbWV2a19kZWZjb25maWcKIEY6CWNvbmZpZ3MvaW14
OG1xZXZrX2RlZmNvbmZpZwogRjoJY29uZmlncy9teDI1cGRrX2RlZmNvbmZpZwogRjoJY29uZmln
cy9teDUxZXZrX2RlZmNvbmZpZwpkaWZmIC0tZ2l0IGEvYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2
ay9nZW5pbWFnZS5jZmcgYi9ib2FyZC9mcmVlc2NhbGUvaW14OG1tZXZrL2dlbmltYWdlLmNmZwpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zYTgzYWExZjAzCi0tLSAvZGV2
L251bGwKKysrIGIvYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2ay9nZW5pbWFnZS5jZmcKQEAgLTAs
MCArMSwxNiBAQAoraW1hZ2Ugc2RjYXJkLmltZyB7CisJaGRpbWFnZSB7CisJfQorCisJcGFydGl0
aW9uIGlteC1ib290IHsKKwkJaW4tcGFydGl0aW9uLXRhYmxlID0gIm5vIgorCQlpbWFnZSA9ICJm
bGFzaC5iaW4iCisJCW9mZnNldCA9IDMzaworCX0KKworCXBhcnRpdGlvbiByb290ZnMgeworCQlw
YXJ0aXRpb24tdHlwZSA9IDB4ODMKKwkJaW1hZ2UgPSAicm9vdGZzLmV4dDQiCisJCW9mZnNldCA9
IDhNCisJfQorfQpkaWZmIC0tZ2l0IGEvYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2ay9yZWFkbWUu
dHh0IGIvYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2ay9yZWFkbWUudHh0CmluZGV4IDdiNjk0MDVk
MzAuLmE4ZTgwYTQ4ZjkgMTAwNjQ0Ci0tLSBhL2JvYXJkL2ZyZWVzY2FsZS9pbXg4bW1ldmsvcmVh
ZG1lLnR4dAorKysgYi9ib2FyZC9mcmVlc2NhbGUvaW14OG1tZXZrL3JlYWRtZS50eHQKQEAgLTEw
LDggKzEwLDE0IEBAIEJ1aWxkCiAKIEZpcnN0LCBjb25maWd1cmUgQnVpbGRyb290IGZvciB0aGUg
aS5NWDhNTSBFVksgYm9hcmQ6CiAKK0lmIHlvdSB3YW50IHRvIHVzZSB0aGUgTlhQIGtlcm5lbDoK
KwogICBtYWtlIGZyZWVzY2FsZV9pbXg4bW1ldmtfZGVmY29uZmlnCiAKK09yIGlmIHlvdSB3YW50
IHRvIHVzZSBhIG1haW5saW5lIGtlcm5lbDoKKworICBtYWtlIGlteDhtbWV2a19kZWZjb25maWcK
KwogQnVpbGQgYWxsIGNvbXBvbmVudHM6CiAKICAgbWFrZQpkaWZmIC0tZ2l0IGEvYm9hcmQvZnJl
ZXNjYWxlL2lteDhtbWV2ay9yb290ZnNfb3ZlcmxheS9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNv
bmYgYi9ib2FyZC9mcmVlc2NhbGUvaW14OG1tZXZrL3Jvb3Rmc19vdmVybGF5L2Jvb3QvZXh0bGlu
dXgvZXh0bGludXguY29uZgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4w
YmEyZTRjYmZjCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvZnJlZXNjYWxlL2lteDhtbWV2ay9y
b290ZnNfb3ZlcmxheS9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKQEAgLTAsMCArMSw0IEBA
CitMYWJlbCBpbXg4bW0tZXZrLWJ1aWxkcm9vdAorICBrZXJuZWwgL2Jvb3QvSW1hZ2UKKyAgZGV2
aWNldHJlZSAvYm9vdC9pbXg4bW0tZXZrLmR0YgorICBhcHBlbmQgcm9vdD0vZGV2L21tY2JsazFw
MSByb290d2FpdCBydyAKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvaW14OG1tZXZrX2RlZmNvbmZpZyBi
L2NvbmZpZ3MvaW14OG1tZXZrX2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi5iYzhiMTdiMmZkCi0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9pbXg4bW1l
dmtfZGVmY29uZmlnCkBAIC0wLDAgKzEsNTcgQEAKKyMgQXJjaGl0ZWN0dXJlCitCUjJfYWFyY2g2
ND15CitCUjJfQVJNX0ZQVV9WRlBWMz15CisKKyMgU3lzdGVtCitCUjJfVEFSR0VUX0dFTkVSSUNf
R0VUVFlfUE9SVD0idHR5bXhjMSIKKworIyBLZXJuZWwKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSI1LjE2IgorQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NP
TkZJRz15CitCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKK0JSMl9MSU5VWF9LRVJORUxf
SU5UUkVFX0RUU19OQU1FPSJmcmVlc2NhbGUvaW14OG1tLWV2ayIKK0JSMl9MSU5VWF9LRVJORUxf
SU5TVEFMTF9UQVJHRVQ9eQorQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQor
CitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTY9eQorCitCUjJfUEFD
S0FHRV9GUkVFU0NBTEVfSU1YPXkKK0JSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1f
SU1YOE1NPXkKK0JSMl9QQUNLQUdFX0ZJUk1XQVJFX0lNWD15CisKKyMgRmlsZXN5c3RlbSAvIGlt
YWdlCitCUjJfUk9PVEZTX09WRVJMQVk9ImJvYXJkL2ZyZWVzY2FsZS9pbXg4bW1ldmsvcm9vdGZz
X292ZXJsYXkiCitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VY
VDJfND15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjEyME0iCisKKyMgQm9vdGxvYWRl
cgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15CitCUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjYiCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX1BMQVRGT1JNPSJpbXg4bW0iCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0JMMzE9eQorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9BRERJVElPTkFMX1ZB
UklBQkxFUz0iSU1YX0JPT1RfVUFSVF9CQVNFPTB4MzA4OTAwMDAiCitCUjJfVEFSR0VUX1VCT09U
PXkKK0JSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQorQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTj15CitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSIyMDIyLjAxIgorQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImlteDhtbV9l
dmsiCitCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15CitCUjJfVEFSR0VUX1VCT09UX05FRURT
X1BZVEhPTjM9eQorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15CitCUjJfVEFSR0VU
X1VCT09UX05FRURTX0FURl9CTDMxPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzFf
QklOPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfSU1YX0ZJUk1XQVJFPXkKK0JSMl9UQVJHRVRf
VUJPT1RfRk9STUFUX0NVU1RPTT15CitCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9DVVNUT01fTkFN
RT0iZmxhc2guYmluIgorQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQorCisjIFJlcXVpcmVkIGhvc3Qg
dG9vbHMgdG8gY3JlYXRlIHRoZSBTRC9lTU1DIGltYWdlCitCUjJfUEFDS0FHRV9IT1NUX0dFTklN
QUdFPXkKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5p
bWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvZnJlZXNjYWxl
L2lteDhtbWV2ay9nZW5pbWFnZS5jZmciCitCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTPXkK
K0JSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfRklUX1NVUFBPUlQ9eQotLSAKMi4yNS4xCgo=
--000000000000d5bfe905d57edab8
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000d5bfe905d57edab8--
