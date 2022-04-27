Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37EFF41A49;
	Wed, 27 Apr 2022 18:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ua5Dg0VAFIr; Wed, 27 Apr 2022 18:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3B641A47;
	Wed, 27 Apr 2022 18:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C19B1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE6C941A47
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC0vDLj7q_wP for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAE72418D4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:53:46 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j6so5152973ejc.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpgcJYCjeAK2ayexyYFz+Vbpyl+Wn91F0qaZODWIA8g=;
 b=Ydo2xOUcqz6eioBfvCNWB4pY7CmFTrJqd/CJtizGvnf8kEgk1BNOdGbRG/Yi/9PB05
 oYlPRzQ21U/qQ5voxw0PZw6kL3rtRqx4GR4vP7JMxGHpuffxD4CnxDBVX018Ll/BsH6r
 qRfVNkAkOCz20cMxpDXiQT5Db6eX+pdj5EH2mBBA5+9Ys8UQbTYYMBMv2vTU/qdzdyl/
 eo1FMDevkqmLWGVQwYw5ZIR9ItpBDmAEzBohClZiNOlTPIvSrkhbPbQHqTp9SGQB0DVh
 I+gN/9sT45GXwBw3M6yA2p5WpQEjZrpPDndiGTkEscZIKMSPN+/fKDUzDMWbvCjmgYTC
 PVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpgcJYCjeAK2ayexyYFz+Vbpyl+Wn91F0qaZODWIA8g=;
 b=MhIgK7v3HJB+wWdflZb1tvpqI3KhNSNofHhHzztD5ZNwOTtmWFrd2ytD4psZGCICYj
 hRW5lBd+XkrRTbuHqzR7TZC0iFf7HBeRY2z9XFbmG4a15YaBqUd/UVXehZENSltbdJrE
 m1vI7+lrlfaDsl/cHmS+n3/lVtafMhkanaUnxNHLLiNnKWXZ39Yqt3Mc9QgeWihKirfz
 aSx1rCKezSD839j6tLhCsjhQRwCkdNE8/rhf0P/QD5rbZT99YzXutuUzCU9gLGqvxGzm
 tS1PhoRO0Sc8lG0iIfECE/2F1Tzk+yKfCQKCqRNjmuItFBeRSrEAJzdNAYTXOvxZfTci
 myuQ==
X-Gm-Message-State: AOAM533PIv9oI10b5Bw83KfTtQr5L+WxcbesxvW/+zrhxMWeVheEMXal
 8SaDPpeaxDJEiRWjQgfHoiFjHA==
X-Google-Smtp-Source: ABdhPJxf0A+K4ulvnbO7l61ipfrWMKZdttphCsbC7ZIB7agdJ5RNzKegLYO6bunfgJEKYU7P3ftDWQ==
X-Received: by 2002:a17:906:24db:b0:6f3:a29f:95dc with SMTP id
 f27-20020a17090624db00b006f3a29f95dcmr13945863ejb.520.1651085625168; 
 Wed, 27 Apr 2022 11:53:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm7195627ejc.161.2022.04.27.11.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:53:44 -0700 (PDT)
Message-ID: <061f790e-aff8-8883-44cc-1a9a548b367a@mind.be>
Date: Wed, 27 Apr 2022 20:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220425212338.1105933-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425212338.1105933-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/pure-ftpd: doesn't
 build with libressl"
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 23:23, Fabrice Fontaine wrote:
> This reverts commit e87e6fd085b8a4965b9dc84635fd36e380da4dde as
> pure-ftpd can be built with libressl since bump to version 3.5.2 in
> commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2 and
> https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pure-ftpd/pure-ftpd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
> index 0354949e28..f3cbef84b9 100644
> --- a/package/pure-ftpd/pure-ftpd.mk
> +++ b/package/pure-ftpd/pure-ftpd.mk
> @@ -45,7 +45,7 @@ else
>   PURE_FTPD_CONF_OPTS += --without-ldap
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   PURE_FTPD_CONF_OPTS += --with-tls
>   PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
>   PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
