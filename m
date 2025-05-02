Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D192C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E45820D7;
	Fri,  2 May 2025 10:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYJw-ouuYCC5; Fri,  2 May 2025 10:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5300483D0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5300483D0F;
	Fri,  2 May 2025 10:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C357EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DD95415B9
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPjJcNtqhwKa for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7103E41591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7103E41591
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7103E41591
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:40:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A850E1C1120; Fri,  2 May 2025 12:40:19 +0200 (CEST)
Message-ID: <6888c9a5-2a77-4698-8e78-3124357a9334@rnout.be>
Date: Fri, 2 May 2025 12:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <f89b12cd7480ceb378067d5088717357615293ec.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <f89b12cd7480ceb378067d5088717357615293ec.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182419; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7SiEOd04wP2jF9cdexl+3p/0S+1DhIaScd4wjqF6JY0=;
 b=cPmv7KwGw09NcBM2YBWYoBmaTSsTudKF6STtddpf5nzbmJaLBYZlyT5/Yc1EVilTVqN0lQ
 0vHDjvHQEMbjc9WbH3Rxwz22HGYotqTDLLj23MbN3GGWT6KbJmuzICv4ymQLDgfDc+3fQf
 gMlzZXF5Z9sQ2SnJuJmsYKSbVood/MDB3h4KQ+euyaBrTL5WLwnu61k+Uh6UW7ywc53lQM
 drO6HB4aZkWc79u9FPOaDL5Y5ZtP3uHwCyD6+megjIvpnJLf5H89ev+uBYr8PVUhzVPPT5
 /qGq1+h3YxAeNpWgaJQgyPjl9oXoVJYgHujBirlrpqC2T78EMoj+kgPXYZBUBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cPmv7KwG
Subject: Re: [Buildroot] [PATCH 01/29 v2] package/libsigrokdecode: needs
 python3 w/ zlib support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/04/2025 22:03, Yann E. MORIN wrote:
> Some protocol decoders in libsigrokdecode need the zlib module:
> 
>      srd: ModuleNotFoundError: Failed to load decoder usb_power_delivery: import by name failed: No module named 'zlib'
>      srd: Traceback (most recent call last):
>        File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/__init__.py", line 24, in <module>
>          from .pd import *
>        File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/pd.py", line 24, in <module>
>          import zlib   # for crc32
>          ^^^^^^^^^^^
>      ModuleNotFoundError: No module named 'zlib'
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libsigrokdecode/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
> index b58c8a2a29..463cb25f28 100644
> --- a/package/libsigrokdecode/Config.in
> +++ b/package/libsigrokdecode/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
>   	depends on !BR2_STATIC_LIBS # python3
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON3_ZLIB  # runtime
>   	help
>   	  Libsigrokdecode is a shared library written in C, which
>   	  provides (streaming) protocol decoding functionality. Say

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
