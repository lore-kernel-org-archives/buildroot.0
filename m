Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06533C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 07:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A34D406B9;
	Sat, 17 May 2025 07:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCDo6QZCOD8t; Sat, 17 May 2025 07:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A62C406BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A62C406BE;
	Sat, 17 May 2025 07:59:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD21E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C06040534
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmmuDVud8M7w for <buildroot@buildroot.org>;
 Sat, 17 May 2025 07:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FA3340125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA3340125
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FA3340125
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:59:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7870D19F74D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:59:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 May 2025 09:59:37 +0200
Date: Sat, 17 May 2025 09:59:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <aChB6bwZ007ymPK_@landeda>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <8b83ad421062201ab3387b1133eee53a800b1918.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b83ad421062201ab3387b1133eee53a800b1918.1747241900.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747468781;
 bh=Ps8IhHZTpO6NTCLrBGSuxKYI0NKTTioJf9ltpPP6eIo=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=FsaBMvr/S4agXcde/a/545j30f/I25YoAg4/JBINhyUlLx/gsouJgi7HxqvqPnCm5
 V0Am7ZAz/+jXnqktAjAguQnD19Xku3VbkaFTGpOgCLOnNj1PLk0MtBAuFozpnAynCz
 BPYaB8f5e5lmbW+ePM512ZmipeFv3KFy911Zm8k8c2RVqjdv44HFZo87/uXbHTlXaW
 3uNBg/2DUHYJvq/q0apd5+nircgr5lt2TYGHU9MmTPwI0ulVGkdLrUXRaaA4TZQ1f6
 M87R2OmomMmBw72Ixf8hkmzAKVR6Ywfpe+dusXYP8Vj9u9W0kWiC51JWNkWKHsbxFP
 ey45zJVv/xZZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FsaBMvr/
Subject: Re: [Buildroot] [PATCH 05/13] support/scripts: fix and restrict
 conditions to accept merged dirs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2025-05-14 18:58 +0200, Yann E. MORIN spake thusly:
> Currently, we accept that the merged usr is bqckward, i.e. that the
> /usr/bin, /usr/sbin, and /usr/lib entries be symlinks to, resp., /bin,
> /sbin, and /lib. We also allow either entries to be symlinks to other
> parts of the root. Both are accepted despite the comment at the top of
> the script explaining what should be accepted.
> 
> However, a properly merged usr is the other way around: /bin, /sbin, and
> /lib are the symlinks to resp. /usr/bin, /usr/sbin, and /usr/lib, and
> the latters are actual directories.
[--SNIP--]
> @@ -32,12 +29,21 @@ test_merged() {
>  	local dir2="${3}"
>  	local inode1 inode2
>  
> +	# OK if missing first entry and second entry is an actual directory
> +	test -e "${root}${dir1}" || { test -d "${root}${dir2}" && return; }
> +
>  	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
>  	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
>  
> -	test -z "${inode1}" || \
> -		test "${inode1}" = "${inode2}" || \
> -			printf '%s\n' "${dir1}"
> +	# OK if first entry is a symlink, second entry is a directoy, and
> +	# both have the same inode (once dereferenced)
> +	test -L "${root}${dir1}" \
> +	&& test -d "${root}${dir2}" \
> +	&& test "${inode1}" = "${inode2}" \
> +	&& return
> +
> +	# Otherwise, this directory is not merged
> +	printf '%s\n' "${dir1}"

This new test is still quite complex, and is in fact still wrong in
weird cases. For example, with BASE a custom skeleton or rootfs overlay,
if BASE/sbin and BASE/usr/sbin ar absolute symlinks to /usr/sbin, the
test above will accept BASE as being properly merged, while it is in
fact broken.

I'm preparing a v2 which greatly simplifies the test, and makes it cover
more (all, hopefully) cases.

Regards,
Yann E. MORIN.

>  }
>  
>  test_merged "${root}" "/lib" "/usr/lib"
> -- 
> 2.47.0
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
