Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA31C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B2F60E7B;
	Mon,  5 Feb 2024 09:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B2F60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veZnmBaI7lkH; Mon,  5 Feb 2024 09:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B197760792;
	Mon,  5 Feb 2024 09:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B197760792
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBB551BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1F1340A70
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F1340A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-cZmInQihRA for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:36:16 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA21C40204
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA21C40204
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511490772f6so1394259e87.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 01:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707125773; x=1707730573;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j8MI53Cdp1KrdcruJUp9XUgvZXpJ2mlen9b6TmMPuCY=;
 b=gdjwqevdNSuvOm0FfKqF6wBWBHVxiM11OmfGBRyVKN/TO51WzputGAsfM1aH4Ty0PW
 4U69j7c8f7/jMpt3z23RuimPOe2BWiM6cnCQyRb2+X+Z2NZaT8Y4Jlw2h4JdNYrcPPPg
 +d9lUz8if/e017f8R/Q3cE5SVDiveFn12HvZaxV87hQTytnmSELfrJSZqPl/g5rTOTym
 cSsVYr1RbdnZuAr8iDXf/B7AvjRWYq/dAd3r1k097zhxgp6g3gzOD1aUWrS7DPLG0dn8
 hl+prdTqShljgsFT+kO1pVRVhUrUUtd7//cy7G/K75KZ5LYfVAfTTHSZrGQk/eJi1O2J
 s1JA==
X-Gm-Message-State: AOJu0YyjrJVqvDlDGHHJLa7TOo4PnRn6aXk55DSKX7Qx+SytNatCmYFC
 0hnBl/xNMoONTThu5sR7R+9Q8GAc37F7isor94eNsiT6sI7XpgIccNBAhtbb7Z92pozVyAFbCYK
 V
X-Google-Smtp-Source: AGHT+IFbhpL7uGkZuPT+Y81Nr9iNH7q7hzfKOd+ZJqEkbbVMWYOlmGgDrGi2KsjJFa364eDSOcQSAA==
X-Received: by 2002:a05:6512:3287:b0:511:4177:5089 with SMTP id
 p7-20020a056512328700b0051141775089mr3924156lfe.16.1707125772737; 
 Mon, 05 Feb 2024 01:36:12 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0040e541ddcb1sm8014801wms.33.2024.02.05.01.36.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:36:12 -0800 (PST)
Message-ID: <54778c37-172e-414c-a4f2-a15f691145d3@smile.fr>
Date: Mon, 5 Feb 2024 10:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <cover.1707060159.git.yann.morin.1998@free.fr>
 <d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707125773; x=1707730573;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8MI53Cdp1KrdcruJUp9XUgvZXpJ2mlen9b6TmMPuCY=;
 b=YIaKiEHJ/aOFSqxLwhu20Tb159Z0a8m2qp0eYs1uPKr5NXR5t9nDl0PRZLjsWLlvOE
 bi7Gxaei3p03dWpTVdudae9Vlhp0AxV2bs64wuwr4fkbVSYAqc3ch86wS5pQstonTA3+
 LBpVVGGKgqq5Y1/N9jsqtB5jLptBzpQgWEjiJrqNF+4iYzrNYSGJDbtc5QknMRMaAK9m
 KY68jXt6nZLA1DEZiAg66A8gDm5smqG6eolWQt+G9MuiPtxnj96GW5Udij90VsJpr2sq
 hjtd8spJJXrG+43SYsHeYu6nRzdzDUyxoDcEXqD1pb1COORFmplKxv2ilBK459EFrzLJ
 j+dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YIaKiEHJ
Subject: Re: [Buildroot] [PATCH 1/4] package/containerd: drop
 CONTAINERD_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============8044238676734867086=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============8044238676734867086==
Content-Type: multipart/alternative;
 boundary="------------0ucK6tidMjZlqiji1rMvTbBk"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0ucK6tidMjZlqiji1rMvTbBk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/02/2024 16:22, Yann E. MORIN wrote:
> From: Fabrice Fontaine<fontaine.fabrice@gmail.com>
>
> Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
> CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
> CONTAINERD_CPE_ID_PRODUCT will be set to the package name
> (i.e. containerd) by default
>
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN<yann.morin.1998@free.fr>
> ---
>   package/containerd/containerd.mk | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 61a8472ddd..d3ca102797 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
>   CONTAINERD_CPE_ID_VENDOR = linuxfoundation
> -CONTAINERD_CPE_ID_PRODUCT = containerd
>   
>   CONTAINERD_GOMOD = github.com/containerd/containerd
>   

Looks good to me.


Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr> 
<mailto:antoine.coutant@smile.fr>


Regards,

Antoine Coutant.


--------------0ucK6tidMjZlqiji1rMvTbBk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04/02/2024 16:22, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d49b322f135647c46b0a6ba3d077e11269dae161.1707060159.git.yann.morin.1998@free.fr">
      <pre class="moz-quote-pre" wrap="">From: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>

Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
CONTAINERD_CPE_ID_PRODUCT will be set to the package name
(i.e. containerd) by default

Signed-off-by: Fabrice Fontaine <a class="moz-txt-link-rfc2396E" href="mailto:fontaine.fabrice@gmail.com">&lt;fontaine.fabrice@gmail.com&gt;</a>
Signed-off-by: Yann E. MORIN <a class="moz-txt-link-rfc2396E" href="mailto:yann.morin.1998@free.fr">&lt;yann.morin.1998@free.fr&gt;</a>
---
 package/containerd/containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 61a8472ddd..d3ca102797 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
-CONTAINERD_CPE_ID_PRODUCT = containerd
 
 CONTAINERD_GOMOD = github.com/containerd/containerd
 
</pre>
    </blockquote>
    <p>Looks good to me.</p>
    <p><span><span class="il"><br>
        </span></span></p>
    <p><span><span class="il">Reviewed</span></span>-<span><span
          class="il">by</span></span>: <span class="il">Antoine</span>
      <span class="il">Coutant</span> <a
        href="mailto:antoine.coutant@smile.fr" target="_blank">&lt;<span
          class="il">antoine</span>.<span class="il">coutant</span>@smile.fr&gt;</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p><span class="il">Antoine</span> <span class="il">Coutant</span>.</p>
    <p></p>
    <br>
  </body>
</html>

--------------0ucK6tidMjZlqiji1rMvTbBk--

--===============8044238676734867086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8044238676734867086==--
