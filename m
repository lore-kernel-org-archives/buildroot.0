Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F2DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92218408F7;
	Thu, 25 Nov 2021 12:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNovOKO910ge; Thu, 25 Nov 2021 12:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91094037D;
	Thu, 25 Nov 2021 12:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E43331BF3CC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39D782443
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXZnUYtFqxB0 for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:26:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18E4B8239A
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:26:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s13so11293163wrb.3
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=En7UwdaymBzq2f4PWHuCSuWfUWUgXKLKqs/0G+v2+WA=;
 b=DVnyS5ediHqSoWmEwss7pxDvvZM/o5mjn43zkG9Ao/Zd/aRpLYeTgLc5a4YpjanloJ
 mk5mnRmP97fbx08dtyZGMlVrgekSA3yCdc8EsYzsaFUB0p4NeCvCdBxonSWKdniBqa17
 czeXBwrvKSs7P5G54TdKfREfqSHUgQkU1PoVmTR4hJz7bYpO72lMkJyvTm2/hTDMbU6h
 ffujEBeTGEIP9jLwqB5Fz1QyeAxd7CpWmjiBDNpyo1t9Uv8b55b79u7njNPzOU2nOX+l
 n97Kv9LGcku10mKt2OOWLfXJ9KK22pS2UEgeGz/QHGKAsntxi0DCncxXb/KlsyCO7vg5
 afIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=En7UwdaymBzq2f4PWHuCSuWfUWUgXKLKqs/0G+v2+WA=;
 b=QtOB+9Xoz/myj54DafBuFkFLajBfCReukY5z6zxYSfMc0zUqwhhVMiyYoyzxNEUFTK
 yOP8HJqtU9hLut4UbAmotcCF6cay5H2LUbr8VjYAdcf2sjQVZRV01jgMBYcY52pThTt3
 LLLEMed9mtnf5di7LuIDpiixmrklOE+7SLE74CgeCFWfhGvjr2ugShSknjHKa80RdmA+
 EH5VkipzmBtEodrVRVf6eS9w2Kk2MKI/NrWuvrhdyv2jndsyQSpVQOfjA0F8/OYf/yS7
 KJl0sxk67UzbfdAWAAPRzF7/ax9CZShi7v2h70iqTK3guubKpHQi2JnUtvDN4YPQBMIl
 dFGA==
X-Gm-Message-State: AOAM530tvLj7S2vUQCs+l6TtHhLPlmziuXJA/UlCiWmUXXHy21ynFbG9
 RZ/G9M2sRySUatBNLVt3qAM=
X-Google-Smtp-Source: ABdhPJzJ0yx7QMUYaEgcAcUhOf5bXgpqHpcD8XzkwNsl/8ChICy9/+VaWChvAJ4Fr09x5RWjebHljA==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr5875302wru.547.1637843171150; 
 Thu, 25 Nov 2021 04:26:11 -0800 (PST)
Received: from camb691.localdomain (bilbo.ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id ay29sm2606167wmb.44.2021.11.25.04.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:26:10 -0800 (PST)
Date: Thu, 25 Nov 2021 12:25:56 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211125122556.7609ffbd@camb691.localdomain>
In-Reply-To: <20211124204127.493ffaa3@windsurf>
References: <20211124151827.1107e808@camb691.localdomain>
 <20211124204127.493ffaa3@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH] Handle _LICENSE_FILES with full path
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Nov 2021 20:41:27 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Cyril,
> 
> On Wed, 24 Nov 2021 15:18:27 +0000
> Cyril Bur <cyrilbur@gmail.com> wrote:
> 
> > legal-info currently assumes that a packages _LICENSE_FILES will be
> > a path or a filename relative to the source of the package.
> > 
> > There is nothing preventing _LICENSE_FILES from containing a full
> > path, probably using _PKGDIR within the package .mk file. When this
> > happens, the legal-info process simply adds the build directory on
> > the front of the _LICENSE_FILES resulting in a failed cp of the
> > file.
> > 
> > This patch simply performs a check to see if the _LICENSE_FILES path
> > with the build directory prepended exists (as is the case for all
> > packages currently) and uses that. Otherwise it will assume that
> > the _LICENSE_FILES file is a fullpath and attempt to use that.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>  
> 
> Could you clarify the use case with a specific example ?
> 

Hi Thomas,

Having reread that commit message it seems i'm out of practice (was
never very good to begin with). I'll send another and include a
concrete example.

Cyril

> Thanks!
> 
> Thoimas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
