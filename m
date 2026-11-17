Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC6606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qheoIiUs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D567C60730;
	Tue, 17 Nov 2026 22:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXjeah7reL-3; Tue, 17 Nov 2026 22:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EF7F460743
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794954076;
	b=P0i4oHAV6M4i3NDPzAoaeggzKJqFjMwQwNvtmwcaEOkI6er6HDGDFjzIlDcDRmO9+FC0
	 uv4akK70e67mW3yEyA0wzEAiJQrd9youOt8fvvUYbS75l69mxtD77EbO7UZH7AMqyJbXl
	 YnqK9UthP/xfEKKUj75dt8vS0h3ZeY5u9+pdSFpiDjDcgtsoa+DADzWqSVMKXomkLPF1w
	 D/x77y4hkITpOC2StX7MoOI4XiO+gk1jEjUMNqaK4A+/cGIZ03xeM7KUOTXfbOYVqhAbu
	 4uBWsut/IqBNNLcgSOoFfAyjFD7tQ5nT4VYZcOSqG97CJVn/LEFoHz/5lwywvyXt03A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794954076;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HPC7pgzyKUB81TLOnRRCvACRokcB8x4yiWz62sBaV4g=;
	b=p+X7GMdb3ushLDhXCIjUa/87toTDdnkhHiBCTI0ox1QMwxiry3h5MAckZzQRJDo3hWr9
	 fDetzWIOq+T4stWDS2AfMOGTX0EktedboMQMmTY7H/50R2C2h2Kkx/MuEzlTDVjBDMwrs
	 0v+M37Lq9kUgqIsPyaY/e1E7oFdk8B4TNMpHdBE+88/8oiUXlkmbyp7iHBzn9eIAcrG3d
	 UpHCGWuOrTjGcEyICSdvFkLicmCZaS2bvzEWDx3eM4MnX5F7iwuF38fFRRZcYGt0TpJv2
	 G3cW+T4a0HQP1ztGP1MV38Z9C4f5Pm9Fmpa/umU4JdaIXMAgcpRJ50442zB6dcjwZoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794954076;
	bh=HPC7pgzyKUB81TLOnRRCvACRokcB8x4yiWz62sBaV4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qheoIiUsQlVd1Cv/qkNDBw/tywDoUcZEdeqLP1gy1gCXJevAKN4s4JFq56JeJSU0Q
	 tjcu7LM5KL+ZBfadO3c8ARbPWwJWAsM2B4hMzrvpOr1g4YI+XTT254WPqyTr0wEe+9
	 Y0v1NzLPb6OMR5lve1T5GED8FoHSO7KaD6Y0SU5CGstg3T2XQWskrpTW3TPgOxXLv+
	 mwCpOqpOa+uPerr394oo/y+d+3YlNNgcqull+JMaMCdXfFpgB0WaZSegJSkcpv5Vtm
	 azgYFSYJ9+iSwG1hQlM0O6BJPr2SbxsP1anB2HLi8hoVMqWj4DZmp1oGVJjqmeIYVi
	 uZvyPdLDbpClw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7F460743;
	Tue, 17 Nov 2026 22:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45CED1A6
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9F54035D
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZ_46LzSM6D6 for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 22:21:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F39384005D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F39384005D
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 22:21:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c50ac25cdd4so24601866b.1
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 14:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794954071; x=1795558871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jS5+VKUDSPvSe0+eB6pp7HIJ04BsgIpNFFCEnY1SrR0=;
 b=sxptD9nplpLskJKZeYkGaUBTZ3uiG3UuHZ4QQCnKX9Snmbq7ykXSxQXzBjzREofs4W
 q7MKp6WLVemXol39GWNtXYF0psjZAy1MvSoQelB4QDKOfVW6DEw1ycLBfLrGhknHEGqK
 AGJ7USUpYZ56/DGUDBE7WMP9huDb6eTeg+vZn+lJGNsHe65ehEx/RINEnk2ntjJUwsED
 3PiR973xuqt6LXcR2AWnJgprLG9zFnC7La2/g0UaojACFbAL22xfX3yj4cqa2x3NGMQB
 nvGAhfTeakCCq1RM6fUIil/425imGIaiatl9b47gppDYuvfuonHNs49o8OUkX8dDUqn3
 sL1A==
