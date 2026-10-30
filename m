Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D6606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iF2DhBCX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAB9813C6;
	Fri, 30 Oct 2026 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkvePHP4AxQl; Fri, 30 Oct 2026 15:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C78B881654
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374040;
	b=VenKiIYE541FaqUflkZec5ZI11E/LwTZzn+fCMn8xdG0koxwXtgDWPXLe6Eid8d1mDOJ
	 NQeX4XaZgg5C7Ro9iBm9s00R7bfE+wecReu8P2WP3KXA4sPvckdgl6IMHiimeGtyZpIkS
	 w9QfweLq5fSd3smaeFfwS90c5X7h8n0JqwVMkw3DWd9T2+bpm5Db+NyfjPZfB/BoNWxXq
	 km6zWGWVEc46ezZnTRSPO8g9oAX4NXxvU1sEo0PAII7Ppo2iySjTOtH2OYm9irwUIAHmo
	 NEM0+NtvT22MEUp8uhy7Vdl+66E4nVqD5WDSY31rsVxUiE7/6p4HuJ7Cp0yDDjQjhdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nMPyVLIWayekgNq1z4D9sTUTe9DK7AL66iK155UWtAw=;
	b=rxlpXh1Wk9J/hX6wROufKQQOKVS+GPAULSrHRGCpxbtdq9G9E5lyZL0UFnn9Sx33SOuN
	 GHzofLdzGn1I1lqXpu0IGRrBp73ZAp+pyGFzOjyAv6l0a0rE04zFNi2isBHGykW8GSsDL
	 i8T8nAMLZV7WeNO75CwcBqCiFal6qSglYcTizEchDMSVCvQSLS4nK4e27m/2QPcOTOx5s
	 Z6eSN9aD8BAdysf78QGZz+0A6AcXMnbWbu5KWgIahqVXPcykfrH+4tfT6TGKLF4KeE1r7
	 EMTOB2zaoZN4ImhQwx6efiLMxw6p1YfszItqehA/so0FZOIfLHjLOaTih5Xqg5wV+vA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374040;
	bh=nMPyVLIWayekgNq1z4D9sTUTe9DK7AL66iK155UWtAw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iF2DhBCXykS/BCWFX2x8cS075s31VJnIY4D8YveOOsGcZJM3lgdHap44/nKHc/3gX
	 Kn7+Aki+Ug/cYNoot9i5mzIj6Lt3fI94cgJUSSlrgg1AQtDRZ0s17vwlne6GxsloID
	 P4/qneAYgVE9jiR/EeV9KrV1GatyabYU64hMXOEZ4mok5uzBt0BspyPIAVdStBbg0j
	 B1jcXB/A4S9PLk8YbeYPWw3XMy2CwNCyIkka+XVDb6tllXvZ2pvGtOydMchDU1Fyx3
	 KZwoWfGC98gFOA/ZWXev/tHtyTEqdz49WZsi8rgKbK/3wWo+KTaD/hjw7abyihJcax
	 8C+OL/IkFqDGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78B881654;
	Fri, 30 Oct 2026 15:27:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A4F3AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A86681509
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkBur-07O0Vp for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31753814C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374015;
 b=hA8Z2iStjlUSeq1bOpVbxXdOmwvR5bUqz+QbQgbtFMh3wcTnt4jyRi63I/oqzfXVXiWW
 B6ttohD/oUVi/p0s+pFbAOd4kVwNRDdWXAYa5tSU2KzM5C2+fnhOSlAh10ua283RnZNyb
 2m22vL0MaxogAVptiPIt8fTQI6qrDiHBQaiXzxVUJgTYAZ/RoaSV227irLO+16h4C/dMq
 JdIvD3GjaOmFjINIg076QjmYRESRxI5eq7oUbKBuBHmh//FmtV7JhLROEq4qjLibW+ubf
 TNw59suO6r5FnpUqnUvW4OB0ZePSTyHluwW4sQXrp71FnV4lY1BhNXBprGyuJWjGOYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374015;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=50fxAbyKDlZlssb+vC1Xb9QQTlR9OrbHgfB82JWZW+c=;
 b=JzzFbGIAcevlCskdgJsxg2PNvloS3xMJvtm4dUkCo+bjWaA3pNvq/fvNLFV6/f83qj21
 z2VBYQfrhbSAXFxPe2NC6Jsk4yQ1Ny/V/ku0j9z37bBKyhHK+iJcXa+XBzjUrQ1Qt7JJ7
 hc7I7zs/GaX6XN9ol4K/naCl+RdhQ8sTOjhQAqWh4uiMUn6HzDGuyyeLzt4OPKxXL3ne0
 TCE5xEYuuI+9kjlcoDm0gT6VCLf0OPnTuZX+CdexOXT+Aq8YTG7DPiW7Aexhqt9oJV2Qu
 WItG89NPtnRpO8AO+8n/grFRIQsgujL6WYphsTh0Lly4ut9jCfA4H5reEAoK81rimAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bzBglYW5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31753814C9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8714295e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374013; x=1793978813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=50fxAbyKDlZlssb+vC1Xb9QQTlR9OrbHgfB82JWZW+c=;
 b=vUqqCZdX1pRSjsDT4UPQH6K8TKy/fwsxIyTB89i65HL7iGearfFyXusjs3sIbO/hki
 TBQiY+pWDENbq/zDspbXHSfL2j+yJAlBW/7tECcs9LhlHRncR4Z5KBxs7uFHKP3tYfF1
 flj196Q3CoONthgvpscPvZCt11yXge6U0dzUg1cwdG3f8z4bSCWyo2CGbbOmQEYDd0S6
 VtBoepgDdEahBAuv9K504DSLZCCQDKEIlSBsOuWYuS1reJhPSdniEDJegWBn922wvIzd
 dCuWBwCHe2e75NPxzEMB0Oo7eeQIFo07WzpJqEA5kdX6ucfkH6oFasUngVQ7i6/aSDJD
 GX5g==
