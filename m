Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A266C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB3C60AA5;
	Sat,  5 Feb 2022 22:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMKLCtPJJySA; Sat,  5 Feb 2022 22:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF7760806;
	Sat,  5 Feb 2022 22:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18D341BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D9E40889
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXgrstMUHxjy for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:52:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C8914087C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:52:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p15so30597982ejc.7
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hM5ld+YvAyvWx1Ug0rxGOP+89AAQFEh2UVQ6VEov1oA=;
 b=WNbBm6OFryTm+bXLjTSDwsb0yzwumZsw1ILwVLfcwZAcxrwOskGcFRR35F6mXA819n
 Mm1FgLv7dx1oALvHSs5tGKPKh7KUEPpm9fcznBlo/vVFF0Gg51Z0VloZOtF4ybRoKStC
 Ik9Ubsi7R9ghpP8M0dpvHGwJH9iYtDn8quJqPzOTDoVwbcPcgCIadClK06Vz3aJe7H/S
 hsq8uCu9JTCzgA2qOjZv0GjsFW08lDGpJdogg1acokQYs9MOuIhbeZla2pKT6YRcQewS
 YMjDzgF6Ubj0c7bhclwX/3PjEC5QU1QD5CnP3cEqOQPKy9QUSymddOZWTLrCqATVNPCz
 O82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hM5ld+YvAyvWx1Ug0rxGOP+89AAQFEh2UVQ6VEov1oA=;
 b=jnzXKaSjYYApmXLFi+e4R8JX3j6DhTQUxIGFFMy77/nTEwZtLKPHqN5O7zd1vPCwcu
 PwoR0Sd3N1lrwURHkCoskWmrpNYzp7WO4qNvx9jiPVS3ECh3vZuQ+Dc8iyCooSLp7Ue8
 rIe3/hNbQCqCmsuguyhktO6sCp3/hOKPGNvtex3RD3HQrEhWrO/ofVdbEvZo4HkgjkE0
 rbNL4QrphwkzN08Ypm54dBdTxse9bp+2SydVQaB/R1TAcROjuR6T4N/juR+yDPg6FFaA
 p8i35Cu5MN/0O4C92S5+14iwmpOkPSaW7ABCd20ugWZP5oW+ACoyZrXFmiKoYfL3R2WU
 MSaQ==
X-Gm-Message-State: AOAM532OZvpK+0l53PoHn/0txp0UnhykJ/z5HDki1/bOpTsOi6kOmCc1
 L3mLG4vXOAqEUAKmlf9s/jh1Ww==
X-Google-Smtp-Source: ABdhPJxRhca0FOM6oVch2I7NUDWvpe/xbaMW/NJdh+lzZVzgc8/QnRumiQguSGK0t9+kJYHYrR6VQQ==
X-Received: by 2002:a17:907:1c94:: with SMTP id
 nb20mr4592600ejc.144.1644101552381; 
 Sat, 05 Feb 2022 14:52:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b12sm2773916edw.91.2022.02.05.14.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:52:32 -0800 (PST)
Message-ID: <b463c1ac-8c10-4103-e585-bb848204e20d@mind.be>
Date: Sat, 5 Feb 2022 23:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220125213242.301404-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220125213242.301404-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sqliteschema: drop
 python-six dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 22:32, Fabrice Fontaine wrote:
> python-six is not a dependency since version 1.0.0 and
> https://github.com/thombashi/sqliteschema/commit/3aae6a0bb6d4b11ef2c83cb23a796a320ea422da
> which dropped python 2 support
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Peter, this one is for 2021.11.

  Regards,
  Arnout

> ---
>   package/python-sqliteschema/Config.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/python-sqliteschema/Config.in b/package/python-sqliteschema/Config.in
> index 8383647129..b8fed33c49 100644
> --- a/package/python-sqliteschema/Config.in
> +++ b/package/python-sqliteschema/Config.in
> @@ -1,9 +1,8 @@
>   config BR2_PACKAGE_PYTHON_SQLITESCHEMA
>   	bool "python-sqliteschema"
> -	depends on BR2_PACKAGE_PYTHON3 # python-mbstrdecoder
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>   	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
>   	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
