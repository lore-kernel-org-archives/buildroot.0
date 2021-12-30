Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E25C433FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9985813D2;
	Thu, 30 Dec 2021 21:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O5Zf6lWLUgR; Thu, 30 Dec 2021 21:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E718136C;
	Thu, 30 Dec 2021 21:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEC3B1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2938136C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ob_pt0audzzD for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7498E81305
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:47:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:14b5:310a:ddef:6cec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A288813F7E7;
 Thu, 30 Dec 2021 22:47:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640900847;
 bh=sB+R/fj7jqw2wNJOMLtWFIvJTDYMpOlGMzeRZeeeBnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hwxo12z9dGxua4lTn0W8BdF0XDobAGbiF6Mb1088tKHzEANyVodFxZfEFynId+aIN
 3pqM12HuLQRQUQmvZQwmh2B/jrDGhtRJgQAOkIaNHIzvtWjZvfHpRQBbR5zfgALyIP
 2Z3yjTRK0AQDsGBPydntzVxnAaIR5JvE+Atj/r6cMr9aF26HRH9Zw5TVrMjdj1T6Ry
 +/M38rmgaqhAARh3S3Xr9ZHh1qKhFIm4AifcEMjiSoP1dcAEBSbsWtCuW5StYc/s9Y
 Bd9dD9aZ7S19pHkwmuRr2VlTaN0gSV6hbGHS4uMibrx6Qr1ykJF2HXqo1WVCCOPt0j
 y5zJd8zcf/Qpw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Dec 2021 22:47:22 +0100
Date: Thu, 30 Dec 2021 22:47:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20211230214722.GJ3390456@scaer>
References: <20211214125510.13654-1-andreynech@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211214125510.13654-1-andreynech@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/: remove -E flag from
 patch call
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

Andrey, All,

On 2021-12-14 13:55 +0100, Andrey Nechypurenko spake thusly:
> -E flag instructs patch to remove empty files. However, in some cases
> empty files are essential. If they are missing, build could be broken
> or other bad things can happen.

Do you have an example of a publicly accessible package that has this
issue?

> Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>

I was going to apply this, but then I was wondering; what about patches
that actually *want* to remove files?

It turns out that we do have a few patches that remove files:

    $ git grep -E '\+\+\+ /dev/null'
    board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
    board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
    board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
    boot/grub2/0033-verifiers-Move-verifiers-API-to-kernel-image.patch:+++ /dev/null
    boot/grub2/0034-efi-Move-the-shim_lock-verifier-to-the-GRUB-core.patch:+++ /dev/null
    boot/lpc32xxcdl/0002-delete_redundant_files.patch:+++ /dev/null2012-01-01 16:39:47.918907000 +0100
    boot/lpc32xxcdl/0002-delete_redundant_files.patch:+++ /dev/null2012-01-01 16:39:47.918907000 +0100
    package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
    package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
    package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
    package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
    package/gcc/10.3.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
    package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
    package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
    package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch:+++ /dev/null
    package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch:+++ /dev/null
    package/screen/0005-rename-sched_h.patch:+++ /dev/null

While a few of them could be rewriten so that the are actual renames
(now that we require a patch version that supports renames), some really
do want to remove files; that's notably the case with the uboot patch
for the roseapplepi board, or the babeltrace2 patch, as well as the gcc
patches...

Furthermore, some users may have alaready relied on this behaviour, that
empty files get removed, for their packages in theor br2-external
trees...

So we have an antagonist situation: some patches will want to rem ove
files, and some patches will want to not remove files. We can't satisfy
both, obviously.

So, unfortunately, it is not possible to apply your patch.

If your package really requires that the files be present and empty, you
should then use a post-patch hook to touch those files.

Unless someone comes up with a better idea...

Regards,
Yann E. MORIN.

> ---
>  support/scripts/apply-patches.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index e5a2fdd09e..6da83f6826 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -114,7 +114,7 @@ function apply_patch {
>          exit 1
>      fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
> -    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
> +    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
>          echo "Patch failed!  Please fix ${patch}!"
>          exit 1
> -- 
> 2.25.1
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
