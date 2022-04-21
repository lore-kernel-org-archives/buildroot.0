Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D5383E27;
	Thu, 21 Apr 2022 17:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DtvZjCC-dkt; Thu, 21 Apr 2022 17:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE07183148;
	Thu, 21 Apr 2022 17:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63DB51BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6072E409E4
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0hBMwG9B73d for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1938E4015D
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:55:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b19so7713583wrh.11
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+gorvYwgiM6ekpHX4mfe+qeemc6GUCZ5uUwupGzeeCQ=;
 b=UaYLHxoymg+uQngtmDdDEaRPHEbWHSp0TUgBsVIVqn0G+IWejqqM+3Gv7RgRpI0/X+
 gbEh512MWAF2Ou1phDZnvHuiCj6GcITarGVNUcW2ay8hyJHnDRr2N8ErF5V6O9mEHvBa
 nH4zUsfd34/0YYJ3mfPeaZtDZDWgo3aHF89drnUlj5JqW8YOIP6FlFObYUuPqSZWX8rZ
 affxPuyrMbG4u5LldXFtg7tSG/r1x0ieSuYl9IStwJn0rgh8hYBxYY2kCn78TlA66325
 UYOEoaa3ZWHGohg+D2nHFogSlQaLuXl8ieQSWhLypraSCF8e68XYsJbh10/swg5A9CCb
 YBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+gorvYwgiM6ekpHX4mfe+qeemc6GUCZ5uUwupGzeeCQ=;
 b=eeA2pB0H/9RqpG3i3KEUEE+6ohvI2U7zPN5VSTexY0STh0fHn43wO242YtdRn5Uzl6
 DuxoMtjdjI6Sh0ZZOWYItqADm1vUph2K8gOnumB/9ygX3f5ewp78RR+SqnCdJJlFnSme
 t27S++goBtcNAj3QXop8RtvtRwZ3y4BDtFjwuJS9opa5N3LQSDzkn6AHeoeoB1ynp3Ac
 GpWZ14fAJfZ0c9kSFQLA+OY2DgPxBxSmqQt2SKWj6CvwuDPiGqhG5ld1u9PWj8ZS7rC9
 k6vfTaButkATa6bXTksUsJf7+HWZJZoRL7X4ngk5oNFpFOHSJcuQ6GSLCa109idi7h1S
 4bjw==
X-Gm-Message-State: AOAM533YOANe8tmw9Kk4M1inOBCu9IiF771loWvRfSsdLoNj13c5TqHe
 8n3cDFF1KFFeHE+vdqJ4+BfIYZbakR4BMw==
X-Google-Smtp-Source: ABdhPJwJfJd5bt3v1OfSs3hREFtGzFYUTfGRdyZ3iLpQ09lO5zbWM0ok0iSrz9NmhYzl2zTLqmbLqg==
X-Received: by 2002:a5d:47c2:0:b0:20a:9132:d20a with SMTP id
 o2-20020a5d47c2000000b0020a9132d20amr630914wrc.709.1650563718256; 
 Thu, 21 Apr 2022 10:55:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b00392ae97b948sm2448943wmo.15.2022.04.21.10.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:55:17 -0700 (PDT)
Message-ID: <7bdb1a8a-fea6-62be-9e64-c71ea23cdf67@mind.be>
Date: Thu, 21 Apr 2022 19:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220411211956.257449-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411211956.257449-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: fix static build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/04/2022 23:19, Fabrice Fontaine wrote:
> Fix the following static build failure when using an external zlib:
> 
> /home/autobuild/autobuild/instance-11/output-1/host/bin/i686-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Og -g0  -static -DHAVE_CONFIG_H -Wall -W -Wno-unused-parameter -static -o rsync flist.o rsync.o generator.o receiver.o cleanup.o sender.o exclude.o util.o util2.o main.o checksum.o match.o syscall.o log.o backup.o delete.o options.o io.o compat.o hlink.o token.o uidlist.o socket.o hashtable.o usage.o fileio.o batch.o clientname.o chmod.o acls.o xattrs.o progress.o pipe.o   params.o loadparm.o clientserver.o access.o connection.o authenticate.o lib/wildmatch.o lib/compat.o lib/snprintf.o lib/mdfour.o lib/md5.o lib/permstring.o lib/pool_alloc.o lib/sysacls.o lib/sysxattrs.o    -lz -lpopt -liconv
> /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/9.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libz.a(deflate.c.o): in function `read_buf':
> deflate.c:(.text+0xb93): multiple definition of `read_buf'; io.o:io.c:(.text+0x2bf4): first defined here
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/488453197da880dda8f47b71ff302192bcbb6679
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...g-with-a-zlib-with-external-read_buf.patch | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
> 
> diff --git a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
> new file mode 100644
> index 0000000000..0af090732c
> --- /dev/null
> +++ b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
> @@ -0,0 +1,27 @@
> +From 60dd42be603a79cd57cec076fe1680e9037be774 Mon Sep 17 00:00:00 2001
> +From: Wayne Davison <wayne@opencoder.net>
> +Date: Mon, 11 Apr 2022 08:29:54 -0700
> +Subject: [PATCH] Handle linking with a zlib with external read_buf.
> +
> +[Retrieved from:
> +https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + rsync.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/rsync.h b/rsync.h
> +index 4b30570b..e5aacd25 100644
> +--- a/rsync.h
> ++++ b/rsync.h
> +@@ -1172,6 +1172,10 @@ struct name_num_obj {
> + 	struct name_num_item list[10]; /* we'll get a compile error/warning if this is ever too small */
> + };
> +
> ++#ifdef EXTERNAL_ZLIB
> ++#define read_buf read_buf_
> ++#endif
> ++
> + #ifndef __cplusplus
> + #include "proto.h"
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
