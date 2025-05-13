Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDABC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E601C60BC2;
	Tue, 13 May 2025 19:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iouQ3UroINbm; Tue, 13 May 2025 19:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E93960F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E93960F31;
	Tue, 13 May 2025 19:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE231153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A378741216
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnIUt-I3cchm for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCD5340D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD5340D61
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD5340D61
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:59:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BC5A920039E;
 Tue, 13 May 2025 21:59:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 21:59:48 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 21:59:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250512214843.470210-1-bernd@kuhls.net>
References: <20250512214843.470210-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <ca9f13b67ceb089f13c61a130e1a39d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747166389;
 bh=tF8r4KJ5VX0iYqMtqwt0qRLQRfFGyIjbUh51knOpTuE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e1Y+hTCi2H7dp9FOn2SbQ+fhnYOpF88uPmeydRGud0AhxbPNb7frkUcBAfXws/sdt
 Cd6rnUtOpDhqJcwSQsf4phpBVyz5eJj6mXzrzC4hyYN8aaaI613VXkOfwVCVCXJXiQ
 kKC/+2+UV/x/fM68DpaBuUYaD+DiLfMFwH+H/KaBLBC8rGec0orDzdY+s5B4sfXiwk
 Y43gnlKYzBngq9Yc+Tel1vHxCUzp+M0+srtmVZcKzSTybvZBmjP06bkfIulJj+Q7Cj
 Lh7TY1SmMVqiAuuIh1obV+AABlwwJFghPWuICNRCzIvdGPdb8CkD0prA/zfDhEKEzD
 nCD02WGswqh0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e1Y+hTCi
Subject: Re: [Buildroot] [PATCH] package/dhcp: fix build with gcc-15.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 12/05/2025 23:48, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dhcp/dhcp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index b3b7fe3203..ab3150ea6a 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -30,7 +30,7 @@ endef
>  DHCP_CONF_ENV = \
>  	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>  		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
> -	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1 -std=gnu17'

I have the same comment as for the unixodbc package (that we should 
avoid
passing -std=gnu17 unconditionally because not not all gcc version in
Buildroot are supporting it). See:
https://lore.kernel.org/buildroot/525ab9dc6a65e244195a756308a08c00@free.fr/T/#maa7665395d454963bae556b66f11e2a08ee7c6e3

Can you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
