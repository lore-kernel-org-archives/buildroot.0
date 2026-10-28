Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A257E606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qUGR15FU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ss4cWrRz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7156580F90;
	Wed, 28 Oct 2026 22:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Si9COcw2m-M; Wed, 28 Oct 2026 22:29:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F19A80F46
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226549;
	b=bSN5pTw4QhUKRXWZAJ/1oCpzTX30Llao1p6LZhvquwoN4NAvraYImKlbbrT3lS2YWHjd
	 apX8Qwr+Rlxs1u2AbtFzcIg1hCn23S9pJSE12cRX1qHYdYHdqYmadPJ9ktpQOvk8DGQxV
	 AWWs702R8ML8klwWSaaCDr9Gjc4X58fum33QmDDL80e7mQQVuRrAALz9s7Z2g7EoBeqgX
	 zWz6+HadfZ5Ai0kvS7mHc5yhKCfzqhcRvAqv7AzoSMc1PJpUw4xG3Zylion7sMHaOk5e2
	 /ImdajIfaYk98tpN4YzZgAF5eSUf7VGkYlDumA9N2FGHmclWFvnTYwAC6dHGBDC4emg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	b=NgrzITqwdQX0KgS44M5kFCezdM9UviNQu+rQCAumGObSutbdADxqRXkMjiVDTe2K+ch+
	 31MBJDejNe25AxDxiu5oeKu2S6Sr0Z4UKyvAKc4OhpV/OyYw8vgVqFIlSw83cUTvwv3FC
	 f8bjc79g1f9YkxIWeAEE8bKump4OYIXULSEny9Yp0Ak8k0WhdE62quqF1Rl9bIGKQ4isS
	 S2vVJYiV0Q5oQDh9Zc2bo3NXuduOumd349CkRqJP/FRiN9cyGi5MXBODDZINfv8o3Kats
	 M+Vq9vpBa+1PkLVR3NdqtDpM8BsK8Gs1nIYVaRhz2U7KAhOgjtV4eMIeavOitrtNM5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226549;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUGR15FU5f6C/cLRW5Mbi3QSnqEHKoaft9f61dgfBxi+sAfVIlglIlsCrPfUpEIQs
	 uVz/m4QIzpLdj2+EyBHEZZqWdGJbujDJ84b+q3mIK5N/M8kX3oLt35gp70zfBkI3J8
	 QmHpbLpoZPxD/V1xfK18RbUZ8L0GtVLSaY9hCULAdc8iRW2v39IT9mT18MwjUX0CPr
	 Q8b+kEL244DS1D7p7ItLgTszo6ZWLtvdiKCCj4vn9NwdueCzrNHJY7014rT72kn9me
	 GJrKn9i78Ame2UfnpE8z5K7q9nSlR1xEPacJgmNSTa49U4d4gipO0hQjwT+koEXooc
	 uy+MLQ6+SBFEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F19A80F46;
	Wed, 28 Oct 2026 22:29:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28BC63AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A09460709
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3lKaGc3GlTr for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:29:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A116760690
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226547;
 b=iUW8aczHOivtFmCkdcPLFFg6XqMXt3tQxOdNn3NEY1Yx8tGlH+5DEsdNa37UPCxi1efz
 vVNKJiNhRrEGtKpp/R3aqvGX4bvgPHdQBiZjxCU/UY//GVJCWbo9k4AtS8yqTjfX0LCGB
 yJ4hM8VBg8kPyhuKHsG5F61S5B0Mv1JZCfolGf1v6TJ1PgvoBJ+vMougZKvn6Un57xV0o
 7aqvie1EgAQUFLQA4o08LHGQ5v+JmZdP13rY0F4Jk/NzRH0OGrUqiock5mWd+eeMvnr3l
 qj+tVitD+C6fNd83eToA3RZtABuMcuDSuXWExQYdNwTr9ujQ389+BBOl5N0GG3HY0rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226547;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 b=lS4fTY8wpNVSZAAncFgSO9xdVKAK3RDmMef7r68726Dr13D8UgkaHrcXFgLhwFpatOvA
 QxHD5aflwb0EGor/i5oabQm7euYOACdb1A8iVBCPVTuone85yRcBDM9hqwkbMH1lP6NJD
 iqWHbNjnu9ddcgWUsjhCfPOghKJ55FYUGhzf0k43NCtfarL6cYIGmXR18BUpK9XA+hiVf
 UUvYhQg6SDksM4Zn7MiXG0a/Y7F/ObG1cNTHfMqyUQ/l+VzBlPxJZK2aAAxUrVHtA334S
 ofMxaGKz/B5exuvWsR5N91yq6JaVXFSlIxBbyAdL9QGkNQngMQIrFChJhD4pGwpV4Vw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ss4cWrRz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ss4cWrRz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A116760690
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226504;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ss4cWrRzLxu0rx7vzzIB6eBZhapprxx5y3DMHsTzwGyHf1Q7iCzqm6OOHStxDtHxS
 IDzEdJcsO8WTF170QIt7QjaZdhCaiNO/iwr/Z0BJRx8R+f4vCZXoa+sdrkRiAEGq1C
 8vJ+I+SZz8YDPnCEeJzUHww3oPUAo7htJcYol4WUuYPnbmryaf4iBr6I4v1YCiG+KE
 HtFsDklcITxturRJ85m6UrsgjVISOe+KyjI8rluaLPpDPhkLFOpC0mDH9/Z7W5HXj5
 BdogfdkHe7+BZpIXfBNGhCj2Xsn3uxtpnsQuHddIi8e45LlxAq2ybp+aH/NB3nGHFA
 gnxPbUi+YR2cg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 tmiaRiGtpJ8dGRY4OU3xjaLk86cgTmCtGvRqBelUjUrF4IXcbpvQo1SscG9ZmMDvyLsinA6qDUQ
 NS4ZvbSx3lgpBvQWNQ+gjxWIRRsA9LT6LLKhS67OoIhnvPUH8x6pacWT8oOE8jRRvd57/1kZirX
 xMVxLehz8ALtOOar/mw6FXEskcB23Y0FAdm+YjvQd5vp6YXu1CzIU3lPvUN/zMDoYg0M2J4AahV
 IrlSrybiuQSwus8OP0FQ2RbrujoT7wKbUG/B/tcLnx41C1GcCjspRlnx/GnDXjEmcbHu2KWEhgm
 StXkaWS4+mwW9FZFCFFk6J3CBoYSxxWl1q0pR63orKqb1ec1fQzCpQH5FlFX0Bp7xCUcvLN/13U
 OoFOYZ4q8VEF0JdOJ6cbngykzUPaWkp0zdYw5VzYhf4nlIdSVukGtZ1NcYnekSD7nYkVfqxZ6wi
 ICeiSvX4nuPAfdTSPgknEHtqkFcaoL9wsktea6aPXw5P4H9SoF1TgQk/oC79azJmMMAwdA9YTgq
 DPQKZ6lQ9GXwk+zO4Nx3IgM+PJgYzE7L4vD7uVU99KoQmiSrQ5DMmk9YcPWB5uCfaRTB067xhEa
 UrTY
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 800AEA4C6FC5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:28:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-1KQw
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:04 +0100
Message-ID: <20261028222822.490779-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 03/20] package/kodi-audiodecoder-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk    | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash    | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash    | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash    | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk    | 2 +-
 .../kodi-audiodecoder-vgmstream.hash                            | 2 +-
 .../kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index d011e38fe9..84eb36bd80 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2828685f1c353bf7123d0f9e88b28f53064388f6ea3ee357b8fb22d5c237ac8  kodi-audiodecoder-modplug-21.0.2-Omega.tar.gz
