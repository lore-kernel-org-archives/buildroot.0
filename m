Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B8606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=itbplpQL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D937340F2E;
	Fri, 30 Oct 2026 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBuG3WaToyvE; Fri, 30 Oct 2026 15:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 638E640F1B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374300;
	b=E/9tBlSXTiXP02avQ5IYlVG798A+Y/xuCFnx/UV5IBV2Ott2PkxwAYD4Vog2rODfYI7O
	 R8+tnDz2vEliTOp0O2Kct74MpkjF9MNmfDVc7q2OBosKD9BHvQrGRkZ9sPRGCjmapPxY2
	 My0Nghx8rrfPtIP/0M0BIR4DhTMVipDbINWIscPYNWEl+v+IKn7qMqZ/zpOP0BOVvh5d/
	 qhoqHTplS39rNdLEQ6KLEd6fy1ohyK82VJFShaQMK5BtxGdN9OjKDxWnQXJcLFBFExs2y
	 00VUMTuBwXvQD9gfHwPIueAeCxPNK5UefW+kH2V1YGB4YlHW4YrxX/kuj2VfpXe8jVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rW2pc+uJ0giZHh00/DwKf1ShikFRKL508GMkito8DqQ=;
	b=M5g6o74JbT0cTuiSI+YNT3l+iTmcX0DCQY5PKXvaPqSMfqgo1FaV/CHV3J9meWhwH8Gh
	 0n5/Z/68b+GdIhp+tf2Acs2bNyWyvqNx2H06oDLOjV1NJRC+YF1scgQYH5BLMeaanO+6p
	 Lbbw+gMTV0xyhqTyLKi/blrOSBwwnlO/gNa1alnXF3IJloDFHHcsdq4wxJDI5B8mDBLJ/
	 ZjH22PXpiBcQQij3Nhu6MHTfEeF/X+MnhkAndz/Ibz0XQEZw1taZTFykHLlixuP/ne22z
	 K8cuhT94t7OzdOBK+OFqL9L/b/3UtjkNWvYKUMB5nmgWKiVoNKhJCiFiC5TPvQLs/tg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374300;
	bh=rW2pc+uJ0giZHh00/DwKf1ShikFRKL508GMkito8DqQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=itbplpQLdA23NZD5mcaP2H9/6dVm20mrLPaNjaj7xmS/QoxjVfhmoGjSDQBNfa635
	 zC7KcZ+7hPGBXO9nGhTQpmdsyd1+F7fDeSKDs/zEC/UvrwupPnMrsfhVlJ+NK7oySS
	 VrwE/SMGad/Ezxs+sC22qtXQokLKJXZXT31TkzjPWmrQQGt2vmwWI4XJ+jzPw06JJi
	 r8HNNMDdiUZLmqBBq5vVxoPmyaORCQV1EFpOybmok6r1qLCYns/HuBX2Gq3A02aRS+
	 IeN3T6+rRRleMjXW8q3vmnErH4FDFAHAv1ruV95TL+6xUZickgXaKaEcUP/B4hbAMN
	 SISO9Nd5+wlzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 638E640F1B;
	Fri, 30 Oct 2026 15:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 705E8D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564AE40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvfuMPFqj-Ds for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3728A40530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374189;
 b=PPHkXyJUuQDVQbxtuM8WqApFHTh60bHM6B+zS6KHxcNipMS4m3xO3huG4tVxh5bKmFNg
 Yoq1A+/4kqtBXgQjxlgmC+3vA22+KYvH796B3zceps4SCOB/JZLgExCIU0us7/5foBg5T
 Cktq4JjwDJ0oHqLOzvzElkBCdpof8ZuXtoC9XF5A8sdW87N6TwTbdo95ia8/Z3Tlb6A20
 2UGVES+WH1Mm9Nxyhmd0K95isLkve5bkz2nL9NvjFq85rDDD+vB9kT0dW6azKszIJpVw5
 wtH4v8xHMb/PCC7U3fCu1AdwOD9CmeKFAKtRqRboXQVWxHqem3NQyR8lJMmSe6ZXrfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/eTQao1juv2f3Ij5m9XWtMv+aGVoI2hw1RUM29jlneg=;
 b=Nh7sOZeVfah7UYtIp3wdq+tBeTISHXHMPE7vIeaYnHesMVSfkACtFcdej0Fjp0QBCgzi
 /859T6x164njLhDVqTRrLk09QLIvOTKNku+wZ5irqob0onecsZa2+rKOb46nyAohAlLmM
 x4qmEIafYJ3VElZISbGrOm74zs60k8Psb7MS+8uW5I5BN7VDudE33iHBpBqPjIJlNdVS9
 Fp3gXNwNopgCl+eu6VfrOiTruqL5yUr3xTqzITrNnM72QHrXAmkjApWaxL6lGK/v0GOAh
 +g9kSZrilDOUVtskv2B12nq46JKwbis5GoKaGWdPopTUnKvddJFnILAo8q6hCjDYExQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D+VTWZmO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3728A40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so11074815e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374187; x=1793978987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/eTQao1juv2f3Ij5m9XWtMv+aGVoI2hw1RUM29jlneg=;
 b=azxHPhnZ+VzJBL5MwSSGb7g3LDEjftQQcer8EHOI/doUD7bjMK7C6S2jzUAPgi4qW+
 7DuIS6x+3qT3vghs1BY8LtFkVZbl0wl4k3udMVcuw6vVfEHoGiOjh516OQLfIcYdVhxd
 fSwC+vCBmOKjDzfV9l0KzYxSNLM9bgPRJhxRTF7nu38zXqSPImtnCQcoFKSr+89N2O/e
 DGQ43HiiT2m5It111VSX6nVExWoODEw9t1nEn80vM81rWUQ5SBH3fNsLfPjOaH3XN8HD
 Gj29QPE/oV/aZ6VikYfPYD7O2Xg/XCEDZUtLyZKKc/SQIGKjTcFI8krCxbt3evIys3qH
 qC4g==
