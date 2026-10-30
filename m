Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05F1606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mwod2KBf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6AFC40D1D;
	Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5uIboJCWzLN; Fri, 30 Oct 2026 15:29:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C60AE40D60
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374151;
	b=D1mJ6bg2nGgDWiFdVIAq/M8xKNyozbVsM8ERljLaKtj5h5IlncHc4EGUe4DDntLxF/eK
	 uJPLp71+5nxsc8oDMbjgZYtYIDIyPv+BnSDDqAFzln6nJitj8ILLF3Y6xWGoD0CZBs03l
	 +81JbyVQVdnJT8fBrYeO24MEO02xroKJURZfHGPNq6nDhG7mexzVowtba842FY0nFElvv
	 iYxbz1bVwYdeuuPKC4qkLavZUjx+hRJ0upJ1J6Y1E4eyQky3w1Wt5nYqMO8RPsJGpdZGK
	 Kwa+yI1MwG8miclv6XNRzTI0TrgOWQnyquQ8sPOoWOtDD6KBrtb/I25HQUqisMhD+TQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FZE+ZNtXdLyzqz+fL6ia6nQIFg/6zbiwbu+WScI8QIM=;
	b=gcMFNeU+5pqbDXYWL4tokQe02nmpGOg3gs+Dn+4mZhPiLF1yGjDmohmkgumUICe4Q2d7
	 j7wmcBbnO36fXyKGDWN/9BzSNTMH+Mq7IT3m0ahkI4czGu5LZ0AA6AMzzgLzNIm7aDCuQ
	 i5z+2EaE+lOraBl7sU6vSKjxb5ypGQCpOEmNsDwZ/dqXtV3j4woE+GA5CG4xPtAzvsEUi
	 R8Ji86v9K+1kIE+A2AP3r+xWrCdVPeu41vbaSax6oNkvJFYc+Ii0UnATOQ8MDwZd/3fB3
	 5L6e+n9iuxudeecvkMbz3w3Sjr2/DsAMKgVPsJGNK5aHxyKJoxxEXWevqgWLc/L0/dA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374151;
	bh=FZE+ZNtXdLyzqz+fL6ia6nQIFg/6zbiwbu+WScI8QIM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mwod2KBfH+FvmVfqkWmLVv/caSeL3GrCjUfkioOPxadJ9HOMwqRxwGwUKK6a9/8Jr
	 QcEG+u8q1ub+S24VCbN2JMN29x3tOFPQdnEBry+Amwgi8ZeYunKezA5KLcXPs9NGy4
	 zpd3FGt3bpSsPxjt94MmDM13GKuftivuzrQ+76JGfw+yJpJfx0+XBSAUi/uduGRBMp
	 TIZRmMIK8ACJe68rxHKlOvy84RB7D6Vo2Slfs3ROYBjAo7JHEoYNPHBMVrQYofXVhl
	 WfKE4wuUua5g5nFl66Uq2J424fNFByumL06cV3v8s3wXIGSJtEKOJKklKuHh8w2QFe
	 E+4cetRbVxn7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60AE40D60;
	Fri, 30 Oct 2026 15:29:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9674D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6BEB40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WY318zLe_81v for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E37B40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374092;
 b=ZV1ZpfDXyjYIGI+oCNJjBJ393XWtfLI1WhsuLkPO6dWUVDPxQmdGbh+wZfksHaf1KqJ3
 RivVX1sG9mkQzmM7eTIdZJSlL8Gl+L8vICMVoOGlFgWR5nPGdW2R4Pqv2GNIVSuWErzin
 gbdHL5K6F+bXiuZ1LnApV3U9EudN3MmhSMmhm0AhmmvmU1qvf67sfzbXb0gvKJzFPLCui
 KvbixBnQd/B+bv0CQsppiw89ZfTZ167jcSpse4J6OIwN4hGwBb/+DBrW8P7bsBaprPhC0
 xfRpRZCdSorRzQClgbHjcp8LTsQa7BXkED3MQkXPcA0WZxRwyL5Z5byuaUU61UaKNaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374092;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xSDTTpADcDr24KWiD1Sk4UAH65BLtzUAgfA0B7ceg8Y=;
 b=PKmUfeXlrwfLVs1sSS9qZw1kPXIs+y20YTjEbuDn45kfTBJMjIIieIgUTtwj92MsLOkf
 0kE7yfE59yfJj53/N5a3Gb0r/LICeHf5njqPzZSwvxgy4Hy9BXY2yJZzzTuUL50xpy42z
 yBjs1TcJHAJawtBX5tzFbnG9vUvMLHIUXAEaF4FS/VODGUA2/2e2FAvvAvxXFqg2p+6Wa
 GdTnCNgWI3EOx98+8uDa/3EBdjXnYbaf3uIcQ5cGMqIXmbU9UIVtkupyAxhk+X9QR1wlg
 PFvOQpzYJHnm+l+FwC/t4Rb93VLKlSXFbbzFJqaFSET+M5lNiXDbWPRFN+SlqdOXhyA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fBRW7TaO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E37B40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso9877195e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374090; x=1793978890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xSDTTpADcDr24KWiD1Sk4UAH65BLtzUAgfA0B7ceg8Y=;
 b=nsYtlK9koHnnxvVNCRS2tP1lYFdh/3kvPi34r3UrA37f3+qej0D7ieB+nIfIJW20ky
 II62F2+mx4zdaOd85OsuB97z4YynGfYK7lQd0lXw1WK+EpTkzh3e6y8gP5WQq0IXjuJz
 1lyeacn9O7I5X6YOAktLZL7hHJ/pNNP8wu715qxnf8tJniwDVHAKyizbVliIHzt794Su
 w4yxeyLhwHW7+CJVwajMIuOsKDvjY5Q1l6iy8k54LE5g6lJ6AZNioJzLj35JEk5MvYtd
 dqiArcNoCrL0yIjrZob9qf5NVY+d5abaQCOCPahNQoKrhcS1v639pWI1ycJ5XQ8kwi0c
 USNQ==
