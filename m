Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B8606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K6o2kCTZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DD6812D2;
	Thu, 22 Oct 2026 12:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hby32YKUhBFO; Thu, 22 Oct 2026 12:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 168388126A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792671069;
	b=HbF3oGspv4jSnQJIHYpprincPWnLJXsWfJA67pNjo8Q4N2Agtf2a1kHTVmpVeJbZy4uZ
	 fHk1Ux6AV5eEHb3/Tm8CaH4d/2eFPF++3Q8fvcsCpT+0Y6sph+5/k2MnxpXRNylSEg1MP
	 D2nHrid3uicvxZ0GBp8ZcgPOYtjNZog8fIVV4r4KLmdYHrqobBaOsaK82C02Ebyuv719C
	 SGEjGax4hv7NT0nW4rjPWbjcGB9OZIQvbYbPp0bZDEHw8l8FrbegsOndcy7/KHGrFFZ1N
	 knSCDqrRFVvVsp6W7szTj6EwlzXxs4bxYk7rYBxjlUMzI/I8B2/G/kXV4mshi4DocEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792671069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0kKcolmoQv7sG06isxc3UFc8oa/OgW0KqtLi+MqgCyA=;
	b=hYAA919VtkvmtQM9avq7SiKvkw9Q4cIAZjF7BmtNe76sPWwZPm3M0fg7+TAoJJH1TRWK
	 QcBYutJYWEdTVmvMlXfLSN3SIDrRkX5Nm7tKY8xAAGp5ANCB38/0/lizJDRLIHhhoegLQ
	 VdV3P2Z/uYG6SOAQA06dvdfaUCMG65TyoKE8IixWp25gZJBRQHFr4/I0F9B72uvvneI7c
	 F6qjZ86TL9V85MUMcAqDUEy9/qkLIdsDvAxW8hBIzxdJrv6ayY7iSR2vLbUb5/fLd+rYZ
	 xyTC9OAWQjNhzHB5lgVgARRgD6Kj91AV0wPSFM0bt9l/tIifLPsnhdNYlNFhIyt/geg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792671069;
	bh=0kKcolmoQv7sG06isxc3UFc8oa/OgW0KqtLi+MqgCyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=K6o2kCTZzPEBqHdLdGiTZP+pW8mwFCADof50zccbaO62OReo0cUDSioB4H4zjfsK0
	 JneCJL7V+zn7LXaj/MfB81ohqz3NJ/fOJwRrt59T96G5b6fWzVm3E8UlBVwOWUpF4E
	 aZHqki32Dc/EUFxeFuuvNrjtX433e6Dep4nJVNwiOcMlE7sKH0qfPegaq1Mm15ed7i
	 p4UG2s7w8PQLMblJJUUvZxUhorHwKVkKO+HP0yThx9jbaFHBeuJfy2xz92ySiqKrfj
	 b963Zs5Uw8I16T2M4zEC8PBH0J0EeNrX8771nfbzu2V5QSVDzTxQ0ih/35OJLuKtI4
	 GLz6oIRE7pPqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 168388126A;
	Thu, 22 Oct 2026 12:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5578A3C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AD118126A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW3T-0tWTJmB for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 12:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2BD3981266
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792671066;
 b=KmPtPSuPTFwBM/7iyFofY1uckyGS1Fa/QfXlf0kyOe/kghFmgoXGhJGj8as9Mc3Jo+G2
 uKgvnJWOnWdwODxRig2b8avf2e+MOLImYb/I0qEPA7paHLzQPOQUhpfz2blzJy6Kn5NV4
 yW8EoN1Qv15FGBA0xghlYehB5xlv84GCtLi0I5pfkxXonYVzV+0Rtxw2AdRv9+2q/e1Wi
 YNRN+aICzgjoxX1a3RFTpxaNDFJJQ2NtucmSS+VFJa8IV52dKMQ5sd35UXoytYmR1Xrn4
 4mWvRZprle4zMKD1tjGnYAJGx3H92nR6hsJlqdygCphZiGXLXhYbGVM1/amNzxGS7jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792671066;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=v2u1BDFNGix74mYqadi/5vJYbfSF5yarwcf5qspEU+I=;
 b=FkPU4PUabx1R3mbQ4dcj3IxpdJ0PU2vJThjG/Px77771xxtLp8hTw5t3EHeWuuTlAPa8
 p+hOUL5Je4PUjxVR0MKWikscuQ4ae6BGiWj4wjWHMUSjZoJhKCVjyiIwX6LuQQa8Uuz/9
 0fnhBN2xP42CgXANNdQMgSFBCzEGFIXqhvCJaVBnqrO3dsy7E+ZBkZdNFp/ArCDjxN0Di
 GmJDA2htGnGwM5BGjqNbQd2ow7+/v221H2YPxcwdFqy4b3EJLBPaDKe7fyfXxk0RT0h6c
 AChjszjLBCcvX8pHVep8vQAv5LW6N+3H1riP75iHHexaS6dcDNVF/ANWbCJ9ONl7CMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JUP8bmhV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BD3981266
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:11:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c2acc1e170cso254667466b.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792671064; x=1793275864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v2u1BDFNGix74mYqadi/5vJYbfSF5yarwcf5qspEU+I=;
 b=LRCTEMg+eSxdNTRB4S9qThuAcM5hMZ4LuPXDgbSYwG9VA0t1fRB8nzV8pHCJwOVnTx
 eDADtbD5fz8+lPIx6BLxEVmk8i6DrSZLL6mZTolqZ4yyW4BO7P+5kbjzL0dmlcRVE7pV
 /9/4mUzZsa+CG4whNKnFsWlA1mGpJ+k8z+jaUwlXApAQ4wTIH5+a3ZmUGkTXPWB7DXDY
 tRTN+NhohrHXxTNgiUPOr9fz2QEOYbl3nUhSz+uQy8CAmQll26U8bho8aNvoLyzVSgSg
 Rz009R2/Vioy0f5ni3RTziKvlqjwIuz4tpTSoyqaG8SMMbC+7lUyglEzseqtuiAd42oZ
 AtAg==