X-Gm-Message-State: AFq9FYLUj1zuDy0VLZ9T1LhnQd17KWLzgNpo/3swgdYyAf5mA9g3uaAv
 j3bdVSAmUtiBqgVHwvX2+S5p7HVil2bcG7ivBLQSHQ/BV/L8nQzg8BCGIRYaG+iYLrFtrxKQUbX
 1oOP9LFk=
X-Gm-Gg: AYBFou1T0UtncXcBUqP5aL4azcVHhPSPvGO6otgUvpnM5EyDHnXJX3CGt2N9B2KvVIq
 HoVOx337SJ4NpKuOFdusYeowiXxbAUhTvLTKtAAtEw+u+oVEtrlakVc8lVK4ckKNxDZkcD+SvvO
 gW0YGEwgyirpsgLnDQRj1sdenOyKAW/oDdlU6/LtjdGAQZksluODUhQAH9IZT/dYFS61IN28zdl
 BZt5j7B8WBrMVX5KJwqfnA/ibRwH28UEc058jKri/esFtzO/r1QuZgO5aWLoTbCS6VMyoqDtZsK
 wSLm68JpEyOgqnOt8aZWgUB81MEskR6I7ILGVJJfWmM50dF/uh83c3xxY0hPNYyHt2kX4dePnYi
 WAyrysF4XXLo6mHPZtS4Rehyx48M6xKfIkx0BTOTV3aYWWdA0sK5TL3Mh4tgJV4dkI5v7o9C9Dk
 XfTNhRbdbdAjv1EAFL89E+jvWI6ICNwEy2ZNuSlbudTViqnV7XX9lPlNA1TX2SF8Ed97hVSC0zR
 1FTCBUY9omyWxFFbUOyoJYS3qK3lBs2jtkGfwb5RIMuRlFM3pXfvJksUCxi7DityqVS02+na2Vd
 yyudrM4zk1pwwE2NFSx4tsf6yeR09hTONLaEApiKEb22oPYZUQQGEi+HFPS85TpSKGg+5y6+
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id
 5b1f17b1804b1-4ac17e10ac3mr61467365e9.19.1793374013069; 
 Fri, 30 Oct 2026 08:26:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm3648137f8f.22.2026.10.30.08.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:52 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:50 +0100
Message-ID: <20261030152652.1906422-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] utils/genrandconfig: add missing newline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The line:
> 
>   configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
> 
> would fail with:
> 
> Traceback (most recent call last):
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 650, in <module>
>     ret = asyncio.run(gen_config(args))
>   File "/usr/lib64/python3.14/asyncio/runners.py", line 205, in run
>     return runner.run(main)
>            ~~~~~~~~~~^^^^^^
>   File "/usr/lib64/python3.14/asyncio/runners.py", line 128, in run
>     return self._loop.run_until_complete(task)
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^
>   File "/usr/lib64/python3.14/asyncio/base_events.py", line 720, in run_until_complete
>     return future.result()
>            ~~~~~~~~~~~~~^^
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 556, in gen_config
>     if await fixup_config(sysinfo, configfile):
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 255, in fixup_config
>     configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
>     ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ValueError: list.remove(x): x not in list
> 
> because all configlines end with a newline, so this needs to be fixed
> to:
> 
>   configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
> 
> Fixes: b07d21ab984d10cbabeb186fbd47d446e027c03b ("utils/genrandconfig: handle BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/genrandconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 8437d6342d..597602f257 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -252,7 +252,7 @@ async def fixup_config(sysinfo, configfile):
>  
>      if 'BR2_LINUX_KERNEL=y\n' in configlines and \
>         'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
> -        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
> +        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
>  
>      if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
>         'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
