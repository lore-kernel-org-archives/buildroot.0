Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82286C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E50860E43;
	Mon,  5 Feb 2024 13:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E50860E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSh46SFion0M; Mon,  5 Feb 2024 13:23:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 872F9607AA;
	Mon,  5 Feb 2024 13:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 872F9607AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8B21BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4552F80C97
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4552F80C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwsnmcE7uadX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:23:41 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7749980B44
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7749980B44
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b35323341so1059262f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139419; x=1707744219;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=808msWLxGvfsbh5AgdMQCUKAWahdzitlXjZyxnyRg4M=;
 b=JlD37p3P7SQNzKKqz5YZYc70Sg7CqNoy1ulUCktO9i9zHKDCLMvTqLi+EnRvEWTY7J
 XOuDJgAR+bxFB2BPzVJ8S+teJSaM9PEMpi52cONcp+bg80aL7egZKvXV+Kv+3GhLrdXT
 dRtqV6fSRM22lFT/vGXGYIlEiIiFowaPlHg0m8B8A0BKyJfIlKRNLDUs4zTRbR10smpn
 NzDEqxAhCuyfLyGXhxNqrnMz+gjrCBz0TpS25cKQCLiFCxMNQVUbDrvSWTRUSmFrMWjH
 /HknGT+qtrRryGY+/EEDPSAd7AxfEpN+UinSMNKEe+y8uzZ9ktjmIoNRIIMs54k08d4+
 Jcnw==
X-Gm-Message-State: AOJu0YyFuNnlxIVh2iWwcAIC/BPXWO2RSwuM5ES0ivv07AT24y9hYPZP
 Zd/OGvAyrZ/5XisPn0pwbZDgXNGZw1Yntp471ZfZKFlR1PRIXarMc3RpEwH/FnU=
X-Google-Smtp-Source: AGHT+IE1fXAR1igiqjsfFEv/hsLliaqu++MMqRMCo6lUtwsmdi+FCW2aSRPNpWdLXJdhgC+0OcNPTw==
X-Received: by 2002:adf:f24c:0:b0:33a:e6f4:d22f with SMTP id
 b12-20020adff24c000000b0033ae6f4d22fmr6445479wrp.13.1707139419509; 
 Mon, 05 Feb 2024 05:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUk46Fvne4xfAkx+sEm3frMZFEflgGXc09t7Gq9RWmsJ6a402b+CpRPq+8pZvphdnrXgAcf6sfDNupXxOSjEVZSwEX0XaZUdg==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:23:39 -0800 (PST)
Message-ID: <afc4d71e-4ae5-4450-a6b6-c905e36cb116@mind.be>
Date: Mon, 5 Feb 2024 14:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
References: <20240108071410.118585-1-egorenar@linux.ibm.com>
In-Reply-To: <20240108071410.118585-1-egorenar@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139419; x=1707744219; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=808msWLxGvfsbh5AgdMQCUKAWahdzitlXjZyxnyRg4M=;
 b=ZxO8McFTcIkTySKOTcY4AO0MuBFTBNZ0iyFKbuyvV5nQ2Dqgk+36zMTnMFMM84+nNa
 Ud20xGk22QO5Yh34ztjatEUXLAb62uWitQL860SIf7nTqLRnCM5G19o0db6YzyGkUvOp
 k3jZfwB7lpgV4Q87UULIbLyjaj0zFAsBQ722A3JP/q+ZwQnek5YArw1tr4oGFUKO/cNp
 zLltj0sLkg4IOSVH+USr7BcdcLfd10hon9YaE8v6o3faeTl8NzmVhyQv+QevSL7VbsG4
 XklbPYZWO4vQVPjPnKOWRtOUh0cq75jngEDkJzvjYtZLIJWxfD4QZUxidJB4BVbt+SdK
 vZQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZxO8McFT
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to
 2.30.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2024 08:14, Alexander Egorenkov wrote:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/s390-tools/s390-tools.hash | 2 +-
>   package/s390-tools/s390-tools.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
> index a00e95437b96..c70bf69f008c 100644
> --- a/package/s390-tools/s390-tools.hash
> +++ b/package/s390-tools/s390-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  849ff400dc6c1eb7eebe4aa3e7a4871721c25bcee6cfdd0535a056a038fd3ab0  s390-tools-2.29.0.tar.gz
> +sha256  9e565701cc6df4808243027706ee0a76c5fc0c7f9aae0afce1479fd4ff68bcdf  s390-tools-2.30.0.tar.gz
>   sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index c3155a13ff5a..bc39a9bd1970 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -S390_TOOLS_VERSION = 2.29.0
> +S390_TOOLS_VERSION = 2.30.0
>   S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
>   S390_TOOLS_LICENSE = MIT
>   S390_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
