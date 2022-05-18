Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1444C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 04:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ADEA408B0;
	Wed, 18 May 2022 04:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6gVg4qUANO1; Wed, 18 May 2022 04:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E570140761;
	Wed, 18 May 2022 04:49:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 007681BF414
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 04:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCDD7831C1
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 04:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAGdzoDMDf3h for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 04:49:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B342482CE5
 for <buildroot@buildroot.org>; Wed, 18 May 2022 04:49:17 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L30rR4421z4xbP;
 Wed, 18 May 2022 14:49:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L30rP3mVCz4xY2;
 Wed, 18 May 2022 14:49:09 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 06:48:59 +0200
Message-Id: <20220518044859.2901762-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518044859.2901762-1-clg@kaod.org>
References: <20220518044859.2901762-1-clg@kaod.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] configs/qemu_ppc64*: downgrade binutils
 to 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cHBjNjQgb3IgcG93ZXJudiBMaW51eCBkZWZjb25maWcgZmFpbCB0byBidWlsZCB3aXRoIGdjYyAx
MSBhbmQvb3IKYmludXRpbHMgMi4zNyBbMV0gOgoKICBDQyAgICAgIGtlcm5lbC9rZXhlY19maWxl
Lm8KICBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTA6IC50ZXh0LnVubGlrZWx5Lgog
IGtlcm5lbC9rZXhlY19maWxlLm86IGZhaWxlZAoKUGF0Y2hlcyBoYXZlIGJlZW4gc2VudCB1cHN0
cmVhbSBhbmQgc2hvdWxkIHJlYWNoIExpbnV4IDUuMTguIFVudGlsCnRoZW4sIGxpbWl0IGJpbnV0
aWxzIHRvIDIuMzYuMSB3aGljaCBkb2Vzbid0IHJhaXNlIHRoZSBpc3N1ZS4KClsxXSBodHRwczov
L2dpdGh1Yi5jb20vbGludXhwcGMvaXNzdWVzL2lzc3Vlcy8zODgKCkNjOiBKb2VsIFN0YW5sZXkg
PGpvZWxAam1zLmlkLmF1PgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGth
b2Qub3JnPgotLS0KCiBodHRwczovL2dpdGxhYi5jb20vbGVnb2F0ZXIvYnVpbGRyb290Ly0vcGlw
ZWxpbmVzLzUzOTU1OTIwOQogCiBjb25maWdzL3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnICAg
ICAgfCAxICsKIGNvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZyAgICB8IDEgKwog
Y29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIHwgMSArCiBjb25maWdzL3Fl
bXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZyAgfCAxICsKIDQgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNv
bmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKaW5kZXggMDgyNWQwYWI5
YjMwLi44NDU4ZjI3MzlhNjYgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9k
ZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZwpAQCAtMyw2
ICszLDcgQEAgQlIyX3Bvd2VycGM2ND15CiBCUjJfcG93ZXJwY19lNTUwMD15CiAKICMgU3lzdGVt
CitCUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM2X1g9eQogQlIyX1NZU1RFTV9ESENQPSJldGgwIgog
QlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgogCmRpZmYgLS1naXQgYS9jb25m
aWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRfcHNl
cmllc19kZWZjb25maWcKaW5kZXggYzQ1MDE0ZjJhYzNmLi40ODBlYmVhMjlkNzAgMTAwNjQ0Ci0t
LSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZworKysgYi9jb25maWdzL3Fl
bXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKQEAgLTMsNiArMyw3IEBAIEJSMl9wb3dlcnBjNjQ9
eQogQlIyX3Bvd2VycGNfcG93ZXI3PXkKIAogIyBTeXN0ZW0KK0JSMl9CSU5VVElMU19WRVJTSU9O
XzJfMzZfWD15CiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VU
VFlfUE9SVD0iaHZjMCIKIApkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJu
djhfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCmlu
ZGV4IDgyMjE0NWU5MjdhMS4uOGRlNGNmNTE4OWI1IDEwMDY0NAotLS0gYS9jb25maWdzL3FlbXVf
cHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93
ZXJudjhfZGVmY29uZmlnCkBAIC0zLDYgKzMsNyBAQCBCUjJfcG93ZXJwYzY0bGU9eQogQlIyX3Bv
d2VycGNfcG93ZXI4PXkKIAogIyBTeXN0ZW0KK0JSMl9CSU5VVElMU19WRVJTSU9OXzJfMzZfWD15
CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKIEJSMl9TWVNURU1fREhDUD0i
ZXRoMCIKIApkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25m
aWcgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwppbmRleCA1ZWFhM2U5
NTNmNzguLjk4YzZhZmRmOTM5OSAxMDA2NDQKLS0tIGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNl
cmllc19kZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25m
aWcKQEAgLTMsNiArMyw3IEBAIEJSMl9wb3dlcnBjNjRsZT15CiBCUjJfcG93ZXJwY19wb3dlcjg9
eQogCiAjIFN5c3RlbQorQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKIEJSMl9UQVJHRVRf
R0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgogQlIyX1NZU1RFTV9ESENQPSJldGgwIgogCi0tIAoy
LjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
