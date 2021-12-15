Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EC9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAF52831A7;
	Wed, 15 Dec 2021 22:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EU116TBt915; Wed, 15 Dec 2021 22:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571AB8316F;
	Wed, 15 Dec 2021 22:13:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 052E11BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D3A83163
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eg_XjV5usZN5 for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C4DC8316F
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:13:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso532602wmi.0
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 14:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=cMdP1O4uR4a6iB8AdssH09kSvFWJta1LcBfUdigsw2k=;
 b=MmcvvoqfDM9QtPVGvhZgHIGub9IlHJevZMFGIVpDGQxT6MdNDj/jUOop79rXq+JiB/
 wDl5cQyGKEBe4xEl/D36isl7pzlt6R0jEhX1aayTTZZM7p2c3EB9b+k6+zx0lJU5ShEK
 t615jHR84iwFXFNESrgyHR+p2TyCLc9mA2P4DcgplS12ua0VbADKzLSjRQldRVsYvV85
 8/L7FULEv71TnS2kkeOm02Nyz3b+xx8Htuz5Miqg4lmHRVRcCqwxn9cWjqno32GSnHU7
 hS74qflFJPl/5kn8WK/tA4OevsVh+ImtetAV5EhN4q4HBXvWQxKWCL7hE3dU5TKJY1My
 KXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=cMdP1O4uR4a6iB8AdssH09kSvFWJta1LcBfUdigsw2k=;
 b=EdG5LBQGXZbrt6gByZDPqjikYTfXnuh0LUdd8tQE6WKKGc4aM8+TsLpv5aGFEn/+VA
 EfRMG8wgbfxpED7R3+H2/OH0GnZ3hGH+hGQAfnCDBe0/SyKNySEd8eMUXmQ4tMxMoe/Y
 ayDfPFHjA4PEakVxDB9WIXeP/pCXN/lxhEfhGkj0vb6lgOstwg4RzHlrFvn4m7CVO5Vf
 OlR0FoIv8X9yVCWgIjC3d4rxzvnYcxwVmYh1pN20pcVOLkrOEW1nCAo/syDcTFI8lezP
 x41y4ZT8gpdFjnP7MqEig0c2cbUjLewpbODScIWjqFtIAWFv35VvDMNHk0z0HKUyC2ZG
 OCzg==
X-Gm-Message-State: AOAM530B+MtfavqF+vf3g2LyqrYN3c8cczrIReFVWg1vJtprlD9B0Efk
 XQL+/kkZm7E1MJXUTLR/WMniG/l1R0dMug==
X-Google-Smtp-Source: ABdhPJymG+iGzMqJMmOx5YoS23Uy0BkUgrdYgRzAxQCarv6XmBykIX/Iyk5+H9+Io5N7Mvth229iqg==
X-Received: by 2002:a1c:9ac2:: with SMTP id c185mr2153343wme.134.1639606422616; 
 Wed, 15 Dec 2021 14:13:42 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id h5sm2649654wrz.63.2021.12.15.14.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:13:42 -0800 (PST)
Date: Wed, 15 Dec 2021 23:13:39 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Ybpok3UBTfQFi1XM@pevik>
References: <20211215184938.21026-1-petr.vorel@gmail.com>
 <CAPi7W80xRfx+3L2h_4s=73=n7rw5tjizLSn1bWojL8yyQZZ9gA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W80xRfx+3L2h_4s=73=n7rw5tjizLSn1bWojL8yyQZZ9gA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/iputils: bump version to
 20211215
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

...
> > -config BR2_PACKAGE_IPUTILS_TFTPD
> > -       bool "tftpd"
> > -       help
> > -         Installs tftpd.
> > -
> A BR2_PACKAGE_IPUTILS_TFTPD entry should be added to Config.in.legacy.
Thanks! Implemented in v2, for both commits.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
