Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16209C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC7460B5D;
	Sun, 13 Feb 2022 15:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwbnQfO74XZE; Sun, 13 Feb 2022 15:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0046E60AC0;
	Sun, 13 Feb 2022 15:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1A041BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90DEE402F3
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGDiea0HEkrz for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDA4B40214
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:25:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w10so4998634edd.11
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qIwc6saSmPv9P6H7FsLlraPphrGlheQRn3jPGGFjlnA=;
 b=cOoKVjE6Qrhk/YB/SCKfCZS0Sd2TY2f6cx75GFSSjpl8YXtO0tur/YR1MdC6QjMwJN
 3ygEHwQHrxVfPXKdkzFzbt9UdltGXt5yhIgnilkAtxLSk5lctbi2TgXCr6rCoa27ji0z
 35JVoO2N5J617gvI//Tx03KOd+AZ3e9v+pY/MQQNQrRCamgo7tY3NkX4BWUvsbevCZxQ
 75desxNogs+O2y4Q5HHKycnhCR05eDL05NX1ZguR+LBFEOEX0V6ceYIkUNry8ZrJoo1B
 t6n0NKVrMv4JBGgDyUG++kyK8Nb+kTi+5MBOHrYmogbGbRS4bThaomAVfRbh0zlhZYwN
 ydTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qIwc6saSmPv9P6H7FsLlraPphrGlheQRn3jPGGFjlnA=;
 b=OKSttVA1Q/GgbNrg29oUd5pkBYEG9JNKSSOQBZ/SCuOZ6ylJ43q/b7lS7qn1SPZWna
 d+tFVlLGt+O+tjJ+x3aoJ3fG/38Uy7UGqqGexITQCdQcLP+gQBUy3nx6dKYPlZMzEF7h
 hvBhanStoX0uvs7DfGRrQ8aFyXMBeDPFdnJAN1Uo/96kpVPcW8rvRkLd6FV0zZWFwbrx
 tPL7g24GR4D4UeAHTgUArgIx42RVEzNi+kOrIEx/LhX2e2Qv3GdjflpngPrnNe2C2fUs
 x4LcOO5Mkaxcw3Pot5Edqdp0tgm1GcIBa4x/yq/8+oJUiJVJUoZhrzASqKBHepRV+OCm
 ZCgg==
X-Gm-Message-State: AOAM532twUmdTHnwfDTxvchmgYETJK7yiYWIKAfZl5HLGT6Hqv2LWTBA
 ky+ahG1UQa1Bo7zd62q+HkyYRY7YI4KXCQ==
X-Google-Smtp-Source: ABdhPJwetqAu3cfhFIgeVwQaZyXnANLXF+MkcOIlSouULo4VBwIAyrOzQmTWsN17oQMeoLSza36xWg==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr10752387edf.299.1644765908283; 
 Sun, 13 Feb 2022 07:25:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c24sm1272751ejj.60.2022.02.13.07.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:25:07 -0800 (PST)
Message-ID: <54fda3e6-1188-f104-4c6d-f1686df77bcd@mind.be>
Date: Sun, 13 Feb 2022 16:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206095403.1563814-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206095403.1563814-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] docs/manual: fix "+size = +" latex
 formatting
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 10:54, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Not sure why you say "latex formatting", but OK.
  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/writing-rules.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index 3eec095d0e..06f87556ed 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -184,7 +184,7 @@ image sdimage.img {
>   * Every node(+section+, +partition+, +file+, +subnode+) must have an open
>     curly bracket on the same line of the node's name, while the closing one
>     must be on a newline and after it a newline must be added except for the
> -  last one node. Same goes for its option, for example option +size = +.
> +  last one node. Same goes for its option, for example option +size+ +=+.
>   
>   * Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
>     assignment one space from it and one space from the value specified.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
