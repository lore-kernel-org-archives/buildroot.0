Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF1EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E80160C01;
	Sat, 15 Jan 2022 09:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyimEVpK8r7c; Sat, 15 Jan 2022 09:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FF060BFA;
	Sat, 15 Jan 2022 09:18:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D66FF1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C461581846
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YD2GUMchRzV5 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E2938145C
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:18:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DDC6B19F59D;
 Sat, 15 Jan 2022 10:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642238287;
 bh=P7TlXn6JqEAp9tXtVsYKz6Hfi1JFGGq1LRisxY3gBnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qms2ELY24UArkgDoNPF2JNyZbGQcD4YNhRZ7z4d9CZD8NN8VseLnhYgsxn3sYikZx
 2LZRd5PdnJ5ITo3sDEGiA3mPE5eLH3P7pdwsU7wpxpoPpoCiLa+Tp00TzziXXp/IHa
 vLs4GxxJkhm8dpcPQ2V/aQ8mHAkrBa4UAl135+L4nkcr2ZxCFi/0+E2CdVkbalwA81
 bkhh/nQ4CiVpToX46F9mT7QkkhfVqxTxrL+/Zg+VU6q7Iy4KI0WwPRdcR+xESrLbwp
 oAkz72xDLS5jFBamyod2qTfOfPJhD/Z9dKMIq0o8AMTzq+q66Pcnx8MymlbXim1D94
 3h4isssjlKo6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:18:03 +0100
Date: Sat, 15 Jan 2022 10:18:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220115091803.GA1945846@scaer>
References: <20220115015004.2531151-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115015004.2531151-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux/util-linux-libs: add
 a missing patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2022-01-14 17:50 -0800, TIAN Yuanhao spake thusly:
> The commit 2f5068640161f7b267099e28b69d4c2280b4ded3 added a patch for
> util-linux, but forgot to create a symlink to util-linux-libs. This
> results in inconsistent libblkid.so builds from util-linux and
> util-linux-libs.
> 
> If you enable BR2_PER_PACKAGE_DIRECTORIES, you will find that different
> libblkid.so is used in different
> $(BASE_DIR)/per-package/$(PKG)_NAME/target.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ibblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> 
> diff --git a/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> new file mode 120000
> index 0000000000..2f3c482144
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> @@ -0,0 +1 @@
> +../0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> \ No newline at end of file
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
