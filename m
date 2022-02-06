Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBB4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 07:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C2C60B83;
	Sun,  6 Feb 2022 07:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXGA-LBZdRvl; Sun,  6 Feb 2022 07:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32A760B6A;
	Sun,  6 Feb 2022 07:14:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9EC1BF3E8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49EC760B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvJPwIEzViUo for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 07:13:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A4B660608
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 07:13:58 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id GbkCnN9ecXfntGbkCnxHK7; Sun, 06 Feb 2022 08:13:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644131636; bh=ndzZHKP502O5DQIlGnuDCnL3MVlel8CJv2ZQ+OvnICQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=eS4aAxbk7zTjsGTjLoo/r/xlS8i3FFUfN3ie+4hw+A+a0rx/4CKaXBX9r8Qr7D6j3
 TJ54PKmbX4xG2zOW/p2Xwwpg+NKQ9I9TkyCg9vAfHLhsNc+QcjtNLXpJrCgVcbSoLu
 iIP3yrYDzcqDZ8lnvLP4DqrJGaD1P9IQ/C6ijtawxWTczocHkFCAjgBnmgKB4wfl9Z
 d2fPKKCAjlg0uYuDO5GYk4crjQr3eQLOqyC/ya5uPGommSE1XzlwNdPpc0hddOPINj
 zw1EWFj9AaG8XwSnRQoRK26SjTzVFNTIz1DUTuCubhysitju6nwbnu6m8ZyB6oEE+g
 e6pzDWKy8c1nA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 6 Feb 2022 08:13:55 +0100
Message-Id: <02663281-0879-462D-8A89-F922E86018A7@benettiengineering.com>
References: <7d81f185-699c-9fc4-f392-07b332ce8184@gmail.com>
In-Reply-To: <7d81f185-699c-9fc4-f392-07b332ce8184@gmail.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4xfPY8/68HqYNqHtGPJ18FYrj23g42lJiw6d9oxr0qUFusk9qoFNgMexKhryfqtLjZRWKL9GpLQl3juVHbCxXt63N6TM1n66fg13kSB6SMaZPxZVfu/Peb
 RAbx33CbU+RiKbloRhLgCuqjuWvObhHzGwRhQ/sGMh4v9M8DteFzL5JzuTt97bwjNix2FB5Dg2NF948Fsg19ENSbr4ljM3DL1iRVvOg+U74cd5lWtlQYLUra
 ZNv2KktZWX+GQrTtMAZPvOS2ECVMQ/+MTd/Z5QkcCco=
Subject: Re: [Buildroot] [PATCH v3] configs/orangepi_zero_defconfig: switch
 to extlinux
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

