Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EBBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E97416FD;
	Fri, 24 Dec 2021 22:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtZmEeICx3Ot; Fri, 24 Dec 2021 22:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A15A416F4;
	Fri, 24 Dec 2021 22:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98A7E1BF488
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 22:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8208E83E1E
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 22:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVoZdNGcX4mZ for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 22:19:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FCF883E19
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 22:19:04 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id q14so8497572qtx.10
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=QR5Y+9TPkLnH8w0h+R3DiKq4+MEqDDPzpbygx95K25E=;
 b=c+oDPjNxp5gMNAuUaw4BnSsmyE3E8tD75aU4CjppFq/q9vHK+8DRf3Ai312MMiv09X
 Ab+3DRXTNXb3o8RfY+h76bWYJgIujhD3VPxTEm8BqKiSSWcIO01UmErqNSdVWpcVNSrR
 krf8R8d+wQU48irAE4gcDSnAKikR7HdVU82RsTh2pL22uA9zN2G1rTi2YXvfCGjqtA2B
 ng122019jpyVsdVlOSh1DLZtWn7Kn9JGcdzvgYmjWwIw7J3l3kbTFK4olLwmNaEKS2HD
 FTOTLhffJpaTPCWl6P6vHededSZFgrI/A6lz3jT/ShVna2VKDglVygnZTDN6q+L1nJZr
 N8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=QR5Y+9TPkLnH8w0h+R3DiKq4+MEqDDPzpbygx95K25E=;
 b=iOqZVtcD6d+3AVxAbX2DjAyUTedTySn36AyN9waLuw/yHoURUCYKq/uBgHQmquZYCV
 gc6Be12jxU986kr4/pRkMIPfSC1SIx7Jr4VaWQPWdPCr/YeGNLH9mf8lmiRgsq0JcPIJ
 xoUmVt5RSitWZ/WHX2ZgbiS3mQ5puYON6bTHLHI2m+dmSiN9H9apqW33YfmAgKq/yzXf
 Ie9Hu22DJ/vLRs8HWPBcXDh5fp6fuRaKZRunEZCmjzCj/LrgVZfNJ35AlumfnUv8iJFL
 JFshN1LJ8nyKRgX40xXNRHbBOX30CnjmehmZQAUAfCpJSuJu7Q9UWLfv2sObl/EsdWua
 GC8w==
X-Gm-Message-State: AOAM5337yk/GzBEEdaCaGjZl6M/n9cx2QSOIAXc09yir09fGjp1P3sqF
 pjrfLC2J5Re60BERVitue6juCViB3Lc=
X-Google-Smtp-Source: ABdhPJxHFa4mNESQ6hSNqteggw52ngze2j2EntKpvKjs1El0AMPfRdxfP5VGcQ4erytIlSYQF3s8iA==
X-Received: by 2002:ac8:7caf:: with SMTP id z15mr7275158qtv.20.1640384343189; 
 Fri, 24 Dec 2021 14:19:03 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id 16sm7864447qty.2.2021.12.24.14.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 14:19:02 -0800 (PST)
Date: Fri, 24 Dec 2021 19:19:01 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: fontaine.fabrice@gmail.com
Message-ID: <61c64755a49c5_37de1aa14-379@xultri.mail>
References: <20211221123406.22392-1-fontaine.fabrice@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61c64753f00ff_37de1aa14-4b3";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.7.0
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


----==_mimepart_61c64753f00ff_37de1aa14-4b3
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Dec 21, 2021 at 09:34 AM, Fabrice Fontaine wrote:

> Drop patches (already in version)
> 
> https://www.atoptool.nl/downloadatop.php
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[test-pkg and runtime test:
 https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/435387627]
Tested-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

Regards,
Ricardo
----==_mimepart_61c64753f00ff_37de1aa14-4b3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61c64753f00ff_37de1aa14-4b3--
