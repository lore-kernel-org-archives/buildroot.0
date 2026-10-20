Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE460A2605
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qMgIkvoK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=iyaqGk9n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C0F760887;
	Tue, 20 Oct 2026 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAvTHhRd5kYt; Tue, 20 Oct 2026 13:53:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6601C6084B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504386;
	b=ij8fACcKoNDyyJT3NwvDZQd3Nkqa2wZJ2mI0p0wtptuVHwP5IXQMTGX84t9JegLgZFFt
	 SsH/3517nD33g4ag9eQJ1K99hfMLK4N0CMt8vhKVb/QURncxaqUQnRc2FeOKkAnzjOOKK
	 fNvepih3YxfgIVVwBrV/vtuGnoo5z4EeS6HBrOZ2hEoy4t4btCUgL7cxLchpv6o/XB5L4
	 ZVpG7NLCZ2dNx0QRB5YCSrBVeHIC5vx6nG+T59u8nKpz+mrxSwMQPSZaDs86wIS0haz3f
	 CfbNu6nDL54mpHU52jbyQUUU62m3TjvSRErFT2kdVFz+vjOmTNwEhqwycsuzEW6+jsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FCWg+/V2DKBga87xU5ctKc83cc2XA3oTYAr+hHRSQE0=;
	b=b1DkjmEbRa6zwFyOzzuJ6KVAM5LGixgfQEQMiWaI5phiHi7j//lios3tfsNmEswQNTef
	 EBMYf5MzHqY3p79xWSYGV5/E6jRCr0+01fE1NMLkc2P7XQp03FMT7No3726H/Jw1Qo7lN
	 zIfxvEajLxb1YW4WHtNF07YNNIgorSIgNe/ruyED+jOg9oj5ZLVL2Rl5+b3Sxrxm2n1hG
	 beMq+AB17ZJ5aUr0KKYEmatW8VmmaIYIxCgiY5YD0X2Iiop99PfGk2d8fsy2ebuNQ+Y43
	 H7fswvLMNHiGtIhRLAP5IyjVshClxju3RudMFHDfGLtl9Ktqb3+FIkX8iaQUomZjszw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504386;
	bh=FCWg+/V2DKBga87xU5ctKc83cc2XA3oTYAr+hHRSQE0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qMgIkvoKHIjUD2nCqLW/3ZQR6KXrTo19pCVNYgJAVut53siuG8Bj89ZlTqkupzr7n
	 01ULBFCx4NeKPf81tHhcf62ZII3u1Z5xwXzdfUcWKREpxy5dyKvejfTOIL4fUXiUlP
	 4o6r0ebYAaupOFQYCyfcImnCxGYLP2PZ8/VPbQZvTvtooxMjJQ321ttQY5VdzriwkU
	 cV/13pbFbWvCmbWZQLabBDWvUyHs5vs7FU0+NA08Xdwn3Nk1nql6vzu27sWxzQK+VA
	 e9smDGpk2ys3ApfBbu9fFw7i30YMSzKq1klnnM/Oae28GLwZBZ1rANxDaUE/bp8rYe
	 FkCjj0m7lduMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6601C6084B;
	Tue, 20 Oct 2026 13:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE30769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70AF581004
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWkmzIIBQDQk for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A9C280DB5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504384;
 b=sOG3MDo38SaMhmDFGSZqx/WKpetXvNKuX8cXzEi5GzikS/RR/Plqr4VdpG+z1NsdeKan
 +KMYSZlOLFoR7UZNZ7HgVFyLSGAYpWEeRKFDtZ8Hpy0mDq5gZ6hGKTSLXGLY6/0twUxcf
 oWUiC0NxcYlFyBqun0WjR+06ML4TI/f9fIvXC3IaCMerN5mlEkhSvZWyWqObgJ3Gk/Bcu
 7kwRYZudIQ9gEAr2KydUzhpOcLmFDyOmprgArsn3vJJhwO8Uk0Zpg/Vq220I572XQrpPW
 jbI42fGsOacxVaPIDHjXC1rhBLVwxyNK+pv+ZUqfTgDbcHqbp9psFs62j9gyvkkCdBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504384;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qgdD+3bnj1Ts7ZgkamaxsS7vWKLwxFfzpZWtVF2FLKY=;
 b=fuT+JPyUhiQwkictkDlyIKmNfl+iDxqDb8LM++sCZNRdMwf9x4bPKIsALa5WgEnRjlHo
 Fg76tQSLMnB0hcnt5qy6cYmvQYh9b2I7i3pu/eV1jsF0WOJxqNx3mDBUoky62x3ufOh44
 4ewp1/jQY5DcmblJE+NAeWncFasgzwPJXAlLir5iGTLSzqkmbXZQYpFi1Zt55Xj1OTNym
 lfqNy60wTsyJ+OShs/KwOe4p6nI5gxict/c3NZukBVjnY1ZhlSRN78gmeWuWHwyYyc8S/
 ID/n+uqQp+8xo505qaeA+jWemUr7IhID/ikTNR5jYNJZGwtfoaS3u/PNnJ2CFqeWtXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=iyaqGk9n; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iyaqGk9n
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A9C280DB5
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:53:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso4420975a12.2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792504382; x=1793109182; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qgdD+3bnj1Ts7ZgkamaxsS7vWKLwxFfzpZWtVF2FLKY=;
 b=iyaqGk9nLAu0XVZc41CS3/x5euBX+8/1noh3yMkzTrGbfI1iemLSB9icb+FLgPDzfE
 TbSnbtM/sKKgC3GcXJtzqaAjqRESAt6uGCgKHnMjQtybRA1lDESAJB9rpQ/r9+ljQW0+
 1MDwcIy/mgFWWm1urlzG5HkwtF9iiwCl5yEiAWpb182VB7T5cR8DIsWe53EXVlRfFUu+
 gjVKMY05W7Sr/bInWEYjYNhM405P2DcBPzyB8tYY+B/vLkePUC/MWhrPj3/k0naQBtIw
 kG+c/A3L8W7vEsAdweFxeryMQBzQE2d63izQCZOVynEsB/puCvIIkQOrHLetGscF7KrF
 IsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792504382; x=1793109182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qgdD+3bnj1Ts7ZgkamaxsS7vWKLwxFfzpZWtVF2FLKY=;
 b=ORG0EsZYpDviDuG+e9my0X3TizOFCO2lbcDEBLBsCFW3XMCcybqXrhpIBJzLvv9Fm9
 BinLWS4PdjZdYJ5K6jFBdd0fov7NRW8OneAaC4RZ0SkVBSpGNLf5mkCHUwH8m8ikxBUW
 0F/ojEJzVOpTcOh7WTJLEW+fqQeFUuM/aNMU7V2hJiDgVe4lSJJu/+VamvQm3EdLdpVu
 NFqlbtQKXgsXKruMLhYZd5CeCi9janF03MVlinpSTULAkl4udh2VrgFxwMQjHbRWCeUG
 9RdBkvnRXRVj9+5RR771s4pTac25Bd6rnnFuNiUhoNbgv56MOL3gxT1JvoqyylfBf5HF
 hd9g==
