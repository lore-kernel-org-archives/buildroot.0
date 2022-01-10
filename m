Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFA2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8247404DB;
	Mon, 10 Jan 2022 22:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACaxjmYaey2V; Mon, 10 Jan 2022 22:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F322E4063F;
	Mon, 10 Jan 2022 22:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 693EB1BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57F9860C18
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQkQW5bxtQox for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:43:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBC1E60C0C
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:43:15 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id c15so16191888qtc.4
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=GkrOhWgT4+j6J7C44yuewrxOmNXrGJXp7uIaP6MPoYM=;
 b=cIMfxApmz6CmEUnz69H32bmqnO/RcRP4xDelWXxL8cYxxxlfE48zTq6MUiiVLepjF2
 BPm63gLiYyt0Yi0EbAJPPIlay4vAZOZz6ODboPpYzfFA0bIo1/xGu+nxqThBUN98urQf
 Lln/2mIDeiLWA6KJPULyC4yxUk9C+q+eIG+/9cXmhZkET21AufLKaynkNEskCPEvg//s
 N8e6TPquGWUT/m88p0pC0q1d2ojGO4edD96jeTzu631Y0/trn/VuJS0trLTL5j16f1A9
 i3s+Py9htBLAgZgToGNE8Wc3GYmqfYPxRLmmD114oOL8OIZJof9KHgM5T9sAjkYQLZqE
 gXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=GkrOhWgT4+j6J7C44yuewrxOmNXrGJXp7uIaP6MPoYM=;
 b=0CYPTpH3b4nmf8YhFP4XOFMVAIr0vT7DMZBvLoc679S4bfjkze1+pTtPguTtRWJZXl
 15FSgVrGkK3aN4GhmyeFSQfK4wB7aM2DEI1r0V2u5mbX1HzzmHUKBG8kZE+jpqBRT9XP
 k81qlNGwnjpr6wmiFilAqduyVga93ev+fXTFmiDUP/cR0FtyjMFIU3gqwUq1CUt/Xa3J
 dVhs8cj9iweZkh9WDy6xyfDuLtxMcx5NyIqpjt19zJ129Axtzpj6LosXJM+20KMYlBID
 NLoYDuetwa0ERvJBTys24bof/K6a3RBlLVMOg+7VL1APVLkg0FT2rCabJJg+RsDgTRID
 4+7w==
X-Gm-Message-State: AOAM532UtjZsjYo6u6MdoubU2DWLPFVUA1LQAtVLDfqaoq+uf6YJOOkb
 MoGgxM+7vrQOmAzSQDypGYs=
X-Google-Smtp-Source: ABdhPJzFDokJaUS5AmS9ntXcS6MKhUeflYHJfsg7Udd5dSVoQV8qscf6irfij8tTCBeomh8cMKJXJg==
X-Received: by 2002:a05:622a:170a:: with SMTP id
 h10mr1597033qtk.497.1641854594698; 
 Mon, 10 Jan 2022 14:43:14 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id o5sm5665456qkp.132.2022.01.10.14.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 14:43:14 -0800 (PST)
Date: Mon, 10 Jan 2022 19:43:13 -0300
From: ricardo.martincoski@gmail.com
To: yann.morin.1998@free.fr
Message-ID: <61dcb681410a7_8fcfa78-19a@xultri.mail>
References: <20220110162319.294088-1-yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61dcb67fbb5e2_8fcfa78-240"; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH] support/download: drop support for the
 'none' hash
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_61dcb67fbb5e2_8fcfa78-240
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yann,

On Mon, Jan 10, 2022 at 01:23 PM, Yann E. MORIN wrote:

[snip]
> ---
>  docs/manual/adding-packages-directory.txt | 9 +--------
>  support/download/check-hash               | 4 ----
>  2 files changed, 1 insertion(+), 12 deletions(-)

Another file to change:
utils/checkpackagelib/lib_hash.py:        if htype == "none":

Regards,
Ricardo
----==_mimepart_61dcb67fbb5e2_8fcfa78-240
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61dcb67fbb5e2_8fcfa78-240--
