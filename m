Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF66C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7E883D7C;
	Fri,  2 May 2025 10:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiMKrC_dEKtj; Fri,  2 May 2025 10:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A7A838E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A7A838E6;
	Fri,  2 May 2025 10:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E756229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F35B8198A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6Tq5ttgg_Go for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94507810BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94507810BA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94507810BA
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 949C91C1122; Fri,  2 May 2025 12:36:06 +0200 (CEST)
Message-ID: <2ee5c3f4-6c47-45ef-b996-ba15618e59af@rnout.be>
Date: Fri, 2 May 2025 12:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
References: <20250414150721.4300-1-tianyuanhao3@163.com>
 <20250417112243.4161-1-tianyuanhao3@163.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417112243.4161-1-tianyuanhao3@163.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Sy9bZfTh/pM5yqgzUmqzsrOwhZZtSv1bQl3GMoE6KVM=;
 b=XryhqyUTV5lN+DKJgQVchq+3UkHO4YqDf9QtOMu1Z/J91l3m+3qVT6vSSucJJDULSteGTh
 mnMVs2m5bKrpYixpGs0QodF63nTgneP8rqUxWwNREr7iJ2X+02RGJr9zO0RkQojCGzitWc
 XfQ88pJWYgoNrqJAg2ZSiCdCmWyuivCmIiRImZ7voJSSw+5NyuAZKQNs+T04ssZ/HpK/9J
 eewzihv+wH/qDVdGwd6zG2oga6lnoIfIhNMq3nohgABrgoFfS7p/c7mYw5kuDU6UGduWuS
 1gn8j00uYhqEYVhnjwBOXB4UIlYn63KO6VNDXt7W2arqIm2MR6rxTlKDgAJ/DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XryhqyUT
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: install systemd
 service files
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



On 17/04/2025 13:22, TIAN Yuanhao wrote:
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yann E. MORIN <yann.morin@orange.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> 
> ---
> Changes v2 -> v3:
>    - Create symlink in /sbin  (suggested by Yann)
> 
> Changes v1 -> v2:
>    - Remove untested TAILSCALE_INSTALL_INIT_OPENRC
>    - Change default service files to use /bin instead of /sbin
> ---
>   package/tailscale/tailscale.mk | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
> index 55f8ac4ab9..7019b9afc9 100644
> --- a/package/tailscale/tailscale.mk
> +++ b/package/tailscale/tailscale.mk
> @@ -15,6 +15,18 @@ TAILSCALE_LDFLAGS = \
>   	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
>   	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
>   
> +define TAILSCALE_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.defaults \
> +		$(TARGET_DIR)/etc/default/tailscaled
> +	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
> +endef
> +
> +define TAILSCALE_INSTALL_SYMLINK
> +	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
> +endef
> +TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
> +
>   define TAILSCALE_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
