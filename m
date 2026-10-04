Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9BECA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 12:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1AC3406C4;
	Sun,  4 Oct 2026 12:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86MU5ctmNZ99; Sun,  4 Oct 2026 12:18:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B17774069F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791116299;
	b=kBKrS761lxGmRpYCn0V4ak03obd2u6aEAMTRT0lEt0AugtavM4GFOc8Uf5Cz2DbJ4IGC
	 T3EqeoZWvpJk/7myFU40VnrA9M74HmsFUnCyL0R1NvvtwsSTURUbC9Kx5HH2x9LB+9PXE
	 U0Pxh0FfH8OEox8tWCm4UWLpcdCG3v9gOUBugEdphfY18mvmwdRHPC3wRnc78/UiW6D1a
	 lTARg7z0UkRfltYVs9rPxf6FcnOhk7QUHpQ+ybRlm6WD48ebbKgD8p/hs1HW/EGImG4BC
	 4QJ56HRQZgkszW1lNx8uLSYnsX/Ya+yfOYfVhfDYTkFQB548B6QyjaXfCmvVJDNUpNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791116299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDxL4SX8pgeOjqC/eU3bhQlx9KklM1e858zn1A8+ck0=;
	b=WXup/+XsC5qp+/ezq1fS5EVS1cjFVakxmekH+b0yQXTkXBDf17SCTIZ64ytOQOvwg3po
	 jbhjSrD57puCi7sHFEK+gUZqSpC7/v9fUfFjlX6r1RCryLv5JM3k0mJxwY0XmVu7tg0zL
	 gid5RirYopxIjJ9qz/Z/4gO3wJZXst3M1FQH6PtpWQLaDcQHcCAlwo458DWVJaMOcttL/
	 tWUn49/UL5yR1cAhj2ltUu2k2SXvB88WgXbR0RwMe6kT3BD0loVi69SXZ0SJxGjHeMupT
	 PIphEK2ggwMZYbJwO342xQrsPlPBolwbKarC/JLa2jpvAiwpL8GGehgK2cdsKbmSi4g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791116299;
	bh=SDxL4SX8pgeOjqC/eU3bhQlx9KklM1e858zn1A8+ck0=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pxi4lTn3BjDy7IazdAifarNOJXCsvoZvPYM7UDC9qkV5isesYhqIcUfLym+kQ4BKV
	 /+EhsjMUfCgPKUkuJYk614bMV5UM6uvMbeoLucT3/lA1zsnRLhkJ1XMDfljAy26+39
	 2T7rlvCSvK9f7Fhf46TOdZrvdTsnlBRZGZrwyI4Z9duoyOPYvJA904yIdUf4Q4xY4K
	 J+8NXb6OcF7zvlGeot6PeLnj/0BLQ9cKu2Sp9Igo7nQNAp+ASTXvWe6+sKzcv1lTm4
	 b3UenhGjbtcjKHBk94lBlDsGSlHoJnHR8K21TghSffMpEHI3jzwvNeszCCy0cpqpYr
	 3qbL5yjKNVNFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17774069F;
	Sun,  4 Oct 2026 12:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C21681A6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B438F60614
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPY5Ejb334qC for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 12:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E3D76060C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791116297;
 b=X5O5LwsipZxOxbzCz4KfFQodJCqJk3CwTgDeLY617S70G2yHETcIg8uMgNKLpW8JUbKH
 LF/wsZPcXG0aY/4JrBmGcThYLJY+XZ49jzRsq4gP+NP2lvolQPrggoHwjaKEewy92ZJV+
 8n9WNo5dI8zmdFpCZa5OefIe9hfjHBP7C+FAAow83jyYXZ78Vm7PArhRGcf3C1JO57VMe
 68QHxlpR/g5YqV4DRBK7Hv8uKE5mWOXCs6J7gjA9JpzHggdYvvrnzh5EEYigUf5L0b8Ze
 vVow1DBJFPlVsZ7qLgeVyb0dfI0JCYKOYm9BWy9QzY/8puSkZLVCx13tawrQfgoOV3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791116297;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=Ek9po2DTZh9WnMzvJClbuf2sU5S7Sl0jzlmCtwB4N7w=;
 b=aSHv7l8AdwskizR3G+M9V/BHaldM/+yROuZghlVtMKTbYMlZ+nPdXrgu41s8CDu2GW6k
 wcUmiH6KMzKXVVlxHcoioOGrjoI5cYRMqcgtqQ+nsOrbk0HPAlOFw8pXmWOhq68NpK6Jt
 L4xchZhQC/dQSEUWRFbs/XK0A+Z7khKFKFPk7XLSXJHrMvhh6CE28dCCaDFJqPGkNt6h+
 hbKevJOOO4kktesLx3rR/iaQ6x1eF8YdPBjtMlKA2uCRH9w9syGEk1r/3xaxWZxXA23/u
 QCPeU9+DCDx2Lah2kpYbMnJDOgKNtw3ZHbMikJDbyJ5WNIlwbyWkBE+PGNHp1HN/e3A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E3D76060C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791116293; bh=0fFbkpTt8hL5rkacEAJxtjGV1upq6ehbaKXI/YjhyLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyOwDXfOdc13Ry3GtvLOvkhsY5wtVt7vHH0WoIZ2SxNimTLyTj4BCbm+iLQ7gt1q6
 dlP6rYtEdn/qlW4OJEke0P/ZeHJXSXxOtKxYIwRkBKyy3OVUrrmg2fFULWuByD3cZw
 b4scDRlg90gE1W8i7E4P7l3t9GwGoPyVgeWNEtFaypLhFt3F8xQkoKwXjIRrHxgTTl
 RmiUlmUfyb+uUXR0ajemnMf7dygu5qY4xCNSlI5gisI57l2UPHhkLGkuYmkmeBvCRu
 77PwKoKkZUQ0j5vdJqqzRaKr1+iDFPgeUlo/8Y0PkNxYRBKTa6+kf9i3gNneEdMfUp
 rzb15BPwruG0g==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1E7F231E0BE6; Sun, 04 Oct 2026 14:18:13 +0200 (CEST)
