Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB5606A320
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qM8c/p22
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F69A40599;
	Thu, 22 Oct 2026 08:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDsHLy8f2-8i; Thu, 22 Oct 2026 08:39:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E0D17407A3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658369;
	b=H1ML+WRAO864wFbLz92sp03c1Y+4iyuTuXRF16S5hHNWjlR8PXbPMMOYTCRi556u/Y04
	 3xnHdZsL7udRnzjL/Jmr1ccHR22Z/n5q0W5sirL0tJPFlmxVPK4kowhkwaEZMx/eAH7fG
	 B/yruVAlTGhh5G6Ob/tPUx8Tq0KujT1rUxfCwYuvZfxlDYZFvtitkRENoOIOfMnSOFs4V
	 R5RbKOPgw6CzivJbnyFw8t5q//nSNY2Y5MNkgXJ8Kix1W8N+t8UK32QMx9bE/N4E4hb1+
	 RYikzwEKBB5k41Rnxw7R5RWCc7WxVA7lWUK4wGjRcEkN3JxOvCRFOe2cLlYXaJvVN0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFItiUiozNiGMedyg18HVKbxPIxryOJUSXOYv39J36k=;
	b=OA59cx8YXhltWgG/CWE4I6HXuHb6mvFmbKTRBIKGCMOUA5A24quPX2vmhH+2jNF1ZsnH
	 ExfVRYUxnI7Pju2hrMUddC0oyJyafwYiQtmVLrYwvTfvGxNUREU4bss5UTPy/l/omRulX
	 wCqY11VQlvcLIJHBMKBfkh6wgLJ03hsrz/ygJdJ57PGt8VkrQ/+aAxheUnh7IBh0eeaVt
	 iXVJki8puBTYdSeViT9OPf37TFa8CG3WOCj3QZr65zoY1KB54z/9adUf6nchUWwxuV9XJ
	 ywTYRyqREMNybR2mXLlLNzoTDEwWR5G/DbtOISQdn1xsZd8uzGNEGHdrw14Xv3YMl5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658369;
	bh=tFItiUiozNiGMedyg18HVKbxPIxryOJUSXOYv39J36k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qM8c/p22oDCiDVe+SkqcpTKsFctUMLd9gy3qSFfV2EQSQYZtudW7MiW8Ci1keGTri
	 KlFpegXUqUS5kGkyyrzFMkGk4y6Ma8MygTVvapCp/CTwCm6nDcCMMxEVIOsLBhNeXK
	 3ZGqizc4iOSuzSQVRaGlyLoBSkzyvFtj3n7qQ8MM6tFjG8mD0PGqv3TZOlGizPcXhO
	 NiAQY6t0yzI+5cfZ94J8DdV9S8MXCJIafpBQ8Fk3pyjppWN+30CocjA++iZxN/s5WS
	 4XTpkoJjmB4lApPP84CbQFsL0A3soamLayC7k0OgVkKWxXl3RiJNP64pgW9+w61Ppq
	 2wsIk0vx/i1EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0D17407A3;
	Thu, 22 Oct 2026 08:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14717235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEC55811F3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gacC4p7e0QQy for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:39:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9F53880C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658366;
 b=FSc55YfJlq1ONMDjWaZq5zKZKoVa8XSH7zwz4CnU0HaRofWgn+TXhzmOvTUJpCJT0SU9
 lqP2szDjn29qC2BT5dHY9bn2omSnKEucVp2IjSNv569wF5a2alzL+frm4yIwZ8dvkPjQc
 UlKeQQNPZTiBRlnFPQrGIWkuLG/s8vwjSGp1E4C5Zd3H2ADIsqqwf9W4QSd+NSET8iuFd
 5yYBsMrFfbuJq286fCsV4HBGn+q9d+n3KJtD/3o2QPlWCncDJdJjCxgZEYObegEAhgCgR
 6bJ+LsuwntrMcKUBVv+n6HA1lwdx2OYhBxJTaSXOsmRsG6bDNW0GykDjCL73InCm79A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658366;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=VvkqTd1nqmlwN2BYQoS2Ac6eyI9d8rQa4/OoWcKzMIQ=;
 b=EpMAznNKLPSmjjo59vOWp9bN69pnMPEb7DepJ5SdvqCgP9DWY4s2Ha8zdp/oz76FnHoX
 /rQfLWu5wsxBjksFYQtfxD4fuUEJb7INO4hXDvY/ghkRSmVNbs/8God5b1nmTbKiisOK7
 TlnMLNAxrCAF0GeTDM6BOjs6lNZGatKIm9F4OP2b4baJNkoF0kyfX/JtFJscREGmLjb5U
 oYndD2KgY7omejRCasIUCFwUkqwGtJ2v0jeEMUcw2N/NBOcBqe95F6lGGMZ4HvfeK3gTg
 tYDega0bVNW5KS+jdSiHBvqcnLkoHnJqJCJDXhYfrgxy4jPSOywdv3v/8gcTwNTBqKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iXo3x3zV; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F53880C0D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E14B5C5846E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 99E4B60360;
 Thu, 22 Oct 2026 08:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD59410328C52; 
 Thu, 22 Oct 2026 10:39:23 +0200 (CEST)
