Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE4DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 17:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899E941A37;
	Fri, 18 Mar 2022 17:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwx5Iq7Zo3Mk; Fri, 18 Mar 2022 17:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CCC41A2B;
	Fri, 18 Mar 2022 17:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 098711BF34E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCB984312
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 17:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLL8Mm6nLeKw for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 17:52:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C985581314
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 17:52:06 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0AF53240031
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:52:05 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KKs5t2p9yz9rxG
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:52:02 +0100 (CET)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1647625920; x=1648230721;
 bh=hnY2u02BgutZZE47vVEmXqVxPZOE2t2u2Un3WgqFz60=; b=zLUBybDlgwb6
 13mLSZhJ1vUjS+krdrLKkXdLLoJbt+ceuSm17P0hj5t5e4bQhHQDdzbXF5pdkNfy
 AXlP6enmP8iitIlYVojmFbEZORDFzKkVhxGgS/X8DuSrbq/DlWgzjwY3FkVjt3mq
 AQot/eW69xR/p5BapdB8OjB8cogIzfvrBvLaJvfBb9j9IFDqH8VlmOkMCxtjqHDy
 /w5b2k6xJrY2LRujXzvK5g92RToTwKFrJc552bdtS5z+mQTzaoY5qoodRLfwfDc3
 YUx8nh6DmxZC3k9IEO7PPx2uOghGKqertTWY4Yl9scYvEe8N5dNp7gD4XIuD9l9b
 tgxUgPplsw==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id kVMzCHau3pJx; Fri, 18 Mar 2022 18:52:00 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-142-156.dynamic.as20676.net
 [92.193.142.156]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Fri, 18 Mar 2022 18:51:59 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 17:51:56 +0000
Message-Id: <20220318175156.186854-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.12.1
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxpY2Vuc2UgZmlsZSBoYXMgdXBkYXRlZCB0aGUgY29weXJpZ2h0IHllYXIgdG8gMjAyMiwg
dGhlcmVmb3JlCnVwZGF0ZSB0aGUgaGFzaCBvZiB0aGUgbGljZW5zZSBmaWxlIGFzIHdlbGwuCgpT
aWduZWQtb2ZmLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nrcz4K
LS0tCiBwYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B1Z2l4
bWwvcHVnaXhtbC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wdWdpeG1sL3B1Z2l4bWwuaGFz
aCBiL3BhY2thZ2UvcHVnaXhtbC9wdWdpeG1sLmhhc2gKaW5kZXggNWM2MjlhYzY2Zi4uMTkwZGZi
NmE2ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9wdWdpeG1sL3B1Z2l4bWwuaGFzaAorKysgYi9wYWNr
YWdlL3B1Z2l4bWwvcHVnaXhtbC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1
dGVkOgotc2hhMjU2ICA4ZGRmNTdiNjVmYjg2MDQxNjk3OWEzZjA2NDBjMmFkNDVkZGRkYmJhZmE4
MjUwOGVmMGEwYWYzY2U3MDYxNzE2ICBwdWdpeG1sLTEuMTEuNC50YXIuZ3oKLXNoYTI1NiAgZWU0
OTVmMzRhZWZmMGM1NzhhOTlmMzM1MGEyMDUwZDRlNTg2MGQyN2IyMDA0YzAzYzM4NGE1OTRmYTJi
MGE3YSAgTElDRU5TRS5tZAorc2hhMjU2ICBkY2Y2NzFhOTE5Y2M0MDUxMjEwZjA4ZmZkM2VkZjll
NDI0N2Y3OWFkNTgzYzYxNTc3YTEzZWU5M2FmMzNhZmM3ICBwdWdpeG1sLTEuMTIuMS50YXIuZ3oK
K3NoYTI1NiAgMjA2ZjY3MWI2ZDM0MjU1N2FkY2M5NzMwODhjMmM2MzhkZjBlYzBiMWRhYmJjZDI0
ZTY1YWFkZDIxOTE3NzhkMiAgTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS9wdWdpeG1s
L3B1Z2l4bWwubWsgYi9wYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5tawppbmRleCBiYzAxODE4MGVm
Li45MTM3ZjA0NjMwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5taworKysg
Yi9wYWNrYWdlL3B1Z2l4bWwvcHVnaXhtbC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLVBVR0lYTUxfVkVSU0lPTiA9IDEuMTEuNAorUFVHSVhNTF9WRVJT
SU9OID0gMS4xMi4xCiBQVUdJWE1MX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vemV1eC9wdWdp
eG1sL3JlbGVhc2VzL2Rvd25sb2FkL3YkKFBVR0lYTUxfVkVSU0lPTikKIFBVR0lYTUxfTElDRU5T
RSA9IE1JVAogUFVHSVhNTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5tZAotLSAKMi4zNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
