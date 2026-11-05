Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07C606A32E
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IN73gOcd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=iiGYJtHq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34499408B5;
	Thu,  5 Nov 2026 13:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eljky8IAWass; Thu,  5 Nov 2026 13:23:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AE91408D2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884997;
	b=p5DEtBdISbEeALyw1GVl+PuOasoHGLdl9tucvaZTkioDpdVoy8F57YMmv1g5uHtErRdy
	 QMkrSD4My16mC1rwl784ofsY+jo9rOI61lov1tNiteLESVqolO1Eel97FV/+kvZ+xw1Ol
	 qamfuCJLbJ7irMTEaN+KTZC9MoX3y2m+o4ZexkiepougXCOGSYp8RvWCPDEb7RCNIHlVq
	 Cxt1AIk0j7Y+PhaMErCXiTL16i1ltfw5+Hr0psK6w3Dz+uRpBqQEd3WR2kOCzUr+Bo53R
	 npY57q5/eyQfpHD/vOpvOHiQzVQx9/G1Fk8+fXWOvUe1cfqFtbk/2ZneDW5QF7/Z+Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TzL9tGZfnuTaEi4Ohk0wJFGQRT7Lnf1odr7PjpdX22s=;
	b=o3jhaWxNVMLVsHIDNJOzEWMnJfnQqrFbO+Xs8g0MxZPWQW5PLKUJyeCrCZCW8FAmlWxp
	 JY+7DEQBTrYt/SiDepnirVTnsoBHHqtfBBgV8itxkC8zh+aBfHnlxMbz/+erMNVfIyy72
	 aoeE9iXruOnog97OyoAaSw1yZ2dvi+BTVlWEd/AL4BYedHkupFRtkD63CsyYY4iqgUBr2
	 Xn+1ElrhLXsk1alrTV4lHe90qRe6Pu5RIXNePAR+It6Rn1G9zwfFQlWKmOwvU3pSQfCWD
	 inM6b2IMp+Ga33NQiUB6QEcay9si8pFnlpWcgvP8oWO5Oasf6DsKZKG629FqPeH+uKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884997;
	bh=TzL9tGZfnuTaEi4Ohk0wJFGQRT7Lnf1odr7PjpdX22s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IN73gOcdDJyzuOWevCz3kHPiJRUDjG+x7zfilquB7R5vbSD6fyAT6E/8lXALEiuIZ
	 VHuXRo5dO8KfLBvCdcSO+hyCTIlj5X+3mc0zvXsqIHPUVQ99ynDJGBzNYkgmqduqTS
	 xQWIan6cjMCNZquTbDHc64b+K+3btjazMEbTW0Pn1BnvAvlb0Hxip6PqDTgTn9Jh8o
	 i/wfVdcI4cANrIlF8neYew5W/e7Bcms6i6KbTcKr/RIx3/SEjtjJLEFmVrJjY00rqr
	 9s53rUUu/HobfDRSuMXwQ2n4ftI3SvMfn9fRJ7P1n/i7EIB4ZpUIrSkGqdgjBVRZIZ
	 WRseepocN9/vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE91408D2;
	Thu,  5 Nov 2026 13:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB4934D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C71180C0F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1gb15fnJIen for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED99C80BF0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=iiGYJtHq
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED99C80BF0
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b1b13e09ffso1285018a12.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884983; x=1794489783; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oytPCjxLMdqRtpNOPGgX/O08pBAYY9HIG2mHKizb1ME=;
 b=iiGYJtHquSgcMOZpJdQ1vhTi7iDdBg66hq/1KYBjnUk+44wU4klC65PXsMDMBoGFYb
 NOBLhnYkibu15Ekcz9/+eu3tnMKmGycpWzOZCVGPWe8QX0G0RWQy2mhn6MI54/J+d41F
 SW8XcJeL1J13HbRCkr84eRkcVPiO9NlyHVJKNDc2YxixTfrzBi+PdT1hwDMHsMVVpHTk
 a06fqpsF4i2K2icU7QaoEsZpR1bR4IeRrcayyfgYU/er+WDeyjP3GVmmGJjylJXS83rL
 tsqCpNytg/JMZeqrt5aZ2QGfdz4dpTUadTM+CuxXF8qvDYJU4KJ++m5G72yQnTLUjgwW
 xReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884983; x=1794489783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oytPCjxLMdqRtpNOPGgX/O08pBAYY9HIG2mHKizb1ME=;
 b=zFmTTVc5GxdmXJs0u2PZykG3YO9yliwd868JpMfdGtcu8B34QW6ldKNb1EqB2G3aUY
 R+nff1gcC0LiwZ50d7Q0DIa+2HfxuoV8gM04QEfdhemsGLmXunB8tYcMlUVFi+D11Mt5
 jU2HHYaw8V2KVea4dE1p07rytbigTrqd6AtbNJjRYjUj9NOa2TjE3C0H/GJPnxN+y1sY
 b2468e1aEXvJmfVG7bLqekGjq603HUrW6fkwU9Feq9iduc/BU5t6ABywwW9zMuillqdw
 cW1ZUMw9M83qQgIn4j5dKfyw7ONUszOQ9jO4cdSmPziH8aEqs3sEhwP5MX7DzaEwe/0s
 dw6g==
