Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13E606BA62
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fjvpA+5N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=n7eZLoN2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349898096F;
	Tue,  3 Nov 2026 11:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX6FZHO3uYXm; Tue,  3 Nov 2026 11:03:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E34880935
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793703828;
	b=Tj4u/zzKTWzSdqViGIdipAJzuFru6pop7o/kMbTjEWt80Lee2fIGR2jhOPabf7saDKmy
	 ROARNGRPrcF5je0Cmr5PusWZcrDRzT5Jo/bWn+hhswr9CSOZfKFFhDva0JbVBl6uc9ErI
	 BjIFPOe7rntVnhBZB758jQEJGN7qAcM3TrYI9dmtIm/de0xvXZY66jUR4ORg0AUp3QaUu
	 9jGobhD5q2w9K9i9PhlDzkI17P/M+NXu9HA4tSXyuDGxh86Col5EMTnOsLD7jdwZwcvVB
	 OGXKmY/ryUsww2SCalvvPzR1/RkgPmbVXJTxTrw032pkOu2a6hZN682wFXotoJJthyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793703828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AnzpnGYZ4boWDGpsTE9QGarUsMTrM74LqRgD98VRX0w=;
	b=O/0OwYX3BgVK8QnawKQLhmvrNaoxl7bAn74xdnh3V9KSg5aeaPuwUw6rJy7kWOEUG8Zg
	 DDFM63ZSbYwCoYHuuErp1BvS/ez6smGQEh0WFvQ2xO9PcBhRnj5K9pAkZ5xcr9FDGAHFJ
	 tEv0urPhOkgGIV6wKlcxH/zJTou+uOoHbQxXKcnqevEkAVvbslpThDemS1uVRSMLii+LJ
	 Q4T+sHbrLr9eSSoIpIcrjD4VtGVF+4eebmju1VorhhGbqJFJ//N+LkbKihv8Sp3BErtic
	 U2mXxEKOObjWk6V3bJK6qJZdxMKsKnYfG8gmRbTEMelwr0/smGD1jjDJgVki7q2APww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=n7eZLoN2;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793703828;
	bh=AnzpnGYZ4boWDGpsTE9QGarUsMTrM74LqRgD98VRX0w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fjvpA+5N7dFpy3Zqta8fyGm4ta7fKzANJrKu6lMaP1hxRxO671lkxfzvOcxiV94ti
	 jN9gwnEBn0aGRXtY10Od+yTvwSUqYgivRadF0R89aoejWUUAIilP4iiC3JeK28+kBz
	 sHMryk7HxyMp0RRc1d8AJZ6nXR6G0vnB+QeFMI+uQ/QAPPmyG6rzFk3ghOgkG089zZ
	 cQ5qOoBb0/9D36NakhQLJePj8sXZrwhc0Pr7mJqi0pqgMk7pJZmIcJs/DAdBpdV2xQ
	 uYCVVWnFVaDyzdHlNqAGx4gZ7dUKzCnfyfLTF+kVr+uVETgAxTYLMcS+YA9FcQmdMd
	 pTq/vPc867hbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E34880935;
	Tue,  3 Nov 2026 11:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D8BA2A8
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EDC780935
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yexsv6BWj6U8 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 11:03:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD783808E7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793703825;
 b=KamltyBG+/zHXbb35KhJb/wSbA2ZDCPaQG1ps/K42RrIgDSsgHJ6dSAmPk2LhclC1olh
 R8jE6K+CoCw57qSZ6eDICQpBle3juuKFaUX1O5mMZRTO1jxoSdLu9EYUHBclIfho/sNea
 6qIfVoZDarpWHoD8F8SzhdIVzFPmugykv1fqR938quwg6zt2cJ8zm3UER3+ssWijf6ygK
 ygO2CPIyhrYDwBrIKMUJh9y2NpSHUfl48U8LvenbEI6MP2SjiUHIL3SFymCUNx5PXZ9DP
 3SAzkJ6XWBApy36jbN7bqG7XdAsQE337/twc7WP+Pvbd+pqoxnzhMrpt1Gg5CzLzvHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793703825;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=u3wgVTKqGLXKzzRS8TVzfzqQnTuarqaPb03IyE4l2WM=;
 b=N/0uxNflKjyGSOlGBapv3XXa37myiaMMgwDbCcakslkeVdMI8w7xpXjTuPCIybQ+P7ST
 J2r5daZs65fIesWrHQvG6gyAeNOAQTMmPAhTP+jvNXE8A+9ompCQyw+DtgphvDljICt39
 W81rOnJDbR4ofIp4WhY4b2e+/IlTqO4JJd4lwTQZpDpnH49KOMl1AY/EMZR4PVLnh7YoU
 ZCVm57+Df4oVvJ9TClup58f6hn64aqyybMdVOE0AVt9YV11FHHb2/7iUuXH12cAM5RTVE
 +t88S2h+pPEa0wBAcRreCDwrQdQ93L/gvFIeMYNnhPONifsfpS/TybszX7X6cx7V/JQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=n7eZLoN2; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=n7eZLoN2
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD783808E7
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:03:43 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id OCImxrRz1W41bOCInxqZwD; Tue, 03 Nov 2026 12:03:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793703821; bh=J2U859iomqMyEcHwaFZITOhITl2TJl0IGoruKy6ifLc=;
 h=From:To:Subject:Date:MIME-Version;
 b=n7eZLoN2M0WukW27TiqnV3eERA/ji49Y72infWpodpzEjeOgUVzrI1wyNIWFQFLou
 uvOox6404XoWNvFQWuy3j5fxDocADWLSg1ngQMNLGKACW+RuH/1PLhEWS/PUDSZkkH
 P0A/8zStnTpPwfbTGgDLKVfupH72qUiea7PmRKaGzG/qyAbolPcUN+EeRuoRH2k1gl
 lm+EJZf5eCtTplnEate/aGqXbXNijOBB7YB4JpN5zurDEKsQcFXOUYrrcK7PXOxY/E
 uqkti60+BwKVRBYev6mPLeDWtk93f13/UwEnUSIppEU9CBLFMqEeWZU56cMVR1ZnuQ
 dVNw7idVAR68Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Nov 2026 12:03:38 +0100
