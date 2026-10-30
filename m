Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A61606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YZCImeSC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D03812C6;
	Fri, 30 Oct 2026 15:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zz05ezxJ3RqA; Fri, 30 Oct 2026 15:25:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1AC93812AF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373948;
	b=DKW4lDUiksx+zm2CClAqs4zYIp745umAGPpV5f8cSy52A+wHOhslmqXkkaxKqgul6khy
	 t7kfp/FJkY7C4UflRFsthRjzWLWZRRzHiQgucr4gvscmKcCmrFVa6CByiYqehaEShM1Lv
	 akEkYlobVRb4LPkxVThbh4PjZ3bL9+2zL1le93ZcILV75UlLcEFccC7S50mK9UoBEkA5r
	 YhbkaxVW9H5TcZ57vP9rtjTHGejCERTjpGSAsApTC1hYXbcA/6RT0vD4zu5IBE3DElkk9
	 i0uQk0CKJVKwEx6upAjGwuHyqGShEsESszEavwk0FvcRKKJjIP6V2NWxDgowBSbD06w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rKPL/gzi1YYxfU3hJ/+os6yRqhBtqGZWc+X7xQlMny8=;
	b=IVdh1GHcqfG9uo2xkEYV+veAxhNVAPh2rVTqG5k81fJoBFBzE9b9xvfWqpagYObJCmn4
	 mrByc9rontwL2sGpO0ykAnDeRJv8/VNuaum+AGD13eXZla7XuFdvpP+hIPmBzlIxLgZ+D
	 S1MZCduw3yT/5wVv5DPVabsa0rNzmflcXQk+nucq87jmIki6jcxXDctmVaf25wK0LC4yK
	 SC9IuAtRO2Zu3Gekz8nNlEs+8WD8pxtezwBuFvTE0R+L0agaCSdVjaBfMYVRD3lrWaBAu
	 P7f74depDSEToI5EPiuNGQoFQBSLYT0H4YNNd/JeiFzY7Y/eLmbKYSdaa59uUP6uGhg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373948;
	bh=rKPL/gzi1YYxfU3hJ/+os6yRqhBtqGZWc+X7xQlMny8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YZCImeSCD5c5WGMlXlipjS1li7RSat/XjUugvkEJUMvWfXHXTBS2IjB+0UBYhJ5qU
	 jHgf7NNi7cXP0r/mvkfFUQ0QbLCtEZhhk5WoMBxh2nu758y59WN4PTXyUAWYwyYAvE
	 7D1Cj+Ls5tcztfk1sn8RSFwgvsvhKqB6gZ1hn64bmYnhZL/Twa2CQ0hkjXiAa4gmQ/
	 QI4358A3rvIfem2NdgZpTdOehJuBha5KX/9m2Lyyv+FBnL+CiIta5DV2KV9q6yAeBp
	 KMSZ5J10g0FQwnDJaS7fjDckxP0JEzZLd5evK6XKCHypiue27RZf4cvgg50vu1EruC
	 RrCdiWfmUbczg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC93812AF;
	Fri, 30 Oct 2026 15:25:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58C4A362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E20160AA4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjs3tB3wEZCl for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:25:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1960860AA2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373946;
 b=WkT74OyIaNiQUclNFmoJJyTWEI6se3gWnCm9X7HBBjqphsfCOa4a40ebGHP6ItB2hzPj
 bhjd82erTyLsHLv519WciejoSTU6nqTL67g3aCQ9dM+oc0MY7lqXeaCwRHrPVLL4Xz15i
 BDHN5HJNX+alRO3gHCcw2yutyxs+xpN00Yi9LGTl7QxSw/g+oleXJBSRGmvhRxO2sqYh7
 06cX7K9ylSp8nHHC0P5KxNGPxaEb700XWHRpDZMl6Hssz7aDRFtQllYJiph63rgo1in+P
 nCmJWGgf7I7sO4jqaTOdFAQI5OPhn5fmFxfHQNk4Gs1AwaDCZ6Bm6CP/+M2ua1A9+eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373946;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=97YzKQEh2GMwMFkF7xa5UEGC/75cOahSNk95s4vCf4Q=;
 b=VHfj2yNiYKaDdlhNxSN0l1hOmouwra7Le2NwPpuzd49Si7qfhPI+CbkEzg8W7T3n8uhA
 IHBXvrviePyaH9/AWja12jBEzJuTO64K4LHNIGRShIF8buRrhA06LEXGVDkEYDdmwFoUW
 T9y2djRfMW7MUe2R4zp7i6OLUYSb6ObCjuoVvjtx2PqJfVwKivVcUG/PzO9S+a/xId2xb
 i5m+OBVYcwexrMQaYkqd3u+i4yaKIPNnGxdruOpTbBwvG6n93pupub6Ov9sse1WMMfLi8
 zGmE9MfnQ/NvdWhrPaULg4GMv7UIPOE4CaPlrTixP1zw8rWV0/Xlfi63lBQT8bvl5JA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fpTEP5Jv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1960860AA2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so4434235e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373943; x=1793978743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=97YzKQEh2GMwMFkF7xa5UEGC/75cOahSNk95s4vCf4Q=;
 b=smG2Cj6Hag0GTB8IArrSEZHC9TAT2ip7KrPxA9cJ5j/8spetC28Sjt6GFka89xrfWf
 jrBz1zDt4vihPBWanKPCQEqNAWnAzt4jFA9qJVGbj4/mzm5SU3O4cLoJmto0sJ+4s1P0
 XWBsUXwcYGSYRTF0k/Z5vcRRaSO1ryG8/MqUQpPTjmtXwnGKP4xonUr/6qVLDqh4d/Jb
 AY+ZPT6SqUzHqMSGx735fOyhUITA6v4+7y3fp+zHLqpJPjvR0VHQZTJcNwOSC9mpJ/cU
 yuWvENd2pbrEDBzttAc4ov39rPfQY5pzUn8bKNiW9BamVBF+Z9/UcFH/H5OhtFI74irf
 Gnrg==
