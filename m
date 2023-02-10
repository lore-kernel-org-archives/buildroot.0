Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17DAC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 11:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBE660BFF;
	Fri, 10 Feb 2023 11:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBE660BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrN5gjaBE6KW; Fri, 10 Feb 2023 11:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54F660F51;
	Fri, 10 Feb 2023 11:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B54F660F51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD0F1BF2AA
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85B2882202
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B2882202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYvzRNWEvw_F for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 11:17:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA8708212A
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA8708212A
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 11:17:38 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pQRPL-0004wA-D3;
 Fri, 10 Feb 2023 11:17:35 +0000
Date: Fri, 10 Feb 2023 11:17:33 +0000
From: John Keeping <john@metanate.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Y+YnzeeSbedxW3eK@donbot>
References: <20230209170707.4066903-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230209170707.4066903-1-peter@korsgaard.com>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=xo3Ai8+pv71/1jMjVEjvZWvn+c6ra291Qv8h1zQkRpk=; b=qCiG+
 E6ASUfUDc+7fLz9FT36o2QDcMGveNc5N0ncWdvelKhD+D5Xn6KxqJYopxakQhLlnvUn+QqFFobU03
 d3eSv3K9sV9ZW+rv6I470//mmaVCO/dt6XLuuYJY6uGq3SeaVJA6KUT4joPhT7utVuYKnR9TcPtzC
 p2Qzj1aZpzJOEVyDOMg0XwNo/adGIsqDqaey9qBwB5bmzTazznIpDtF+hVOWMU+fzThU+p7/gCcUG
 QRum5e6jRHfgpvceaF9y3Qm+ptSeFVnU2lLjXWFWScX3XgYx9PHPb13WwUWjwYDVyWRmYH+z4yV6d
 S19xoyJpZgHS5L3sbhNtn2psBl+1A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=qCiG+E6A
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: Build with ninja
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Thu, Feb 09, 2023 at 06:07:05PM +0100, Peter Korsgaard wrote:
> +define WEBKITGTK_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
> +endef
> +
> +define WEBKITGTK_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
> +endef
> +
> +define WEBKITGTK_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
> +endef
> +

Would it make sense to apply these changes in pkg-cmake.mk?

Using `cmake --build` and `cmake --install` works with all generators
and it would avoid needing to repeat this block for both of the packages
in this series.


Regards,
John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
