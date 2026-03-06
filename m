Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DECAFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269F661407;
	Fri,  6 Mar 2026 19:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgHJEMNXw8Ot; Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C2F96147E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826790;
	bh=5f9MvoUoz0nLLV7lahKlKJaT1vDA+PW8ZWtFf3sbzps=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IZy6VKEU77S5AmKUzmzDwjUZ5GMA1PEQBl05pdyipL3keIHoyoDviXmoSzn0F0PFv
	 k5NUNcCzAoIV4HdiLG0wO37vIC7LVpEcM6mO9b0srnBrYI9wElCmNTrU0Faz2p3mWz
	 6dNvxsfgdInkUadY9GMKrSl3cjKM48TTlPPHpcfdB1Qiyj1sqSGkw3EgTsuIFqpKlN
	 BrBRs6vj4XAFD0rLZKjBBadZApA1umro5e1XDyPn9lyT+Clk3i1upENJ07SMu+aRpc
	 h7j1M1zbH7oauixKXGLBoKE3gzPZyYzZji9LJYLCfoVkBL6SSWkagygILwpYZYCzKq
	 Id572hqlzTyLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C2F96147E;
	Fri,  6 Mar 2026 19:53:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AE725B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 364C140767
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egQnscBXsAva for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2D0340455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D0340455
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2D0340455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so110300365e9.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826782; x=1773431582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ljai6sCQJwcXcgP33zGtMD7rN3TZPqSlocUYPGH2VtM=;
 b=Nn7eq/nG3v4gipz8/xfXhtf2iuDk6i8dNGWAuzEAnFx2cnMTffaszkHHxrrpPmczD8
 XbVem8pQEd4FlOZS/cjfG7kX90wrlNnv0hXyyN4lI/zfOgNUMNbkpi9LP5zNYO8w4DvQ
 6HvTpU/phFmC9Bux5gMKWKXo2DknZ5qCMQDQ5CT7CR8NAELYO9cY1cYhxvuTyP1sZL2c
 zqpjMqssopPIvhz5eDV7ICYjQ6OW/wIpcmYxTkIThpFVW5Ten9fTh9DOoIQHxH+xaD2d
 4UIv026aQu9n3hY9+rJzoApLg1yApjA7Tbaoe3RHz3kG4uwIqIoKCTye9sa7usLESa6Y
 pKZA==
X-Gm-Message-State: AOJu0Yxvj1VDLpFPXWS0AP5r7uA638W8Hm8V7sc5FpyJoicxR1nfQ3Nf
 FhKtgmQHTKsaU6eGHJN+4EMSiGtAakXI0u1uvS8rn6RkVJ1YQf3ptcE1dAqxKhqKIMh5ZkpLezO
 JXap7
X-Gm-Gg: ATEYQzwl6mYa4Eu+boN0UZ4xic6Yr/Cd1GGNSW5yw72Kg5Rs/winswq4mIpJ4rspWxa
 xLgEaOSgN6vUA2lD999wztuBtJXO0MpgyUKf5jY8tIkO5PbGpgQU0SijipjAIrhDJore0ZSzjsP
 isJQ9nl2QTjc54kas2WO+VMnmD3q8YS+wzYnGUJqOZhLtJlJOg/qNhT94f7eHiGtbr2ZqmMwH+k
 x9LkUemNsh5nYe+3JOuoWpVPO9ePMaWPoRa1ipOJlfkXh8Ie7MqAFecOn28aqgK7qYwqpCn0NmU
 Em+LBJQs+G8BfZLC+FfH2dUOA84MTe1LaufiB1PHJxagzQ+vy5jv6cHM6XUAW8G+GDN3m4LEmyZ
 P96SnsIkBx/JJdBhFi/+XD+dn1IgaOfX5xsWSIxXS8al9EC1Aqg1Tl24FZbLdytxCHhpvyyidoY
 YYJ0+WQjGawCwEwTk=
X-Received: by 2002:a05:600c:19cb:b0:480:6c75:ddce with SMTP id
 5b1f17b1804b1-485269791a9mr51619725e9.33.1772826782573; 
 Fri, 06 Mar 2026 11:53:02 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852767d8e4sm53353105e9.2.2026.03.06.11.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:02 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:01 +0100
Message-ID: <20260306195301.7290-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224205227.263450-1-thomas.perale@mind.be>
References: <20260224205227.263450-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826782; x=1773431582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ljai6sCQJwcXcgP33zGtMD7rN3TZPqSlocUYPGH2VtM=;
 b=PcXS/6cpsQH7dncrY1ngFTNXS06gL4zcLmrXsjgXd68LXp7SHIMC6fbnJ7rIfz4TaB
 aE+xVeBVTk6dNQhIwWclGh7jIaWz+7nIV1C7cp8eVxL/pVfmPq9cZpOwHpqxTbosFquI
 UZayafdFE6RD3/hJdj30jecXzFSilflS0VXcl2Edeu8K713gnk7l/ptDDQN7INfHFu0d
 F0oRWLAs/LcZ1s6OO/XJA0wZqYFaK2wj20WMFucp8Z1t7v+npXfy8AvEABiFWmiHXztu
 VUwvQoIeSWbip4quWqBrxoi2mrKTPkoSLfmbIiHJPUJOu7u962QfCmlmDI7V28nbuOGT
 a51g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PcXS/6cp
Subject: Re: [Buildroot] [PATCH] package/tinyproxy: add patch for
 CVE-2025-63938
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-63938:
>     Tinyproxy through 1.11.2 contains an integer overflow vulnerability in
>     the strip_return_port() function within src/reqs.c.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-63938
>   - https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...r-overflow-in-port-number-processing.patch | 41 +++++++++++++++++++
>  package/tinyproxy/tinyproxy.mk                |  3 ++
>  2 files changed, 44 insertions(+)
>  create mode 100644 package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
> 
> diff --git a/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
> new file mode 100644
> index 0000000000..3b14a58fb6
> --- /dev/null
> +++ b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
> @@ -0,0 +1,41 @@
> +From 3c0fde94981b025271ffa1788ae425257841bf5a Mon Sep 17 00:00:00 2001
> +From: rofl0r <rofl0r@users.noreply.github.com>
> +Date: Fri, 17 Oct 2025 22:57:39 +0000
> +Subject: [PATCH] reqs: fix integer overflow in port number processing
> +
> +closes #586
> +
> +CVE: CVE-2025-63938
> +Upstream: https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/reqs.c | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/reqs.c b/src/reqs.c
> +index 52135a03..a562c68a 100644
> +--- a/src/reqs.c
> ++++ b/src/reqs.c
> +@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
> + {
> +         char *ptr1;
> +         char *ptr2;
> +-        int port;
> ++        unsigned port;
> + 
> +         ptr1 = strrchr (host, ':');
> +         if (ptr1 == NULL)
> +@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
> +                 return 0;
> + 
> +         *ptr1++ = '\0';
> +-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
> +-                return 0;
> ++
> ++        port = atoi(ptr1);
> ++        /* check that port string is in the valid range 1-0xffff) */
> ++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
> ++
> +         return port;
> + }
> + 
> diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
> index 6656a752a6..c5e975d8ab 100644
> --- a/package/tinyproxy/tinyproxy.mk
> +++ b/package/tinyproxy/tinyproxy.mk
> @@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
>  TINYPROXY_LICENSE_FILES = COPYING
>  TINYPROXY_CPE_ID_VALID = YES
>  
> +# 0001-reqs-fix-integer-overflow-in-port-number-processing.patch
> +TINYPROXY_IGNORE_CVES += CVE-2025-63938
> +
>  $(eval $(autotools-package))
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
