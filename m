Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE550C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59359607A4;
	Tue, 25 Jan 2022 18:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqnAaL4qWVO2; Tue, 25 Jan 2022 18:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B1260D5E;
	Tue, 25 Jan 2022 18:39:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22E8E1BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E86E401F2
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mn1Zhp3E0fD1 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF881401A3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:38:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8D4815FFBD;
 Tue, 25 Jan 2022 19:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643135900;
 bh=FiHGmr9HnxseRl/KuijX/WvHCfA/a2DeOUlC9tJxGUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KJdpLu/JZdKR8Qf72ExFHyewntvQ+i0QOMHqqQdBYDRt5KVNX5sb4LBJmaww6jy4K
 pQHyDb1ruTKs30St8uvJ0zm1us6iXMTssnA0vT2Gq++DMz4qSt53PC2TMP7L3LzqlF
 XYSefi21YzcEzvSLJ9XwSwyaBfG7HpV9B+9vozmbxlz9ENmz4ctwH1aVtWU5GxqMV9
 b6fxL/m+snMSwDAQtLiZtCqmOkKxy3gJGb/dujtgJDScXYeBJxFth7IC0EWQD/5N8T
 ST+Ffd4gWbAiAvOVjT1Q4U3L01iwTc58oPue0ui0LjqvZ7OMvpLtfGtyMu88w5cPz7
 Xfk/FqSm3NOeA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 19:38:16 +0100
Date: Tue, 25 Jan 2022 19:38:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220125183816.GE457876@scaer>
References: <20220124113749.585264-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124113749.585264-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version
 1.5.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-24 04:37 -0700, James Hilliard spake thusly:
> Drop patch that is now upstream.
> 
> Drop python2 support.
> 
> Drop python-six dependency which is no longer needed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
> index 256f9d5eb6..3bb4e29630 100644
> --- a/package/python-pynacl/Config.in
> +++ b/package/python-pynacl/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PYNACL
>  	bool "python-pynacl"
> +	depends on BR2_PACKAGE_PYTHON3

You forgot to update the comment in paramiko.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

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
