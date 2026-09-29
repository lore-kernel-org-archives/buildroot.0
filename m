Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C60CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD95281190;
	Tue, 29 Sep 2026 18:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdUBOYdZeIG0; Tue, 29 Sep 2026 18:46:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CCD508118D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707591;
	b=fV9oaMs0U9/zhUd6Ok/zsb4SgraPI4SJsl1riptLj2jgDTtOZfMq834WDjulzzKBsnqU
	 oAVrqnVhuVViBlf2I7dHR1B9kVcvlTh1vhuZ3lqHeR+8xtJHkKvyLRA8vI/kVQQ0FBPnq
	 8kj1nupRRbpmnGtKgOzJQ6d3LQWU7Ff/v+iDo0MPkVaRbP95e5GuOTjBFsWvbDI0qGTeP
	 icOzeG6u+GIhzSZx2AflDwopaGQKvf5DKm8cMVZRxyaCIzUYNHjupS/Pi+5vUAhzqPghY
	 IM1PVpzsX1sAbio6pR1uitHeAm1sQIBEwKSjAmqyOCByQuITF/1qfy14akeG1M7aqVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=OWGK8y9k4MRIDYheeXLnskPKirclkz6aY1R9+NlZxhTaBUCiJfPyBqEjmmy0xdxqpwFn
	 E4YXwY9UQboWb76NZsI4uvk1ntORb4ZoaIm5FR0639WctblgGlqen9RwpKjvBL0U5KUAR
	 JWDblb5GpEKc/n0maNSs38ozWbGUIfJZsd8kwvA0eAnca4MzOBPfnOHCQXmZjJWlfH8oq
	 jxyvPCx5dO3WOc7PAalcYOUBJLBGQJaSqik/0KmbHH6GVYSXHR7PW06FANJ7tX6fzbeJF
	 Hds1bTW0MMZEdRG040Fbi2TU9/0VSYAB8T1ZoRsV3TdMWoes03arMsjJRHbzyfef6nA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707591;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8jmxeDTlkdU8DN0KO+t8E2t3b2Oi8osZV8WoE4KivDqhm7g+3XashyNiwCAS0w6L
	 Ex7bXq5Tg9v0hI5ThWV3koAzqfbQVrXzgwWtLgscVguUlQvX0o41HmhTX8n4usp+ff
	 x1hr8ES5XyCDPu3apmq/5KHb+BDBw+9oizQxe7Mh+KjmkpCtyjlXP1Xju6guss44uQ
	 Q4oNcSZMJRk68WRv4yi+Hh5ikfrf5gVSb7jeK0Vm3M9mULXG9cyUvc9fI40dEaGbV0
	 7O7WNJ0+oYfxENNekJ4fsvwrzFTyhbDf6SqFmaUZ1nA/Hjrs7v7gozr08aeuqOMtQi
	 HZZF0Vt9O2QaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD508118D;
	Tue, 29 Sep 2026 18:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB0D3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94667406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdaIUzMWM9nz for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:46:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6D8C4069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707589;
 b=rRRg4kdQfJKMm/bfAuT0Qu+YmSNtS5gnDrbTkteU3D4sJaLbrB/ZZrsF7QcT0OtYtJHw
 LmIF92jHupgNiJXtlM949E06Sgk+TNg6BZfdPfo/qshNan/aqVkdCd5TGq6soA8sTeklf
 Qns5DSnEy3/yZoQ2X5+Ys4wj5w4vrKKk7aV21nkDV7diMmMY4WAgfqiBCIX8F2SA4iv1V
 bVihAdcm+NBXpDsuCvIZL5S+KhPggG4fiWo0W+fI1pUhSGTqB+vQtkHjkKCqFmwv8dpl5
 LXjKO7cmyvmdsfcXlWDgttpuDqzoJdpQdGrrS/jI/nOS0HUT2AY6w8lknQ+FyNPH7Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707589;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=mdv0NDs2k2xfK+VhYyjAnKv6v/9LLqd3i5dB0CtZH48MhybMEVko8vsHWldhj0QTeDfQ
 IMUvSMkpbMMG/wkWkm7XGzPiSDRqzl38xI9p4iiodxgxsGRWjEMTayfiAEoDAlzFhfQYw
 1B6MP7872q5QI9lkz7GbI/lkIYEaPApWJNZWm+KWPIaJZ12If+ooc0WhOGuQVP4zBPkkf
 D60ioJODTtSFuQyzS0aHrieEW39A87M9648myNAUqRmS+749LUpzKOG9BaSy9xzXE9EKC
 b+NoxlvPECM4zi6EKz/iw16+Y91X5kfGAnsa/lZ4RsPH+Hh8Koq19KGak2/BIzwbY9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kxrQpByh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kxrQpByh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6D8C4069F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707030;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=kxrQpByh7zyiDQFzDL85ureTNwnG4WKqCLG8cRt+b0PQOJolHSrPDNVj7i6wKS8Uo
 FxBkSeKllm/sFMWeFgbvOtcAv4wvDJ9jLEUA4b53Ryk62YoStP6d6t94iY9YD8hsN4
 w6RzAbHlFmtZt+tioulffSC2HSEqXp9tx2ZjOA8Uv0hfrUs8dY1Pa47eGhZxlkMBFW
 vzn3fxq08n4CcoRSsceA0hJ37pjn5b4BmWXrX7NlI28U4e6qxfkLkt+isLn6e2zn0x
 K9uu1bT4MFvBZGxfyU2fQelco+syl7D/29wxoUskYW8N4zOgsFUMAJIdg6MQhShhL5
 pDppqxbgKTh6Q==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 GfVifyxV3dB7IkEvFADKS1KLrnhBvONWI9WE0/uGNqQvuAC+9SP+87a2RNPUOqV+RB3uEQ9Y4fd
 uMtidERkkw2fFrbCtIcoeZIo8YSxx7RXWg/RgINj82kdQmDVxlA+PVWLkbpKby8BwQASn2aTZjv
 XGJ7r5r+IcVJ1QGTTFgC+QLSCgWRp5IcTjfuvDLus++J25DPBqR3HDOtyZNQgAu9mIc4HE/9U3T
 xgb4iasM1rhsG++pLcGBCBwNIc7ItQyP/K5rICbYXpy6WrsoAn81aAdKi5BSy62aLQ2xH+fNVrd
 WKTabLryoS34pQQ9OsHzM5RcvxIDvddoqIdKDdGPM3Xx4CmerYAsAf734eFw10dbVG3x7SwxIKf
 Wq046aW/m2vdqhjh/7A+DxigfFfWo5F7ck0qIA0KOs9a/J+Nf4j0i9OKpPR5KE/TxxkVNH9cLYp
 pLdbZKvM17rj1S/uBj4GyaT66Q0DN6LDZ3/lQZs8qK85cyGqaaeJh3CIR2qPLyh//T21z1LnmLw
 3TZjAJxlNVO3pnxq3lnzosFKUdPYyRIy1nryzg789btIsRg36j89Xz3a0dAkGTyGepQg6v7D4Oj
 vXqAhQjhXCuOmGPpaQhPAODThOnWL8XIlmLneHegUMYLYLuBzQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76AF7A4C51E7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-3f3w
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:40 +0200
Message-ID: <20260929183607.1849293-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 41/66] package/libesmtp: Fix build with
 OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
