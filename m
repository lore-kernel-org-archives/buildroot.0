Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFFE40338;
	Sun,  6 Feb 2022 11:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZwprt4ukQO9; Sun,  6 Feb 2022 11:32:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7851140341;
	Sun,  6 Feb 2022 11:32:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A20081BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E26940341
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVkzWW6uxLvk for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:32:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62D5840338
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:32:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f17so6746404edd.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 03:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=0E/m7FAoSXZzL6q7flqJQ9B7DuAyjBPRRJmlcPqAJhs=;
 b=gFrBs8oF7vpHUv5/EIcgS0aledwGrWwr66AbPMesKL/Okn52SRBm7S3MuqNR5aj3a/
 IoEXpSl5FZae6TKYzh3IZ1rKJvWewlrqPL/7aeGZqfPDmWyrlR54+VBrpGYhEO/3z8Tx
 bIBGBoaxz6H+jhwdzdubHTZTzfBRhgk180zHKzre/gZYjHxOW1dx4qa5UHW8rjb672mB
 y+6v2Dol9K9Hmb7veTeip4fSKD3UTzuhZCcTNylU4pitZVUwKt2/jj2WJpGVdLw22E9S
 4JMig+7+HprpO5Flf0AdA3XiaOB+1O8Vzajc+V0KPTjdVmymB0v3r+zhf0H+mR7/uHAJ
 oVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0E/m7FAoSXZzL6q7flqJQ9B7DuAyjBPRRJmlcPqAJhs=;
 b=zaRfShsWD4LF8VKRW7T7R7qilBmGbOOot6QjlrpX625nUnoKF0JEFYBRkNpSYHzzlW
 Uhc2ucS3l1mnMLB+CztCI2kk38VAyRfxYNhlTfpiJj4aCzBJN0emZPB5ABcOzf2o90d3
 zxr11LQT8gCozE3vQ5DCjSIoKnCQINL7/KdcGElAypGWHOh1GDAoXMKK0BvA+u5+q4AC
 rKEkSvxXwUJMo/Xy0PZ5exIfaQ4jD2z5p18dXD5keBRpZOoXIMxMng+ogA/8C9443Mp2
 ToEZEY3acMkvCXhl0pv6ZdBQNzvgZw/mMgPSYTX+KXVdf7dGMgzwzUX0ezYQbyMUnQ6F
 +eRw==
X-Gm-Message-State: AOAM532ugqFHfX4hwmpCI3bjJ5NckxoNzAtDeA+DX+GmZKuKsbpDDhNg
 oLzBQ5mRJjJD9CkR4rxORDAb/w==
X-Google-Smtp-Source: ABdhPJxrJzL9E9TY/RngLdm+lTQ1o3iW1VLUNXrQcy47DKka/OU+LYrzdvYaXxYy+wiUohtjdh3kOg==
X-Received: by 2002:aa7:c793:: with SMTP id n19mr8496461eds.74.1644147118559; 
 Sun, 06 Feb 2022 03:31:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u6sm530568eje.101.2022.02.06.03.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 03:31:58 -0800 (PST)
Message-ID: <d33c9f1c-2a1c-285e-0acc-cd52db921a34@mind.be>
Date: Sun, 6 Feb 2022 12:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Arek Marud <a.marud@post.pl>, buildroot@buildroot.org
References: <YfcMrhsNq6LnkKzP@leo> <20220130234800.14da56ca@windsurf>
 <Yfz+U7rrMCkgrjah@leo>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <Yfz+U7rrMCkgrjah@leo>
Subject: Re: [Buildroot] I have a problem adding new package
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

  Hi Arek,

  Please don't top-post, but reply inline like I do below.


On 04/02/2022 11:22, Arek Marud wrote:
> Helo Thomas,
> 
> Thank you for your answer.
> I had a problem with libonvif compilation. Compiler complaing about
> unsafe include path (details pasted below).
> 
> I was able to compile project ONLY when --includedir parameter was set,
> without it - compiler complains about include path.
> 
> https://gist.github.com/arekmd/11e9621ae3fc476cf37e80150d15b177
> 
> I pasted build log without LIBONVIF_CONF_OPTS line.
> 
> 
> myname buildroot$> make libonvif-build
> WARNING: no hash file for v1.1.1.tar.gz
>>>> libonvif 1.1.1 Extracting
[snip]
> make[3]: Entering directory '/home/myname/workbench/resources/development/myproj/bu
> ildroot/buildroot/output/build/libonvif-1.1.1/build'
> /bin/sh ../libtool  --tag=CC   --mode=compile /home/myname/workbench/resources/dev
> elopment/myproj/buildroot/buildroot/output/host/bin/aarch64-myproj-linux-gnu-gcc -
> DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFS
> ET_BITS=64 -I/usr/include -I/usr/include/libxml2 -I../source -D_LARGEFILE_SOURCE
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  This is what is wrong.

  It is caused by the following lines in build/Makefile.am [1]

AM_CFLAGS = -I$(INCLUDE) -I$(INCLUDE)/libxml2 -I../source
...
INCLUDE = @includedir@
LIB = @libdir@

That is just simply wrong.

  The proper fix is to patch the project and

- Remove the -I stuff from AM_CFLAGS, instead just set AM_CFLAGS = -I../source
- Remove the INCLUDE and LIB assignments
- Do proper discovery of libxml2 in configure.ac
- Add the libxml2 include and lib directories to CFLAGS and LIBS either in 
configure.ac or in build/Makefile.am


  But it seems that this project is pretty dead, so the easier approach is to 
just add

LIBONVIF_MAKE_OPTS = \
	INCLUDE=$(STAGING_DIR)/usr/include \
	LIBS=$(STAGING_DIR)/usr/lib

  Regards,
  Arnout

[1] 
https://github.com/sr99622/libonvif/blob/76961fb9f3ece462724a4a6c09b4bd7cc051b759/build/Makefile.am#L7

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
