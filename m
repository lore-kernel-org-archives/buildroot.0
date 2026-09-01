Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E3EC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 20:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C9540A40;
	Tue,  1 Sep 2026 20:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7Dc1KokL2Tp; Tue,  1 Sep 2026 20:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788295900;
	bh=vHoROpdwXUajN54ddy3spKinaxCFJ+qKAFYhb3ALMEQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hAT8i13pBfq5H/9iNasSMlqWb8uKspCyTcumlBol5MjKMJoKJhXVcRkuwRwNqzZ1w
	 vOg+/3tkYyAL25I0ee9SuhLOcvfy28L9N7QU6idLQAXW7feS/LIDOxYlniOpjZtBT8
	 zMFm1syI2rCkP7yqpV/7ZeHAhSEkJFDjfDCE3DVYpgrHr9YqgHTeHfqWaJvjFJq3o/
	 LxTRZmNr75nFUE00ap5GMacD65xB45E00GuuUYAmr/2JIw5Rdv0uQkDUJsU9V1RjOR
	 pKzCSqlw7Xolnatv0CvZYnst0zMP5LGaCfzWacCWhO1cx9MrkPqc6IL8cHJfGddRvb
	 aMtsxjo0tXBrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E70F40A29;
	Tue,  1 Sep 2026 20:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD272FD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 909CD80ED8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcelg3XlWlWR for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 20:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92EEF80E47
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:51:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E18EA1A1937;
 Tue,  1 Sep 2026 20:51:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B52426053C;
 Tue,  1 Sep 2026 20:51:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8942111C7927E; 
 Tue,  1 Sep 2026 22:51:28 +0200 (CEST)
Date: Tue, 1 Sep 2026 22:51:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <apc5egLCDDm39inI@windsurf>
References: <aoG3tN3r2SnRX0el@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoG3tN3r2SnRX0el@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/runc: enable uClibc support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

Thanks for your patch!

On Sun, Aug 16, 2026 at 03:14:28PM +0200, Waldemar Brodkorb wrote:
> fexecve was added to uClibc in 2019 in commit
> 858ffad217076227089cc17eb832db0bd1497792.
> 
> Runtime tested on a Raspberry PI4 (64 Bit).
> System compiled with Bootlin Toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/runc/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/runc/Config.in b/package/runc/Config.in
> index 73eac72527..e4027fddaa 100644
> --- a/package/runc/Config.in
> +++ b/package/runc/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_RUNC
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>  	select BR2_PACKAGE_HOST_GO
>  	help
>  	  runC is a CLI tool for spawning and running containers
> @@ -14,4 +13,4 @@ config BR2_PACKAGE_RUNC
>  comment "runc needs a glibc or musl toolchain w/ threads"

You need to update this comment, to drop "glibc or musl". I had done
that locally, because it was trivial.

But the less trivial thing that you need to do is look at the reverse
dependencies of runc:

package/containerd/Config.in:   select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
package/podman/Config.in:       select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN  # runtime

containerd has:

        depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc

which is no longer correct since runc no longer depends on !uclibc. So
either this dependency can be dropped, or its comment needs to be
updated to explain why containerd still doesn't work with uclibc.

Regarding podman, it's even weirder because it doesn't have this
dependency.. But I guess that's OK because podman needs rust, and rust
is only available for glibc and musl configurations. That's why we
didn't see any issue there.

Still, the containerd case needs to be looked at. Can you check this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
