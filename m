Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3574606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XtXQJng0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nIIjvXzd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B2D605F4;
	Sun, 25 Oct 2026 20:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWd435Oe2bmm; Sun, 25 Oct 2026 20:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2C06605FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792958992;
	b=K1b03eCVTwgzR7sy44MiDJdW/y04QZFM31c4upj0/npK2tsLghMsLdcp6ba9fh8QoA8Z
	 t7PrMcGjKkXRRPDmLGZbjJixEQ/55QHkdfh63+Y1c6uSh4GzWozQX6limdTXewMUeND8k
	 MZUndDf+nkWUve/tYH+bDrNyqRRqbyCIOk6OO/u4Bgq4f/GOWLCyXFb8eMdnXz7VxCy6F
	 cnVEjzSsEipxpM3hEN4kV5YbtZzcc9XznUBSK3c+LRfEjDwKTwSo6XvebPAC98r57JnIV
	 Lkk8vm6LWRmqiRbssKzQ7cLBMV/nZyGETBRWiT2MyMAn3acWyBnhaKzrjTsLSDVaJ8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792958992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jnyPtyf2T2pwGbXmtCcM5L2RXDxeR1Q5SYFENQH5XwE=;
	b=fNwNUOrbAw71cVwtlcCf4i/W6mEttb6m1UnypWDShUSO//eDXUfliPqcFDn60H70Aftp
	 Vb7ggRAR/6rOemZBJcJg1eKYfd0lG9od+Qb2BtYbLoHGPNmgEdirMCPv4vz7eyuwxkWZ4
	 //eq/tq2UBUevDQ5Ui+BgZQZapGsR9WooKAVEgizoBnEtZFB0nUVRAfIxY9uC9u6/U8t+
	 k7VYYKQFgC29dgerOYl3xJMNkY54Q05D6cKMB47cSSYVF+mpl2uYRgsA3bUk4r9myowuL
	 VxjL1pRdJZHwdcgToDrVaTnjLToc86Vs+JAf1L0ofIuPSUTrYLtiG9cqQsMfdBx4k6g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792958992;
	bh=jnyPtyf2T2pwGbXmtCcM5L2RXDxeR1Q5SYFENQH5XwE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XtXQJng04fgzOINdWk3BvVv4HFMXKOQuFTEc4PpgVAJJwVkML/MYZpzhB9QcpVyFW
	 0BYzmLvCvgsF9EK3nUXZOLUuAUneM2VphEQ/xxc3uU/QSQxntS/Ozb0gmcZYnQWSuv
	 ZPXpAPD+yVPQDCGXW1KdzOJRH3dHew//3PImK1SzSHKf7SuKW9l8oI++KQMylO7a2q
	 amMlocYRFeGF6Lm/cJH4Z5gapdflKkWZXT5BoY7Kc6Hu00mtD+JYndLeWRN58L+P6u
	 EE0Nm5LHRg1oVcT/SKXi8jmYMS7QoXZvIusL+WiIUE8c2OTRmqypg9RYDGFKkrhbdE
	 Sx8W6mPlzQOrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C06605FC;
	Sun, 25 Oct 2026 20:09:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 727444D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588AE4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAw8F1s3Sjzv for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 495654008E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792958990;
 b=B6LgBFFQvm4IId8BY7uImltKfZlVQiPmpHdzVcthiSsgfdkaTZaiwxgcSaWETO+3vi2h
 CK5lZbDzMgwAE0kPKB/OU/XfcN7gXtEzR1Y72hepXjqPgNJ7Nc/7um4qYAkBhEAScfXp2
 6y7K+LB26qsd+Zu/vbTaXtR3Kybn7hpceMe1IoZs1pu8fg2fm0im4XqClx9AV+7sBRQB5
 gJId08Id54fURj6W2ZcJWzsYL1fkZ3454DOZA7FDuNOEcZ1f+0l/kv+VMsiEzbuayQBHo
 W6qKiuCjgdCpm2zNDrRW0lp7yEB8y0Isc7Mu7yoRYPnJDuc1LCQYNoD/gosS80yMcYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792958990;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=X85gzQp8wGCE4Qul3uRO8g7QwAzbctWQL8ghc5s4z7I=;
 b=leN9Q2sUbRt9KhmGHBii0SqPzfBA+xKkl8p9aIKhsRtzJR7Ub8yq+cEx0/qwO0hE15eO
 YhOi8oi1ATE5+5UUzJP7ZIhnOo3znaytTm0lTVWqxEMViInKov9Pnhs/5DfS/f0H+IEV+
 9b9ec0a5aM0eRMoa+nceACasEyJZiUi1HzYW2Zv4gW6v9o0xITtUw9LzBz7k9oDcgVcYC
 TaJZ8DA3MCqJq2NcVcPMnFsyc6Cz+vhE9GoAIxoUvunoBl6e5cE3pMqzGiyEVQAgRT+kK
 6rW8rbwQlHUjcIeGskhEUil7qqZMndlJjz0ulmJCTo0vVIzrqKpyk9bH3GoTRCA6+Iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nIIjvXzd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nIIjvXzd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 495654008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792958987;
 bh=X85gzQp8wGCE4Qul3uRO8g7QwAzbctWQL8ghc5s4z7I=;
 h=From:To:Subject:Date:From;
 b=nIIjvXzdJLy/nowGH6UrBWMX2K7zZYTqgHqZywWTouLGgsPLd5a4bgOX9alaw+vEw
 fv/pDNojj3MWH4TewOfzpUZsxiLxzmUXfvWx54jcyCYxMR502RDVbiI0yvHU3n6NF+
 t7B0YpPF6MHBauX1Wyxlq/d839mLOtnmcoN1q5rafCD8Pa18dzEk+Nx7oRF/PXq9ds
 AQmRYMpR4Y56aK7jgrrmp8kCDMxLlVrGGXs/qh5TqjoPHbxhKIGhleqyNqh69IzHnS
 wKCrSZ7TyWLUq6jFz11uBoECuZUcr7LtATDVcGU93jSaK/SOxO5rlg5z4UoZvzoiVq
 8AMbEBUCx76dA==
