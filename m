Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F3606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A+AiDdug
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7716A81A2B;
	Fri,  6 Nov 2026 16:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKwLLXUKqFP2; Fri,  6 Nov 2026 16:09:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE3F7819CC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981388;
	b=UKd9pQfR4fDwwmdjIlBZx9gfasp3NvIITZqxmqQphlRiAe7C9eoPAKOTgLGYo4lgOX7v
	 WrL3Xhl8YqvovI46U4mDreI7kEKY5w1emd65QDaU8eUKEHUxy299wv3qWzoH1bmZbP4JK
	 tQqMpucnIZwQmtdKtFM4xrCzduMGqwR4qxn9GA5dWpf3wbw/AD3tfspccHG4NzdOqKkSw
	 VzkrZt3gER1YAKhFEGavr8VdhHfO95h+44HvvpKa8vyke+c6xsMs6HVWkpo4+4y4WIwiW
	 wcFekEkaUOjqZDK7z1Sz0nYCE4pNyNeZdB2WJLIvDA81bFYOD3RBvFoVksq+SfeisYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=09hq503KY4DqrJbqri0XqEge3ADvRVuEX6hK/zajg8o=;
	b=adgtLn3bwlLzzhkKsiOZzzSTLU6rl0rQf5zYkH/BWa9qLQMOvXkzOzlObZWrz+61LijL
	 XSFldsJMrbIHmqAZWWI+KLAVfEDs4Z6D/7sZX8Ezlv+3hwFOvRcAc6cbpXrM84X77pzU1
	 kLT23QxQQuWOsTEmnfZT7/5Aya1xz9ftGym92iURbDKqE4fI4p8i7NMdElGGeJwo4BlKI
	 W1OXG6uVKj5H+NwpxKzKWbDejasIytMVPuerBSOTVNAnogVM0Ll2IJtzbufGHmkbAT5q6
	 5PhRN98lUNphoMg/BrUb1dnZOOh0jsae8gS9ihlGOsjkgE8t3Q+ajcsW6LP17R+XJqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981387;
	bh=09hq503KY4DqrJbqri0XqEge3ADvRVuEX6hK/zajg8o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A+AiDdugTHfZEy8hC7Nwq2OM3Tzmf0q9i0kz9IF9jfSYntzRdu29p8aa7KSSiBVEq
	 5k9pPNBRcDOo6TEe8v9GbTm390P4nS6uQT3bPC+ZATbP9m6QHvBH+xDNnShXnDWS2u
	 llTzGQcEoSHKLnhPetWNE30OVhZ1mu0Iq8ziWfwcmhCLKWBVyUeSVeLFIKOqOKFiiw
	 1rSCLhsrpen4VIMo/g1yTjcHvfwIpIOEYGu98U+jWkjEDbV+a8RF4AG7O1k3GLKThG
	 DZ518qLa7UtSogN4l7s8rRfB8pJp28r/39wY0njBBTxiZimbmiSp6n+8VMUi/Ryhde
	 jvZlbkwI/iNcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3F7819CC;
	Fri,  6 Nov 2026 16:09:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F20B02E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3119607AD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oqv3EgW8F4zc for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB81A60A5F
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB81A60A5F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so906306f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981357; x=1794586157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IO+uXe1876Av1GWi0ouwcnDUTjbc2I0jzh4pq+snSbk=;
 b=U0Kw3FJOA+8MNYYwp2w2ApdiWyuWl+7S3PvxqIx3mm44uTj9WLIbyHqFjbj618jxgP
 /Fl8LAqZDEbrwYN0tSu+ec45jZzd9jbU8/fxnhVlfUW/58971YyDnSDEGps54Ze+ut9s
 LVpICz4gDhDdSL7xxwYW9KF/OJo7/ZS2wMViuTKjSUGzAz6Wma48JJqIL4+sDlR86Q5u
 QAmAcvX5c+UwFXd4Gy/K7PDuI63ti3FOii1Y4AUeKKsEVXgPCkwKRdyQuTMQAAhzgLXi
 W2KuObuA63AjyQjrSCdIn71FsT9SKBLci2fKt1hFIo34vDrKKiLPF+yDFUMCN6tvOEOc
 NMZg==
X-Gm-Message-State: APuU4Z8VGQwzPWyTkIN2fGuEHh4EhqPCK7WyQs70MzQoelNMVmQy9t0Y
 V4bgGedu4hyfsgyVV/4IZKXTX2yfYK5FXWKpeP+D7Ob0CE3DjUONZHWhwVAXhnw2Y8W0Alle64k
 fsnpvUzQ=
