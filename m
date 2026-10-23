Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF3606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CIBPYX/b
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8149360815;
	Fri, 23 Oct 2026 13:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_F-xBRrfXvV; Fri, 23 Oct 2026 13:21:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 80BA0608E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761714;
	b=TNq5qs8Z92Smjr7a4UH+doC/XZ9CNnlKKBMVwxaZZFXdfUsFd3yi2CDYBa7wDpjW3pXr
	 ClBOcqxjosr8dHZq6vQMYc0iqMLMXb8i8/jG0leN/q2178kDeNz4b5rdNQ2oTmzTleaAi
	 U7fchQit2GUnRilhVbVGSqDvWMwBnsYx36WTcgHOnLETvW/Iu84GtKvLpRmCS2tkK3S3x
	 sTVNO8VyLnYKRj8fGwXiMKJdyddLNARcWl+xSEqlGD6GPqgvRJ0nZsKrPvsumKtlgY/2r
	 20I6GGQq2hjY4pitjyShIM9I3TrZ33OJqmIlIaGVmOsXWjdoo3v0rD9oMic5EQKAD+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=riiL4vKcAixkCb6lV3+zniUiRSn7g3vQrO67BuHsFxk=;
	b=VgcI5Pc3vWwPoWqCrmvozyOw6zfTFeC8LzTRMnWqFdyRojxRlDY2Xv2aL+JC3HySOr4c
	 Blm4jKZ73px++bcjguFAvsLIczrGbocPWfnpgtdpgx6W24dNQ4I8AH/Abm0O8bLrYW0e3
	 +EORibDLtc84FWF2/tDaoWvx6qs+oGUzc0SQLNQAPZYmLJkKB5YCSoGQg0zkfUt2IaCTQ
	 gc7O1yUgXfuxYh12IIQk4NlyLKs+82hjrhcMHSFaMa/MIB2CJOBbtcqS6pWvbxJvwZsR3
	 DoZB6uKmxrfAyMbDb8pTVh1APLIi7c8vmbkbYX1a8zcxCyxF0LkzG2Vx+nggPZxbmCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761714;
	bh=riiL4vKcAixkCb6lV3+zniUiRSn7g3vQrO67BuHsFxk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CIBPYX/bjM7022wY41dq58ifnVKbT7PAxDAp53Lg0m6BkPKR9HcyJv27J0c/GqxeD
	 tbVNdF756NUPbcvk4Xguw+fbwSDuwkrxcXySjbTMBYC4cI9Ajktz+pR1QZ4nTVW9EK
	 QrX/OuXhq1DSSJcezBOex+20coigRtLRPuT4zFrOEVjd6O5xZv3w2rAcg5LeYmiYyR
	 S3tV8dYHFj4o9OgqoUf3iLyKwfbWRvvZc8fLuFt4VpfzcJq3Vw4v7+RBl0vABm3T3s
	 1qAqSzuCLbYcbVy8IewJ+Ne3cMrU4Bcw9jSPheddyIO3I5kEUCsFhA/FZf0VmA4506
	 C6HUV16SItZVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BA0608E2;
	Fri, 23 Oct 2026 13:21:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C563356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429F6401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLTEbdA3jxGV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 35A02400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761708;
 b=cOSf4hDKwbuXKA+2ct2yW0Ax3KFMQgwJjPeozTCNfIR5Feduj9sME9iXvSowxJWbNYoG
 YUQBfeVeg77PP9NnDxnbQyWni+SA7hnPGLDArLrgyVMSfTId2DZQvCPNHiY+ggRxNECHr
 az39kCkv7NU8mXOxMZiCsQoYI4WAPc3S6vCyffXBHSXevtqMAVd+qhqxwsPI8RgPAAcTy
 2LM1cMy4/EM/oMRd5ZK0r2qirW0r64sGqNKpFZbESSJUfLtEcckVoB7iJnz8UUt0XiFoz
 ujlOjEDojgr/bC/od2QMGEAVom491DbPSMD5OoYCQuLeplFxuyvyltHMarQrfKg8a+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761708;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=V2z/4TjhUWfBIHlVbWTKgB7FXuJtYjVeR1kAUcIT+u0=;
 b=PjJANZuK3ooUQMnEv5bxO1+uliACYO5vOTywTEQQHNIdmHrCl3YdXb3BdpxoiIEKckEn
 u/7BHOs8DdUs1cs0r8Z5ycNvsPL5pJCi1JGT5MGWr0UMsrGVv1q256XzbYZIsY6qRpdNN
 wFDt4mJIzcSPPpDP1RdUUPFwKpPo1g0nYYS1fTuB1ErGQk01oxJvFgl3MRYvp2wBSz7oN
 K2Qn/oNYfdUqSQGMHI0Pw7FJhFuZxYQpvNEzogw1jE5gPDdbrnuqLvleZZyGt0NagqUI+
 hhGxHnQc9mB2FflCLtqNErkDJG/+SU3iOHanMuylj0eDhv5D79ghJvZC32Y413q1mtw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DaerEwFY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A02400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so9164725e9.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761706; x=1793366506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V2z/4TjhUWfBIHlVbWTKgB7FXuJtYjVeR1kAUcIT+u0=;
 b=gCZvXi59r3U17anec3xRgm3C15Ed4fgxcNmTOhRqi1knSi/Q1K2wEIp6L7LqluX6on
 17++7QGfE4fh5f9qQ4IH75pgtHFelPm0Pb5OSRCj7gQEAcEXoUOlk87oWF04jHCm20SV
 3Qc23NRWsu4BBf36qF1UApu9/dt0bvuED5GGHaNHdMibEyFR5r1E8SsYm4JEkqs8+Y7W
 WJ8r1Em7vOVee/dwVHoQmXKxae823Y9JGtKw6WHs8vGW1pFLMsyYT5IfKLkv/sF4RYUc
 x7k5t8HpYY4YzxFFshaQAhJ/r2asYLL+8qD85p5S5QCh0VnmkLHHiZXS+36ED88cR42w
 bdig==
