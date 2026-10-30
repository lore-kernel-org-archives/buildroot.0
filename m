Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C7A606A323
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eQQyPYl6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16CB840D66;
	Fri, 30 Oct 2026 15:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB7Ecz799tEv; Fri, 30 Oct 2026 15:29:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DCE7940DCC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374165;
	b=QN5LPNW4o54zKoCr68TlmUsrCaQDV7taneMdliHKLRI99JoVrdqJlUSFS/C4TSLQPIXE
	 hA26qs2atnOe93z1qcIdxmzDC3lIzqIv9lJa44F9DQw+Zr/DdSo/B8SOjj/DyYwceuyXG
	 RLJloN/+GbjOsUihkzk4Ak9gh3nvp6dp8H3s/ZNAPTTAbXZud9/3rrzYHdRa4ul3rEDUP
	 OyQ9nZgoyofDgmPweBvmQPj094tIvwRjvWXT3EvxO4xzMuWpXCm7idP2ItemjQ/9mc58G
	 5IBmjV6smMQPt83btMvVu5XMUlow8uHdXqrD/mk0p2Smc/rMlCyS76QyxvwlA/1KKGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DfqEdy95OuI+EhF+GupO0wYyTNQc5Pmd/4GbRNLHRqc=;
	b=UOrELW96w9h018hNgZONCINt0K7ItXsLxkRY29bJUZSdxWYhH++mD2E6jw/woM9TWHJW
	 aWIiqbAgP9wBDx/kUIceO3bbvV6mLJZU8OLdYMQZirHrRWEaXRrye2T6pRFe0/Y81gzA/
	 6CuXV9kVPB6J1X9Oxi/zia7kql2KnKR/qpmupQYTEsvcXz4qH5fVgiAv/KPEu1TmgTuj3
	 Xb7CuCiNQr5YoFBeuaemk8gAs1j0R6mt06m2Q2zh5YDP/Z4yY/5R5ZK/UX9lbtyMYWqEJ
	 w/qPAaDaz7aYrdpNJCFavOwk79ahjQDV32pFFGnkar2aEK6atdDXMyb2m9hglXkeafQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374165;
	bh=DfqEdy95OuI+EhF+GupO0wYyTNQc5Pmd/4GbRNLHRqc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eQQyPYl6vzBqfeC00zYUY/kDGrUG621a4Nq6KdaEn7Ve3Q1G5Qd5LRrW5AJfPNNOI
	 /LedbQ+Gyk3BD0r0mjIYAkDGeI0m0PSmyNnmX3yd1aBBdrjCkQmBzW/2x7zUHOt0EV
	 soJIs6EVqYbdHWT+XcmIgTPJILde6lIZA1iGNGMFykG6OV9Y+O2zrIsDJ/YaCv54J8
	 xgn4ZhSKP5ETv6XopMDe0MdMw5TQkuFys3i9r7UZ7RNQB/Qa6MJTw89gdE4KYnh+Sv
	 MaBgztdjWtN+AkATmEwO1sg7AfVobMzGbViL4tHew45qVZKW4b1gpJcepmlgJqmTqz
	 NyzZDsMyPS3lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE7940DCC;
	Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B924DD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F06B81680
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZETHztyyhrO for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99D5B81331
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374117;
 b=EVtSw7oN53ypkmLsQ/r4/AWbldbBdCfsbrWDOOVbPm1IQQRf9PfoK9xpVM48e7v4GXE7
 DwnDuwYeJBhMcp96zjUIUarbfofFMsKwibxTSwdgg9NTe8Z8fS0X8+wKv3goDn+AkE1uU
 lh1BMyg4YioP+DexA3HyGVGPc1b1DM/VuJR1spY+SIZCXfJUeO8S/m/fdmsDzHFo2Os3V
 MkKKCO1sB7TlfFONV9x9aysk1te8zs+OC3AC5y7au3vuu93PAz6ac7wjONJxQIFdDXBew
 lx+XT1HIzST6N+n6nbU7vSkEOCOwlB4owkngRBKxQbHyjL0iOXgAfv+kBD7TCi6HOcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374117;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=IkXsWh+taURWZ6qmXHYiQUO/m9fQSTdbqxATCRPmg3o=;
 b=kmlZKXZRwummsB3ONLxOq05nnRkbMFcTKxmBCj2Kw1CKKRPL1QxsQnDvFkFElupaw1iH
 4D8J7ZPP+fBbpP38Y2JyjZS4sdGjzmmOqGiGGLkAwDTLyyrUQpAmpKXB1o91dkLC2j1qi
 +0lhT+x3P16Go/tjqZ+VqOWSR184OcP0kfqHbPU1xsCDlgQN/x4XDc0faMfaiBEX9ZUoc
 Op2ThC8WIyzxL6/szFqqWgxy8mTwFj2LIZDp3oX2mVSF2yNdFFsQeGN3htfmbbeqW2iiV
 y7uK6sXDroLWl1Kska7zv0VhaCe5qftp2hZNgUMlkp/snC8EX0JgKPk4UsgvbOw3q9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FX5oWtqj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D5B81331
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so6371615e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374114; x=1793978914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IkXsWh+taURWZ6qmXHYiQUO/m9fQSTdbqxATCRPmg3o=;
 b=GFLyCzf1xBy9swpUGZ7BpRjsByO3dThT3pqTzHKlB1/fTk1A7NeskR3OUia8ZzliNN
 Fn4YdxBEjUCqWwNpWFj+jqwx00UM9vBiZLkYXeO+qnv+cg4bWp26u+aCSEfXLyYqJTkl
 3ni8ozUuXk0dPhA3eC+AOdl2RFJg99jqSunO4EDVlDxGtmSgaFDR1BJ/cp3lbOBxVJzb
 YzTrKIXdSVkCsQXSmg5P1Xn2GViVfjCIiJ60rQx2xIg/ZqYdyj2gLRpQ7yv0iG6i9Alo
 KNAl0mEgocofwYWEiVUtvkFKc6O6PgQ5MriUgtAdO4yZR7u7hVG6nPTCRdaoxDmNTLUM
 3J1A==
