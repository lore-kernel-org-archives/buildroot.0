Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB19C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56DF81FAC;
	Sun,  3 Mar 2024 16:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKzNATDoHbpX; Sun,  3 Mar 2024 16:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0803E81FC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0803E81FC4;
	Sun,  3 Mar 2024 16:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0989B1BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB54581FC4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Cz3BLH53Apm for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF1EC81F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1EC81F6E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF1EC81F6E
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:47:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412e2f03358so1648475e9.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 08:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709484465; x=1710089265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mARH26itU/g5WhwkgxUpX2dki9uOWUj8fv/tlvmPLNM=;
 b=YChYTnNNZW68mUcNEcXirZeIgY5O3d8s67MOwSTWoP/ArhhGttx8/PC2QaaTN314Pt
 DBAkXUUk29C/4tBZf4QPkH9p+w1VdcU3qxppvolAd1NBLwZe1dKMMCKMrsoeeqzrprl8
 vKNGvORYmp6Sh939scFDh2xY83oPnqe5ShJMtL6u8NTB004LX+Zu9tIPUw2w6E+FmYYD
 PtMUlcC2i/1P2/cMbvKI2jLhGEcs5hU44T1F1wkuGj1qSODYQynX4N0ZvwhqmHWxiuTD
 EhDl7jizcM6vUw6T0QzPfmWvRa2qun3kPXM2bP9AYYlhGBNDuPQ4KkrU18BBQOfTUY35
 uLGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTZVvO+qZyGKguoSWBiv3aU9WMR5PH4VbQvbVA8efrxy3ZkNpXIrSlBQx/F+dPe+zJqPGHgSQxuKHHAZhNf1k8jMkGzxg1IA==
X-Gm-Message-State: AOJu0YyGdSTRWioEr+Zl/Us1buI2aqSFBDWSOfKOLr+uVaxRE99GhceS
 0/rQaZWHYh4MfbmxJDwpUbToV9OXE9oKlvlzkodSD7+mhWVuD0ZDp6l64iy5vDgqbCv7DIh0aLC
 4
X-Google-Smtp-Source: AGHT+IHUd44ItPUHyIWmrlHC1ORZeX4AHWJGuazNSWC1ZEwBpDF/5v0zp0uF55d/wfogbpBJtCBowA==
X-Received: by 2002:a05:600c:46d0:b0:410:8071:6931 with SMTP id
 q16-20020a05600c46d000b0041080716931mr5350174wmo.20.1709484464874; 
 Sun, 03 Mar 2024 08:47:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b00412e38ad377sm425458wmb.15.2024.03.03.08.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 08:47:44 -0800 (PST)
Message-ID: <463396e3-1936-4b23-85dd-589aaf0deb51@mind.be>
Date: Sun, 3 Mar 2024 17:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240211223046.1768519-1-ju.o@free.fr>
In-Reply-To: <20240211223046.1768519-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709484465; x=1710089265; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mARH26itU/g5WhwkgxUpX2dki9uOWUj8fv/tlvmPLNM=;
 b=gvwGHa+tBv8iDC1YEdeuAeLD43vsrAcSYlnoW7OM61NCPQhfN4HaPUyZ9hD7v1RS5Q
 dOlbvlB6hzSyS0AJwIXvbtzidpekidftPrFGCVm9F0ivfa4v4ntu6Wzbz2Rxb1YTiSkq
 DCxo7sT1dgUzNojhFt0BC4kEHC2OoO3iUuwXD/jFf8+/z1V+03cNUf8P/ScP4k+pUBHe
 i5Coun7IiK7d3CfLZzA0jd9cvua0mF1IRxw7dsr8rpxIYQ7qyrJznh5TMou042k6IXyp
 CzH4yn3WbgncQfrdovNssaUzmQZeK6VgvVjcCPL3voES5WdvbV88nTaMjIm1CUV+mO+r
 srqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gvwGHa+t
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: mdadm: improve test
 robustness on slow runners
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



On 11/02/2024 23:30, Julien Olivain wrote:
> As expected by Peter in [1], the hardcoded 3 seconds for waiting the
> RAID array to rebuild are not enough on slow test host runners. This
> test already failed at least once for that reason, in [2].
> 
> In order to fix those failures, this commit adds extra logic to allow
> several attempts, before failing. The timeout is currently set at 10
> attempts, waiting 3 seconds between each attempts. To help even more,
> those 3 seconds are also scaled with the timeout_multiplier.
> 
> Fixes: [2]
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-February/685034.html
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/6137469690
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/package/test_mdadm.py | 22 ++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
> index 75385309a6..d5abdb0706 100644
> --- a/support/testing/tests/package/test_mdadm.py
> +++ b/support/testing/tests/package/test_mdadm.py
> @@ -122,13 +122,21 @@ class TestMdadm(infra.basetest.BRTest):
>           # We add back this blank drive to the array.
>           self.assertRunOk(f"mdadm {md_dev} --add {failing_dev}")
>   
> -        # We wait few seconds to let the device rebuild.
> -        time.sleep(3)
> -
> -        # The array should no longer be marked as degraded.
> -        out, ret = self.emulator.run(monitor_cmd)
> -        self.assertEqual(ret, 0)
> -        self.assertNotIn("DegradedArray", "\n".join(out))
> +        # Device rebuild can take a variable amount of time, depending
> +        # on the load of the test controller host. So we will allow
> +        # several attempts, before failing.
> +        for attempt in range(10):
> +            # We wait few seconds to let the device rebuild.
> +            time.sleep(3 * self.timeout_multiplier)
> +
> +            # Once rebuilt, the array should no longer be marked as
> +            # degraded.
> +            out, ret = self.emulator.run(monitor_cmd)
> +            self.assertEqual(ret, 0)
> +            if "DegradedArray" not in "\n".join(out):
> +                break
> +        else:
> +            self.fail("Timeout while waiting for the array to rebuild.")
>   
>           # With all those array manipulations, the data file should not
>           # be corrupted. We should be able to recompute the same hash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