X-Gm-Gg: AYBFou0yyeVGPDsX79+rO8gCuKQ6kCi6yt3vPAgosWLAjb3ceR2vAe4c6MVtpJg1GUJ
 q6elWDSCV1FLaeQvy8CuTBuHweIntQBRfuXX5ESl1jhOtuIjwtkiLBCuTmsJn5BnBx5Q9yD5QzI
 k79S9klPw+vYmncE3Kd6ewxBJdCyo3s0XQs6qQtOmDYTO/oew6NUeimJwPX8t/wh9YzuJ8S2nsV
 ByPtEbvZMp3d/0cG1posflQbXegbM3lD11Za36Eu9nuNCqBA18k0oscvPx30UALsDJYEvx+e7JN
 icsMt+qdzym81t0XAOsdJFkjfeYwcr+ru0YgGyYO2W7ihppyjzgYRfE1Apq7YzWLYg5ZRwCTjKJ
 DW8MeKn79IbKrXqp2ypYHwcJz+NcbQHYcKpUPrSfDzS8mh0/13zo2KuUapchqtoKkPuGU/NzT04
 M8EWySsk4MN/pdLSiIbFT/rBaJSxNHoDeXPYX0VMjjvIfFUSjG0WMPcJDaTgRjL/mkPkJ/0mi2J
 0225/NdwmOB2Z1I5XZ3Lfoxp+XVdbwaecGTMtXw98eS3lWeSSYcFf9HdLtrK7iDYQP00sNWxBJx
 qODBBqCE1lzg9bhpL8GIxnaoc1YQ5ZQ=
X-Received: by 2002:a05:600c:3b29:b0:4a1:fae5:f2e2 with SMTP id
 5b1f17b1804b1-4b6db4a5d89mr55591885e9.4.1793981357505; 
 Fri, 06 Nov 2026 08:09:17 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e94sm4761579f8f.2.2026.11.06.08.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:16 -0800 (PST)
To: buildroot@buildroot.org,
	Pedro Aguilar <paguilar@paguilar.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:14 +0100
Message-ID: <20261106160915.607077-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021205653.895333-1-paguilar@paguilar.org>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: Use typing
 annotations needed for Python 3.8
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
> Python 3.8 and older evaluate list[str] at function-definition time,
> but built-in generic annotations such as list[str], dict[str, int], and
> tuple[str, ...] are only supported at runtime from Python 3.9
> 
> The generate-cyclonedx script uses these built-in generic annotations
> that cause the following error when executed in a host with Python 3.8:
> 
> Traceback (most recent call last):
>   File "../utils/generate-cyclonedx", line 222, in <module>
>     def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
> TypeError: 'type' object is not subscriptable
> make: *** [Makefile:23: _all] Error 141
> 
> This commit fixes this issue by replacing built-in generic annotations
> with "typing" equivalents that work properly also with Python >=3.9
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> Acked-By: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 1fbf020a3d..a79ca41fe1 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -14,7 +14,7 @@ import json
>  import os
>  from collections import defaultdict
>  from pathlib import Path
> -from typing import Iterator
> +from typing import Iterator, List, Tuple
>  import urllib.error
>  import urllib.parse
>  import urllib.request
> @@ -148,7 +148,7 @@ def cyclonedx_licenses(lic_list):
>      }
>  
>  
> -def extract_cves_from_header(header: str) -> list[str]:
> +def extract_cves_from_header(header: str) -> List[str]:
>      """Extract CVE identifiers from the patch header.
>  
>      Args:
> @@ -219,7 +219,7 @@ def read_patch_file(patch_path: Path) -> str:
>          return f.read()
>  
>  
> -def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
> +def cyclonedx_patches(comp_ref: str, patch_list: List[str]):
>      """Translate a list of patches from the show-info JSON to a list of
>      patches in CycloneDX format.
>  
> @@ -285,7 +285,7 @@ def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
>      }
>  
>  
> -def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
> +def parse_uris(uris: List[str]) -> Iterator[Tuple[List[str], str]]:
>      """Parse download URIs into (schemes, url) tuples.
>  
>      Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
> @@ -295,7 +295,7 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
>      Args:
>          uris (list): Array of URI strings from the show-info output.
>      Yields:
> -        tuple[list[str], str]: (schemes, url) for each usable URI.
> +        Tuple[List[str], str]: (schemes, url) for each usable URI.
>      """
>      for uri in uris:
>          scheme, _, stripped_uri = uri.partition("+")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