Date: Sun, 4 Oct 2026 14:18:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asJEBMQpD2FYJql2@waldemar-brodkorb.de>
References: <20261002135956.354969-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002135956.354969-1-ps.report@gmx.net>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH v1] package/gzip: bump version to 1.15
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

Hi Peter,

I am having issues compiling gzip after the update for
qemu-system-aarch64 (defconfig, glibc):

  GEN      zmore
In file included from gzip.c:61:
gzip.h:120:21: error: expected ')' before '+' token
  120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
      |                     ^
gzip.h:120:21: error: expected ')' before '+' token
  120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
      |                     ^
...

No autobuild failures, yet.

Any idea?

best regards
 Waldemar


Peter Seiderer via buildroot wrote,

> - bump version to 1.15 (for details see [1] and [2])
> 
> [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=e6263160768c73f6117f3c1de78291a60f2cb796
> [2] https://lists.gnu.org/r/bug-gzip/2026-09/msg00030.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gzip/gzip.hash | 4 ++--
>  package/gzip/gzip.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
> index 90c9be4e6e..ddf5e38f0f 100644
> --- a/package/gzip/gzip.hash
> +++ b/package/gzip/gzip.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
> +# https://ftp.gnu.org/gnu/gzip/gzip-1.15.tar.xz.sig
>  # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
> +sha256  9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48  gzip-1.15.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
> index e79de4c99e..1c74089147 100644
> --- a/package/gzip/gzip.mk
> +++ b/package/gzip/gzip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GZIP_VERSION = 1.14
> +GZIP_VERSION = 1.15
>  GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
>  GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
>  # Some other tools expect it to be in /bin
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