X-Gm-Message-State: AFq9FYJrYxoGmyP5iwLYa9umkoxxtE9z8fFLbPMqKknCSzzPNxCh8qOa
 ieuBUex/NzM1E6qOqeabxUWbw/RLnl6i/S734xxyzBVLhuKeN/ckI1lOoBLKR0vw+9XYI4IoNCX
 I4M3n+6Y=
X-Gm-Gg: AYBFou0502b1BXbNzMHdSdjpS71obgqGfNGoV8rPSxaN0EyoLhXZf12V2Y8APkK8ZLF
 Wlz4ICR3ZyzSp1XOUFYttykyAkSCPz65hrdirtPEfAwEUdoONSnytw/lXK3rVgsO2Euiif7Q/RI
 kNjEDOWptz+quIoPYmFg5DCXFjT8qfJkfkmbw6TtPwvGbKBGTU7dIVUsbq9xi2w3CZZo3n5GpUN
 njvaVmp2oUJSTYRAHVuGd4GF8Ux93810Qc6QSdb45P3C0vJ0Lrr665x+QtMAsHD96sXbgntjD0k
 0NWSrRgH9TYhX3dXoYfHT512j0o+46XVvkobHZhx1wgKvIEF+Rnb8f9Db3YjX9tUzarCdbDluGc
 mYfSFP9WHNvt/9nuFfnDrFuJ4GMSAWR2RHcl5jTe7lxGeVBb56LiyMlnfAYzmSpXnJycej9jUVb
 ixfPdtuP7NL389Fao2VQjGs/2wRcIhrLPv9WBFvUoQ8A7SZ/xP3Q3eO919+05uRAyO6xXh4Mui6
 NCtQeHFvLeKOdvS813GjNqGLHgXfWk3vCY+uLKn/fbDxM3WsG8qu7zEC0wCfImDiUjUjMd7SiBG
 KPp9lcKqSwsfYuS+m68fKLl4J4nkOM/FPky0QwJjWjk/StmKc6mNJ/8Mz14ianGt1Q6ctzbM
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4ac1793e81cmr62145165e9.13.1793374186635; 
 Fri, 30 Oct 2026 08:29:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7c5063e3sm141465705e9.0.2026.10.30.08.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:43 +0100
Message-ID: <20261030152945.1908100-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024195254.3299917-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.10
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.10
> "Libarchive 3.8.10 is a security, bugfix and minor feature release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/683e8c7946cc42fe0054f26c840d7e9ff3d4fc56
> 
>  package/libarchive/libarchive.hash | 6 +++---
>  package/libarchive/libarchive.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index acd4b9ef22..cd5943ebb2 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
> +# From https://github.com/libarchive/libarchive/releases/tag/v3.8.10
>  # After verifying the pgp signature from:
> -# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
> -sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
> +# https://www.libarchive.de/downloads/libarchive-3.8.10.tar.xz.asc
> +sha256  56cad765459d5ee25a3b761f90c47d99379d28297fbfb72d908880d6b875fb96  libarchive-3.8.10.tar.xz
>  # Locally computed:
>  sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 88dbf2a48e..75cc034f6d 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.8.9
> +LIBARCHIVE_VERSION = 3.8.10
>  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