X-KAS-Sym: v3:f51bdf72230551df:gs5I8o9H2iLtPKNAMAXIrjVac/YTPKriE9A+dnhtlcJNg
 F2go+rW5ROC4Q42IQTnW/C78HxTsW7+BxuCKDG0pzuNt7jndcveJWLWhqQzDwt39b0bFL2PDH6t
 csR21rggwyiYivtf4LFuVS0JDWb3XyNA2BNmNiAgxkw65AEdbyHVfFYO520RzXV2zByVyapCbFc
 +BAcUEueumgBkVgf9Pr2xeA6hoG9IsDL+uFD8EaPP73dkiqzblv+diynkPTUs1du/DqOkZKRI+O
 FDBlMTUp7d/PM8LhovZbpUuM18FoJqytumX0O0Qw3RzQVrA4g9Hq9pSmnDvEr4i0MOJ9g3DQ==:
 hbdWS47CMZZVr2VypOOuKZ1qeVsfDsvplJZI3kUt0QOo9qr48cw0Y+W/kFvdxtRzqZKXHl/dedy
 r6+feZ1/KNaqdGactLs7DDN38J5hBykHZfYRPvh+ylsSNi3ThNxQFYzv+s5DIb8LyUB62yoEZ0e
 Gavr/ZtYwoy+W4YEXJRscq3hE8e9P7hNlh3B7g9fOCm/xU1fcK8m4d8DqzJW405Apj1b8aMK2E2
 tuu/BrlluBbv6H8YBXNYydbRHzFRli8St5P8BKj+LoNcnvAzSPoFcSButUNlvryNs9xD/hk5mLX
 XSQlDRSguO90lt5kPwLHt2hTv0eFnjj7ERsNFANXofEWx/KoQQxwpmhw0y/ATXaX2aOIsjBNEUW
 kta6xej9Xn0C6vGglgJl5KuCTmvb9d1VhxtjVUsSMh5nTO5m4fWi6IaDttIxVi2vhX+0h/vq2z6
 2kCyhZPp66uBWEtDcAAGdIEBqBRkxiN/5iesqzKF2gG9APQtNqFbIv0id5c3pkmM5J4JZXjSOYo
 v/uhkf4JGxyfF9WuKtheQ+Ebo9+yL7NQTjJ5rHHMQgDFQlTABPcuNvtMqjPbAjtR7EOfTrZMfrX
 KQZM
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24152A4C6A14
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:09:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54146)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL4XL-000000006JO-0Eef
 for buildroot@buildroot.org; Sun, 25 Oct 2026 20:09:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:09:46 +0100
Message-ID: <20261025200946.537342-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] linux: fix headers version selected by 6.6
 LTS kernel
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

Buildroot commit 5e8705263cf4592d8c02fac71803053e17d4f83b selects the
wrong kernel headers for kernel 6.6 causing a build error:

Incorrect selection of kernel headers: expected 6.12.x, got 6.6.x

Fixes:
https://autobuild.buildroot.net/results/857/8570296451fed025c248530da8186ad5c7b237a3/

Fixes: 5e8705263cf4592d8c02fac71803053e17d4f83b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6a1eed3146..a722031fd5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -55,7 +55,7 @@ config BR2_LINUX_KERNEL_LATEST_6_12
 
 config BR2_LINUX_KERNEL_LATEST_6_6
 	bool "Long term 6.6"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_6_1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
