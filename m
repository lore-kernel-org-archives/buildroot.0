Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86B606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aOLJoO/F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB57381466;
	Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5Vj6OdDZtmn; Fri, 30 Oct 2026 15:26:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C62C813E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373984;
	b=cZ+i6vU9era486VlQGTWFxzg/t6xHwPWTwt+xFTlrP73zqCWRK8Vz9QpZhJ9MQAB8sUa
	 /ucFYzapDuSubGlhu6g4tHw9QoLn/xoyEHR398NpHB7EGHMRBKozfoVmOtyrgcUyLai2b
	 sC/LouhmcKSyxDRpgefmprjQOxPHcfGCM2CphxUd8cvm1Ovji3/4u82y6naqk4pvwRUyU
	 oroY212HcT2Hcaq1HDbJXYucet7vVFnpbSstgMDyvw73kEXgf4sVJguuXrb9q6iMBRPav
	 roQtgu8nzznfkfmIk0NyQulp9VRAOTr9EPWeLIDORx0s29nQs10InNp39LiPcgLalfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ll71+8dcr1AKNi6ElE/4ceYd5uHWppYbrV0VkBAxZYA=;
	b=VPsA0Sxum0/LxGVEd8xufbae3pTbbAIibOz98uadSYLm0PTZWz8YVTtmAcpPP8cUd/bk
	 Js3TkqfMzkVvDjg66s2jC/F+pedU30tH8WHQrdkFL7hOBQt+R80cXRmIQ7ifc8ZEqhNgE
	 UEOj3Eym2BemvvrGGHbElseH252dM4TfdH6OgnGH6kTvygO6/2Rwb017eDeCQIsWr8Nwt
	 fpU5uz4cbiuJHJyHbYO1KkRYDefO3Ybk2esFt5jWYjHWLUEoFxsGdk3AlqRZJ0MvKL+ig
	 kzfXDGSWUuAyzPuHyBTH55+mbZjLuVigRefSSx5Kq3gn5H0XuVrug8AhU+I8W/X9rzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373984;
	bh=ll71+8dcr1AKNi6ElE/4ceYd5uHWppYbrV0VkBAxZYA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aOLJoO/FS2Vc8NhZLNnUy3Nkam2ctonClUOej27VJcLOoQfAD25epza5oSu8LsuC+
	 rKNTrp91Az8GJ5uMjYQX1Z2kKmmwkbh0vBtoIJBBmUYTB1ihxJvh1HArJgty4BiHxj
	 J2+jq+V1O05oe4+h6EHjZEm36pjMddPV7lPKCl1xtdbjVlnJ5UtxWMToqQNZkQLcTW
	 gsa1DiifUwIkLpJHFs1au7QLl3RgYM1l4t8hdzdErFJyyy+UFPQTPvj/x0BO++zVH5
	 9zEAoV0XftYv5zHVAa1xwTP9RnW3E1/+r0mJa9G9s0oCrTMNm51bwSMQ+ffg8tPWRD
	 2pF4912myLPkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C62C813E7;
	Fri, 30 Oct 2026 15:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C26AD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82B1640530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5hBBbEq1AyS for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2C75B40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373975;
 b=PzpIe2i859wqHYdMvmCcumoSPmtCxtVjh2xN7d+IbagSQPMDlB4WBQ0InMS8CZgP2Jvv
 ijN5Wp7dguGb6L4E1RqbwrfKs1HyNAdN1CYU2LFB2qTKcTOpYvZVgWz2hFQtKvFFZTx7o
 EipA6ZnUjmSu7IGQhVMf9AbFdMj7Oo5/7uceGGag3SuDLAWsSEUJx1bl3mkvKHQ8g5c64
 a1he+k5/8PpOwhPfvzLxqSH6d82FqQ1R46X+0Je61WkdQvB0jijYTo+z+5ZDgDOLtHNsz
 hMPorye/kcoU/o+OO0NN/mh52qBTMtG1SrC9L4YmItpL5BZcxwF7JlIUjmEVDnVPAOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373975;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=pRDnbt/V5Fc6714lOoh1olz1pzFQTG9abCuIL9RSU/4=;
 b=lbPlfrml3c5Q5RZtD8RPaSqjqUV71TH2NNTlGj2fdsO5XKDSnIcdkwZbhF8GbW3VLk3E
 1Twg8meyDPU5DDUpIwwPCXvrHNM7U7gSRMR6C/LtB9LCyBDkLRj18RsCJu+qWICWK2wQp
 yQ/2jFluoNfViaR4usVT7NR+EKRDy8baaT5nNBqTDGiQUq1kfJdo8PhBFocgHHRFGa9Qw
 RUPYRCZUFoXf0nGAQtY7+eDtvElSbYGmcjxQ9EYKkDIHmbs/Z3W5NmJROT6QdtlCf3dqI
 ulPYtGrcPmKg/DWcgSfH5BerdAh1UaFzMPxGmz/nNyAIX9Nf7qRxtl0Lf/pdlcmcUOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LRTpu9H3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C75B40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so4437665e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373972; x=1793978772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pRDnbt/V5Fc6714lOoh1olz1pzFQTG9abCuIL9RSU/4=;
 b=hEe+L4swirHvZ4nlAyVQZhtPLPnjAIU/MNh4sKpzTXLwMJ/qV7rxjRm8VnjDxfhxQZ
 8gYOY+oBP6+kb4LhoSbdLX7W+7i50x5si3t9IkslHQKX+er11dGkD868F7NcXElHenLL
 N0YaGd9x9cXB3mdkYJwkcHCLyR1mH7XqxzYxf+h8juHzZmr7FCqYNMN7Q7CP6eziVLjr
 waLMHFaMs01L01XAlLzvpTKYD0nJss73uIXikH5P29+WCjJpnJqrQRuGHGLFJGCCTog8
 gXndp4bm56i3DN/YYq8d7LYYVxRYbht0Ep5xreky0I8FA76X9Q20YdeL20It1MsWAl3P
 29cw==