X-Gm-Message-State: APuU4Z9GbW8zGHssoF/uDacNqeLOp2i4CLD3C8bn+Ku8b1h0B8oJdisl
 eSbRX/hGyx3HNomB+TbyCQPCYsZwwExEheDqUw3jZkrnsFoeAIbnYW+BmwY4zQ==
X-Gm-Gg: AYBFou0/98XB1V5JP5esfVhRyaHerNqLQznUE0V5zKd6cKZaMUdPROwKI9n+VdBagxm
 JTGlXoUsIhmeOVVpsOEu0n1Ds9Hjh90v7jEJzM0ECcoX5r3/IlZZkGeUU9giNjdmYGY7ksB3SVL
 v3JuS+LdBRLikv+Bi0hOLP7HZdzUAHnW24aPTMvf2DuXwjylfq25bMG2uifp7db4cZd/anCa8Lo
 8Ust+9pNrIKCiZmMXYWv5DzXudv683BgA7BAsFD4tJULZvupMQ3i6clTEBx22tKGMkX+bDoU05P
 MFBbfQT2nhEpinsKdx51xvZQsBuakVSWwqM2zqjqYMMQjVJBCkpHJda+XQJvtuTLBKZ6aCa+TxU
 3NRdnbGW4jZmcEXeBhEX0cW0o7wiOUUaVKCflF9x17S5blUyY/vJ3+5ITaf/LlTBqQQr1lgV0O2
 XvsnysJAjmjaLV89L5BEaBgb6rb4gFWv8MJBJX/b3Or0gpZMvDrR/81IRcbwV4pO5Wg8GL147gT
 z/HRvZyy4qRxog/x4Z4d7SNkGaoEw1MhnfKPN+008Mt/k9wueLUpRkognErBMOQpOjfEsGJeSgF
 QQ316EMal0ESdvnBBwgHqavjMXXmEHxJAEAXqgobuGyRvHLj+hp8QDihB6gb8FGaGq9TIT+NTc6
 BYh0B+2SD
X-Received: by 2002:a17:907:6d1b:b0:c51:691:c76e with SMTP id
 a640c23a62f3a-c510e35c6camr47473266b.36.1794954071551; 
 Tue, 17 Nov 2026 14:21:11 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c510ca62f92sm27403366b.41.2026.11.17.14.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 14:21:10 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 17 Nov 2026 23:21:10 +0100
Message-Id: <20261117222110.4044258-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fftw/fftw-quad: only available on x86
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building fftw-quad for powerpc64le fails:

  ../kernel/ifftw.h:73:25: error: implicit declaration of function 'fftwq_stride_destroy'; did you mean 'fftw_stride_destroy'? [-Wimplicit-function-declaration]
  ../kernel/ifftw.h:73:25: error: implicit declaration of function 'fftwq_mkstride'; did you mean 'fftwf_mkstride'? [-Wimplicit-function-declaration]

The stride macros for quad precision are missing for non-x86
architectures. Upstream fixed this in commit 40e620ec4441 ("Fix
missing quad stride definition (#422)"), but with that fix applied,
the build fails further:

  ../kernel/ifftw.h:73:25: error: unknown type name 'fftwq_iodim'; did you mean 'fftwl_iodim'?

api/fftw3.h only declares the quad-precision API on i386, x86_64 and
ia64, also on the upstream master branch. fftw thus doesn't support
quad precision on other architectures, so make fftw-quad depend on
BR2_i386 || BR2_x86_64.

This issue has been present since commit a2380157f668 ("toolchain:
enable libquadmath for PowerPC with VSX"), which made fftw-quad
available on PowerPC with VSX. It therefore affects 2022.08 and later,
including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/f46528b5a7a0579fdc7a3f4a6890c6e50a7799b7

Fixes: a2380157f6688c5c065fa19060a2c33145bab95b ("toolchain: enable libquadmath for PowerPC with VSX")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/fftw/fftw-quad/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fftw/fftw-quad/Config.in b/package/fftw/fftw-quad/Config.in
index 10d296df91..3d490a2c8e 100644
--- a/package/fftw/fftw-quad/Config.in
+++ b/package/fftw/fftw-quad/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_FFTW_QUAD
 	bool "fftw-quad"
+	# fftw3.h only declares the quad-precision API on x86
+	depends on BR2_i386 || BR2_x86_64
 	# quad-precision needs to have a gcc with libquadmath
 	depends on BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
