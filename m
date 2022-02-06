Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0105FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A912660D7B;
	Sun,  6 Feb 2022 11:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrW-luJk5zmb; Sun,  6 Feb 2022 11:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDED560D6E;
	Sun,  6 Feb 2022 11:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30301BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF61781756
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clg2kZUzK_Qu for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1803F81432
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:05:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b13so23796838edn.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 03:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3h8h+8Rs6fllbHvVhhx6OiHoG7PEu6IUHJoRQD1hWts=;
 b=Vvz0NBKREQlD0cZ94cC+YVxgHaTCUbBTUTmw2OZXYiQCsmEcmsfmbCLJE4OnlNZ+n8
 FUoqaGnhkkS51f0+62O9Xxlnl1/h/wfYagQs5su3jJRgoKuCuUphgQI6lstlIFfQHH7b
 Yk/4TJXFNYGrWjakM4nf1zMf5gQbH/8li6z0NF0N3FAFUqGcw8Asj34qlCM9sXdc3Bst
 iD//+KFPzWMPS9VLDc1PBeZ261nAObyR9a9sKoz1JeYs8WeJGQA2mncIYci/ggPQdxln
 krhdt2cAxjm+pb6rOxrgseJWhi/SaUbTnAX4jJX5LdCbkQRZ9BynWl/0j54TQ8XESPP+
 7dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3h8h+8Rs6fllbHvVhhx6OiHoG7PEu6IUHJoRQD1hWts=;
 b=fIl4n1VrWKo4VWaCC7Y8Zs8LNY09y5UgQdHWLlIzJqZK6JCXN5lUtrPBpbNKrTC9J5
 E4SQ//zrZqXnWndDdBGJF4/Qj3O17pucJoSTytSC3ngyH+LHrLz8jxXzOlHRahsE4wxw
 WYOPnxRfCIsJ93HqENnTi/XGEobFUUqFGTfm4HJEsDZgE2QXyUtgY//B0qH4EvV+lfdJ
 lDeD8dJNckJhVxBHK9Zitlix4ecNvOtN76N3AMR1UJhy8608jIniC6LNlTHbNgOsQry8
 ZLoJS1pvsG2lmYFsJ8cC6rOm3cpNpglaOKHCaqFCEH3mHm+PYThWi+vanXohU720z6f/
 qEUQ==
X-Gm-Message-State: AOAM532Y/NTy1tcXr6wzsfBWzxpgadVcg5vRfC+lpkTF3yGGj1KWSgn/
 wKhGlwlEdx12gDcByvkhibZgE4rsoigs0Q==
X-Google-Smtp-Source: ABdhPJyZn3A9eEMqSn4WnWbEbVYhcw5rbINuf2c+AHBMSZkurosCIo5roR8+tDZgwbj0nfpzSUqYbA==
X-Received: by 2002:a05:6402:3696:: with SMTP id
 ej22mr7035413edb.146.1644145544157; 
 Sun, 06 Feb 2022 03:05:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l8sm33047eds.90.2022.02.06.03.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 03:05:43 -0800 (PST)
Message-ID: <89d065e4-5745-8b6a-4aed-d03b26c112f2@mind.be>
Date: Sun, 6 Feb 2022 12:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220206094504.11415-1-peter@korsgaard.com>
 <20220206094504.11415-2-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206094504.11415-2-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/avahi: add pygobject support,
 move to python3
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



On 06/02/2022 10:45, Peter Korsgaard wrote:
> The python support in avahi needs pygobjet to do anything:
> 
> Building avahi-python:              no   (You need python, pygobject and python-dbus!)

  So, doesn't that mean that...

> 
> So add optional support for it.  Python-gobject is only available for
> python3, so change the python logic to use python 3.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/avahi/avahi.mk | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 04c4164af6..1992669a92 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -40,7 +40,6 @@ AVAHI_CONF_OPTS = \
>   	--disable-gtk \
>   	--disable-gtk3 \
>   	--disable-gdbm \
> -	--disable-pygobject \
>   	--disable-mono \
>   	--disable-monodoc \
>   	--disable-stack-protector \
> @@ -104,16 +103,16 @@ else
>   AVAHI_CONF_OPTS += --disable-glib --disable-gobject
>   endif
>   
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)

... this condition should be

ifeq ($(BR2_PACKAGE_PYTHON_GOBJECT)$(BR2_PACKAGE_PYTHON_DBUS_NEXT),yy)

(python3 is implied by python-gobject).

  If what I'm saying is true, then actually I'd go a bit further than that and add

	select BR2_PACKAGE_PYTHON_DBUS_NEXT if BR2_PACKAGE_PYTHON_GOBJECT

to Config.in. Automatically selecting python-gobject would go a little too far 
since it depends on gobject-introspection and we really don't want to enable 
that beast unless it's really needed...

  Regards,
  Arnout

>   AVAHI_CONF_ENV += \
> -	am_cv_pathless_PYTHON=python \
> -	am_cv_python_version=$(PYTHON_VERSION) \
> -	am_cv_python_platform=linux2 \
> -	am_cv_python_pythondir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> -	am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
> +	am_cv_pathless_PYTHON=python3 \
> +	am_cv_python_version=$(PYTHON3_VERSION) \
> +	am_cv_python_platform=linux5 \
> +	am_cv_python_pythondir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	am_cv_python_pyexecdir=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   	py_cv_mod_socket_=yes
>   
> -AVAHI_DEPENDENCIES += python
> +AVAHI_DEPENDENCIES += python3
>   AVAHI_CONF_OPTS += --enable-python
>   else
>   AVAHI_CONF_OPTS += --disable-python
> @@ -127,6 +126,13 @@ else
>   AVAHI_CONF_OPTS += --disable-python-dbus
>   endif
>   
> +ifeq ($(BR2_PACKAGE_PYTHON_GOBJECT),y)
> +AVAHI_CONF_OPTS += --enable-pygobject
> +AVAHI_DEPENDENCIES += python-gobject
> +else
> +AVAHI_CONF_OPTS += --disable-pygobject
> +endif
> +
>   AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
>   
>   AVAHI_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
