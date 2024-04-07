Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D2CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EE1A81BBD;
	Sun,  7 Apr 2024 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Gjht9Wfqyed; Sun,  7 Apr 2024 17:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F6081BCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F6081BCF;
	Sun,  7 Apr 2024 17:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A46C1BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 175484035D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTqYS0B0_hfq for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chinhuat@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BC2F4018F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC2F4018F
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BC2F4018F
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:47:14 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6ecec796323so3413117b3a.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 10:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712512033; x=1713116833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUKd3euqRcs+njQrrrQ/TBE46mBu8ApVxDtiKAQT2uE=;
 b=I6Q5spCTMDCDfDZaiOqKpN7ES4eHR1U7xvd6v4aaEV71YHxwl+Ux8FDiZKIbc7xMxx
 2HocluKlGMzkVzzeQNuGNZKWPuuYh6tLJWpA4l6cp0mh8yk63MklK9ntf90RuanWWiKj
 fP3qsn1XPSUqtCKroySxbgIA+QTe7HAlCMpBjaoRyPuSctmrNnq+QIgCThf/FI+XAqM3
 lZcg1A7Ydi5kS6y0NvEFWyBpmlR/1ChtJcRBG22QO2tQJXfEplfUTZHHm1M4/EfgdIBC
 zBRr15SxmWfcHQmrieLmoyP+8vw+3+gwU0YItLpPBEoGIeWheGVm1WZ/KYEIA5enZbB/
 l32A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRxoKTa6lvAGddmNfVRyyJTQcwF/1jCHF7zph4pmJRNR8hkC9pNyhQyWURBg2ZQHqO1L6ECuPrFmG+o3rAnEsIrZKRV3enGw==
X-Gm-Message-State: AOJu0YxR3R58n82q8vIUUxSATWEgUSYtsHfaxCG4ic277famqjvIU65Y
 N/VOZe4oyvHbHOikGx76I/zl1ALRRPjEybnoSoFurRF9kI5AnuAS
X-Google-Smtp-Source: AGHT+IGOR44ScvcEtdCu9u50vdWeBDDwhbpyt22p/kAwyRjLNBldgSHEalt744dR7Sg11OJ8L3Avrw==
X-Received: by 2002:aa7:88d3:0:b0:6ea:f422:64ce with SMTP id
 k19-20020aa788d3000000b006eaf42264cemr9007167pff.33.1712512033513; 
 Sun, 07 Apr 2024 10:47:13 -0700 (PDT)
Received: from NUC7CJYS ([175.144.129.205]) by smtp.gmail.com with ESMTPSA id
 s25-20020a056a00179900b006ecffb316ccsm4705279pfg.202.2024.04.07.10.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 10:47:13 -0700 (PDT)
From: Chin Huat Ang <chinhuat@gmail.com>
X-Google-Original-From: Chin Huat Ang <chinhuat>
Date: Mon, 8 Apr 2024 01:47:08 +0800
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZhLcHN3heQjqZvCD@NUC7CJYS>
References: <20240406154308.3336009-1-chinhuat@gmail.com>
 <20240406233701.036e7ca8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240406233701.036e7ca8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712512033; x=1713116833; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fUKd3euqRcs+njQrrrQ/TBE46mBu8ApVxDtiKAQT2uE=;
 b=HflLMym2FoS+DqX6yvpf7rVVas853GXCVKn4yIwOR+gD+ktdUGSTio8JyxSuLcUNLs
 wDq3KCNu+IyuRHFPqFn3KccPMykmzMyzxnU+ftXQ3xbo9TFd3+GnD9HypoesIruvn8sB
 pd3QSOPyb5F+JLY4cX6rJvANiTCZknnIeqOu+0I3p8r2nxdlcOtqRZHT63+uMZex/heL
 V8qgD/XSrhUuN+Ba4La3k8ilFG9RT1HkK0hWZZFJnWmLVJxr2pGkrViCgVZdHwFKVvpG
 Mzucwc63E93KMTPpIDT46zUPfrekMG0z1TDmAqhakdJoK1tsoh2p9GwaemvkTOJGYaL2
 wH3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HflLMym2
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47,
 add Y2038 config option
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
Cc: buildroot@buildroot.org, Chin Huat Ang <chinhuat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> I don't think we should add a BR2_UCLIBC_USE_TIME64 option. Instead,
> there is already a BR2_TIME_BITS_64, which enables 64-bit time_t for
> glibc. It simply needs to be extended to also allow enabling 64-bit
> time_t in uClibc.

I contemplated reusing BR2_TIME_BITS_64 but I noticed it has a
widespread impact of causing many packages to be configured with
-D_TIME_BITS=64 due to these in package/Makefile.in:

  ifeq ($(BR2_TIME_BITS_64),y)                                                                                                                                                                                
  TARGET_CPPFLAGS += -D_TIME_BITS=64                                                                                                                                                                          
  endif                                                                                                                                                                                                       
  TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)                                                                                              
  TARGET_CXXFLAGS = $(TARGET_CFLAGS)  
  ...
  TARGET_CONFIGURE_OPTS = \                                                                                                                                                                                   
  ...
          CPPFLAGS="$(TARGET_CPPFLAGS)" \                                                                                                                                                                     
          CFLAGS="$(TARGET_CFLAGS)" \                                                                                                                                                                         
          CXXFLAGS="$(TARGET_CXXFLAGS)" \ 
  ...

I wasn't sure if this is the right thing to do but at the very least
whenever uClib is used, my intention was to only configure itself with
UCLIBC_USE_TIME64.

Assuming if BR2_TIME_BITS_64 applies to both glibc and uClibc, should
-D_TIME_BITS=64 only be appended to glibc GLIBC_EXTRA_CFLAGS?

> Also, can I suggest that you split your change into two commits? One
> bumping uClibc to 1.0.47, and one making it possible to configure it
> with 64-bit time_t?

That's a good idea, I guess I was too focused on trying out uClib's
Y2038 solution. I'll split the patch up as you suggested. 

--Chin Huat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
