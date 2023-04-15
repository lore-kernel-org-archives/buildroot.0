Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1B4C77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 07:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B748C4052D;
	Sat, 15 Apr 2023 07:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B748C4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_Pl-8AWjVBr; Sat, 15 Apr 2023 07:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E43C540332;
	Sat, 15 Apr 2023 07:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43C540332
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 499771C3EBA
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 07:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22D7740332
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 07:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22D7740332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYxeNkL0h03N for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 07:15:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB75400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBB75400D9
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 07:15:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8B48E5FF9D;
 Sat, 15 Apr 2023 09:15:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 09:15:17 +0200
Date: Sat, 15 Apr 2023 09:15:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230415071517.GB2819@scaer>
References: <SN4P221MB0682F9ABB79DF3B57BF6C4D8A0999@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682F9ABB79DF3B57BF6C4D8A0999@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681542920;
 bh=bmyspSNFNovhY5pMuRGmX5oQbZEoB/DMFanTjZ3Jfnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a1srcVRVFwwZ7UR3SEgTBFDxCth+/FlkekaUIhScFgsWpout/0VLabHh7jgBzdMi6
 EbnvIelcrKInVEi3G+8WHJEg3w3J9eHLdyej9K+PFeV70YS0ry6hBCIr1jN+uGATEQ
 Sbf+bDb+5K14CxYwYTqjMpZ+nhZDdTIlMJATXDu6/L9t/jRZ7wQRepfXi+pDUxVoMf
 44XhTqHBZ4ScD8ulSzNyQX87LAuKfsm2X+kYTwLSBCPt0YNwV9D2MkUauUCr5BuNuD
 7nFfwWTY7Tw1SzwnqHG7BgmdWok42nb3pteULS3MlWPkLdtx2ceAiUDek5nsDcotji
 V74Pw3pdGU4IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a1srcVRV
Subject: Re: [Buildroot] [PATCH] board/qemu: restore readme globbing
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-14 17:53 -0400, James Knight spake thusly:
> The QEMU board's post-image script will glob through various
> `readme.txt` files for an appropriate command line to use. Recent linter
> changes [1] prevents this from happening, and results in the following
> build error:
> 
>     >>>   Executing post-image script board/qemu/post-image.sh
>     sed: can't read board/qemu/*/readme.txt: No such file or directory
> 
> Reverting part of the shellcheck fixes for the README file arguments and
> marking a linter exception.
> 
> [1]: b32d7c99c64d6dcb7a68036a7abfa86b8b558627

I don't know what I had in my skull that day, instead of my brain...

> Signed-off-by: James Knight <james.d.knight@live.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  board/qemu/post-image.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
> index 763287ca391e970aba016fe278fa0d37c8a618ad..e344d1e6bce4e91bfb0f38bc992bb535e4c9971d 100755
> --- a/board/qemu/post-image.sh
> +++ b/board/qemu/post-image.sh
> @@ -12,7 +12,8 @@ fi
>  
>  # Search for "# qemu_*_defconfig" tag in all readme.txt files.
>  # Qemu command line on multilines using back slash are accepted.
> -QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' \ "${README_FILE}")"
> +# shellcheck disable=SC2086 # glob over each readme file

Yeah, that glob eluded me when I fixed the shellcheck issue.

> +QEMU_CMD_LINE="$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '"${DEFCONFIG_NAME}"'$/!d; s/#.*//' ${README_FILE})"

OK, so I remember I added that backslash on purpose, to split the long
line, but I don't know why I did not immediately split it...

While at it, I also reinstated the plural on the variable name...

Applied to master, thanks.

Thanks for fixing my mess.

Regards,
Yann E. MORIN.

>  if [ -z "${QEMU_CMD_LINE}" ]; then
>      # No Qemu cmd line found, can't test.
> -- 
> 2.39.1.windows.1
> 

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
