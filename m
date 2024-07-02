Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85879C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5622C811AB;
	Tue,  2 Jul 2024 07:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Pnw25m-gGQQ; Tue,  2 Jul 2024 07:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B9D1810CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9D1810CD;
	Tue,  2 Jul 2024 07:04:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D42E1BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54F37810CD
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqrqUBlBnc0b for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3462880F86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3462880F86
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3462880F86
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:04:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4256788e13bso27686785e9.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903882; x=1720508682;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Mh0es0XbImP59po95RFzAqHFnWhq0QYjUuMjppjBdE=;
 b=BXIGuZqItB8wUwHPbZ1sboC75hkDh7ElTXNDRVuIJm3bMiuQO5olE0nI0JiAT1CcWp
 7fCZj8nGFfDUfWULbT0mI8LdlFeHVA3pMbrwgmDGpZmi+MAkTPLB3wALkIi2/0OdD/XJ
 Q6yVRMR8xgt43BzPpTN3PH5qpa7V/2wOdQk6MIoas4Fh+XQRVu0X36jWyJdtqNwV7UGr
 dtOz8CY+zzj4Rrk5+V11S4tbGAGVPTdRiX1WFtV1OrEb5e54SZLOKEPrl1sArCw7GBuB
 0Kn4+rM/v5HtSYipL3mMhGlQe3fOUIMpHF1mH+3b0ZJM6itBR3xOr3f7ONLSMB///tTZ
 yOog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYnCxu4TMlvEZsfcPa4AVgHgZzvnbJFS0uRZ5+DCaCB07sQ5gLAWmkeY4PMJezXE6Gd8eu1D23xU8gb1jHpCsum3GOBXLANg==
X-Gm-Message-State: AOJu0Yxxkv8L10aybLyq56HDHGuEPoHgfM1bOz/wUn5KxHGuRa1F1+Ys
 sERn+YRWsJ3EnR81StboBom5KsymEobOSjtCgEH1KezkkgxzqVQTqBGpyCkO9gKl0Y1tTqXq6Pn
 y
X-Google-Smtp-Source: AGHT+IGvZHapTG0fcKVHN4eY4AmzMDKspchRoA7vImlzuSemhSj2QR2G9tJYyYWw+SNz1DPvzkv/iQ==
X-Received: by 2002:a05:600c:4fc5:b0:424:9477:ba19 with SMTP id
 5b1f17b1804b1-42579ff2decmr66494805e9.0.1719903882404; 
 Tue, 02 Jul 2024 00:04:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09abbfsm183838985e9.35.2024.07.02.00.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:04:41 -0700 (PDT)
Message-ID: <4f8ddf8b-e0fc-4cb4-90e2-8006d790fbd4@mind.be>
Date: Tue, 2 Jul 2024 09:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701181057.1736031-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701181057.1736031-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903882; x=1720508682; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Mh0es0XbImP59po95RFzAqHFnWhq0QYjUuMjppjBdE=;
 b=XFDGt/iti/FNmoDDhxsojuv0IXnjUNtPqb70lG0iNk/QguFyjQSZBuaclgGrlnvxn+
 paNqO63EYAbp9vjAfUnR2bgCqRGDNbhCfct5TTnGl+v1c6XsRXv2DbbsQ7wEzdQjwZKn
 +vyOCKZb8TYg9SbYT0quDvmkyVotBQt4o5nZT+lPFmqyogA2iFQJYgzrddtmsU3wbbpf
 MpwtozFhUAufS3clAMKynUwgw0WWCk21X01B67aJwoAg3uFiOwX9aCwXgoqNplU2wSH3
 mtbHuH+HA0mX93309WhiL6lSVGOaOWIUMaz8WT05YxaJeEOouu8IbRpap+jEen20Vweg
 S3gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XFDGt/it
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to
 version 0.20.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:10, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
>   package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
> index e06061346c..52c78a7630 100644
> --- a/package/python-aiosqlite/python-aiosqlite.hash
> +++ b/package/python-aiosqlite/python-aiosqlite.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
> -md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
> -sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
> +md5  22620fe09bc9d9df3bffef19919eed7f  aiosqlite-0.20.0.tar.gz
> +sha256  6d35c8c256637f4672f843c31021464090805bf925385ac39473fb16eaaca3d7  aiosqlite-0.20.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
> diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
> index e513d53c02..a48d676c69 100644
> --- a/package/python-aiosqlite/python-aiosqlite.mk
> +++ b/package/python-aiosqlite/python-aiosqlite.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOSQLITE_VERSION = 0.19.0
> +PYTHON_AIOSQLITE_VERSION = 0.20.0
>   PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
> -PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
> +PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/0d/3a/22ff5415bf4d296c1e92b07fd746ad42c96781f13295a074d58e77747848
>   PYTHON_AIOSQLITE_SETUP_TYPE = flit
>   PYTHON_AIOSQLITE_LICENSE = MIT
>   PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
