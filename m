Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E50606A336
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FUrkfmNK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C99740D9A;
	Fri, 30 Oct 2026 15:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVDbvFYpjd3C; Fri, 30 Oct 2026 15:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17C2540D72
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374157;
	b=HVG9qNJLpHvCzEEw3omNVJ1ZckHFMXvL9XUTykiBL6fIUgghY1LQha7g3elmzrYOdSwb
	 iOeuW17lDLBVdFWoeZ/nNOgdNpNwY17DBvtWauo07R0gyBiA0NpWyB5fTf/feQwGgkosU
	 3vaxFpt9G689AGtIQG+IVV2X3QtQx/O39cNIbJnCqTii61230BlC3X919kTguQteMZMLp
	 jx/2Wv0EITxzhOD/E+r3UkFAOA9PDg4fOcVGicnVMlUxxEzvtBGvA1r83o9kZdd9+wX+d
	 vnqQUb8QWObKv9DP9bD4Ss3Xlrtn2cZNCrMyP/3L8YecboPJpAl8jQrLQGWnXjaTEiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SkY9660Lb9uqaslMWULvKJDi/TdKitIM+0je8X7mmIo=;
	b=GUVqYxppneq2MsePXi3ksDoX7KKf3FKES7a7lDfYIYUhxqsDM2KU2bK5/01YiD97tCxn
	 HPflB/s8OfggD/m0527VUhMdg6aB6ciMCD9fnzH2Zma71s4IAyQiDFh8undPBaxGpMT3F
	 8MDTrkhnLEsanb3jMJFYsgedQ5q+nt0Ba18DUbwNOtdbTtxxxaa+ceNuG97z8GkQE5Dxz
	 61eEP4eVMAafqzOv1BSsJdQTEklSLyEALIy/71eIGcb8N7S8up48gmDLoJ3Fz1LWO5PrO
	 79/gr6LEo3ZzFJOFxdfb2tNEX87snF1cXoTXiz+F/oyD8MIhE35kWltwUTI/8qzE7MA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374157;
	bh=SkY9660Lb9uqaslMWULvKJDi/TdKitIM+0je8X7mmIo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FUrkfmNKC70OKMRH+i3f+gE+hfXrHPmxANfoAePzCk9mVXLUzqpLJSf9oJJraWQld
	 KQsORlWad9+JcASRkbzzT0zeJQOZAUe5UyyqRp693rNCISyO1IevgIWeDIght8T7td
	 5nwzzosTbvTGsKnV3Vn6bcUFALMk5tTQea4mqCLGP0o79lGmTks03jdFmALF3mt7Kt
	 a1Kz8QDeRyhuR6GGJYAmfIdw8DvboSYoOIR0wUcUMuHjOHe0eCuW4pqhg4Bv0ol2VQ
	 iLTpw/8z1VBReMkLPaGAvcsJYop/z5opcr2G6nWzHfjWljUrAz8ymlCxwe1y32yNVE
	 r3vwkK4YqlZNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C2540D72;
	Fri, 30 Oct 2026 15:29:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0646E235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E04A04053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsiKhJUkOtXt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CBECC40530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374102;
 b=dyq1KSUaJRkUc5L7WhPboSInFU0hZEGvvSsAyLOQ3ewX9r4EoAlhsn/CQ7LNTmOkW+cg
 FjW+2HhEeV0EJg+QuLa2JXwXxt0kExdTnrlnA6+tILgFe1KSW/QNM/3laoEvV1b0fR0xY
 rWjZsu6uT78I8Mi8/YN9zR3+vis5UZUHozDWP1mwQ/3mhm5sJJak2F3/FpggtXezASqb3
 G3LwiH5SuzL8jJ0EG8ADchExdZrKL50bVhiWWq0nSBE9+tHXoqTLE7ZrcpV21GBZnr42y
 BdDlXMjCBOlcFJp5Vm+WZZCEizV9WQvb9fD/QxVqKYnknhsDXecpJniyXJxTJwTha2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374102;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=TqVrHXhnPZXX0gPHQYW3B1WDORErNvTTsyut6aR7rzQ=;
 b=NYHc3AyNKVPG0AesZI4KaTouEJrIN/Ax/DXaD7WPV5lof5d+DqhGqnLXFZN1rKnwtZtv
 PAQ2RqqTt8O5B0n2+zRb39PEAlEcE8jwUTFwQZQBoZQ+hxwaz3bZwtxuCs8kUZXryPya/
 T35rc+r3JIUnCXoyTmzRRNXLEBh6kHfbUaqB6Q4IzX0vkV7V4vBG0Cf4WVcv/H7fdL9ou
 5ri/APSWuIWNFvTyAcOioaVt39Kf4RHRc7wBsD6n9wg4hDUlLpJ8SZtcxwUQya2SkwH70
 d7jsKRSeqUJoihz5rEO8LiJSF6WapHr/jQjIqvKvVSihMHbbi5nJyYCTcScS7mATabg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XtprpGj2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBECC40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7954165e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374099; x=1793978899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TqVrHXhnPZXX0gPHQYW3B1WDORErNvTTsyut6aR7rzQ=;
 b=nZMDjIuDl1p3TUd/f9fUn6m4Cm3AbZEa1wjHtDo8B8K4vg07npGm4Zg5W63Z00QvBT
 ofLwZJ7WyQXdGpNLgKQaPuBKzC3ZVtviHXRkGDtT93pCoELSXycWsmaLQc+l23upo0Sl
 2gFDErMbZBQUWDHlW76ZwV0PYCPme1GU2f9KCrVmOHFEXdmPvjNDpUElc+aqzcpAMHFc
 94IVqbUbmqHXnJ23btggGvll6PsQScscgbRj926d9tsp2vxe1CeSEit1xW3drnMn7Geb
 FEGPzPcG408WU7uk1kK3gHVcLecArNljHYrSGqsT0qho5PDtLMuyNn+0TkOHYsnrO4qE
 Eaig==
