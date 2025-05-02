Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F2C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD53812CB;
	Fri,  2 May 2025 10:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDyJvew_DJ6x; Fri,  2 May 2025 10:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1E382CE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1E382CE5;
	Fri,  2 May 2025 10:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 128FAEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0402B60B11
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ncw3QZCVRfV for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EFF060B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EFF060B05
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EFF060B05
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B87281C0F8A; Fri,  2 May 2025 12:20:03 +0200 (CEST)
Message-ID: <f0956011-9f6d-4910-a7fa-688a6b4e5393@rnout.be>
Date: Fri, 2 May 2025 12:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20250303041551.3968139-1-troglobit@gmail.com>
 <20250303041551.3968139-2-troglobit@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250303041551.3968139-2-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181203; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PrVUIQtq00Vqvitz4DnSrKvd6HhCy/5zORIP1RZk814=;
 b=V2Vyj8EbBh1JiGLgxw72mkqJ1ZMICGsZtvgXeXIJOtWrX7xOlSQMlml1ajFbSId5XL+rsH
 ACoFF8d7RM/I8/xw4sKcHF65eYOD2FtbByTkFTbtq5WqtOvN0hqhkmnO/bVbNKqvarxqfz
 2VcQS6mF+K8WLNSUfzA0AMdGJZnWJc87Ozu//sCovNq5v8Ej7mkqddDGxjzBm4FEJ1y55F
 xOyC82xe9j4w2IoH3UNMFaeu72j1p6xT9YSEFJHjkBBCwaoS1m16eGG+TgupHjED4I5A1G
 zm7AyoPZL8JGbxyY/AApttV+am8Iym6Ee+9vTrQRH1Z89oKQ01vK0nBfWRg8hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=V2Vyj8Eb
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/03/2025 05:15, Joachim Wiberg wrote:
>   - Update syslogd -T documentation, it applies to messages originating
>     both locally and from remote syslog servers
>   - Fix hostname filtering support, introduced in v2.7.0, broken
>   - Fix parsing of userspace messages in /dev/kmsg, inserted an
>     extra space before the message payload
> 
>  From https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/sysklogd/sysklogd.hash | 4 ++--
>   package/sysklogd/sysklogd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index 4024965e23..645bc6a0ae 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,4 +1,4 @@
> -# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
> -sha256  6ab74ab5001121bb32697fd2f7ab3cc4b4452c3f721677e06e5b60982a04d0cc  sysklogd-2.7.0.tar.gz
> +# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
> +sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
>   # Locally calculated
>   sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index e8b7fe2062..a3e27fd17b 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SYSKLOGD_VERSION = 2.7.0
> +SYSKLOGD_VERSION = 2.7.1
>   SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>   SYSKLOGD_LICENSE = BSD-3-Clause
>   SYSKLOGD_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