X-Gm-Message-State: AFq9FYI+HUuotSHmWINB56S0Hh6pC809GFD069Mj5+I0JZ3jjuDRhmje
 CKKxtMLC3jGrIRjAxm/RfOMtN1bgrhj9sdS9y2v13mzX3lnvPVlKjpHzMh39xQ==
X-Gm-Gg: AYBFou34yUFiFY5bY9FODKEe6JlvSz81WoOx9kuSxbR0JHhTGFCf0+XuBsmL97eZKC4
 TTY5iGDmrYkdOwbz+RZNDCJ8oFEQOaK5BNS+ES+gpic20gfpGjoczokHiHEZ88KsUBUSwr71yLv
 BxIfI46E5nBIgqxW6YP0wcI09tbcC4L7ur4fhNYT+fR3zM13BivwDmT477BLsaUb1jE1vkJ0P0j
 CuPUArumw8iOKtKwHFXMwZWKuVTF7mp/6fHYZtnjgNtCWYbLfReZTPcN5mjYjpvtSwGrFWYQy3T
 WsD2TQ9RaLcbmg+9U7biRSYArpXUrT0b7R7Fg9z1aimrItUtUzARltkKgXwTkhL+o25iTFKD/6B
 dvR1OIXJOyj0XQTPY2y20N712DIsITxneD9dB5gjFK10aT6MpOvrIBZS6lVr96Gnduk/t5fVspH
 04K4jJbth96ThwxFJjvGy92C76I3WozMrdySfS4MexVi/92fBYLd2EI9Q1CzL/twbD+iTB3qnCy
 2Z1QLiOFNB/tYw8nM6OGN9XVFBj1yyleq7lp9DAmlu2EpOK0dz/cFoqICV5Do/6FTbLyWpDsgWe
 gziX5xrx2GWcYyDtUnlxIJjMtc6OWD9s5Qg=
X-Received: by 2002:a05:6938:a092:10b0:c46:7ec3:fde7 with SMTP id
 a640c23a62f3a-c467ec40883mr345341766b.31.1792671063682; 
 Thu, 22 Oct 2026 05:11:03 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a59ac2csm97852966b.51.2026.10.22.05.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 05:11:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 14:11:02 +0200
Message-Id: <20261022121102.3130117-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gauche: disable TLS support in
 host-gauche
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

host-gauche fails to build on build machines that have mbedtls 4.x
installed, e.g. Arch Linux:

  checking for mbedtls/version.h... yes
  ...
             tls/ssl: mbedtls
  ...
  ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
     41 | #include <mbedtls/ctr_drbg.h>
        |          ^~~~~~~~~~~~~~~~~~~~

Since version 0.9.6, Gauche's configure enables mbedtls support by
default whenever it finds mbedtls on the system. For host-gauche, this
means the mbedtls of the build machine is used, and mbedtls 4.x no
longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.

host-gauche only provides the gosh interpreter used to build the target
gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
not depend on whatever mbedtls the build machine has.

This issue has been present since commit 73e836e13982 ("package/gauche:
bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
support) and thereby made host-gauche auto-detect the build machine's
mbedtls. It therefore affects 2019.11 and later, including all
maintained branches.

Fixes:
https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d

Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/gauche/gauche.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b635c488fe..c63a663ddd 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -11,7 +11,10 @@ GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
-HOST_GAUCHE_CONF_OPTS = --without-zlib
+# host-gauche is only used to build the target gauche, so it doesn't
+# need TLS support. Disable it so that configure doesn't pick up an
+# incompatible mbedtls from the build machine.
+HOST_GAUCHE_CONF_OPTS = --without-zlib --with-tls=no
 GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