X-Gm-Message-State: AFq9FYKuVwcJXDc3oc3SqZNlQmi18cVJrgnf2aTtTs1jUHqpljuShchb
 XEtM6sFr3UVu0vVQDA2o0SoaBfHQ00QIzXF5BjSnSIMso4mszqHSlHtmSSICQPfpdINI/0nHGX/
 HB7I8w98=
X-Gm-Gg: AYBFou3g6I/n5WtRrCZnPp4zlcLEYEvM90dpwi1I8RNUSX4MAJiF2MJSBTYKydAFm9e
 TgbvSXSLuotU9133bpt52ni8OOjvsQDGqrXTYGDTYnwxRu4hakW78HI9rfkoIQoHixMa9t5zzkX
 nXsfTzdzBvYzaRyhiSNhugrSPQu+OyEwciEyijmu2nR3caJ5H5mX2xPYmFU8605w4I1wTfUz2Hy
 AXaGQavUA+92GWiOxhNt2wQnJ0SbsfTJmO47FOsB9ZbH5ajH4GRey7d82UvK0A0F5TriHCGpCBh
 6hx3MgeQ/65YA1lQizvXkrIK7jvSUKelqVB31Ci6wKHxc158a297u/xEJz3bax+ykGINZBGjDQM
 12Lu6pn3rZrnawo4OiSXCdIL/JhA6qbhNpfeOLtwj+hej3TdmiQA+9lBfN7YZxCTY1Pz3swSgXT
 IaNmmt5G/rKtbSOaSehUXxIvdSXIP1rq76ZoIEiZwO8FM81dRWsqDL0eeJUbRMTbTY86wUV8cRb
 h80M2PtL0J72wZSecE49JJH4CW7SnGjsJyl+h8YHnEzwKJFYdU4HaFUztGfvuhU62HcaOCg2fQP
 gh5al8N6GXFUMh0gNvw/n2LuyDeFBJcf78GjZyaZm9iLKHegH0DxQXd2shkAkgeSNvAz5tN7
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id
 5b1f17b1804b1-4ac1548f591mr60097305e9.3.1793373943188; 
 Fri, 30 Oct 2026 08:25:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abebe33e79sm50046355e9.2.2026.10.30.08.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Devoogdt <thomas@devoogdt.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:38 +0100
Message-ID: <20261030152540.1905642-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260308081212.777547-3-thomas@devoogdt.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3]
 support/testing/tests/package/test_fluent_bit.py: new runtime test
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_PASS,
	USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> v2: no change
> ---
>  DEVELOPERS                                    |  1 +
>  .../testing/tests/package/test_fluent_bit.py  | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 support/testing/tests/package/test_fluent_bit.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f7c5b077067..dcd25eba388 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3197,6 +3197,7 @@ F:	package/fluent-bit/
>  F:	package/librdkafka/
>  F:	package/libsoup3/
>  F:	package/yq/
> +F:	support/testing/tests/package/test_fluent_bit.py
>  
>  N:	Thomas Huth <th.huth+br@posteo.eu>
>  F:	package/ascii-invaders/
> diff --git a/support/testing/tests/package/test_fluent_bit.py b/support/testing/tests/package/test_fluent_bit.py
> new file mode 100644
> index 00000000000..825e4ec6d2d
> --- /dev/null
> +++ b/support/testing/tests/package/test_fluent_bit.py
> @@ -0,0 +1,46 @@
> +import os
> +import json
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestFluentBit(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_FLUENT_BIT=y
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Enable the http server
> +        cmd = ("sed -i 's/http_server  Off/http_server  On/g' "
> +               "/etc/fluent-bit/fluent-bit.conf && "
> +               "/etc/init.d/S99fluent-bit restart")
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        # Give some runtime
> +        time.sleep(5)
> +
> +        # Check the uptime
> +        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/uptime"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        uptime = json.loads(output[0])
> +        self.assertGreater(uptime["uptime_sec"], 3)
> +
> +        # Check the metrics
> +        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/metrics"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        metrics = json.loads(output[0])
> +        self.assertGreater(metrics["input"]["cpu.0"]["records"], 0)
> +        self.assertGreater(metrics["output"]["stdout.0"]["proc_records"], 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
