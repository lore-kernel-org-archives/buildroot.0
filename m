Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69583C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 23:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1E8404D1;
	Tue, 31 May 2022 23:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQOavEsMxUa2; Tue, 31 May 2022 23:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9EE404BB;
	Tue, 31 May 2022 23:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6693D1BF836
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51710404BB
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rE13v4yCxCxM for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 23:04:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F7F404B7
 for <buildroot@buildroot.org>; Tue, 31 May 2022 23:04:02 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wAu7ne2PNXOlAwAu8n2qOu; Wed, 01 Jun 2022 01:04:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654038241; bh=wYVpHmMouPe7J6Jtuukr3YiK6TCR8dAH9wFSkGAwFqk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=YbgivlB7vo3MeVazBL3Cey01wC37kVw6wp9uxascea3eCgZkCzQHpgB2vIlLIgsIR
 FrVQBlkVp7izKrUxPCRRB9u69+1rXvOFLTT1mdmj5JzMaXH78JSyl6Lvi0qZjQcGqb
 w9tg+KCeAQFaxah2T9ca5ksXLXgDMbW2/PrNSYIw7t3fcd9yuhdmrrVnFnrc4kXAb9
 GGrhFQKKNQtqwWmbUlAK7nlEnpRQpzVhMM3RQ+sGnwZ4FnAKvaswCAMJK/fKlwPMxd
 JkB5UaYXW/qlhVRzRJjebw1HNZL94xRkVerG/xG7XQzXPNVJHMAIt/QcMFbXhsRBgC
 tSys6XjvMbMKA==
Message-ID: <224404ba-53e9-d97c-0ace-aa8885052ea5@benettiengineering.com>
Date: Wed, 1 Jun 2022 01:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfEca8aYePjq0j0zHxIC8Z9htIHD/Xxq4oB8VhYUgC+dPf/Tjt8xefrNCaGNhGe4s6+kQA/eS5ts5eqwh/a67JQ/q0CyT0KmFAcAn6/aDJ5oKIIzGYuSY
 3m6Hmb980CUAsIagQxsSSIPoqEpLxfSJ8ttzzROktNulRqpEsp+0i+kRHuHs40hmEdwSY4iA3dCObrIo6reep9yEx1SjIGPYC6wL/NLaVZk3QvA7+uSYkISk
 UnGbWMjM9RlIlEjx+lTOqgmSODyHf2usRHgWxVEGfO8bJxyATxllnTi8eWXSObNa5fKboH8xU0FZ68RCWnCbk7V+HT9fsdwQCuBpxcxP+TWPnxxreXY6ZZdV
 Qzn84Ztm4KSjpG3u5JYYebBwuSk7C16lCREyIK9vHn8kXBwWK2A=
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 31/05/22 23:01, Fabrice Fontaine wrote:
> pixman fails to build with BR2_OPTIMIZE_S on sh4{eb,a,aeb}:
> 
> In file included from pixman-fast-path.c:33:
> pixman-fast-path.c: In function 'fast_composite_scaled_nearest_8888_565_normal_OVER':
> pixman-inlines.h:586:1: internal compiler error: Segmentation fault
>    586 | }
>        | ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c9d35d5975311a191dfbe12291398503987e804e
>   - http://autobuild.buildroot.org/results/d34b8672f6211d60af4122bdd94fa8c2f4f4bf6a
>   - http://autobuild.buildroot.org/results/933c4a2e73c987573ecc97172f442b78199462d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   toolchain/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 73ea78624a..7584b85f71 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -199,7 +199,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>   # still exists in gcc = 11.1.0
>   config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
>   	bool
> -	default y if BR2_sh4
> +	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb

I've seen only now that BR2_sh4 stands only for:
"sh4 (SH4 little endian)"
Here I've meant to make it default y when any BR2_sh4* is selected.
But at this point I would use BR2_sh since if we have that selected
then all BR_sh4* cases are included and no other BR2_sh* is present.

Can you please modify according to that?

Thanks a lot
Kind regards
-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas

>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
>   # ICE: in extract_insn, at recog.c:2294 on microblaze.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
