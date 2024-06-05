Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57966C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 19:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0267E40322;
	Wed,  5 Jun 2024 19:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vfgrqyezh8kg; Wed,  5 Jun 2024 19:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E4B040894
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4B040894;
	Wed,  5 Jun 2024 19:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9131B1BF5AD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D09040322
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 19:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uU_aT3CU-jXM for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 19:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E81F40894
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E81F40894
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E81F40894
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 19:10:04 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ew1JsLgFl7AmWEw1JsufGF; Wed, 05 Jun 2024 21:10:01 +0200
Message-ID: <7749bf91-190f-4b52-885d-107d42d57c14@benettiengineering.com>
Date: Wed, 5 Jun 2024 21:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <f4334264ed663d495ff9c8a095c0f56b4b4daaa3.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <f4334264ed663d495ff9c8a095c0f56b4b4daaa3.1717609998.git.yann.morin.1998@free.fr>
X-CMAE-Envelope: MS4xfDbsft4GXjFPsOILUoFGcjHxW5vYidTIW5u3OMQ8R6uNqVQiNSBvn26bqCXiq0VnP92QvggcVPLVwHTxNbYnT20vssz7vVhcbl5TO3pNLuHb8Uxo+hpW
 xHWY63dsBrOXtBDhVbvmQyZOdOmGR38JLKp1vtH872IkzTBvx5w01dFc5CJUaGlg+mQZMGsbiMGOhZSxEHkOKslNIv3OLYgTo/UaQX1Xwrk4Rdn0yrlMcENd
 3VQyy/LEH3Pn3vq1zrH8zQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717614601; bh=Kv4nythsSrZ41XRJ8FNTQiHKfe6vfGmgP+WIzeOhquo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WsmSt6iFCfLmwuLwTUOYYyxgs/ceEIa2Z9evUVm8PpfEp2YLEOF0AKVPd3afcpZs/
 NPdVhjFvIwZV5OdWO0dcboiIiUFt5t3Q/We1iDomp/5xteVjn/+9iuw1mBSIagsKks
 EnCDr1r+7BktbSTbnNrHcosD8qPu2j387Y3G2qJDtmgbqCD+O5T9hjk9mhMPhVO8PC
 Qk7eKBeZ6LgBH9cjsXQAVFz0+0BDpzH5yBgF9FpVU0VX1pMqotUWU6O1FMvva5eJMB
 R/9IhoLFPani4TTgw7dj2a+whFpOtx72r7zgeqOz5n5/KGmb0WmuG77jmh1wK1lzOM
 guinyq0CUP1PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WsmSt6iF
Subject: Re: [Buildroot] [PATCH 10/10 v2] package/sunxi-mali-utgard-driver:
 handle patching the Buildroot way
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 05/06/24 19:53, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you for the cleaner approach.
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering

> ---
>   .../0001-build.sh-do-not-apply-patches.patch  | 39 +++++++++++++++++++
>   .../sunxi-mali-utgard-driver.mk               |  3 +-
>   2 files changed, 40 insertions(+), 2 deletions(-)
>   create mode 100644 package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> 
> diff --git a/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> new file mode 100644
> index 0000000000..02c6aa7884
> --- /dev/null
> +++ b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
> @@ -0,0 +1,39 @@
> +From 079ed8aa57ba6629b992c3d0d01904d3e5170d3b Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Wed, 5 Jun 2024 13:06:16 +0200
> +Subject: [PATCH] build.sh: do not apply patches
> +
> +In Buildroot, we handle applying the patches in a generic way, with
> +appropriate tools (e.g. with a proper tar).
> +
> +Upstream: not applicable
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +---
> + build.sh | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/build.sh b/build.sh
> +index d1fedff..26efc53 100755
> +--- a/build.sh
> ++++ b/build.sh
> +@@ -10,6 +10,8 @@ BUILD_OPTS="USING_UMP=0
> + 	    USING_DEVFREQ=1"
> +
> + apply_patches() {
> ++    return 0  # Patching handled by Buildroot
> ++
> +     pushd $2
> +
> +     quilt push -a
> +@@ -22,6 +24,8 @@ apply_patches() {
> + }
> +
> + unapply_patches() {
> ++    return 0  # Patching handled by Buildroot
> ++
> +     pushd $2
> +
> +     quilt pop -a
> +--
> +2.45.1
> +
> diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> index 72fade58ed..b8a12247d3 100644
> --- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> +++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
> @@ -16,8 +16,7 @@ SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
>   
>   define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
>   	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
> -	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
> -		$(@D)/build.sh
> +	$(APPLY_PATCHES) $(@D)/$(SUNXI_MALI_UTGARD_REV) $(@D)/patches
>   endef
>   
>   SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
