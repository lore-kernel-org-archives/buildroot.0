Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F7C5DF9D
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 05:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF8640635;
	Thu, 27 Aug 2026 05:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTX95UQYZQ6v; Thu, 27 Aug 2026 05:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787809255;
	bh=Wz1BU29bN0W1Jg3Zed2ctz8WlIlaoQUxtxSZwDno2eI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SMhpAswN8LcMvz0uUJut37L6zlbXiVX40lEHmZx3JA/t7yxqfVvVi3LQRFhGq//Ce
	 g1ABQqCjObRBqRLzO/UWK0Fo+tDU9j1xGRFyYMhJiUHoit6gwBVKz3xnByfF8/RZnf
	 xlQH8MbYc7zEQPsWWpqPVSM0oGdl/nlnUbDwAg06mPK/DF95txAqVk7mNy7ex+TSkX
	 F4sQdE6xc9eCk3yugwXXD3oTb+zg0zjPsNMAReQeZzmdz7VLEEg+x+SQX2M+YTv7iX
	 5bxy1pbmKtoQDzMKkNxAPKgV3BYyibbWne0vaG15fIOB+eLJQ7AFIIneXySsWM4r3M
	 x8+e9u6baA3uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B3A405B3;
	Thu, 27 Aug 2026 05:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E83AC334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C956D405B3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPOEjA5WILds for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 05:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E037E40591
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:40:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8DE101A185B;
 Thu, 27 Aug 2026 05:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 624DF604ED;
 Thu, 27 Aug 2026 05:40:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EFFA11C78351; 
 Thu, 27 Aug 2026 07:40:45 +0200 (CEST)
Date: Thu, 27 Aug 2026 07:40:44 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ao_Nj3une8D_aVEC@windsurf>
References: <20260827032643.1940-1-br025@umbiko.net>
 <20260827032643.1940-2-br025@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827032643.1940-2-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mpd: use upstream mpd.conf
 w/ buildroot modifications
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, Aug 27, 2026 at 05:26:38AM +0200, Andreas Ziegler wrote:
> +# sed snippet from https://stackoverflow.com/a/37911473
> +# single-line configurations will be inserted behind the last matching line
> +# in the target file, multi-line blocks are just appended at the bottom.
>  define MPD_INSTALL_EXTRA_FILES
> -	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
> +	$(INSTALL) -m 0644 -D $(@D)/doc/mpdconf.example $(TARGET_DIR)/etc/mpd.conf
> +	export multiline=0
> +	while read -r line; do \
> +		if [[ $$line =~ ^[a-zA-Z] ]]; then \
> +			if [ "$${line##*[[:space:]]}" == "{" ]; then \
> +				export multiline=1; \
> +				printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
> +			else \
> +				[ $$multiline ] && \
> +					printf "\t%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
> +				[ ! $$multiline ] && \
> +					sed '/#'$${line%%[[:space:]]*}'[^\n]*/,$$!b;//{x;//p;g};//!H;$$!d;x;s||&\n'"$$line"'|' -i "$(TARGET_DIR)"/etc/mpd.conf; \
> +			fi \
> +		elif [ "$$line" == "}" ]; then \
> +			printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
> +			export multiline=0; \
> +		fi \
> +	done < package/mpd/mpd.conf

I am sorry, but this is way too complicated for Buildroot's KISS
principle. Some much simpler approach needs to be found.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
