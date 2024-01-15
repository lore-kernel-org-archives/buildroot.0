Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0568C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6B0811BB;
	Mon, 15 Jan 2024 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6B0811BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrXQ2mKGEnOy; Mon, 15 Jan 2024 22:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBBE280FA4;
	Mon, 15 Jan 2024 22:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBBE280FA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA76E1BF39D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2AA41B3D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 22:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC2AA41B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyL46OQssdUw for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 22:08:57 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77FAE41DF8
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 22:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FAE41DF8
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PV8XrwbFGSo8WPV8YrwEp3; Mon, 15 Jan 2024 23:08:54 +0100
Message-ID: <167d3968-1070-42dd-a140-f26a9d6d9657@benettiengineering.com>
Date: Mon, 15 Jan 2024 23:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
 <20240115213415.17439-2-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240115213415.17439-2-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfKfefmFAQjy83tZYQoWEyCr6n7DoCoxWEkcUPSSe4DV3gKxhao73epzCI8BLWOyhT9dCpJqG/EKkvmXwg9cspQFOm/66n6fozXrnRcWm1fGngpMpcXqp
 oyEquoZiBp3C73xPEu+LmNWsTEoK0IQ0luydqWTg0gp5HbTbUQU6/UIfj1f7AlSHfEnqUj9ZooIj227DCllle1QCM+dJnmzQrgHB3fWwyRUqJsmn5WmxyDkv
 PdrM7rAeiMMeqsz1z+k4hoXzmMvQnoFieJrPyDtetbR08RXzLr54/Tih56IwAqqIP6wOcsAf/nAZdl0eS7tFh1KmVbCBIERQcv6hbIj7LdS7x0x11PHsCcTB
 SWQd3+RvBVKkhyTjK4s+LXTLgMVuEbmsn2eVWlG8l1LolWubjU3xKwXqWmMw6MrWIHcxaJHUvRPOgsVz6uuAVvvoTo92GCSfh1tIay6piEWBn8YDne+LzDcF
 yiXb85krvkZKVZyH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705356534; bh=Nj/cC8BP2rXuzt5aS0DwNNS93HQWU1AckLA2tGuAh2I=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QlcHO3hvewUNAJf3Qblp+5ojsYSk7pL7aALSHtRv5x1DSLNNtydFBhyPK2oc0e5RI
 b7FWq92kqkBPs3hwWaXJB5cZVXeJnPvnvNwIpSfUh882tIkwXPfVpVZ3Xigwt/ir39
 3qqe6e9JLbK1fK5DbYiZUCdDyZbE3YPPWpArOGAgs5/qa5XcTYN2J9Iqbf8NXrQu8q
 gJ44Vz36ZsJdgU7inZiqrrJHWHWtret4DOgMKKxNF5mbthxSVPcP42GPcb1soEC3Ao
 Wr5+nsf3IhytbrXNJlEmCr7KZAuRezRlpYDu6aiG7oGlpb+mgPm74zhqYARj0sPIdx
 /wZU5sGaHDOkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QlcHO3hv
Subject: Re: [Buildroot] [PATCH 2/2] package/attr: affected by gcc bug 101766
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 15/01/24 22:34, Fabrice Fontaine wrote:
> attr is affected by gcc bug 101766 since version 1.5.2 and
> https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=11b9069098b4d4c23efb06c9457a085b784354d4
> resulting in the following build failure on microblaze since commit
> b31b91296e7f985b909f104f06a098adddef1fea:
> 
> libattr/syscalls.c:133:10: error: symver is only supported on ELF platforms
>    133 | # pragma GCC visibility pop
>        |          ^~~

Please add:
So let's disable package attr and packages depending on it.

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/acl/Config.in     | 4 ++++
>   package/attr/Config.in    | 4 ++++
>   package/systemd/Config.in | 4 ++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/package/acl/Config.in b/package/acl/Config.in
> index 92f2251878..132c6e8ad3 100644
> --- a/package/acl/Config.in
> +++ b/package/acl/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_ACL
>   	bool "acl"
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
>   	select BR2_PACKAGE_ATTR
>   	help
>   	  POSIX Access Control Lists, which are used to define more
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_ACL
>   	  This package also provides libacl.
>   
>   	  http://savannah.nongnu.org/projects/acl
> +
> +comment "acl needs a toolchain not affected by GCC bug 101766"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
> diff --git a/package/attr/Config.in b/package/attr/Config.in
> index 554772b75d..b9d9f57d8f 100644
> --- a/package/attr/Config.in
> +++ b/package/attr/Config.in
> @@ -1,7 +1,11 @@
>   config BR2_PACKAGE_ATTR
>   	bool "attr"
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766
>   	help
>   	  Commands for Manipulating Filesystem Extended Attributes.
>   	  This package also provides libattr.
>   
>   	  http://savannah.nongnu.org/projects/attr
> +
> +comment "attr needs a toolchain not affected by GCC bug 101766"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 859332d9e4..f0f92b78b0 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -451,6 +451,7 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
>   
>   config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
>   	bool "enable SMACK support"
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_101766 # attr
>   	select BR2_PACKAGE_ATTR
>   	select BR2_PACKAGE_SMACK
>   	help
> @@ -463,6 +464,9 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
>   	  When this feature is enabled, Systemd mounts smackfs and
>   	  manages security labels for sockets.
>   
> +comment "SMACK support needs a toolchain not affected by GCC bug 101766"
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_101766
> +
>   config BR2_PACKAGE_SYSTEMD_SYSEXT
>   	bool "enable sysext support"
>   	help

I've found that following dependency is missing:
BR2_PACKAGE_LUA_FLU

Do you mind sending a V2 with that dependency and rewording a bit like
I've pointed above?

With those included you can add:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