Date: Thu, 22 Oct 2026 10:39:22 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <atnLtZAccKp0Bt0f@windsurf>
References: <20261022070004.2533972-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022070004.2533972-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nginx: security bump to version
 1.30.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 09:00:02AM +0200, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> Changes with nginx 1.30.6                                        14 Oct 2026
> 
>     *) Security: a buffer overflow might occur in a worker process when
>        using the "alias" directive if the request URI was changed by the
>        "rewrite" directive and was then mapped to a file path
>        (CVE-2026-15176).
> 
>     *) Security: a buffer overflow might occur in a worker process while
>        evaluating string expressions with variables, which affected the
>        document root calculation and request logging in the http and stream
>        modules (CVE-2026-93479).
>        Thanks to Matt Suiche of Tolmo Inc.
> 
>     *) Security: when using HTTP/3 a part of an unknown frame might be
>        treated as the request body, which might result in bypassing the
>        "client_max_body_size" limit or injecting data in the proxied request
>        (CVE-2026-95101).
>        Thanks to Hansol Lee of GOTROOT.
> 
>     *) Security: when using TLS session ticket key rotation, one of the keys
>        was left uninitialized, which might allow to forge a session
>        (CVE-2026-97629).
>        Thanks to PhiNode Labs.
> 
>     *) Security: when using asynchronous file I/O (AIO), use-after-free
>        might occur in certain configurations if the SSI page has "include
>        virtual" commands (CVE-2026-97205).
>        Thanks to cyberlancer.
> 
> Changes with nginx 1.30.5                                        15 Sep 2026
> 
>     *) Security: a heap memory buffer overflow might occur in a worker
>        process under certain configurations when using HTTP/3 with OpenSSL
>        3.5.0 and earlier (CVE-2026-90439).
>        Thanks to Banny Liao.
> 
> Changes with nginx 1.30.4                                        15 Jul 2026
> 
>     *) Security: heap buffer overflow might occur in a worker process when
>        using the map directive with regex matching if the map variable was
>        included in a string expression after a capture affected by this map;
>        a similar issue might happen when using a non-cacheable variable in a
>        string expression (CVE-2026-42533).
>        Thanks to Mufeed VH of Winfunc Research and Maxim Dounin.
> 
>     *) Security: uninitialized memory access might occur when using unnamed
>        regex captures with the "slice" directive or background cache update,
>        which could result in worker process memory disclosure or worker
>        process termination (CVE-2026-60005).
> 
>     *) Security: use-after-free might occur when processing a specially
>        crafted proxied backend response with the ngx_http_ssi_filter_module
>        (CVE-2026-56434).
>        Thanks to P4P3R-HAK.
> 
> https://nginx.org/en/CHANGES-1.30
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
