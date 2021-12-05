Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4C5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68254038A;
	Sun,  5 Dec 2021 10:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2kfA33mhHF5; Sun,  5 Dec 2021 10:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE5F3403BD;
	Sun,  5 Dec 2021 10:32:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBF6D1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC1DB606C8
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgEckDuVnq3S for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:32:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62FA560688
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:32:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l22so17983690lfg.7
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NGE8jUyygyOFf2zuAlXwdPA8dQ13EZxL4BPDolbgCLQ=;
 b=Oz/gcXzO3YqWM9h8tiNZGZJ+T/1H0pO7+hfJmADZHxxwlv1MVcaEEmVhT0h9hWd+AU
 N54TEZFGZafioruXfwO/3GLkQfL3T0pDNjYQUfrotcwG8b3LVzIEn/JpkZh3HOn7EwiJ
 fyLjiSbqSoTiru6rq05VuQrtZv+PFvH6V7YaEG+GSyXT9XdQtawofAoYYzDRFfmp++Ld
 LlQr8cYJxeDhjl28h+MmXv41YtRG3QLByxHEU5b/uU0yR1iD1AFPZr7AwfkeFjASVzjV
 whgmauZxvP+A6Zn81wscrEeoqeT2tEH3kr7Pg4dL9dW/D4B7D9I1d8oprBJBxm3W290Z
 kolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NGE8jUyygyOFf2zuAlXwdPA8dQ13EZxL4BPDolbgCLQ=;
 b=Sp/CJ6M1LP4+yZ4bU6BA2homU7J1RbHuF+gkC7LY0hgniYqqqvhK+8a34YP9oudiDZ
 zVaEuwNKG8Ox4XC2J9hYPbSCfBQKsdYp36Pw/95ozRTM7FYzzSM0fT+3BNZDMo0mVj7u
 owFclb1I7EHYVsbUjKpNpBPXlT/w3PNqidJ1g4EB7q4oL90yAeWgIujmgGBzaKFix/BV
 dvex/ihfCvpmQJjJKzavrJIsJ2kux1VvO3ek6jIsdMcPSycni037vGmm2Lob6f3kFdQb
 FKt+V82CfuFXAjjCbrdsx17tEd6yUdyeS9JZIKesq+OimTEPPBO9SA9zU/7lPTHEthJu
 lCLA==
X-Gm-Message-State: AOAM532TXmcCAEogW7z6j9Pw2OwbwSLaoCOQKXRSqT5fGC5mxvJbTR7h
 g1iZsia1iaHTu/kyQn2+tLA=
X-Google-Smtp-Source: ABdhPJzMWBEzYkZ5DYVYvbeR+XrYV7RVp3KiezzH1IYFUFg4za1rBjXmqwnIVR8lPhVr53zD+9SZrg==
X-Received: by 2002:a19:6754:: with SMTP id e20mr27441796lfj.122.1638700351403; 
 Sun, 05 Dec 2021 02:32:31 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id l22sm1045019lfc.307.2021.12.05.02.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 02:32:31 -0800 (PST)
To: buildroot@buildroot.org
References: <20211205102907.2836980-1-troglobit@gmail.com>
 <20211205102907.2836980-2-troglobit@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <b971aec4-b560-3567-e8b1-85b12e8dac47@gmail.com>
Date: Sun, 5 Dec 2021 11:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211205102907.2836980-2-troglobit@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH next 1/3] package/inadyn: replace local
 systemd unit file with upstream
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

please ignore this specific patch repost.  I see now it actually made it
into next already.

Sorry for the noise!

Best regards
 /Joachim

On 12/5/21 11:29 AM, Joachim Wiberg wrote:
> If systemd is available at configure time, the inadyn configure script
> detects it and generates the unit file.
> 
> Also, the local unit file had the wrong absolute path to the binary.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/inadyn/inadyn.mk      |  2 +-
>  package/inadyn/inadyn.service | 10 ----------
>  2 files changed, 1 insertion(+), 11 deletions(-)
>  delete mode 100644 package/inadyn/inadyn.service
> 
> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> index fc04fd5f25..9ccb16ddfe 100644
> --- a/package/inadyn/inadyn.mk
> +++ b/package/inadyn/inadyn.mk
> @@ -31,7 +31,7 @@ define INADYN_INSTALL_INIT_SYSV
>  endef
>  
>  define INADYN_INSTALL_INIT_SYSTEMD
> -	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
> +	$(INSTALL) -D -m 644 $(@D)/inadyn.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
>  endef
>  
> diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
> deleted file mode 100644
> index abc0a1e401..0000000000
> --- a/package/inadyn/inadyn.service
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -[Unit]
> -Description=DDNS client
> -After=syslog.target network.target
> -
> -[Service]
> -ExecStart=/usr/bin/inadyn
> -Restart=always
> -
> -[Install]
> -WantedBy=multi-user.target
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
