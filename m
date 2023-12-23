Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBAAC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 18:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 558044011A;
	Sat, 23 Dec 2023 18:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558044011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jD-rk-KQjmyF; Sat, 23 Dec 2023 18:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3894D4011C;
	Sat, 23 Dec 2023 18:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3894D4011C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A86C1BF34C
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 18:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11D594011C
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 18:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D594011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jw4ujAnEkixO for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 18:44:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 572994011A
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 18:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 572994011A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 62AADB004FF;
 Sat, 23 Dec 2023 19:44:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 19:44:06 +0100
Date: Sat, 23 Dec 2023 19:44:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: kilian.zinnecker@mail.de
Message-ID: <ZYcqdkBK1XbKOmlq@landeda>
References: <20231206192527.90222-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206192527.90222-1-kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703357048;
 bh=B6zPeGs9w1t+RVzDD0aspkLl/VbEl5wCYa5p18Ydme4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bm8zDUsueRrRsaM/btbJ4Wef9uZ5I5w4KSSAw3khPvLTPRJTCp8wicqQYD57FkZfM
 6vzb+QfKLdfZ7OagtN6oVMiUv0clSv/guVsZtMQSgi3NOmr5qdHkhYp2GtHvsIGsc3
 dNgfJTc2yPygi93EnYDlmTyahoL9wRJgrULhhfRBvtlJ9hZlxym3ulfe5Rrde8QYZV
 9H0HGNL3kRH2jYoFYav+r1tpmDLKRY/h6HkDmajcGqjHEWAaMoi3/bVUFc6sQ6XDUz
 8rQUPzBdbWuK/30SbmE4o+aCr+sL6IZVfkTBcHPs39PRh2E3eSAFDX2rlSoK/aND5s
 XNLNacl6y+YQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bm8zDUsu
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock5b: add hash for custom
 kernel, uboot
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

Kilian, All,

On 2023-12-06 20:25 +0100, kilian.zinnecker--- via buildroot spake thusly:
> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Thanks for the patch. BR2_DOWNLOAD_FORCE_CHECK_HASHES is quite new, so
the rules for using it are still a bit in a flux.

Peter provided some guidance in a later thread [0], and here's my
extension on it:

For wget downloads, be it http or https, we want a hash, because we want
to protect against two problems:
  - man-in-the-midle attacks
  - rogue upstream replacing the release on the server

For git-clone based downloads, with git:// of http or https, that
retrieve a commit by sha1, we don't _need_ a hash file, because the sha1
of the commit is enough to know tht what we get is what we expect: if
someone manahes to create a new commit with the same sha1 as an existing
commit *and* with their attack payload, then we have a bigger issue
(eveything will collapse, forges first).

Then, for the rest of the download methods: I would believe Mercurial
provides similar guarantees as git does, but I would not bet. For bzr,
cvs, or svn, there is no question about them: they're not secure. scp or
sftp are like wget over https: the transport is secure, protecting
integrity, but we want to ensure the authenticity of the remote file.

Now I realise one point that I completely forgot: if the upstream git
tree disapears, we're left with downloading from a backup mirror (like
s.b.o.). Or one can also use a primary mirror. In thoses cases, we do
want to have a hash for the archive, even if the official is a git-clone
repos.

So, bottom line: we need a hash for all cases. Except when the remote is
known to not be reproducible by design, which will be the few
excpetions.

I initially dropped the kernel part when applying your patch. But in
light of what I wrote above, I'll push a follow up patch fixing it,
sorry for the mess...

[0] https://lore.kernel.org/buildroot/874jgpnn7d.fsf@48ers.dk/

Regards,
Yann E. MORIN.

> ---
>  board/radxa/rock5b/patches/linux/linux.hash | 2 ++
>  board/radxa/rock5b/patches/uboot/uboot.hash | 2 ++
>  configs/rock5b_defconfig                    | 1 +
>  3 files changed, 5 insertions(+)
>  create mode 100644 board/radxa/rock5b/patches/linux/linux.hash
>  create mode 100644 board/radxa/rock5b/patches/uboot/uboot.hash
> 
> diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..95ad749554
> --- /dev/null
> +++ b/board/radxa/rock5b/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br1.tar.gz
> diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..efd629bd2f
> --- /dev/null
> +++ b/board/radxa/rock5b/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  12e921b466ae731cdbc355e6832b7f22bc90b01aeceef9886f98aaba7b394300  u-boot-2023.07.tar.bz2
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index eed656ef5f..2e72b386b1 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -6,6 +6,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=""
>  BR2_TARGET_GENERIC_HOSTNAME="rock5b"
>  BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
>  BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
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
