Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D043C636D3
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 10:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC75C41950;
	Fri, 10 Feb 2023 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC75C41950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nzU-Y-dY92h; Fri, 10 Feb 2023 10:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7607141951;
	Fri, 10 Feb 2023 10:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7607141951
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86C451BF31B
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6985A410AE
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6985A410AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yQ-9zGvGUVn for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 10:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21AB4107E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E21AB4107E
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 10:26:55 +0000 (UTC)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD142E0006;
 Fri, 10 Feb 2023 10:26:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 11:26:55 +0100
Message-Id: <20230210102655.94324-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676024813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=paWOG+CkgKJLmtWNF2Pk49CYBvUFYClyHPvPuy3lFf0=;
 b=A95QtdsOsfoxxjIkOWzgkQ39f1wZIuU0GrGC0DHa70huiXm4QjWgi1cRV58Uq8pzttVYIf
 tKJwYWjNRAg+pLHLHWs6Yh/VYuwe9u1+1fygoDD44mnOjh9H4FSGc2Bw+TdH2OFD6K3pgQ
 IQ+JaW0FtPK+TB8U/9Pa09Z3GYwOUsD05oWzOg8Jj0o38p2NH1mNCACrXVVGfFkpiqq/3G
 AYgePdZWrGr8z1DfoOD0zNBI1YJ3F1//HzT/NN43Tl2RZNtZ3YrHodesQpv6B7oXELsEEI
 Sz8hJx2ObGbd0SEW5nVx+lOoOI2GYk98c23gSV+qgSo3Pug2bkMBaJQjzTwRkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A95QtdsO
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: set license path
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBnZW5lcmF0aW5nIGxlZ2FsIGluZm8gd2l0aCBhIGNvbmZpZ3VyYXRpb24gZW5hYmxpbmcg
YSBwYWNrYWdlIHdoaWNoIHVzZXMKZmxpdCBhcyBzZXR1cCB0eXBlLCB3ZSBnZXQgYSB3YXJuaW5n
IGFib3V0IHB5dGhvbi1mbGl0LWNvcmUgbGljZW5zZToKV0FSTklORzogcHl0aG9uLWZsaXQtY29y
ZS0zLjguMDogY2Fubm90IHNhdmUgbGljZW5zZSAoSE9TVF9QWVRIT05fRkxJVF9DT1JFX0xJQ0VO
U0VfRklMRVMgbm90IGRlZmluZWQpCgpBZGQgbWlzc2luZyB2YXJpYWJsZSB0byBwb2ludCB0byBw
eXRob24tZmxpdC1jb3JlIGxpY2Vuc2UgZmlsZQoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhv
csOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1mbGl0
LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0
LWNvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5tawpp
bmRleCA0ZDdiZWU4MWRhLi5mOTYxOTFhZGU2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1m
bGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5taworKysgYi9wYWNrYWdlL3B5dGhvbi1mbGl0LWNv
cmUvcHl0aG9uLWZsaXQtY29yZS5tawpAQCAtOCw2ICs4LDcgQEAgUFlUSE9OX0ZMSVRfQ09SRV9W
RVJTSU9OID0gMy44LjAKIFBZVEhPTl9GTElUX0NPUkVfU09VUkNFID0gZmxpdF9jb3JlLSQoUFlU
SE9OX0ZMSVRfQ09SRV9WRVJTSU9OKS50YXIuZ3oKIFBZVEhPTl9GTElUX0NPUkVfU0lURSA9IGh0
dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8xMC9lNS9iZTA4NzUxZDA3YjMw
ODg5YWYxMzBjZWMyMDk1NWM5ODdhNzQzODBhMTAwNThlNmU4ODU2ZTQwMTBhZmMKIFBZVEhPTl9G
TElUX0NPUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQorUFlUSE9OX0ZMSVRfQ09SRV9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQogUFlUSE9OX0ZMSVRfQ09SRV9TRVRVUF9UWVBFID0gZmxpdC1ib290
c3RyYXAKIAogIyBVc2UgZmxpdCBidWlsdCBpbiBib290c3RyYXBfaW5zdGFsbCBmb3IgaW5zdGFs
bGluZyBob3N0LXB5dGhvbi1mbGl0LWNvcmUuCi0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
