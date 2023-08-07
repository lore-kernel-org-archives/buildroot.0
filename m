Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B16C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B2740A51;
	Mon,  7 Aug 2023 18:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B2740A51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdtNoWbI2tUc; Mon,  7 Aug 2023 18:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6B940297;
	Mon,  7 Aug 2023 18:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6B940297
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C91BA1BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 18:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A016103D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 18:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A016103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkY-Scfvp89o for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 18:42:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D234960FF7
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 18:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D234960FF7
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.222.147]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1pnimv2C7P-012o7b; Mon, 07
 Aug 2023 20:42:02 +0200
Message-ID: <e9ac6d7f-0643-7a84-5f9c-31ec9a9ddd31@gmx.at>
Date: Mon, 7 Aug 2023 20:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <ZNEOketbv2Ba6O5N@waldemar-brodkorb.de>
X-Provags-ID: V03:K1:r59SSirSgoYzyGJpVO+spAP8irdpMsRuVQXgcNsUoz8V7ZMXfBZ
 V+fmQqMC72VlWMGS/iC/SJ/eEx+eSLTuxY5JArJo62UGuDsIxm4bJowJGXdXh4X9RiSvzHS
 Kk2oBXvmgIwi5j1twu6wLEaqvNd/VAb9osfXNoyLLW5RcK85kmy18mCOsllqQhXLKIc/nvG
 PjOIWRLTeNY3/eFi3DEyA==
UI-OutboundReport: notjunk:1;M01:P0:UJZr2141J2M=;XztXbgjxYP9znMwPqh6TeCpPqfK
 D/OnB3QrhWrY2ZYS19ZMK+vmHvSZXB9l4Btj1lV7DLDH7+gzv1rvR5xJ+kuyZxlE8kAEXxRe4
 mj44lar0p38qoN7OeXuNujJdziaQbbymO41moO0afqHseJrR5gnmtQyzVCduFYOYcXk15zRml
 bd4Rgw9TDXP/K1VohrgK+tltlpuJYhP5HOGAVEDrlrMyAzDpaY+6k9MVmcyAxu2ZZLgMAid0B
 4h7Gk/uofNoe893MNKJzvop33xeHL02hjd+1wjlpOZWEH9Y4GNbf0z0n4X+3/nTdR9zODe2Ma
 UlYGHhw3/R/KOKD982f7FKWgtIuTB7fGWEaroSyVnE6PblCqFgL/QcsbVWF5vOum9l+oGjbaq
 /1fSqqGk76H09qQsYOzIwTGz/OSLOKVt5yS2OM23AQihmiaBQVRfuKhhRDxoc6181dIZYdvTg
 W46x2Z1fUBF2nCvV8FSsg8bVgr0LtzfoU2MX5KXO03LmceAnCKVqv5K7hn3SVIeLRN5Dtz3BI
 yib2WOG0ZCE5QwLqCIe0AxCBKcYRHLQuJkkH38vnKlqrDcntzXEkvuszA5KyWPNUExXUh7VR3
 d4AUyFbV8PDyQTERjwrEvBeQqL/kc39tDLmY2x03Mc0YAsB2YjKyYBc3po/h04Kb7X+4Vk9/V
 UUkQZt29KFzv0e6DqgYErvwyhCrHKnh1eFR1qHMWnPjr9JFIzL1sQ8sI7uPxm4t9YXthjLIS1
 /MdN98/25KLpIWiJE4fBlr5wxoFDH3SKD2AC+ZmUnWIqO79MnhPtTsUpULPA+Dm/5wKWRaSqr
 zlQovEJi7PLiqCNA4H4PLX9fi9pXQtMGYs8MyMdEMpHA+7BrKZnPlnG35tunujvnBdyKw2/AB
 N0gOKjDYail2Cf2ciR1p6K5vdpUGQdzLTBnTjLmcA5i4JJCM08U5rIkH0qIZzbS66U/uvSf2Z
 2BqrysJ4AqNeZFHRHqqJ31zb2fU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691433722; x=1692038522; i=dalang@gmx.at;
 bh=P39aXLD3eJugfKywh/8CItLIbt95AluCU/fyOhkxknE=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=NGzjsgLCZzfXx3XwCQg/+iERc/57u6ppwDOT4ypBjSsE6Tji3A+6oX6GMeKHP45RtiBM3Xs
 Ve4JxRkqaTg2L5vFUB5RPwmQPPJ8WiA3WDOcPo9j4DQCSLoJ8ogMF3kuiqQapZuYiTw9sDy6i
 VAXJk+JusAM1SnndsAQ1YtTB8pdkC+rJXyCVVhoVB3EQHRYGHWQAFW0MVxCisAHY1mmb8yixJ
 OMbZz4agXBTM2B/OtD7Gki89yH85nWED5leCgCZrlaInEBIbgISxW84VYs4dnpTJ+HBdzte5P
 saxajqbL5IBprZr5UTp16u+gz0Wid76QOchRUm+s1hwXHxlHylvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=NGzjsgLC
Subject: Re: [Buildroot] [PATCH] package/check: fix compile issue
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

Hello Waldemar,

some quick notes below

On 07.08.23 17:32, Waldemar Brodkorb wrote:
> Switch to the tagged version of check.
> See here for details:
> https://github.com/libcheck/check/issues/303
>
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/b10/b1087e9a67ff0382632b73f280fabe92cd863593/

If you just put the following line there:
Fixes:
- http://autobuild.buildroot.net/results/b10/b1087e9a67ff0382632b73f280fabe92cd863593/
patchwork will pick up, that your patch fixes something,
which makes it easier for maintainers to spot the patch.

>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/check/check.hash | 2 +-
>  package/check/check.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/check/check.hash b/package/check/check.hash
> index 543e78f317..3d7538b2f2 100644
> --- a/package/check/check.hash
> +++ b/package/check/check.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a  check-0.15.2.tar.gz
> +sha256  998d355294bb94072f40584272cf4424571c396c631620ce463f6ea97aa67d2e  0.15.2.tar.gz
>  # License files, locally calculated
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LESSER
> diff --git a/package/check/check.mk b/package/check/check.mk
> index d3977154df..dab2b76911 100644
> --- a/package/check/check.mk
> +++ b/package/check/check.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>
>  CHECK_VERSION = 0.15.2
> -CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
> +CHECK_SOURCE = $(CHECK_VERSION).tar.gz
> +CHECK_SITE = https://github.com/libcheck/check/archive/refs/tags

When using the autogenerated archive from github, one should use the
github helper as described in the manual [0]:

CHECK_SITE = $(call github,libcheck,check,$(CHECK_VERSION))

CHECK_SOURCE can be dropped. Buildroot will download an archive
named check-0.15.2.tar.gz which will have the same hash as the
one you calculated for 0.15.2.tar.gz

>  CHECK_INSTALL_STAGING = YES
>  CHECK_DEPENDENCIES = host-pkgconf
>  CHECK_LICENSE = LGPL-2.1+
[0]: https://buildroot.org/downloads/manual/manual.html#github-download-url

Regards
Daniel

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
