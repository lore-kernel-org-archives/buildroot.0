Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C768606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g56mczpB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9EF608C7;
	Fri,  6 Nov 2026 21:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gv9VuFe38pkA; Fri,  6 Nov 2026 21:14:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CBD5608B7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999664;
	b=r+z5CRICml9KNtkuUHISaldWI4rNcEflvyz9Hpbicj1/WOlXXON7xL5fZS1keQ6Jvex7
	 A6NEcylSRpdPRyWmo8of21TQICI1nT1CVClqFixjEhBmzbrMY/HL8Em1+3akpBPY9IBvE
	 ssElCwcYqQUoEwhCWFyTZfDLXnYn/yoGJZCQR3p4wKSx1ye+AcDbt4l7nzEAw5OEG7McW
	 gXBZHml1esE97TgdpZsu4QQTpS6hLA6MQInCU5lKSAtOWfQeaZYOvOETJw27eaze/y04g
	 J0F5oKhQ9hMce+iSKHoZlu7kJvOP7HBibp7teBPjXCZIN27Erecs7/MeHtiOlwsiUoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7GxkSwm0PMoF4LQR+cC1Typowm+FL9/1ewzGBW/0tVk=;
	b=V1fYdYvXO/lEznkIPPpNXo/IkYBLWKmEVcvP4JIENXptCGJT+mdz97xDWUPSgNxkG+WI
	 WlJ4ooLORx+xK2sBbSnS62+0gqA2WmarYV5DF2R3ycxdTxzaPANGPZDhZcHcPo+moenuZ
	 iab2u+4QBjrMVgl+XsxBEAcQzU7e5erUMW+AD28z5e0bCFRQ3ewo7yiHGzl1CJn6f7CD9
	 94QtQzbUY08C7k23HZG6Ilcfk/F7HDpbQisZpQCjtZ7H4/nseZy4juPPw4sXKgFyGA1gQ
	 8w6Pnc+IJ5z4DYCgCN+hHY7sTNnWA3wPa83oI5rgVKYsQBPtlmfrfqOfgE1YMNpc82Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999664;
	bh=7GxkSwm0PMoF4LQR+cC1Typowm+FL9/1ewzGBW/0tVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g56mczpBrH1lenLA6QVYQKlUvMAexaOtf3MLqNm87+xQDJP8vOKCXrjaXpmwaqtrh
	 Aqi3BnmV8nfHLmVaCYE66DjIMGzij968Y/zr3WfZeF8t3QqeNJm6gHRxdJrfV+zHo2
	 1KPziCRLikYR0DgUdwqV++UcL8AyUKasEB3YhhiCg/nz7OzzN5hOAHIuSmbdide5V6
	 ohcDvOdIY3apdZRCDEjLKDcYGGWsqRIQ0WUr+V8gA6P/d0yMhCphZHD8r0abGHJ7pt
	 9lk4W6xt3xMQMiwcEufh6W1Cmh1fmk0iFyH8ytBsHtZ6J949jEkYOtaOWZsp9bAA0O
	 5Hl0/v7LCO26Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBD5608B7;
	Fri,  6 Nov 2026 21:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A694B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7510608CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0ld3HYoNfem for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34417608B7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34417608B7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C14B9E0FF; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dd134b8dfbbc85079a8fe9e4bc567a6e96c409d
X-Git-Newrev: ed54b75e06b7e622be594e9725fe2ff4a9c736cb
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.2C14B9E0FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: security bump to
 version 26.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed54b75e06b7e622be594e9725fe2ff4a9c736cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix GHSA-2gqc-mwv3-66rp: the WebSocket handshake parser accepted
non-CRLF header separators, allowing forged proxy-injected identity
headers.

https://github.com/crossbario/autobahn-python/security/advisories/GHSA-2gqc-mwv3-66rp

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 50cac991bf..0687a6bb80 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  cca33159d2dca5f56c7210a3f7a98200  autobahn-26.10.2.tar.gz
-sha256  6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e  autobahn-26.10.2.tar.gz
+md5  f920b0a74a14a9e048178cb5958db98c  autobahn-26.11.1.tar.gz
+sha256  1a081ca27ad5a0a04d3c7ca07b2caa6d324b8004383e36ae6eede1d5053e23b0  autobahn-26.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 4ef83e33bd..4ea2cd5a98 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.10.2
+PYTHON_AUTOBAHN_VERSION = 26.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e5/84/8ea0607facb3c97a3beae3c767213fc716f9ab2f157570dc5aeba1174730
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/08/15/694ed91f8f28d8c74b424a8a80208d4f221c12ae5d2fbee4d5041cdf1d0d
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
