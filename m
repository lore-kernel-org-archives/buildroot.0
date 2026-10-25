Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ELA82n8f
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771B640602;
	Sun, 25 Oct 2026 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0iQsCxoyXJ0; Sun, 25 Oct 2026 20:54:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C958E403FF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961661;
	b=UbS8bxaphPfIHnrchhjuQsPRhoxIshMLpO/H8LAhhuhRGIEalZaiYudMsIepYh573dNa
	 +sB2uFhFz5pZbU/MsaEwCSkyYirX+V99azlsL70+kkoxoV+47IBIAniV/2ZqHIsAm4oKN
	 y1tcqlFnP/EoQ9/l5buB8LJfC+WAHFNc/q5byMlPNK56Av0eC6U/i29YBlDCKB722RE4I
	 sWTxgNKccbGmBexUlDRjxNozJiLAtChFcAAK2BoGWTsMWjMjGAO54dVBgjGzhF1nibkbq
	 FYe7erNqF8Cy27rXRrs21yrclRK7Zxa462dTQFOnvUXO/xbfrLoHLCiJHXHWb5WbBtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oG6tyF8d73wYW425SZuCQFGUw/+BnjcnibPNZov/eSA=;
	b=qFx3BrwqWz1oZ90l47HMZ5XZ0Lmvnlgts6lDHu0MKxVNKH4NzLlT7v6EWroBJPfhnYqc
	 WfOlZMFde/pwwXuGHy4B7shNAhUlG8kWpnujgLvoaRoVwA/9pbqdXo4meEHSnzTLtaTeL
	 uA+zqoeB2wEJDlUDxlQ/+dr8PSY0bTmaN/5Y3T1D8tvAUar0t61Dl3j4a1c228+sjrPme
	 2zFzsckx0rW+WmIGU8a0vBSylI6+T+9FgJ/dmTNE4AIIPtcz3MqUYTJAAprbHlHZz75zs
	 6QW5nFsF1P0qAP40dOeYFaTFSllnfk4uKsn5JqrbTNajpU/5XsnPByjgctReTsh157Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961661;
	bh=oG6tyF8d73wYW425SZuCQFGUw/+BnjcnibPNZov/eSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ELA82n8fLAwHZx6FuyyqecffHxWDoX1Abe/wZdFft20eFghiWJMep3R0Au1CrjFrr
	 XlpxP0gup2UXqWLJ10AFbCG5d9+8tnWDQy6YxeHmxeJAfxsjojSQf60wpPKc08TTv2
	 Ul1JyCqeDfasH94rprXE7pTg26WDzr+ce+kUVODc18ppBIeEkI25NyQmIF0uNf6uN/
	 8IlTEfaGXBQ908rZifinBzW8uAUdd2aSh6zUXMarTVmtyR1pFtpkIzpTv/QyXoJVvC
	 alfiFiLtzbj85HUyWqK7fniJd0AciHYCEYIX5Md69CIke0MWvJNmFEai1jRMIrsC1z
	 t3vs3Cjeo1V1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C958E403FF;
	Sun, 25 Oct 2026 20:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 894C4356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA6180C97
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZVE3njz2qBA for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CCFCB80C95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961658;
 b=rOJ4lvZcuuFDU5zeZomEcGeoljtLjVFEqoYFDoxM1gxBwNFy0367K6N8pvi4dItVF97a
 JSTWgTTiHT5iQFY9HLyDl/CUsTCaG8rXSmRUtHIVTv4W9sd75HwgscaX0B3D3+MegWGzv
 +VJzhm39YNurOR8cAie5xHI6Je/hyF7OIkRiHtNdMuHcSlAE1Wc5PItf9vS5axxPVve/Q
 1eJEIdfo93LDCXv2cU2EBKPvlRa9C6QpLGPbH1SpeA4tVCuPjRmPRyjfG8IYYySuwjt8k
 FALUjTH7esAsqmzy7YoIM+uEneWSBRhCelCFCU6KLpbZferspv5epcnWg2z/wGE+F3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961658;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ceF7wgzZUyQD8u+vZAEGofxCyC4wteE/xgX3jcm+FMU=;
 b=DCWzMFisLFGb+YtKUNoAQJ3ztV2UvGHEHVTXVLs8c5wHQn5yiOC0lnzNil8/xN+Fpwsa
 cS940pjH89TsUyb5q5J17Wt1PWLUZathHbaM1DiWVYQiRnjmxwrKMqAAf3aN7m9GMpTBC
 dL6kXONgwRFdKrZfyxanCJyYUEldvsHdOW2QX7acqlC/V2fcZ3TZjTkKJFSkyK7Kw+mPZ
 JN0Ge65PJb+QwsZoeyige9UgmjQKFycCRNVmZ7XrEf5S7ypOckV8v05r3cEK19ya8gAmT
 8fT7tVRftBID73xTzd4D9ErqiXBmo0DQxN49k4Pk3xp2wMDY70U3S3bips7wSGSRPqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCFCB80C95
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 229329B9A7; Sun, 25 Oct 2026 20:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:54:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ab71cafc0e69f128fc3bee62fa995c5d65d1c50
X-Git-Newrev: 8f74cfc46c1346a481e6742f8d94cf5d6784e64f
X-Patchwork-Hint: ignore
Message-Id: <20261025205253.229329B9A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: fix libserialport
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f74cfc46c1346a481e6742f8d94cf5d6784e64f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 8.0, avrdude automatically detects and links against
libserialport when it finds it in the sysroot
(find_library(HAVE_LIBSERIALPORT ...) in CMakeLists.txt), and there is
no option to disable it.

Buildroot doesn't declare this dependency, so whether avrdude gets
libserialport support depends on the build order. With
BR2_PACKAGE_LIBSERIALPORT=y, building avrdude before libserialport
gives:

  HAVE_LIBSERIALPORT:FILEPATH=HAVE_LIBSERIALPORT-NOTFOUND

while building libserialport first links avrdude against it. This
makes the build non-reproducible.

Add libserialport to the dependencies when it is enabled, and
otherwise pass -DHAVE_LIBSERIALPORT=OFF, so that find_library() skips
the search and libserialport support is disabled.

This issue has been present since commit 0e16ff09e953
("package/avrdude: bump to version 8.0"), as avrdude 8.0 added
libserialport detection. It therefore affects 2025.05 and later.

Fixes: 0e16ff09e9538d46c9726f8998080d55dfa5d41f ("package/avrdude: bump to version 8.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avrdude/avrdude.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 476f031c99..fbad44a191 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -25,6 +25,12 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
+AVRDUDE_DEPENDENCIES += libserialport
+else
+AVRDUDE_CONF_OPTS += -DHAVE_LIBSERIALPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HIDAPI),y)
 AVRDUDE_DEPENDENCIES += hidapi
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