X-Gm-Message-State: AFq9FYLPMK8SJ6VCYpQugMfnUnyPwt6DzYkRMxAV48k1RCpzlXPDLIg/
 suVszo58OsFAOxXNsAqRep2MIyOGJJQx8z1ZXd6rVPoqPuMO+UFpbR37Y8ptU1aeBzAjOYpXpwi
 j3TJHAOQ=
X-Gm-Gg: AYBFou1IO8N4gFM4QvbXlXXZ9VIw81MSBMmJFlV/4b5Z5huLCbnj55vcm4kSOQXLm2p
 f3H2a6sJJVpk5WEO/fGkRX21zC/m+UZq9NntHg8/sbhYwhhojtNsmJkRzK6Kn+rNZMnx9upjCtn
 s0E3FCB6FkWbvqzosmPhwlWMoWhi0BetSYIdOa/gF1yIIa2mSsSIizl82Jmh1381XwUnFKnZeQB
 kEqGgbeMXuh8eshlBRYqO+GWXara8adjeDcsPLBSLpw8B5/Yx5BxOwF6hO2pkl31/TAOdUemy5b
 8VbAoHHeuL402KEPyyg1usHJqT/X7bdw8fA5qUCDx4dS6tAIU/PH70XK2G+2abPwoF7wmSLWPvJ
 zRsOpt1KWvBpo/VPOfcj1dKSFPyAbs+A90YOrQ+QGVqdY9NGWEqgr/Z+plj/WHdVno/TVYxcW0l
 kcUVi7ku62n5gMCJ2UjB/JesabKcznwiAcDAkIPsY+ksWC2sXiORTxMXFoeRkBPyj41GCz/lKv1
 weTsGu8RbY+ewEii+lkNpyKg1AOLl4wwQWwF78Fppc9UCSoGbImxsGna0hsmKab3qL9WxxMY4up
 ErKJmyrPQ0D/nr+NFQ4akkf02B2U0Oz4+EKP68kvPtAUBxrKp8aHY4AcL04FudmiSzy4rrzk
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id
 5b1f17b1804b1-4ac19705d57mr57738035e9.31.1793374099408; 
 Fri, 30 Oct 2026 08:28:19 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abea533a1esm45901545e9.1.2026.10.30.08.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:18 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:16 +0100
Message-ID: <20261030152818.1907250-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022202805.1466157-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump version to
 2026.10.19
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> FTR: 2026.10.18 was a security release:
> https://github.com/certifi/python-certifi/security/advisories/GHSA-6q48-6c7w-9gw2
> 
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index c6e0206ea8..a583c17bae 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
> -sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
> +md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
> +sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 5430596350..bdfb8ed12a 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.10.18
> +PYTHON_CERTIFI_VERSION = 2026.10.19
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
