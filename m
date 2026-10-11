Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2834CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA54160697;
	Sun, 11 Oct 2026 14:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgUn5BAWRAFj; Sun, 11 Oct 2026 14:55:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EEB6B60609
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791730549;
	b=C7MX7gmocqCG49xAOmaQRroFydneK7fcYuvBZ7VT8diMKvIU/Id4j0D/cWQZbiZRuh/Y
	 x2GyStNu77DGDEzrcFoFhgw1j8qyd6MuQyQEEXsFrXm5I8CHphhOvDvbK+feSsB7ebqhm
	 iwUxygyP6nTsSfobi+A71zAjb4jIqZ2imCpACHGeGOxR4WcrUqvUF1YJG+/e8UFAZQXjh
	 eQN195k7lnXFQs0g+KDWDrmAD9x0zhbITSFNb8mYIN4k6gU1S11MrtdLco3GjopuUu3ut
	 TKt1DlziiLamWcctM4fvy572VPnKgaywSOB92NQiIHZbEqEuvbPyVheAO/mubhC8o4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791730549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=t9RvG/veQeKcn10sP12RAuftLvaMXnnM3PTSFdPZcpQ=;
	b=smvwXiz8S2d1PifjMgs4MtFY8raFz0WRgsuJGh9jTEac5pgJDw8QxvGkOkcu0LjKNSdv
	 UsrwFzo4YYxaVegxzRmrbvFijT3jLTKZUp+syOCXByokEHsZD19i/Ln7duWy3hQAU5qo5
	 /3+77D3/fLHcVPe0wuxaAnvQS5gU5rkIADX7x5OOfq/uZ1paLSMRQJAoBLaNhmD8eATq7
	 ij8lv6yucAQj69WXaHVX1p/bJwDl/jSh0hJRMLqVUzt+zV4pFh1ATBvOrpkVAmuozC6Rn
	 D6VyJ9HWrGGbWtobXbcqpuR4sClu/i7qCH5QE0fe3x1RmGR5HWQYSFWLkND1bOaP7hQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791730549;
	bh=t9RvG/veQeKcn10sP12RAuftLvaMXnnM3PTSFdPZcpQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oVys7Fs4UUkzQUEuHfKnUT8hYieZb/Axcq1b2BHK5nzBfhiw94Uz2OiOrEt7pSc6m
	 2CxgR27RsIlzkqR6VkkrpX8wYQz0bbXZd/kZEjlCuz+Xy2xaCbk9NCPf3hCOz6JTDw
	 WNXLd0ReczXjZblincNp1zIjIO7nutibrhFchY1WQCvVE0cgWFeqzFTV6PgN5zj7qE
	 ic6JtAkb270/QY58epdYe5og0GykOxL+35AITxylwA+fwNOfhGr3pwuoYaylalN4kR
	 sPLki+3/bFjAtpNQ7akJn8UZcwg9R5C3RVNN7rtILmKwXSdEAu3afmLAY9E3TLiuzt
	 fZ8WYUM77jBqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEB6B60609;
	Sun, 11 Oct 2026 14:55:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC4F380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB5F60609
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IINJmCwWTE4o for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5A2FD60608
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791730545;
 b=BkQsLMfuL/4YbvNAHES9mPG+bRyteRwDUQR4O7sCM1ZLTYPZYeG7uRHQYinaMZo+6IJw
 SRiHCZIZP4Nb8zeZwrb7b4kkyF/88JIl+Cn3GSYCWXG9hb400CbtYfdBi7x+wxy8qwajc
 0QxRiyGTuu+MphNyUcyNSnftkUaSNNP+8PsoE6QDAzIck7B2oC2ckpoKUh2pIrfOK/CTP
 Rk85WBwGLSHsj8IQJ0AMgvG27zEY1mfAL9E/ivygI9wN1VF2madFx3FgP6d6wVz+T8N4z
 OIE+kT70vGK89TEV/Eg4APDE4mUvoJKXuMYXwycC0KCdTqilPVnyyNyTERA5RGLpMXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791730545;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=lEWhGrnYgXHqzJ7+VpLZHY5pbdLQWlL1V1uc1KMCWDg=;
 b=GcwBcOoqPdzIIz/Li2/r/47rf7g1vcK97cfnqid3+031O5/W02yfip0z1hPlEG3Duq0h
 hLJfXXpR47wHT51f1AYuQx/ZCdyrgl54u0+LQ+NYWknD3dklxv0bupB8HJxAh5Z845g72
 PT8ErL1LJ4FwjpXXz2UahlEB3+URDPcPCvd5Hf2qdg3db1YHYyTZAvqsvrrSdL3GuXV+Y
 2md6VZD1ad+f73MXMF/lmtBIVPXVqyjiexd2DJFzdmBmPwOQqkUnYxUTYmdE94XZexPun
 3+2GAZ68d6sFEmrTknYinIIC2IEIF9DZcEbKETeRrJ3yTWDtKCcpxbLMuZR2jcIESQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=lp63BkC6; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A2FD60608
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53E1BB97A0DA; Sun, 11 Oct 2026 16:55:41 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Bernd Kuhls <bernd@kuhls.net>,
 Julian Vetter <julian@outer-limits.org>
Date: Sun, 11 Oct 2026 16:54:32 +0200
Message-ID: <179173032608.205445.14009959910527301138.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260122161116.885373-1-julian@outer-limits.org>
References: <20260122161116.885373-1-julian@outer-limits.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/php: Add parth to ca-cert
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Jan 2026 17:11:16 +0100, Julian Vetter via buildroot wrote:
> If BR2_PACKAGE_CA_CERTIFICATES is present, add the ca-certificates.crt
> to the php.ini, to not get SSL errors when using PHP.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>

 Applied to master, thanks!

 Could you perhaps also extend support/testing/tests/package/test_php.py with a
test case that catches this? I'm not sure how, but perhaps there's a log
message that you can search for to show that a valid CA certificate file has
been loaded.

> ---
>  package/php/php.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 2c91ef7b63..3c79ae4589 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -362,6 +362,14 @@ endef
>  
>  PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
>  
> +ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
> +define PHP_CERTIFICATES_FIXUP
> +$(SED) 's%;openssl.cafile=%openssl.cafile=/etc/ssl/certs/ca-certificates.crt%' \

 Wrong indentation here, should be indented with a tab (caught by check-package).

 Regards,
 Arnout

> +		$(TARGET_DIR)/etc/php.ini
> +endef
> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_CERTIFICATES_FIXUP
> +endif
> +
>  PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
>  
>  HOST_PHP_CONF_OPTS = \
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
