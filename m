Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BAE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E10408E4;
	Sun,  1 Oct 2023 10:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E10408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUd5UOTbW2vg; Sun,  1 Oct 2023 10:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491B5417DE;
	Sun,  1 Oct 2023 10:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491B5417DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 820041BF2CE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A1A6417DE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1A6417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-WhHCKxwEgY for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 10:38:49 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94761408E4
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 10:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94761408E4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:7d3f:173d:28ec:8590])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6E836B00571;
 Sun,  1 Oct 2023 12:38:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Oct 2023 12:38:44 +0200
Date: Sun, 1 Oct 2023 12:38:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20231001103844.GK2579@scaer>
References: <SN4P221MB0682E582104B524681EBE0C9A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682E582104B524681EBE0C9A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696156726;
 bh=KAJ9hDSL0HmnEncsv2uugbtck0+DGdqu+KRgYEpqc5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cC2W9xCbqNIjyMIMdJfjDlURNJtA1AbEmzzbrzCL3/pEMuXGdYQ/VpXoWNvBqmdai
 fq8ryetWZQw4LcEhBmf/6MAk+cI8FqQo8jDxEVxzjKpbO5XDutMfPobiUAzfwg0Hkm
 eluAL3QWAwrPepH4ww8um+9yrsmaHJRvIeOwYkm6PM6L+i6xAKRHNDWvndzhbKcFjO
 a+kOE4zOKUeI2uA1Ka4m7UBq9mEz8QCfw3xbrherTfwLxWRsNRrM6uct/7ViJ/gn8k
 HYWI2vFLXYv2eyBEG5vQ/KjGxhC7XpD3OgTve/sSWAZrNNMRlvo5Th/wd8oVOmHPpA
 ws/fMjM7vfARw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cC2W9xCb
Subject: Re: [Buildroot] [PATCH 1/2] package/skeleton-init-systemd: copy
 over etc-factory content
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-05-05 00:30 -0400, James Knight spake thusly:
> The systemd package will prepare the folder `/usr/share/factory/etc/`,
> which holds a series of default configuration files for a runtime
> state [1]. For example, the etc-factory repository holds the default
> template for `/etc/pam.d/system-auth` which is required in a default
> environment configured to use systemd with SELinux. Without this file
> prepared, login attempts will fail with the message:
> 
>     ... buildroot login[242]: PAM _pam_load_conf_file: unable to open config for system-auth
>     ...
> 
> To avoid this, when preparing the initial skeleton structure for systemd
> environments, copy over fallback configurations defined in etc-factory
> into the target's `etc` folder. If a file is already prepared at this
> state, these template files will be ignored.

Why is that not listed in the systemd tmpfiles, so that it is installed
when running systemd-tmpfiles, either at runtime by systemd on a r/w
filesystem, or at buildtime with BR2_INIT_SYSTEMD_POPULATE_TMPFILES ?

Also, none of our runtime tests for systemd exhibits this login issue:

    support/testing/tests/init/test_systemd.py
    support/testing/tests/init/test_systemd_selinux.py

Could you try to add a bit more explanations and context, please?

Regards,
Yann E. MORIN.

> [1]: https://www.freedesktop.org/software/systemd/man/file-hierarchy.html
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index fb15552f99eafcc90bc5fa9dfcee3ad465492b81..4076821c0c0429cf90681f4b16be114c44bde282 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -68,6 +68,13 @@ SKELETON_INIT_SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SKELETON_INIT_SYSTEMD_CREATE_TMPFI
>  endif  # BR2_INIT_SYSTEMD_POPULATE_TMPFILES
>  
>  define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
> +	if [ -d $(TARGET_DIR)/usr/share/factory/etc ]; then \
> +		rsync -av --ignore-existing --remove-source-files \
> +			$(TARGET_DIR)/usr/share/factory/etc/ $(TARGET_DIR)/etc/; \
> +		rm -rf $(TARGET_DIR)/usr/share/factory/etc/; \
> +		rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/factory; \
> +	fi
> +
>  	mkdir -p $(TARGET_DIR)/home
>  	mkdir -p $(TARGET_DIR)/srv
>  	mkdir -p $(TARGET_DIR)/var
> -- 
> 2.40.1.windows.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