SGkgU2VyZ2V5LAoKPiBJbCBnaW9ybm8gNiBmZWIgMjAyMiwgYWxsZSBvcmUgMDA6NTAsIFNlcmdl
eSBLdXptaW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+
IO+7vzA2LjAyLjIwMjIgMDI6MzQsIEdpdWxpbyBCZW5ldHRpOgo+Pj4+IElsIGdpb3JubyA2IGZl
YiAyMDIyLCBhbGxlIG9yZSAwMDoyOSwgU2VyZ2V5IEt1em1pbm92PGt1em1pbm92LnNlcmdleTgx
QGdtYWlsLmNvbT4gIGhhIHNjcml0dG86Cj4+PiAKPj4+IO+7v0NoYW5nZXM6Cj4+PiAqIEV4Y2x1
ZGUgRkFUIHBhcnRpdGlvbiwgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3IgVS1Cb290Lgo+Pj4g
KiBTd2l0Y2ggdGhlIHJvb3RmcyBwYXJ0aXRpb24gZnJvbSBNQlIgdG8gR1BUIGZvciBwYXJ0aXRp
b24tdXVpZCB0byB3b3JrLgo+Pj4gKiBTd2l0Y2ggdG8gZXh0bGludXgsIHRoaXMgaXMgY29udmVu
aWVudCBmb3IgZGVidWdnaW5nLgo+Pj4gKiBDcmVhdGUgY29tbW9uIHNjZW5hcmlvcyBmb3IgbXVs
dGlwbGUgYm9hcmRzIHRvIGNyZWF0ZSBhbiBTRCBpbWFnZTogYm9hcmQvb3JhbmdlcGkvY29tbW9u
Lgo+Pj4gKiBBZGQgQlIyX1RBUkdFVF9HRU5FUklDX1JFTU9VTlRfUk9PVEZTX1JXPXksIHJlbW91
bnQgcm9vdCBmaWxlc3lzdGVtIHJlYWQtd3JpdGUgZHVyaW5nIGJvb3QuCgpNb3ZlIHlvdXIgU2ln
bmVkLW9mZi1ieSBoZXJlKGJlZm9yZSB0aGUgMyBkYXNoZXMpIGFuZCB0aGF04oCZcyBhbGwuClRo
aXMgaXMgYmVjYXVzZSBldmVyeXRoaW5nIGJldHdlZW4gdGhlICB0d28gc2V0cyBvZiAzIGRhc2hl
cyB3b27igJl0IGJlIHBhcnQgb2YgdGhlIGNvbW1pdC4KU28gd2UgbmVlZCB5b3VyIFNvQiBoZXJl
LgoKPj4gWW91ciBTb0IgZ29lcyBoZXJlIGFsb25nIG15IFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQt
Ynkob25lIHBlciBsaW5lKSBJ4oCZdmUgZ2l2ZW4geW91IG9uIFYxLgo+Pj4gLS0tCldoaWxlIGhl
cmUgdW50aWwgbmV4dCAzIGRhc2hlcyB3b27igJl0IGJlIHBhcnQgb2YgdGhlIGNvbW1pdCBsb2cs
IGJ1dCB3ZSBuZWVkIGl0IGZvciBNYWlsaW5nIGxpc3QgdG8gdHJhY2sgdGhlIGNoYW5nZXMuCj4+
PiBWMS0+VjI6Cj4+PiAqIGltcHJvdmVkIGNvbW1pdCBsb2cKPj4+ICogcmVtb3ZlZCBjb21tZW50
ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4+PiAqIHJlbW92ZWQgb25lIGJvb3Qgb3B0aW9uIGZy
b20gZXh0bGludXguY29uZgo+Pj4gCj4+PiBWMi0+VjM6Cj4+PiAqIGltcHJvdmVkIGNvbW1pdCBs
b2cKPj4+ICogcmVtb3ZlZCBjb21tZW50IGZyb20gYm9hcmQvb3JhbmdlcGkvY29tbW9uL2dlbmlt
YWdlLmNmZwo+Pj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS3V6bWlub3Y8a3V6bWlub3Yu
c2VyZ2V5ODFAZ21haWwuY29tPgoKU28gaWYgeW91IGtlZXAgeW91ciBTb0IgaGVyZSBeXl4gd29u
4oCZdCBiZSBwYXJ0IG9mIHRoZSBjb21taXQgYW5kIHRoYXTigJlzIG5vdCB3aGF0IHdlIHdhbnQu
Cgo+PiBBbmQgaGVyZSB5b3UgcmVtb3ZlIHlvdXIgU29CIF5eXgo+PiBQbGVhc2Ugc2VuZCBhIFY0
IHBvaW50aW5nIHlvdeKAmXZlIGZpeGVkIHlvdXIgU2lnbmVkLW9mZi1ieSBwb3NpdGlvbiBhbmQg
d2XigJlyZSBkb25lOi0pCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0byBkbyB3aGF0IHlv
dSBhcmUgYXNraW5nLgoKQWxsIGNsZWFyIG5vdz8KCktpbmQgcmVnYXJkcwpHaXVsaW8KCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
