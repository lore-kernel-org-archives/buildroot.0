Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE89AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B77426AA;
	Sun, 12 Dec 2021 14:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXUD5LaGugtn; Sun, 12 Dec 2021 14:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E357E426A0;
	Sun, 12 Dec 2021 14:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C85F1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0803660D69
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLbRCBwcEd9M for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:10:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EB5D60D68
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:10:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y12so43454471eda.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EWP7ShYcTdtFYYqRQavz7bbe6nMlF47oe+RNExsijXA=;
 b=SuvzZ+SAVXPhT4QJC/s/6YZAfAZ5jAeb86hLv6Afk/rfUvPFWwRqLfY70yI4uu3pKr
 8Z9jd7GM37+E9Rnv69GD2yC/VyLDubJ10535FRKBkNk3NwsZRqLbanZYi61M8lhq3IGu
 GsC+XpVXZJ1a4SXnVzOYf6kMBl6fygrsanvju/q9J3DtIfcJysoVgZY7h7x9o2qw+gIH
 qw06PQJJ164CAwSJ09A3I2RmZe3hWdnDkLRaORgliO+B06PdwWJgTOiI362tcpUmAER9
 GxNo1cwQVcHl3ykjQwwKbb0NxBHcRaaJgaoLeITHABubSrI5/Vk+4j3H6GNPXzZKIe8X
 BpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EWP7ShYcTdtFYYqRQavz7bbe6nMlF47oe+RNExsijXA=;
 b=LmHN3+GCJS6g6Cbbt65TL7S68N5YuHquhb2a+QeJmXdqODLw6jHCEUMbSEazEL7ITe
 XVkSYCwiV5o2AxmgQIJ3HoS6AlI1qLCKkNLDh4DlJVfAAQbufltfG/aC3U7L/KtxUB5R
 UmvftdhKB9wvP+YnAfJ784U7kfus9HWfsc2EZvHsk9RlkK+dLkl2EGXyoCj2dMnq6Yrf
 6H7XmA7wpxfO4WaOHzxrog70Yzmn4KnPLBAPJK4WDfl2gkJyRt7k5ZP3H2ICZoWqNvjX
 zdOgEZECqI5b0zm77Njs2s7SCUGpjNvsVBwTI6rWI6VPoYmzpQRT2Qt5aVIqXO6ukibb
 /qCA==
X-Gm-Message-State: AOAM530TYKcF71r8BvsDSko/JcPSXbiP5ND1eenWdEl3aOllVkcp/UBr
 3LKqnnHh7zW8h40Pdf8rS8lCGg==
X-Google-Smtp-Source: ABdhPJyBcH9tmOQe0nkcM3rf0Hkg07+6Pdsz4D9Tt1b4nDgur3cMtC4AcWeo8Fi3Vl3x0WrMeRW2tg==
X-Received: by 2002:a05:6402:3589:: with SMTP id
 y9mr57831298edc.44.1639318248523; 
 Sun, 12 Dec 2021 06:10:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jz4sm4439654ejc.19.2021.12.12.06.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:10:48 -0800 (PST)
Message-ID: <210132f3-c956-aa99-4ef0-6c1c1d28f0c9@mind.be>
Date: Sun, 12 Dec 2021 15:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211209221723.502534-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209221723.502534-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-pydal: bump to version
 20210626.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 23:17, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydal/python-pydal.hash | 2 +-
>   package/python-pydal/python-pydal.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
> index 911734c8bf..eef00030bd 100644
> --- a/package/python-pydal/python-pydal.hash
> +++ b/package/python-pydal/python-pydal.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256  32faf0b7123bc19b5f70da654fc99a22f4ce6fb20f5e4b38aba819e0ab4060aa  python-pydal-20200321.1.tar.gz
> +sha256  9634f34a31d4411588b73825c8acc7f73ca69ba8a665bb00d0a9b5baff69498b  python-pydal-20210626.3.tar.gz
>   sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
> diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
> index 2aeade322e..428999f5c1 100644
> --- a/package/python-pydal/python-pydal.mk
> +++ b/package/python-pydal/python-pydal.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDAL_VERSION = 20200321.1
> +PYTHON_PYDAL_VERSION = 20210626.3
>   PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
>   PYTHON_PYDAL_LICENSE = BSD-3-Clause
>   PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