Message-ID: <20261103110339.127294-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDRbO7myL5j7rPfuqNv5nYjDxvHMAfE8FJugKSjfKBpci6izLUViKyg/AqEFi505prDUoOQ0zAsWw/qho1hA3uVQLDLwHNh6Kg46+/2lX+Gdvgzpg5IJ
 +WLSLaiJ4awJgpMYMbklSymnDZp/ldDRXrcFzHXXvedAmw8HAf23lEMFU6jCvik9tLIQCsR0dGZWcvpBCMDFieuV2SfOrl9yyI5UX65DivCwaegAKwh+dS6z
 FL+edJ0h96ocOXjTpXt5mIIWnpK7vM0U/VSbGrTzFVvKC0bjDnIQG3MNvyGigFOS2QKCmVXbIOxuu5GPZ8A1ZQ==
Subject: [Buildroot] [PATCH 1/2] package/pulseaudio: fix build failure with
 64-bit time_t
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

Fixes:
https://autobuild.buildroot.net/results/f45/f452fdf42509d56555b31b148edbc2bde2624af3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...0002-selectively-disable-libpulsedsp.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/pulseaudio/0002-selectively-disable-libpulsedsp.patch

diff --git a/package/pulseaudio/0002-selectively-disable-libpulsedsp.patch b/package/pulseaudio/0002-selectively-disable-libpulsedsp.patch
new file mode 100644
index 0000000000..79ab02df8d
--- /dev/null
+++ b/package/pulseaudio/0002-selectively-disable-libpulsedsp.patch
@@ -0,0 +1,41 @@
+From: Simon McVittie <smcv@debian.org>
+Date: Thu, 21 Mar 2024 12:42:59 +0000
+Subject: selectively disable the libpulsedsp DSO and padsp wrapper
+
+The libpulsedsp DSO is not compatible with 64-bit time_t, and is a wrapper
+for compatibility with an API that's basically obsolete for 15 years.
+And nowadays pulseaudio itself is largely superseded by pipewire.
+
+padsp is mainly useful for legacy i386 binaries and maybe
+a few very early legacy amd64 binaries (late 90s/early 00s era games,
+especially ported by Loki Games) which might assume OSS audio, and not
+support ALSA or PulseAudio directly. Since we're breaking the platform ABI
+on armel/armhf/etc. *anyway*, we can't rely on the ability to run legacy
+binaries even if they exist, so it's probably no longer interesting to
+provide padsp on those architectures.
+
+However, Debian's i386 is sticking with the old 32-bit time_t.
+
+Forwarded: not-needed
+
+Upstream: N/A it's been picked from Debian that tags it as "Forwarded: not-needed"
+Signed-off: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index d4cdbd6..7137e21 100644
+--- a/meson.build
++++ b/meson.build
+@@ -618,7 +618,9 @@ if cc.has_header('sys/soundcard.h', required: get_option('oss-output'))
+   # OSS output via daemon module-detect
+   cdata.set('HAVE_OSS_OUTPUT', 1)
+   # OSS wrapper
+-  cdata.set('HAVE_OSS_WRAPPER', 1)
++  if cc.sizeof('void *') >= 8 or host_machine.cpu_family() == 'x86'
++    cdata.set('HAVE_OSS_WRAPPER', 1)
++  endif
+   cdata.set('PULSEDSP_LOCATION', pulsedsp_location)
+ endif
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