X-Gm-Message-State: AFq9FYKaoQOmqE61n68tje+2V6peoM2RCvqaOiaqpJK1C/VWVc6qzH96
 y1euXmV6H78yXV7XJwX/mJJxZ6ZGGuLuJ+PxPyy3j5+kuVnOQxtzyXp1ayiUyg==
X-Gm-Gg: AYBFou2ou5tveVx4tTKIxIVnUX1d2d1mSB5PmwFfzkpNcNKZp5OXxNaA7DJN6x0QU8/
 BHvDCH4BRZ1E7Lpioek5f3UOLKv+MjCURKBRAUR1H3gNbWaL/WDvWCNANOeZHzFUESBy7RmWSmu
 R8l2NPI91hdWhuDQdBFy44k6guwjuoGx60UIvI2k0AXmXLslBO7dtwZwGgrBUJTMK/WtHrbMGt/
 YURPd9CjF/kHCgtVZOh/paIsEBjbLMccCLRrQr+3b/3FzMYgRe0H1V99uk67rej5EDgtecieDP4
 vM6lYoFYt/KgK0niEJmwTgQAx5MIOaumEqTN+7OxqMyoG42r26qu+4vbtc0kmAgY3F39sNsz+iv
 yj2IAF6zDHWETrDX82IyuseeKml8/py1IQJFqYhWvpUxQJTvcAdzvkACj7v3maxVjMZQf83LhaP
 Z6u/saMlrxQI1JEp20cBtFxt4f6QgzSogG+6M0clv35SwpElPX42/mbDzi5n9t/WW3Bl1Kn6Tfk
 lbiRx4JR0tRSe0iGaex/w549DIkg3AptXk3aURQTWZXnL58CO28u0dihlYBD61q
X-Received: by 2002:a05:6402:3605:b0:6b3:af2b:7b34 with SMTP id
 4fb4d7f45d1cf-6b3af2b7c7amr6175669a12.11.1792504381679; 
 Tue, 20 Oct 2026 06:53:01 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b3cbe98563sm2757070a12.27.2026.10.20.06.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 06:53:01 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 15:53:00 +0200
Message-Id: <20261020135300.3973040-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mg: needs a toolchain with wchar support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 4.2, mg uses iswalnum() from <wctype.h> to tell whether
a UTF-8 character is part of a word (upstream commit ee22ef729b16
"Tell UTF-8 words by their Unicode class"). This breaks the build with
toolchains that lack wide character support, such as uClibc without
WCHAR:

utf8.c:23:10: fatal error: wctype.h: No such file or directory
   23 | #include <wctype.h>
      |          ^~~~~~~~~~

Add a dependency on BR2_USE_WCHAR, together with the matching comment.

This issue has been present since commit 3b5fbe8f6e78 ("package/mg:
bump to v4.4"), which updated mg from 4.1, so it pulled in this
change. That commit is not part of any release nor of any maintenance
branch yet, so only master is affected.

Fixes:
https://autobuild.buildroot.org/results/9d55c1b27627118c4279d9aade9f65b45db57e52

Fixes: 3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a ("package/mg: bump to v4.4")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mg/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mg/Config.in b/package/mg/Config.in
index 35e0e6f57f..7eb052d1a8 100644
--- a/package/mg/Config.in
+++ b/package/mg/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MG
 	bool "mg"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	help
 	  Emacs-like text editor (260 kiB)
 
@@ -16,3 +17,7 @@ config BR2_PACKAGE_MG
 	  and, in particular, no requirement on ncurses or termcap.
 
 	  https://github.com/troglobit/mg/
+
+comment "mg needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