X-Gm-Message-State: AFq9FYL2ItqPMzVq0A1IUhm8NUwuKqsSzufoCI9Bzpm1NDgAe7S6iIcs
 Q5kPzdsAcsYHVHxOHUKqU1rJK+grFltVb936fHQTcry47FTmHT6Fn4EbyebICs0VFrz72THW+m7
 5eCGN0hw=
X-Gm-Gg: AYBFou3oPXZHZjecJb3mviHhS2QDAf5K5WsaIVRat1kvDxA+qkd48NJ5vaKCXNS8mVP
 v4rMHEeWwM1P5nxtd5qDxk+siHIglwM44KiM2GO92LG/P+RyTmwq+k9GeUNdk+JPF6VaFMHe2Bb
 wXb+udolFnr7S6DCWfR6ifSoAv29iGLvw7jHPIeHI2mmlJ1RcjnSy78Iw3HPxV/FA9FWf0OxCZ8
 PDaHGtfIk+vRhyMZeO0HMqVP6kPr6eOlYBzeuPZI9oTuTShMJI0aSa6xTNqTS98xfVk3wxUrA2w
 oVGKgQK7/3mro4wq5Rr1iE2CB/eqNlTx8K6pN+qEhREOmNwpjuIQsZVoX7aX1CtsoBpnDQBQ1gR
 Kr4kbEx5y0vtqgaTGibwwJy8yLJeWZcu9R/gokxWlorJ3G9J+9WM5SOPwOlUYYq0uoPJg5iVCrP
 ZL4WVVb3SCZ/6cCBjv+38/Fcbl/MZauFsGrXbdtraaxNhF5V7iNiwvj9/tVwgQkH/efiU5Kznpn
 oXZp1mMWdYEOHkaQURsKVu3G18qw+7KtJmd+7N2lLzcOV7cBAQ34DYxvqCxtelr34Fa8PHMGQ16
 kf0jG06gUAgvPzGR9uwcj42I1VcJfqPDmkqdCmIjYYNWfGb2Nq73TSS4z00tRrJwaNmf8kbh
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id
 5b1f17b1804b1-4ac1889d5a1mr60703015e9.28.1793373972448; 
 Fri, 30 Oct 2026 08:26:12 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf368bff7sm68501345e9.2.2026.10.30.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:11 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:09 +0100
