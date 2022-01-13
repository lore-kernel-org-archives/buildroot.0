Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB7FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC1FC4165F;
	Thu, 13 Jan 2022 17:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7KECYNjkXBf; Thu, 13 Jan 2022 17:41:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06234165C;
	Thu, 13 Jan 2022 17:41:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18B271BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED23812B2
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ah577mE-qRzv for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:41:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99164812CC
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:41:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84d2:7b0:3327:1b6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9927B19F593;
 Thu, 13 Jan 2022 18:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642095693;
 bh=blEOWUl8O1RKvkxHgcxDCMZNrBYb1iSZx4SjXdy0Svw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=buYZY4NoWcx43z0F/vQ2wB+eJZhXlm1M7cVhNw6i99ykzXpxgfLrxEinnh19ARxTH
 1zsM5EzMSP/WR6WmJ9xAqcmA0EpFU4w/AGb54N2gHZQNr1YhLtsJqNMRG7CuYZCa/x
 hDQaJ5A6PxwFxy5m1n7fhXKNMSohga0IsaYAFnvbcjMgsJxVZFLrOj9s8gMPUn61jX
 M0oalP1qN7rk0FhnmRht+C20ktgkbKdkht2zAVYHEZoUncHAuwyXrkOZJavj90MYHj
 7GKjRa8gkQjKBwcF2lNNEH1oGO81EWOelWOD09wIyvKb1FWckZQrOnigjPZrBBHcDg
 eVOR123QcT1yg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 13 Jan 2022 18:41:30 +0100
Date: Thu, 13 Jan 2022 18:41:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220113174130.GI1477939@scaer>
References: <20220113115704.2354150-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220113115704.2354150-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: add upstream patch to
 fix vapigen support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adrian, All,

On 2022-01-13 13:57 +0200, Adrian Perez de Castro spake thusly:
> Import an upstream patch which fixes a typo in the Meson source code
> which caused a wrong command line option to be passed to the vapigen
> program. This fixes the build for all packages which use Meson and
> provide API bindings generated using said tool.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...x-typo-in-vapigen-option-metadatadir.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
> 
> diff --git a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
> new file mode 100644
> index 0000000000..f8cc30ec29
> --- /dev/null
> +++ b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
> @@ -0,0 +1,31 @@
> +From 5385e4c0a4dd4f9cf1e15c9c321b22d19cc0011a Mon Sep 17 00:00:00 2001
> +From: Michal Vasilek <michal.vasilek@nic.cz>
> +Date: Mon, 10 Jan 2022 21:27:30 +0100
> +Subject: [PATCH] gnome: fix typo in vapigen option metadatadir
> +
> +This typo was introduced in 9ef36fa80bf4483bcd837ea3985a51ab533c7972 and
> +can cause a build failure, because --metadatdir is not a valid vapigen
> +option.
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +Upstream-Status: https://github.com/mesonbuild/meson/pull/9806

When an upstream PR/MR has been merged, we prefer that an actual
backport is made, so that the patch has the proper upstream hash,
which helps in the future ases if a version bump includes that
commit.

So I've made that a proper backport:

    $ git format-patch -n1 --start-number=3 --no-numbered 9952446a2

Applied to master with this backport, thanks.

Regards,
Yann E. MORIN.

> +---
> + mesonbuild/modules/gnome.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index 1125e56e7..dfc66c2e3 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -1934,7 +1934,7 @@ class GnomeModule(ExtensionModule):
> +         cmd: T.List[T.Union[str, 'ExternalProgram']]
> +         cmd = [state.find_program('vapigen'), '--quiet', f'--library={library}', f'--directory={build_dir}']
> +         cmd.extend([f'--vapidir={d}' for d in kwargs['vapi_dirs']])
> +-        cmd.extend([f'--metadatdir={d}' for d in kwargs['metadata_dirs']])
> ++        cmd.extend([f'--metadatadir={d}' for d in kwargs['metadata_dirs']])
> +         cmd.extend([f'--girdir={d}' for d in kwargs['gir_dirs']])
> +         cmd += pkg_cmd
> +         cmd += ['--metadatadir=' + source_dir]
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
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