X-Gm-Message-State: AFq9FYIh9N1/P3MY1pSpWEVUWO4CLX84XpkT/8Nir2INGrmCzUIS8bOJ
 0+nQjaDRtUPY8TYjRYBDCzOuWBsreV0tl8S0z/NXZzUOBkoSVKYNNVib8DWqQdfq8TYTJC5KT0j
 bMKT8syo=
X-Gm-Gg: AYBFou0GApMdJkBuOxWw83r8nEAy8K/qo5f1IVmetetHNpAfxHeR/NuHWRyvi+1rR+Y
 mM16w41Kp9SmHpMZlEiyhRgKTQJBb02fVczzPv97aVNzoEm0Fg+rgK9AV8kjB6zKBPx1NtiPi5g
 RVTFM53Y4FaILEKZMSb0zEmnR69M8vG2luPE1Vxgy+KOB0RPnb+CewPCLe5IRfcQW9T+2+wiIzg
 Dv0h5mWanBEbqRpJRyG4YBsbjUI6gK5xPUsRzt4UWq4N0X8VExklSDqSsmqx+pKY29/L6nFd4ox
 B1X++7p8KM6dUTO94lTJQuMTgSyCknjUXpetyenGQpdynxV6m1QAqxGEwAQ//gGstutjjfcG8h2
 o9Cbe6vq/i2C98o8v0LY1PEj6+u/StSD2oGJyLZSbYRKU2hJDoOUE9BHL4Zpa96yjncbjMC76SR
 gq4KK30tQ7jfXGbn9bA8/cGK30VJ5KY+eSDFDP1jaTE9uUPdOw4qq9DLpaZf+4vdCS4okrl5Ig2
 wHJzASiX9GH8PofeZL9ryCbsJSMu5CiRZBHgYBt6hQOALI4/bWujJhS1cD053unVde8/ZSzbykm
 47ez
X-Received: by 2002:a05:600c:6285:b0:4a2:fe3:121b with SMTP id
 5b1f17b1804b1-4a211eff1e7mr38691125e9.28.1792761706067; 
 Fri, 23 Oct 2026 06:21:46 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3805c2c8sm4714673f8f.48.2026.10.23.06.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Waldemar Brodkorb <wbx@openadk.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:43 +0200
Message-ID: <20261023132144.1608133-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <as2yqqA5mwAIMWnH@waldemar-brodkorb.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: patch to remove
 pthread_atfork dummy for noMMU
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> For noMMU pthread_atfork() is only a dummy.
> This causes build failures in util-linux: the configure.ac script
> detects pthread_atfork() presence because the symbol exists, but the
> build fails because the prototype isn't there.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/936/93637dfaabad0a1f11a94488421f6cc73882817f/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...threads-add-dummy-for-pthread_atfork.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
> 
> diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
> new file mode 100644
> index 0000000000..66605aa657
> --- /dev/null
> +++ b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
> @@ -0,0 +1,43 @@
> +From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sun, 11 Oct 2026 16:25:53 +0200
> +Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
> +
> +This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
> +
> +As reported on the uClibc-ng mailinglist by Thomas Petazzoni
> +this dummy without proper prototype is breaking util-linux
> +compilation. My usecase in 2017 was curl+libressl. Since then
> +I moved from libressl to libopenssl and that works fine without
> +pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
> +
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + libpthread/linuxthreads/ptfork.c | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
> +index a1bad3d54..74d630830 100644
> +--- a/libpthread/linuxthreads/ptfork.c
> ++++ b/libpthread/linuxthreads/ptfork.c
> +@@ -150,16 +150,4 @@ static pid_t __fork(void)
> + strong_alias(__fork,fork)
> + strong_alias(__fork,vfork)
> + 
> +-#else
> +-
> +-/* We can't support pthread_atfork without MMU, since we don't have
> +-   fork(), and we can't offer the correct semantics for vfork().
> +-   But instead of failing, just provide a dummy */
> +-int pthread_atfork(void (*prepare)(void),
> +-                  void (*parent)(void),
> +-                  void (*child)(void))
> +-{
> +-  return 0;
> +-}
> +-
> + #endif
> +-- 
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