X-Gm-Message-State: APuU4Z+ufx3UfSLEIHkBnYSN9O0rcZH3PoVqSbekpaHBYJDpW9q9ilA+
 Ww2cFpi6JVyaqdD8mg7XTNIS12eJhCf0NNoLy9uc0qLb5p4cLOmeLXmR5OmmOA==
X-Gm-Gg: AYBFou3F2G2miFsTOQQD7GpfhxsFUu90GN6qtauimlnVpjJeJQcNU+pqzZQSCWcCpRd
 dM/tkInJQmVcgR1TrebNl4XZGhAzK7fBbhrpYb4tXqs1a9Ewe4rm6iJ3T3IvIJloO56wXlSEvvv
 0LXctRmfYyfRu/Z1bphJQvoSX+cpEn4dLKHIJB2QBeF7xDf5UwW/ig9zwu2fdU+3rJGPzpA9ZXz
 afRcSQVc2HM0YzUXx4bJQDxgdQplce1SxVeTXw9ddFkK6EVPrh49HNCHkcqqrs+a/GhvxKSiLeI
 PxZAZ5rGxa7lxiHtmKzsbkViLB7jHYBKvkhJ+Y5ZJkWsVvyOEh+j64Rj2FAhLFkRlLvEVy0PfuZ
 deN5SouiEgCZlBLaR/ZqyII2ixy6DlF9ON2J/8lVqQcikWgwQL8c8K8ilUaI54toEMtr0kMv+lS
 koXVhhq600rOHQSZ/mTqhZYASvyXS0PA3+D99kaPTZCRMotCgQ3Emt1UWRU7kyuR59Rg2LHc/Vf
 NRexKz4FXO0tHMxGeBKoDljFfLkUMVa6t0adbNZdEL9xd9GczTZXyv6RXys0sFuWsYEGU9l6g+P
 pAF0wUet6DsyRJYCtYSt5O1kH4jd1BnfbWb/um6eUdP3NScJ7iWCtBT2rLa+G+/b0BNWBLuwrrE
 HBhaWqQp2
X-Received: by 2002:a17:907:908a:b0:c4d:666:d106 with SMTP id
 a640c23a62f3a-c4d0666d274mr427995666b.18.1793884982995; 
 Thu, 05 Nov 2026 05:23:02 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:23:02 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:58 +0100
Message-Id: <20261105132258.1868556-6-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132258.1868556-1-yegorslists@googlemail.com>
References: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/vlc: download from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get.videolan.org does not serve files itself but redirects each request
to a random mirror. One of them, mirror2.evolution-host.com, has been
unreachable for months, so downloads fail whenever it is picked and no
backup site is configured, as on the autobuilders:

  Location: https://mirror2.evolution-host.com/vlc/... [following]
  Connecting to mirror2.evolution-host.com (mirror2.evolution-host.com)|167.114.8.249|:443... failed: Connection timed out.

Download from download.videolan.org instead, which serves the files
directly and is already used by most other VideoLAN packages. The
tarball is identical, so the hashes do not change; also update the
URLs in the hash file comments.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/vlc/vlc.hash | 2 +-
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 4c9e67d1b8..076104964e 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,4 +1,4 @@
-# From https://get.videolan.org/vlc/3.0.24/vlc-3.0.24.tar.xz.sha{1,256}
+# From https://download.videolan.org/pub/videolan/vlc/3.0.24/vlc-3.0.24.tar.xz.sha{1,256}
 sha1  dae683b3939220eac4a5edfc816c44e00659e68f  vlc-3.0.24.tar.xz
 sha256  e7cab503d1d7d5849b89d2cf0e1ee60d0ef6d012407791b644b9cfc0cc225fdf  vlc-3.0.24.tar.xz
 # Locally computed
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 1f6faa9a57..715cda14ae 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VLC_VERSION = 3.0.24
-VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
+VLC_SITE = https://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
