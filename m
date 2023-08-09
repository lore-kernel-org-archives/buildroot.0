Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC62EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 07:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A559741476;
	Wed,  9 Aug 2023 07:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A559741476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyw9RYoFv29e; Wed,  9 Aug 2023 07:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF4D24119B;
	Wed,  9 Aug 2023 07:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4D24119B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2541BF281
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 07:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13CB14173D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 07:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CB14173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXkYbfc6esMN for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 07:56:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEE1A401A0
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 07:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE1A401A0
Received: by mail.gandi.net (Postfix) with ESMTPA id CF2F9C000B;
 Wed,  9 Aug 2023 07:56:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 09:56:23 +0200
Message-Id: <20230809075623.306089-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691567807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zAyEzdHkchgyi/QT3sB2kPj+ct/qU7f3mtLeEMSLvJo=;
 b=LIMzDkBl/oWbizxHIskKr9W6XxidBu2J8dxEGSMxcY0KkrDcHM3Y0Q0Z/WTtXmbdmj2Qvg
 N/qkst84QlhTA2xgAUkYKCCKEWh3jaJVqjGW/c77dJF9yi2VpyLBepAYKE4pajCWv2YuRI
 oncMEqP/8YMUWg+dWciageJzgTdKr7McgoqraybarfrIzFd6gY2RXCyxTN7N5jJQpmA1I9
 MMS3mKigc2Ajk72jY53+NRQAqvWmD3cAND4Ca+sCqkdweCXxu6mvSX9+JLRaMKd2DI6N8e
 zWNO7ovG76pohuF1we2XHEv6Di3ZxVNUK5Wx8HHvQN3JQK68gAusPHubcM1yMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LIMzDkBl
Subject: [Buildroot] [PATCH 1/1] package/composer: add COMPOSER_CPE_ID_VENDOR
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
From: =?utf-8?q?Cl=C3=A9ment_Ramirez_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOmdldGNvbXBvc2VyOmNvbXBvc2VyIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IK
dGhpcyBwYWNrYWdlOgpodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jl
c3VsdHM/bmFtaW5nRm9ybWF0PTIuMyZrZXl3b3JkPWdldGNvbXBvc2VyCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBSYW1pcmV6IDxjbGVtZW50LnJhbWlyZXpAYm9vdGxpbi5jb20+Ci0tLQogcGFj
a2FnZS9jb21wb3Nlci9jb21wb3Nlci5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb21wb3Nlci9jb21wb3Nlci5tayBiL3BhY2th
Z2UvY29tcG9zZXIvY29tcG9zZXIubWsKaW5kZXggZmRlNWI0ODk1MS4uOWJmYWJjMjhhZiAxMDA2
NDQKLS0tIGEvcGFja2FnZS9jb21wb3Nlci9jb21wb3Nlci5taworKysgYi9wYWNrYWdlL2NvbXBv
c2VyL2NvbXBvc2VyLm1rCkBAIC0xMyw2ICsxMyw3IEBAIEJBU0VfU0lURSA9IGh0dHBzOi8vZ2V0
Y29tcG9zZXIub3JnL2Rvd25sb2FkLyQoQ09NUE9TRVJfVkVSU0lPTikvY29tcG9zZXIucGhhcgog
Q09NUE9TRVJfU0lURSA9ICQoQkFTRV9TSVRFKT9uPWYvJChDT01QT1NFUl9TT1VSQ0UpCiBDT01Q
T1NFUl9MSUNFTlNFID0gTUlUCiBDT01QT1NFUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQorQ09N
UE9TRVJfQ1BFX0lEX1ZFTkRPUiA9IGdldGNvbXBvc2VyCiAKIEhPU1RfQ09NUE9TRVJfREVQRU5E
RU5DSUVTID0gaG9zdC1waHAKIEhPU1RfQ09NUE9TRVJfRVhUUkFDVF9ERVBFTkRFTkNJRVMgPSBo
b3N0LXBocAotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
