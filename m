Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D66C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 20:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E2D60B9F;
	Thu, 17 Mar 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GH7wTSRWtg9; Thu, 17 Mar 2022 20:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C4460B0E;
	Thu, 17 Mar 2022 20:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67FBC1BF40B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53ABA418FB
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjCFJd7py_Oj for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 20:39:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7DFB418F8
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 20:39:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y22so8017810eds.2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bhO6BhtHKIMMKZOdE6qh5Lxk96FhzQUxEp2fMCo1L+E=;
 b=PZ/3IF4psqgWUexGr2+zTmznj+tDPpZwqs942yQHJ8RUNmD9NENgg2VmrmpSFlkpkk
 pLQO5YBwG4KBRaYDBrbBQf0MPkz3FmDUe3XNBDc5107bkFvwMaseQEfzFO+Azwq90dIh
 kyHsFAOlmQEo11IlReojA25YIwEav+NyobRaKVUDBQy81NU4W19YS3S3Int3BeJwgiPR
 QyHrjMdWkVuz4kLTuMZtUA8PHNX02M/eXbp3oH8RHOdO19yE5iTUZefALeMii2KJ5B2Q
 AZSU9XJx6SJ9PUVEPL8ihBoW5d24DyZYBdOs5Qjmw1m8X765N2y9i+/kb9Mb0wqrLZUK
 +Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bhO6BhtHKIMMKZOdE6qh5Lxk96FhzQUxEp2fMCo1L+E=;
 b=Z2sD4PLRZo/6IKQz8sKPwWcekxWbL3y/hjCu5TuNZ868Qcno/xsl2aD2UzTozYBTLB
 DbHvf42dtqhegqs08ZJhCQ8cvQp9UdjgddBfxzeMUssKxzYryAOm8isSz8PvGjsnUC+M
 SHCZa/IVYeYO6I7iqjElQ6iLNW0x6ByeBtplyo4VQ7l/wklW9XCWQQa5KUAlTvQCYHFi
 ESXtzp123niTBuwraP+VA6rzamuDdrDEwURhLLnJEwPJhtSC/7rV90bbk0QqCTfGhExD
 e38C33e08AvmYnuRdj1g6/cNMlkScWhpTDc64ouf7gokudWdxAHq/SIktXDeVCwSVVgc
 fe4A==
X-Gm-Message-State: AOAM530yn+dlijMaekpdK0jZNO6bFBi60hYKFiAi+TkyqoVqO0mCqpON
 CBrqh4mE2DESk30aEyE7vZEV5Q==
X-Google-Smtp-Source: ABdhPJzHlCgeaG/OvQZEZTa1JLTFhQUnm35KREIbVWJ4ONflKyUubFKP5HjMvocflO4vmgLHOVcMzQ==
X-Received: by 2002:a50:da89:0:b0:413:adb1:cf83 with SMTP id
 q9-20020a50da89000000b00413adb1cf83mr6326409edj.158.1647549556526; 
 Thu, 17 Mar 2022 13:39:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm2872307ejj.142.2022.03.17.13.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 13:39:15 -0700 (PDT)
Message-ID: <49a4511f-7111-5065-c04e-513426eab73d@mind.be>
Date: Thu, 17 Mar 2022 21:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <20220309142913.2102898-1-foss+buildroot@0leil.net>
 <e47e01eb-0992-20ba-130e-f53df351c1c9@mind.be>
 <20220310215914.3d26c317@gmx.net>
 <639cd3a7-bcdc-4720-e587-bc22b431bb2e@theobroma-systems.com>
 <008dcac4-aa59-0311-9e86-fef7bc80cdca@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <008dcac4-aa59-0311-9e86-fef7bc80cdca@theobroma-systems.com>
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5base: fix CVE-2022-25255
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2022 17:40, Quentin Schulz wrote:
> Hi all,
> 
> Please ignore this patch because it is superseded by:
> http://lists.busybox.net/pipermail/buildroot/2022-March/638898.html

  Instead of replying to the list, it's nicer if you create an account on 
patchwork [1] and update the patch state to Superseded yourself.

  Also, in the future please add the version in the subject of the new patch 
(series) using the -v2 option to git format-patch, and add a patch changelog 
below the --- line. See [2].


  Regards,
  Arnout

[1] https://patchwork.ozlabs.org/project/buildroot/list/
[2] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog


> 
> Thanks,
> Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
