Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE2606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c9PuzcHT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24B180C46;
	Mon, 23 Nov 2026 09:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Owgqa8zYupel; Mon, 23 Nov 2026 09:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA7F280DE2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427647;
	b=MKkPzbPeK5nWrWLMynyTo6w0HnElk2HIX+jxSPj0lckjxrxeJJPuD/3YZcXGQv/m1bvI
	 Wchr6C423maEc3scrr4wLFoKV+ngeZvlSxr7N1t00j/V0Ju5ymd+r/u4FhG9w3tFOE4Kw
	 PnXwpL53MBSHvm76ozRShKrXuJEBRDccqEB+8nAFyLsFclK/XEotKLHXQW0fWBBvR7+K0
	 i+fNf8Yeh5JFAIvimla2ejGB8fp1pVhbK9QegdFkkNZcBvhIhjjUvXgd0V/yay+fgc285
	 yN7ta6pux42Lv2TrssaK3kdDNgN51s3HeLTCi9VmMtFI+FnGGI405VKRgL9TlM081cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X2ODyUIWBjKkdU3iAICCoHYHNATnZ+P9SFEmyQnStWc=;
	b=PNsJGQWt/EcpSQZh6aWD9FbUcIw3dGxKbseqT7BiJ9tb8au5aWP7BJ7jA2YzFZuUZBqV
	 QG7RfGA1PwIrf4M72+CpoerTGkHV9PieZKIO2y6cMtuOHba+MU9xifm9hjsIPI0DjOTen
	 U/3+/PuWCoH93DBSo5WkMdhnuK6XEFH1iLpnjDYjz5qEond+djo8V/lieAvnE8BGNyb/V
	 bOfsUQc2Qkgiiqh5BkA98e+8chPfBbO+GeZv69usOdHTVHBQ8LAaqIbB8n+z1ae/Xq83L
	 W5G7lYlEqY0LxABxIv4aUJe6tRdvCKwwO/Behg2iHt3Bk/9Ohgy/YJoW/fmT/a6okYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427647;
	bh=X2ODyUIWBjKkdU3iAICCoHYHNATnZ+P9SFEmyQnStWc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9PuzcHTFg0rR1HV73xqUeabPohF1z0MZX4wj6k6RsLMGLGKtWZD9hDiQqQrxt644
	 RIptBkypLaYOl5cFXNptygfYi5es0tRk8MTbtW4pMKEMGZS/zobObTD2W99RKB+ZqK
	 eSibWpsDalY0rfYjSR7Yk4FrqOcWdwQxibxDTKAWvpE24hR8FZsxYlAqLGS9M9rCVb
	 h0A97661mpJnAAjHaU9jzROGqlNslEzuUmgGyKJIeCn2GD4BLQWfkUUR6++XHQRI4P
	 Vl7uD+jSNmrcf/jsDSSZqvN9Wu7hMJBwXWjNzSTgsSs8oF/kxCeSSA5XLV1uOvaNfU
	 PVi1jZ93fBrkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA7F280DE2;
	Mon, 23 Nov 2026 09:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF6C1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D36180C81
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LE_mHNsS66_R for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E7C6680C7E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.53
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.53;
 helo=mail-wm1-f53.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7C6680C7E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so38239815e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:54:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427639; x=1796032439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vL1GnntLnIbV8kDRuIreoclMzsxdu0v/RCDvtcgAAK8=;
 b=ZTFrFT257dB6L4cC1acnUvekBKmMWtsTwCqYlgTWadnF7VgJ01JIXhCPfsUg6XIVzO
 skjG5o+eOieUYBb2IAn/7JsD3R8LJr07Y2x3HvVYAJR1eTrFkPwEEfKHwF0zseFvcwub
 3wJEbOFO8VSVOfzaGLwWXMivS73AsxuEp7JUxB2LxAB4csEgbM3DIHFSma3cMiQt3vOY
 OUhXnJXzzxjE6vntxvWYTCVpIbCso63oNLhwkz//njkFOPS0u5xs/gXGbcVIS+oyT/ol
 QiBeaDOlgRXQVxtZhUW1ZNXsMliND42j5T0bWu1QRSXbN8WBbWwrtF2Jq8wOkE7I2dBV
 xOQQ==
X-Gm-Message-State: APuU4Z/8fYy1ZGB0aKjg5gnVrCQwytwpsIGPScUg1ONsu+jzoudPz7qh
 Q4nErbjRtQ55zraHalb3Q/zOr4K4pbYPll55UUfBeFShXb4nLIPU5Obu+XIjR+iG
X-Gm-Gg: AZFdTZekuQZcMLJS5UrHZETqjjn1TkRTM7SXshNz/1DRFazKNJMk4Hk2yk60xfL0zY3
 PpU3BBHgvU9E9EHEoMvZFP3zCsV1m6Gkbi52vgKCAVrml64vjwgpchyWDexoJ7PRUXGJiTmzMGZ
 FByE02NjNOv2QaDSHxTyoe4VRQ+tBJ9tQgIhVskE7elJfag60iB2TD/fRQQ/wCd3e0Fe1PiygRk
 V67fc+1wrQp+La8jeFfIFf6K01gnrYv1Xk3c7EzfM8MxGPB5Ltwyj8puqMLT5ZwKHWVI0k9bxYJ
 JB+OC3yQB0tR3LAXYFIozjdDGwxTuqSz1eIFFjtkA8BuKttV4GuVIBvu/Rxmo8ErbgcWvnvfeMB
 +oTy64t0JDO4dPR849KnAbncII0oqVmSYHeLBUz4/PM6MpvUzF6RRVWIeoKpWwPLrvqa4G3h1Sx
 SJHJuTQtP+o/vkXmfD+YM7eesD47RbL5D5RsZKiZClfC0OdZJcEJqWRlUQF3Ts2vQR/Pc1FIgWU
 B94q1jCgzhJCf9pyTg/9S6i2iIMmRsjv/lVtnXgn2VrbocVBMjttum6KQwzfWRaL33gO+mTrM38
 aR/YQ6J6CObhZS74PRQX2i+/Y/URV2dlDMrU6nhh/cWh1C5rPobr310szFGqMpcbSVCzFVaxb0i
 jdfEhEGxax1lNzW2wYIv0znEOZNbmzscbEsvFw5B5uC+fBYiIwjxfucNhgMumnnynztGjNzM55g
 6DNEBRqdH48A==
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id
 5b1f17b1804b1-4bb887fc396mr230055815e9.3.1795427638782; 
 Mon, 23 Nov 2026 01:53:58 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:53:58 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:32 +0100
Message-ID: <20261123095339.1566394-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 04/11] package/libinput: bump to version
 1.32.0
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

Release tag:
https://gitlab.freedesktop.org/libinput/libinput/-/tags/1.32.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f6ec5705886..64788cc1688 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8e823cc9f44c51b63ae90af0b73676ed82c0402cc1cbd4a59ac91b7bb6cad716  libinput-1.27.0.tar.bz2
+sha256  3a6065c07b118c08d0c7b7b85a265ecb050a8cfc91eeb360890d768a51b4cce9  libinput-1.32.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ef637094181..635edb7556f 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.27.0
+LIBINPUT_VERSION = 1.32.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -15,10 +15,6 @@ LIBINPUT_CPE_ID_VENDOR = freedesktop
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
-# Code not present in 1.27.0, see
-# https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
-LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
-
 # 0001-dont-call-function-in-macro-argument.patch
 # 0002-util-sanitize-control-characters-in-str-sanitize.patch
 # 0003-libinput-device-group-sanitize-phys-before-printing-it.patch
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