X-Gm-Message-State: AFq9FYIafrJuFbfTSg9bWc4LL7UzVUD1Ccsi9nlEohhHnyMJMuc36+O9
 KLfaC3pXbEn8aDtRbAysswFRx7IAhu+/mSkJcKATToB6IOxSzutGiQrSk7Krrv8bu+y2diZ2UJ9
 5aQGfjfk=
X-Gm-Gg: AYBFou0uerlD4Dxjq1gK4uc4c/6WQzleaVpqnpzOT5ihEQfh9VlsgyTc4b+8EuJIVFc
 egk3S1RxBfwVAbUEfpfTo38YwtYYWgMrpcFHAr0rDf8ZVvY3YTbKWWC5c1JK9MyI70qwNQ9L6uP
 k/nRbwA9w4L0QFa0zeXsmfNT5WY9NZkh/eDWnOebik3tKE3pgoK8Vs+dMLqz5Ce2UVUYb5KJSAW
 z0S0MOYekamF0+XEpv5p+ebm6Ajci/WEuNQCMMzFLGvtmZLVE3BMJLmmnMUJJjA26hKBAROxXPf
 xjwPgIZYYoVglRhFoiL8jBM7ZNaNg5w4sMbCcUpmquzmArEI6ovEqbDk8SvSLBMZHDdZDjt0qNt
 GpE0auFPLUi2IqwBKKFwH/3fwcGvqQKibqp0sd0kKKVSC6lr/3GMOG253P+y3+jaEIOJ/CYHGXA
 ppCNs4N+sTH80OIWenUsCnBXfcw6uxphN3JYas2efepA+O8UJfoM0Joex+zYgBFcVMPQt9rb3kk
 OKiN27aM2sZMxbD0Vz0BKCTvtQy7f4YGxdmD9xv9LxXaDaVH+B0wYmWqKkAPiGke55q6ad53T+Y
 p5bcQ9PMDyV6wkNq2cniT6FRlusP1Hh0eHy2doHAGXlYij3yivfQg3OvdUL9R5eWeLLLgV7ESA=
 =
X-Received: by 2002:a05:600c:4f82:b0:4a1:d8fc:8165 with SMTP id
 5b1f17b1804b1-4ac1889c857mr56257615e9.20.1793374089883; 
 Fri, 30 Oct 2026 08:28:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe885d91esm49209645e9.0.2026.10.30.08.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:09 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:07 +0100
Message-ID: <20261030152809.1907162-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022121102.3130117-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gauche: disable TLS support in
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
> host-gauche fails to build on build machines that have mbedtls 4.x
> installed, e.g. Arch Linux:
> 
>   checking for mbedtls/version.h... yes
>   ...
>              tls/ssl: mbedtls
>   ...
>   ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
>      41 | #include <mbedtls/ctr_drbg.h>
>         |          ^~~~~~~~~~~~~~~~~~~~
> 
> Since version 0.9.6, Gauche's configure enables mbedtls support by
> default whenever it finds mbedtls on the system. For host-gauche, this
> means the mbedtls of the build machine is used, and mbedtls 4.x no
> longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.
> 
> host-gauche only provides the gosh interpreter used to build the target
> gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
> not depend on whatever mbedtls the build machine has.
> 
> This issue has been present since commit 73e836e13982 ("package/gauche:
> bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
> support) and thereby made host-gauche auto-detect the build machine's
> mbedtls. It therefore affects 2019.11 and later, including all
> maintained branches.
> 
> Fixes:
> https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d
> 
> Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/gauche/gauche.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
> index b635c488fe..c63a663ddd 100644
> --- a/package/gauche/gauche.mk
> +++ b/package/gauche/gauche.mk
> @@ -11,7 +11,10 @@ GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
>  GAUCHE_LICENSE_FILES = COPYING
>  GAUCHE_DEPENDENCIES = host-gauche
>  
> -HOST_GAUCHE_CONF_OPTS = --without-zlib
> +# host-gauche is only used to build the target gauche, so it doesn't
> +# need TLS support. Disable it so that configure doesn't pick up an
> +# incompatible mbedtls from the build machine.
> +HOST_GAUCHE_CONF_OPTS = --without-zlib --with-tls=no
>  GAUCHE_CONF_OPTS = --with-libatomic-ops=none
>  
>  # Enable embedded axTLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
