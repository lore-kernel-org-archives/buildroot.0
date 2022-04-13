Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A02C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6B74032D;
	Wed, 13 Apr 2022 07:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeiIdYB9RODh; Wed, 13 Apr 2022 07:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7220840287;
	Wed, 13 Apr 2022 07:31:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9EC11BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B192560E50
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCL9Rr0BN23q for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:31:31 +0000 (UTC)
X-Greylist: delayed 00:17:41 by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.111.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7800C60B9A
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:31:31 +0000 (UTC)
Received: from smtp.getinge.com (164.138.243.75 [164.138.243.75]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 de-mta-40-YfD7P7IrPsudvNsO3VANSA-1; Wed, 13 Apr 2022 09:31:28 +0200
X-MC-Unique: YfD7P7IrPsudvNsO3VANSA-1
Received: from ggo365-exch011.getingegroup.local (172.31.89.21) by
 ggo365-exch012.getingegroup.local (172.31.89.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 13 Apr 2022 09:31:28 +0200
Received: from UbuntuLTS2020.localdomain (172.31.89.240) by
 mailrelay.getingegroup.local (172.31.89.21) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 13 Apr 2022 09:31:27 +0200
From: =?UTF-8?q?Andre=C3=AF=20V=2E=20FOMITCHEV-HERVIEU?=
 <andrei.fomitchevhervieu@getinge.com>
To: <buildroot@buildroot.org>
Date: Wed, 13 Apr 2022 09:31:19 +0200
Message-ID: <20220413073119.458265-1-andrei.fomitchevhervieu@getinge.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: getinge.com
Subject: [Buildroot] [PATCH 1/1] package/opkg: enable openssl signature
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
Cc: =?UTF-8?q?Andre=C3=AF=20V=2E=20FOMITCHEV-HERVIEU?=
 <andrei.fomitchevhervieu@getinge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T1BLRyBzdXBwb3J0cyBlaXRoZXIgR1BHIG9yIE9wZW5TU0wgc2lnbmF0dXJlIGNoZWNrLiBJdCBp
cyBhbHJlYWR5IHBvc3NpYmxlCnRvIGVuYWJsZSBpbiBidWlsZHJvb3QgdGhlIGNoZWNrIG9mIEdQ
RyBzaWduYXR1cmVzLiBUaGlzIHBhdGNoIGFkZHMgc2ltaWxhcgpjb25maWd1cmF0aW9uIHRvIGVu
YWJsZSB0aGUgT3BlblNTTCBzaWduYXR1cmUgY2hlY2tzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmXD
ryBWLiBGT01JVENIRVYtSEVSVklFVSA8YW5kcmVpLmZvbWl0Y2hldmhlcnZpZXVAZ2V0aW5nZS5j
b20+CkNoYW5nZS1JZDogSWQyYzc2YjNjYjM5YmE1ZWVkNWJkMGJlZjc2NDhmNzk3MDAzM2I4N2IK
LS0tCiBwYWNrYWdlL29wa2cvQ29uZmlnLmluIHwgMTIgKysrKysrKysrKysrCiBwYWNrYWdlL29w
a2cvb3BrZy5tayAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BrZy9Db25maWcuaW4gYi9wYWNrYWdlL29wa2cvQ29uZmln
LmluCmluZGV4IDFmNmEzOTM0M2YuLjJlM2Y5ZmNhM2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3Br
Zy9Db25maWcuaW4KKysrIGIvcGFja2FnZS9vcGtnL0NvbmZpZy5pbgpAQCAtMjksNSArMjksMTcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX09QS0dfR1BHX1NJR04KIAloZWxwCiAJICBFbmFibGUgb3Br
ZyBwYWNrYWdlIHNpZ25hdHVyZSBjaGVja2luZyBzdXBwb3J0IHVzaW5nCiAJICBnbnVwZy9saWJn
cGdtZS4KK2NvbmZpZyBCUjJfUEFDS0FHRV9PUEtHX09QRU5TU0xfU0lHTgorCWJvb2wgIm9wZW5z
c2wgc3VwcG9ydCIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAorCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJPUEVOU1NMX0VOR0lORVMKKwloZWxwCisJICBFbmFibGUgb3BrZyBwYWNrYWdlIHNp
Z25hdHVyZSBjaGVja2luZyBzdXBwb3J0IHVzaW5nCisJICBvcGVuc3NsLiBFeGFtcGxlIG9mIG9w
ZW5zc2wgY29tbWFuZCB0byBnZW5lcmF0ZSBvcGtnCisJICBzaWduYXR1cmUKKwkgIG9wZW5zc2wg
c21pbWUgLXNpZ24gLWluIFBhY2thZ2VzIC1pbmtleSBwcml2YXRlLmtleQorCSAgLXNpZ25lciBw
dWJsaWMucGVtIC1iaW5hcnkgLW91dGZvcm0gUEVNIC0tbm9kZXRhY2gKKwkgICAtb3V0IFBhY2th
Z2VzLnNpZworCSAgV2hlcmUgUGFja2FnZXMgaXMgdGhlIGZpbGUgdG8gc2lnbiAKIAogZW5kaWYK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BrZy9vcGtnLm1rIGIvcGFja2FnZS9vcGtnL29wa2cubWsK
aW5kZXggNTAxZWRjZjhhZi4uNTgzNzQ0ZWM5MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGtnL29w
a2cubWsKKysrIGIvcGFja2FnZS9vcGtnL29wa2cubWsKQEAgLTIzLDYgKzIzLDggQEAgT1BLR19D
T05GX0VOViArPSBcCiAJYWNfY3ZfcGF0aF9HUEdNRV9DT05GSUc9JChTVEFHSU5HX0RJUikvdXNy
L2Jpbi9ncGdtZS1jb25maWcgXAogCWFjX2N2X3BhdGhfR1BHRVJSX0NPTkZJRz0kKFNUQUdJTkdf
RElSKS91c3IvYmluL2dwZy1lcnJvci1jb25maWcKIE9QS0dfREVQRU5ERU5DSUVTICs9IGxpYmdw
Z21lIGxpYmdwZy1lcnJvcgorZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX09QS0dfT1BFTlNTTF9T
SUdOKSx5KQorT1BLR19DT05GX09QVFMgKz0gLS1kaXNhYmxlLWdwZyAtLWVuYWJsZS1vcGVuc3Ns
CiBlbHNlCiBPUEtHX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZ3BnCiBlbmRpZgotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