Message-ID: <20261030152611.1905988-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011074658.1888569-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk: further refine
 libtool 2.6 patching
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> 5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk:
> also handle libtool 2.6.x") added some patching logic for libtool
> 2.6.x, in order to fix a build issue in cryptsetup, which uses libtool
> 2.6.2.
> 
> However, the change in this commit applied the newly added libtool
> patch to all 2.6.x libtool versions.. which broke libmodbus that uses
> libtool 2.6.0, and unfortunately the ltmain.sh in libtool 2.6.0 and
> 2.6.2 is sufficiently different that the same patch doesn't apply to
> both.
> 
> So we:
> 
> 1. Rename buildroot-libtool-v2.6.patch to buildroot-libtool-v2.6.2.patch
> 
> 2. Introduce a buildroot-libtool-v2.6.0.patch
> 
> 3. Update the logic in pkg-autotools.mk to apply
>    buildroot-libtool-v2.6.0.patch to libtool 2.6.0 and 2.6.1, and
>    buildroot-libtool-v2.6.2.patch to libtool 2.6.2 and later. Note that
>    we didn't test with libtool 2.6.1 as we didn't identify a package
>    using this libtool version: we for now assume that it will be like
>    2.6.0, and will fix later if needed.
> 
> Fixes: https://autobuild.buildroot.net/results/3faf9e6889cbe33019141450a95023c730a6d03c/
> Fixes: 5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk: also handle libtool 2.6.x")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .checkpackageignore                           |  3 +-
>  package/pkg-autotools.mk                      |  6 +++-
>  ...6.patch => buildroot-libtool-v2.6.0.patch} | 28 +++++++++----------
>  ...6.patch => buildroot-libtool-v2.6.2.patch} |  0
>  4 files changed, 21 insertions(+), 16 deletions(-)
>  copy support/libtool/{buildroot-libtool-v2.6.patch => buildroot-libtool-v2.6.0.patch} (86%)
>  rename support/libtool/{buildroot-libtool-v2.6.patch => buildroot-libtool-v2.6.2.patch} (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 83c1e0c66a..7ad121d393 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -981,7 +981,8 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
>  support/libtool/buildroot-libtool-v2.2.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
>  support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Upstream
>  support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
> -support/libtool/buildroot-libtool-v2.6.patch lib_patch.ApplyOrder lib_patch.Upstream
> +support/libtool/buildroot-libtool-v2.6.0.patch lib_patch.ApplyOrder lib_patch.Upstream
> +support/libtool/buildroot-libtool-v2.6.2.patch lib_patch.ApplyOrder lib_patch.Upstream
>  support/misc/relocate-sdk.sh Shellcheck
>  support/scripts/apply-patches.sh Shellcheck
>  support/scripts/check-bin-arch Shellcheck
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index da33909881..bb65d639df 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -77,7 +77,11 @@ define LIBTOOL_PATCH_HOOK
>  		elif test $${ltmain_version} = "2.5"; then\
>  			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
>  		elif test $${ltmain_version} = "2.6"; then\
> -			patch -i support/libtool/buildroot-libtool-v2.6.patch $${i}; \
> +			if test $${ltmain_patchlevel:-0} -ge 2; then\
> +				patch -i support/libtool/buildroot-libtool-v2.6.2.patch $${i}; \
> +			else \
> +				patch -i support/libtool/buildroot-libtool-v2.6.0.patch $${i}; \
> +			fi \
>  		fi \
>  	done
>  endef
> diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.0.patch
> similarity index 86%
> copy from support/libtool/buildroot-libtool-v2.6.patch
> copy to support/libtool/buildroot-libtool-v2.6.0.patch
> index b3968b1289..ece3134ce9 100644
> --- a/support/libtool/buildroot-libtool-v2.6.patch
> +++ b/support/libtool/buildroot-libtool-v2.6.0.patch
> @@ -1,11 +1,11 @@
>  Libtool fixes for cross-compilation, many past contributors/authors.
> -Update based on libtool-2.6.2.
> +Update based on libtool-2.6.0.
>  
> -Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  
> ---- a/ltmain.sh
> -+++ b/ltmain.sh
> -@@ -3008,9 +3008,8 @@
> +--- a/ltmain.sh	2026-10-11 09:19:50.195676649 +0200
> ++++ b/ltmain.sh	2026-10-11 09:20:44.054085154 +0200
> +@@ -3015,9 +3015,8 @@
>   	# was found and let the user know that the "--tag" command
>   	# line option must be used.
>   	if test -z "$tagname"; then
> @@ -17,7 +17,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   #	else
>   #	  func_verbose "using $tagname tagged configuration"
>   	fi
> -@@ -4746,8 +4745,12 @@
> +@@ -4753,8 +4752,12 @@
>   	  # At present, this check doesn't affect windows .dll's that
>   	  # are installed into $libdir/../bin (currently, that works fine)
>   	  # but it's something to keep an eye on.
> @@ -32,9 +32,9 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   
>   	  if test -n "$inst_prefix_dir"; then
>   	    # Stick the inst_prefix_dir data into the link command.
> -@@ -7063,7 +7066,8 @@
> +@@ -7062,7 +7065,8 @@
>   	;;
> -       -all-static | -static | -static-libtool-libs | --static | -Bstatic)
> +       -all-static | -static | -static-libtool-libs)
>   	case $arg in
>  -	-all-static)
>  +	# Make -static behave like -all-static -GZ
> @@ -42,7 +42,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
>   	    func_warning "complete static linking is impossible in this configuration"
>   	  fi
> -@@ -7072,12 +7076,6 @@
> +@@ -7071,12 +7075,6 @@
>   	  fi
>   	  prefer_static_libs=yes
>   	  ;;
> @@ -52,10 +52,10 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  -	  fi
>  -	  prefer_static_libs=built
>  -	  ;;
> - 	-static-libtool-libs | --static | -Bstatic)
> + 	-static-libtool-libs)
>   	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
>   	    dlopen_self=$dlopen_self_static
> -@@ -7393,7 +7391,8 @@
> +@@ -7382,7 +7380,8 @@
>         prevarg=$arg
>   
>         case $arg in
> @@ -65,7 +65,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   	if test -n "$link_static_flag"; then
>   	  # See comment for -static flag below, for more details.
>   	  func_append compile_command " $link_static_flag"
> -@@ -7695,7 +7694,7 @@
> +@@ -7684,7 +7683,7 @@
>   	continue
>   	;;
>   
> @@ -74,7 +74,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   	# The effects of -static are defined in a previous loop.
>   	# We used to do the same as -all-static on platforms that
>   	# didn't have a PIC flag, but the assumption that the effects
> -@@ -8755,7 +8754,7 @@
> +@@ -8718,7 +8717,7 @@
>   	  *)
>   	    if test no = "$installed"; then
>   	      func_append notinst_deplibs " $lib"
> @@ -83,7 +83,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   	    fi
>   	    ;;
>   	  esac
> -@@ -11296,6 +11295,10 @@
> +@@ -11247,6 +11246,10 @@
>   	    # Replace all uninstalled libtool libraries with the installed ones
>   	    newdependency_libs=
>   	    for deplib in $dependency_libs; do
> diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.2.patch
> similarity index 100%
> rename from support/libtool/buildroot-libtool-v2.6.patch
> rename to support/libtool/buildroot-libtool-v2.6.2.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
