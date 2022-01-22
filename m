Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A04640590;
	Sat, 22 Jan 2022 19:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpfL7Dnw7wyc; Sat, 22 Jan 2022 19:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DF974049D;
	Sat, 22 Jan 2022 19:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E282E1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFC7760AD4
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kg5iSbI63jO for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:09:27 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTP id 740106076A
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:09:27 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BLeVn71dGXfntBLeVnzFr1; Sat, 22 Jan 2022 20:02:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642878140; bh=lTPToYm/IHKGVs6eXpNowH+ssAz3pWdLJGyHpv9KBrU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=N/EDEUY8tQQBUhpwh9JsiPNaKj9uzSCHzI3qMD1g8QBmJMnFQ5FrFASylf4cZS4o+
 INGSFuJZIhOYiSez9MsY+F+6VSm6ZCiBTgnshRfgI6yRYwrp0iaZWlZJfWdGjeC9Pg
 Ft84GAn8NUL9DjKIazzXwxLE/4zj1Exyg3alTsldWAiHmDrI2Zt9O7kuez55yxmOjA
 XRJMoK5TkICN0jx9e/2QVAai5NZIKnp9px0hrzy3Yxrk/fTghb3+35zFU+y+HZVrZF
 R715GykyuG1eVS6me7kNW8bNUJSQ4BojgOxTrZbLJRmdaQ9jhrGm1Wq0XQ7uPCc+4N
 EBcSpo/nCsHGQ==
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20220122185049.1194-1-petr.vorel@gmail.com>
 <20220122185049.1194-2-petr.vorel@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c2326582-34f4-b9f9-8335-29bf85587e70@benettiengineering.com>
Date: Sat, 22 Jan 2022 20:02:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122185049.1194-2-petr.vorel@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfAdk8v7m09fs7EIBoKZMoORGq75Nt/YR6+coGPAgcAt8o/aWpftGqGSjrtjXquRfbefeelHxwpAXqH4iPHij9oH4d+39vEBvoh674yMJYTXb9+tmUjr+
 G7Wh7ZFubDq0tmv6yzmBW9hBa8QrfF0cnPiKnu8SMU2lGzZu9pj6KRLkdD6XHKkdBcrE+fxDJ9wAc9pgBGrFxwXk/Ns2X2xu5zLVfP9g0IdI//iqyUKSjSeJ
 rw1l78R2pAQTYEzgBFDWEQ==
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nfs-utils: Update supported
 versions
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

Hi Petr,

On 22/01/22 19:50, Petr Vorel wrote:
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
> New in v2
> 
>   package/nfs-utils/Config.in | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index df9c12ca44..f00debc420 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_NFS_UTILS
>   	help
>   	  The NFS Linux kernel server.
>   
> +	  Supports NFSv3 and optionally NFSv4 (and later).
> +
>   	  http://linux-nfs.org/
>   
>   if BR2_PACKAGE_NFS_UTILS
> @@ -24,7 +26,7 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
>   	select BR2_PACKAGE_LVM2
>   	select BR2_PACKAGE_SQLITE
>   	help
> -	  Enable NFSv4/NFSv4.1 support
> +	  Enable NFSv4/NFSv4.1/NFSv4.2 support
>   
>   comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
>   	depends on BR2_STATIC_LIBS
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
