Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D972FC0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 07:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C81341451;
	Wed,  9 Aug 2023 07:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C81341451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZeY_kNvLACg; Wed,  9 Aug 2023 07:49:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B8BC40908;
	Wed,  9 Aug 2023 07:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B8BC40908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA66A1BF281
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 07:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C521540241
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 07:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C521540241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frGmfXDTqrpP for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 07:49:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F38440224
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 07:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F38440224
Received: by mail.gandi.net (Postfix) with ESMTPA id C513DC000A;
 Wed,  9 Aug 2023 07:49:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 09:49:16 +0200
Message-Id: <20230809074916.305728-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691567390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kBelvfKxx788Cmt81hb46jNO6rkqkjLPU4kpfuAEFPg=;
 b=XRrlglAFyGKFo4KwWDkGblv5QQgVquwPVZNWdycIW6JtdTjfefyZXfZQqoB2gQeglkZ4Bj
 5g/2e63jmq59S+uWtFnWgrZrrjCU9PwXH9by5QKcbaUsNInU73Rg9zgB2Okne83Z+LPeyg
 tRgrKrHUNkXOWWm/bO4/IZMxVEKdJ1KzdWDmcu/zBlBpP9XJbfRCOLQSjf0GXnsSui8lLA
 kkGSyX3QR/ZzDWmzywssmmt1CHp7T/r4PYdJgEhQY13eKoCgBwnXOgMdBdyfMdZb9crH+L
 oBzDOk1QtOu9KCtr42ftEryCHmBR1i9hKF5W3Ll0csre2OERPEc9PeJ83kTs/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XRrlglAF
Subject: [Buildroot] [PATCH 1/1] package/dav1d: add DAV1D_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOnZpZGVvbGFuOmRhdjFkIGlzIGEgdmFsaWQgaWRlbnRpZmllciBmb3IKdGhpcyBw
YWNrYWdlOgpodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/
bmFtaW5nRm9ybWF0PTIuMyZrZXl3b3JkPWRhdjFkCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBS
YW1pcmV6IDxjbGVtZW50LnJhbWlyZXpAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9kYXYxZC9k
YXYxZC5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kYXYxZC9kYXYxZC5tayBiL3BhY2thZ2UvZGF2MWQvZGF2MWQubWsKaW5kZXgg
NjcwYTgxZDFjOC4uZTkwZjUzZGMxYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kYXYxZC9kYXYxZC5t
aworKysgYi9wYWNrYWdlL2RhdjFkL2RhdjFkLm1rCkBAIC05LDYgKzksNyBAQCBEQVYxRF9TT1VS
Q0UgPSBkYXYxZC0kKERBVjFEX1ZFUlNJT04pLnRhci54egogREFWMURfU0lURSA9IGh0dHBzOi8v
ZG93bmxvYWQudmlkZW9sYW4ub3JnL3B1Yi92aWRlb2xhbi9kYXYxZC8kKERBVjFEX1ZFUlNJT04p
CiBEQVYxRF9MSUNFTlNFID0gQlNELTItQ2xhdXNlCiBEQVYxRF9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORworREFWMURfQ1BFX0lEX1ZFTkRPUiA9IHZpZGVvbGFuCiBEQVYxRF9JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKIERBVjFEX0NPTkZfT1BUUyA9IFwKIAktRGVuYWJsZV90ZXN0cz1mYWxzZSBcCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
