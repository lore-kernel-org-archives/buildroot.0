Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DED1C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A98942E34;
	Sat, 13 May 2023 10:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A98942E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbK-xSi8AcNm; Sat, 13 May 2023 10:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE7B42E04;
	Sat, 13 May 2023 10:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE7B42E04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 908471BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A4834012B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4834012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ipnv4baXg91S for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D5F400AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46D5F400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:07:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A14DA19F747
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:07:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:07:06 +0200
Date: Sat, 13 May 2023 12:07:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230513100706.GJ2582048@scaer>
References: <cover.1676112761.git.yann.morin.1998@free.fr>
 <ec2c6f0827a28d46c9b525f9c058f81cd4c9dd1b.1676112761.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec2c6f0827a28d46c9b525f9c058f81cd4c9dd1b.1676112761.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683972427;
 bh=9TPRN+/qfiOuyepLM0ZweWfhCmvjWaA12xAO7tI12JE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=luywfv9iYEkerHym4KnWSpn4amAoUHzpddT5HrYI109nh8JzUnPCi6L1cNDvDucKP
 NtOWUmui6tkpL0n3x8wNXmlgosdeeBonEbziaeeFRyNQiMgCghGyxuYzRPl6lazvgl
 j54JMeRlHUa2F9lsVcgzE/tXeUVU4nSz5iXVsHWqghexfBwFXN/IitmImJv6ONybIY
 cmJLepl2DTILabjREZsQy/vbGiM31ySxdtSH+MZeeJlgbkT+uZgrrqyuGj5ej+bkEf
 ZEQ+DxYiM2U1QdFnPi0W223yHrGfEBwKZIVxGmYSqHqKUPFbvFlkdEuiRrc82sF5sR
 flXyJYYkSmS5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=luywfv9i
Subject: Re: [Buildroot] [PATCH 2/2] br2-external: make version of external
 trees available
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-02-11 11:52 +0100, Yann E. MORIN spake thusly:
> For various reasons, like debugging or compliance, it is important to
> identify what br2-external trees versions were used for a specific
> build.
> 
> Add a Kconfig option that contains the version as computed by
> support/scripts/setlocalversion; this will appear in the .config file
> (but not in defconfig files, which is what we want).
> 
> Also generate that variable on the .mk side, so that it gets properly
> exported in the environment, for post-build of post-iamge scripts to use
> as they see fit (like, ensuring there is no dirtyness when in a CI for
> example).
> 
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/br2-external | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 5815c6ded0..8aea479d20 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -66,7 +66,7 @@ do_validate() {
>  
>  do_validate_one() {
>      local br2_ext="${1}"
> -    local br2_name br2_desc n d
> +    local br2_name br2_desc br2_ver n d
>  
>      if [ ! -d "${br2_ext}" ]; then
>          error "'%s': no such file or directory\n" "${br2_ext}"
> @@ -104,8 +104,10 @@ do_validate_one() {
>  
>      # Register this br2-external tree, use an absolute canonical path
>      br2_ext="$( cd "${br2_ext}"; pwd )"
> +    br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
>      BR2_EXT_NAMES+=( "${br2_name}" )
>      eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
> +    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
>      eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
>  }
>  
> @@ -113,7 +115,7 @@ do_validate_one() {
>  # for the br2-external tree
>  do_mk() {
>      local outputdir="${1}"
> -    local br2_name br2_desc br2_ext
> +    local br2_name br2_desc br2_ext br2_ver
>  
>      {
>          printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
> @@ -139,12 +141,14 @@ do_mk() {
>          for br2_name in "${BR2_EXT_NAMES[@]}"; do
>              eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
>              eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
> +            eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
>              printf '\n'
>              printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
>              printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
>              printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
>              printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
>              printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
> +            printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
>          done
>      } >"${outputdir}/.br2-external.mk"
>  }
> @@ -152,7 +156,7 @@ do_mk() {
>  # Generate the kconfig snippets for the br2-external tree.
>  do_kconfig() {
>      local outputdir="${1}"
> -    local br2_name br2_desc br2_ext br2
> +    local br2_name br2_desc br2_ext br2_ver br2
>      local -a items
>  
>      items=(
> @@ -192,11 +196,15 @@ do_kconfig() {
>      for br2_name in "${BR2_EXT_NAMES[@]}"; do
>          eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
>          eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
> +        eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
>  
>          {
>              printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
>              printf '\tstring\n'
>              printf '\tdefault "%s"\n' "${br2_ext}"
> +            printf 'config BR2_EXTERNAL_%s_VERSION\n' "${br2_name}"
> +            printf '\tstring\n'
> +            printf '\tdefault "%s"\n' "${br2_ver}"
>              printf '\n'
>          } >>"${outputdir}/.br2-external.in.paths"
>  
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