+sha256  9a0b5bfce44d937726529a5c32d1f33e4d70261eeed5ace443dffd1d159641f1  kodi-audiodecoder-modplug-22.0.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 15a1d96635..9f3e089527 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_MODPLUG_VERSION = 22.0.2-Piers
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index d743433027..7093b6c48e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c82bf0ffab2d09f26b84d382fd00f70695d5f6a6d781be2818f9f5e10bc675a  kodi-audiodecoder-nosefart-21.0.2-Omega.tar.gz
+sha256  f0b89b0ac85c2248c6aeafba1b805c2c21524fe5dd229f2a5ba362b3ea8dd313  kodi-audiodecoder-nosefart-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index ca45739a02..ede46e0698 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_NOSEFART_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 87cf151859..c03bf7434f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d10dd65baed2db1272ff57fde76f0b268a4a434d57022539c4dc5bf6f8b54e  kodi-audiodecoder-sidplay-21.0.2-Omega.tar.gz
+sha256  1657509ee534600bec9f66cd651e7d6342502fde1a213e81a807eb17feb3c565  kodi-audiodecoder-sidplay-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d98fc4a7f5..a99cd32f9f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SIDPLAY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 0ebd6cf128..16e353d2e7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98afd81a9653efd9c6fe69dd7918755c75a4671322b793a35bce610acac0d128  kodi-audiodecoder-snesapu-21.0.2-Omega.tar.gz
+sha256  5bffae158b9e02d2fba2fca7950fc9497dc65928f90ab336f37ae51819b662a7  kodi-audiodecoder-snesapu-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index aa8178c55a..03b3e121a4 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SNESAPU_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 560c93b74f..9d463dd168 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  089ddd6c890e571f69eda0a85077d8ffe91c4b31fd0f9e20f47d4053c1e984a8  kodi-audiodecoder-stsound-21.0.2-Omega.tar.gz
+sha256  c40edfdc694f62d0ce0129f93b16fafa97cf254526d8d874a473560819c31894  kodi-audiodecoder-stsound-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 2bd37a8e04..086e2ff6ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_STSOUND_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 22e7015ff8..5240efc8a6 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb7bee9453825f86275ae05c4561fb52ee7fd9fa21857e303933cb57d28ccc4b  kodi-audiodecoder-timidity-21.0.2-Omega.tar.gz
+sha256  90354522f51889c341541694bc964f24a4739c342c0c8f28ae3c002ac41eebbf  kodi-audiodecoder-timidity-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index c165492416..ab417ee150 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_TIMIDITY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 010315db59..27a721d85d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f5dddc0e6161426b8c40bfd1136ca555588db27ae78c02178b6ac5da93b377c  kodi-audiodecoder-vgmstream-21.0.2-Omega.tar.gz
+sha256  c6ae413f47d9261f3a20cd4e2d380b44a57a82a93d03ddfdf2ac0666b230ac6b  kodi-audiodecoder-vgmstream-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 66beec0a37..74a5f05a0e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