X-Gm-Message-State: AFq9FYI29jvIwuefPBFH5ZYG0+JUbqpHRJw54j2Dlaps0uY1Izh+z9tr
 WfoHtTr+3AwyVVJTI1+5na+6md2d/61poqbfL086U5ZUbAID2Y11WxuDlDu4QkFptevq8zd+Rwp
 UkyWPVSU=
X-Gm-Gg: AYBFou2IefIOLQl2z35W6BowEQu2HQV6Od4nfSj2Dl4rPnoEgXLUpFIJjAd13NIOSuL
 qvUenMFpCXmWbRVrJodMEBBM8uvJmiaK493MCG5rEJDhIdwhemASgQkcFTBYGYWBW0qUK7VFqPB
 TkFAoS/uBBmFlj+HgPiOIV+aRRt+YC/iYI2ZvDs1I9hh8I8OIG1Ur+tdtgfQldA/pCg6CaM7vMg
 L6zUBkO88X7+hKeJYMep8PQZ44Xe3BqOlinzcGNj/LsmHxxtciwYJO4DXWCF9G3TfBDoxfm+GaX
 K3BaACGbxMO0CBqjiICfIXd0uQJ2l7MtmeCLY8pemWmcX0PeL8Y42dURtAWI6CGWXzKslMpgAqq
 tpIc0NIOQpNEMIfZmbTmZe2634RxIXCqtlntgexNsLGgaq1WG4mnukNmfLCWZgkyPZjOKomusvy
 it5AJhJpKI8PzoARAtqBUBxGpQBlnU6DRqONQlM5fU6osCH6lyCXo0yQl5cSu/TZbLGuKeKJ92G
 6pSPuuC3YXqnfD9H9B0srEzL8T1fJmiM6TFHBP7s0HMeq+eolUKmPDLJ0ul3nXj2xKvy43YZ+gW
 y82qaszizjjMkKOzENtVUE7rrtiLNi1jX77g0f7qHAdsBduApIqTno1I3NQtKWJ4b0FyxHEa
X-Received: by 2002:a05:600c:1d07:b0:4a5:87a:50ba with SMTP id
 5b1f17b1804b1-4ac18e5dbaamr57331915e9.33.1793374114368; 
 Fri, 30 Oct 2026 08:28:34 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a762bc1sm27670995e9.4.2026.10.30.08.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:34 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:31 +0100
Message-ID: <20261030152833.1907394-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022222752.3530250-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/iozone: fix parallel build of
 the linux-noaio target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> With uClibc, iozone is built with the linux-noaio target, which lists
> libbif.o as a prerequisite although libbif.o is built by the
> iozone_linux-noaio.o rule. With a parallel build, make also builds
> libbif.o with its built-in rule, without -DHAVE_ANSIC_C, so the K&R
> code path is used, which fails with GCC >= 15 (C23):
> 
>   libbif.c:191:1: error: number of arguments doesn't match prototype
>   libbif.c:170:1: error: prototype declaration
>   libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1
> 
> Commit d7233ae04854 ("package/iozone: Fix parallel build problem")
> fixed the same issue for the linux targets only. Add a patch doing the
> same for the linux-noaio and linux-noth targets, which were added by
> 0001-Add-new-targets-for-iozone.patch.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"); before GCC 15, libbif.c built with the
> wrong flags but didn't fail. It therefore affects 2025.08 and later,
> i.e. 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used.
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...from-linux-noaio-and-linux-noth-deps.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
> 
> diff --git a/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
> new file mode 100644
> index 0000000000..0c4987d4df
> --- /dev/null
> +++ b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
> @@ -0,0 +1,48 @@
> +From 3bfbc2fe58400d32aabbceaa19a4348981931d9d Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Thu, 22 Oct 2026 22:59:56 +0200
> +Subject: [PATCH] remove libbif.o from linux-noaio and linux-noth deps
> +
> +libbif.o is built by the iozone_linux-noaio.o and iozone_linux-noth.o
> +rules, with -DHAVE_ANSIC_C. Listing it as a prerequisite of the
> +linux-noaio and linux-noth targets lets make build it in parallel with
> +its built-in rule, without -DHAVE_ANSIC_C, so the K&R code path is
> +used, which fails with GCC >= 15 (C23):
> +
> +libbif.c:191:1: error: number of arguments doesn't match prototype
> +libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1
> +
> +Do the same as the previous patch did for the linux targets.
> +
> +Upstream: N/A, linux-noaio and linux-noth are Buildroot-specific targets
> +Assisted-by: Claude:claude-opus-5-5
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/current/makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/current/makefile b/src/current/makefile
> +index ba5759f..168fe93 100755
> +--- a/src/current/makefile
> ++++ b/src/current/makefile
> +@@ -180,7 +180,7 @@ linux:	iozone_linux.o fileop_linux.o pit_server.o
> + #
> + # GNU 'C' compiler Linux build with threads, largefiles
> + #
> +-linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
> ++linux-noaio: iozone_linux-noaio.o fileop_linux.o pit_server.o
> + 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noaio.o libbif.o \
> + 		-lpthread -lrt -o iozone
> + 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
> +@@ -189,7 +189,7 @@ linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
> + #
> + # GNU 'C' compiler Linux build with largefiles
> + #
> +-linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
> ++linux-noth: iozone_linux-noth.o fileop_linux.o pit_server.o
> + 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
> + 		-lrt -o iozone
> + 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
