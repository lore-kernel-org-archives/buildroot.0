Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8184606A33E
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZE+X49Al
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E44407CB;
	Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcEt30qrGGpz; Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D962F40740
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843585;
	b=VMyaf/qSi6r6beuAOLooYVDW5wKDx5g5hIb8aOXv6m0DGdHddTNces/G11RfKGyJpJYM
	 oO3OnqJxjIYJVqErPO6+L3hm7SifCRvFbJmJbaB0HglcpzNIuUzDryDmzn3uTTTr3ICy7
	 WoIMuGWA1Xrk3oGODR4xeehoirLhVAHt3zzesegDhoBfqvJ2h203zoWokEX444bG1U1pU
	 qjWEq1W1EKMRMt30doBW1podR6kXPrWqh3jfPcI1Zlm4Rcwe//q7zchatTehobjM/5iwI
	 Rw0ZHsNqRWTFmCLpQ1cOwIfbCtBw3l43FZRo916itZsLvcOCP8gdSSGDaVJvmo9Z9Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wc09I0SwULsznvZufiQ56CcwIVpYuJ4TD88pM9nZiHQ=;
	b=o8RJVFOsl+0p9UHMATPSX3pV76ZHI0YwPX7BhQAdWLQ5te3OkMZldMFVfsBGzKmQHq0j
	 v4Ej0xqfgwLvkuvQ/tTVxFzy9wfTqNqYEnV2lUoAsRb0MDiQ4Pn3dI6JB58/C2NVG/tom
	 ocyne1uNGXnST2qrhDUyfI+75MsPrXY6PdXtjsSQSWGk6AWh4vrerN+9LhwDk8WvV5fQC
	 ozU8b2BbSKnpj02Gl96pQjI210DL1mmy1U6/4EePv3yfJKBJ4kyl2RVlzCqhmMZ44a1Ry
	 9p6l+kp9k8rWnICxVd4PZTr5BIkzsvq0HKyuGFifoU6ZDvmN5FHlBVUr4VcNH/nizCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843584;
	bh=wc09I0SwULsznvZufiQ56CcwIVpYuJ4TD88pM9nZiHQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZE+X49AlhwrzU/pyAuw9dj+Busg9AAZhAR5lQAV3iXttdp2rXwWmxzZVIEBIgFpBO
	 RE7rY5V03Tz0MbLadopOUay+Es98uiW0Kb+afTmsQ7GLIL8JteiUEkigmnhDXW/d8i
	 lt6tzNoWh5vemFIH+oRhSkbBeOXJr0TrvX+6WnoQdC/HrJnWTlO/m99Tv2MU4m1Oim
	 jZ/1xDsKp5DzGW1/kO/J1P1DnxW2eHBsCM5hynceRAqmlR/DrZBrhQArgwNSh6kTDs
	 YOqnyq1ztq+JCY2aDB0VmXqjLL2wGgz8a1HKc9eBpYjw5Q6IXeNqGRgnNbM/uX4/NE
	 6gzweq3aAwE/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D962F40740;
	Mon, 16 Nov 2026 15:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4386E109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29D0D407CB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boxm3G1ZyTNh for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0400D40787
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0400D40787
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso24708835e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843580; x=1795448380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TJPHdiLKrDrIKYUdRABS5hHwjJgGOVlQNO7NtPt+zT8=;
 b=bXLUXNoEuvyZwInJFXuWuylHlsbj76KNx6cQEnr0CThL3z1gOCO3n0bUy6fpF5iIuI
 +EwSC0MSVtFAs0yVQrIX5sVib+qaDR8nHWwdQzwc6s97yzY46nY3UiMeITG5PtrAgyO6
 +Z5fvImi/mWjJfLdicAyI4Nm4uFMBzOr7rOE1knAU4EmtP0LW73CSgvR6KPCJB5SQbKy
 y1nw9tzlAOTBzvSc4g1icTrEKKGODNnsUgI5sT0bcg5NEaouPbX1Zu2o84hjhMyXICsm
 ImE3q7A3ODJUl6VXpSJSmyS+Ym9HY5fvUt8x9Nwr3RPg2dT3KYRPkqikwL4U2smQFTPi
 Fjtg==
X-Gm-Message-State: APuU4Z9HF0JFemidPFRI7ug55hJsNusg4LWKa4bnZbdnYFBpCoVx7fSX
 i6EXcV3YMVAAgfn5LBxqh4ZXQ2ZeeiNYLjrRin0woFEniweqrtNK8OFdktrf/PjXa/4a8ESOUL/
 Fi/WIY68=
X-Gm-Gg: AYBFou3qAgCu8imicG8V7y4ksGlcaGr3o83V62V3Uo9X/ZT0viWnLEDsxiStbVh/tup
 wjxv6nQkt2mMBUYfZmo8tfxf+/1Byfm5tQ2N6wvWVxl0Z/9ywQDSflBKTnX7xidKjrJDhse3FUB
 HXyW6gUaioMdlcER2h03sHC50vbqq9Q4QdJfcIeNlbHyjTg7Jsosf2IQbRxDo8xti2C70fZZCfl
 AQ9SgzGk6pECvQcA+tfimq8tOTLYtgUCiC9veUlsZPBXWXH5hQ1oZWkp7Az8RZtu7Fi+LbG2qxg
 gk47Kuawr4MMgIkWct/NdI3hz9vYWVbNAqe7nNxu268nBJt2CM7OVZLLOr4LAEoRZ1bEsOERs1h
 NsOE9CxiITwSpkQn/e85pHhwv0jh7RMW2VqqPRHU48KisnWXnj18cpbW9QHb/aTWGJF+OBqRHpa
 YVROPs4KNa2RBTJF8xlb02MISvh0AY01HIct/S4AtixIgP2cTE4npY0D+KlsJktl/C3lsfIrmaL
 WdsSdFIjTq4lwsve027SJerDVqkbfVOdbH9Yq15yS6JzPsPz/3EddW7NDx+pUs6V9jsMe/6IinL
 /lTBdOT3WEdzn4pjcBE70oOVulEJVOU=
X-Received: by 2002:a05:600c:4585:b0:4a1:cf60:dcc3 with SMTP id
 5b1f17b1804b1-4bb55a8ccaemr240639155e9.29.1794843579856; 
 Mon, 16 Nov 2026 07:39:39 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb571f6a40sm115398415e9.2.2026.11.16.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:39 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:36 +0100
Message-ID: <20261116153938.725510-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201145.11099-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.7
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://github.com/strukturag/libheif/releases/tag/v1.23.7
> 
> v1.23.7 is a security and bugfix release. It is ABI- and API-compatible
> with v1.23.6 and is a drop-in replacement.
> 
> Fourteen of the fixed issues are rated high, so all users are advised to
> upgrade.
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-xwcv-cp39-m2w4)
> CVE-2026-XXXXX (GHSA-jx54-6rm6-2cgj)
> CVE-2026-XXXXX (GHSA-fpr5-xpfr-vcq3)
> CVE-2026-XXXXX (GHSA-35mc-3887-rr37)
> CVE-2026-XXXXX (GHSA-hpg4-g2gc-pq42)
> CVE-2026-XXXXX (GHSA-9rpf-2x22-78m9)
> CVE-2026-XXXXX (GHSA-48p4-gj45-w9v6)
> CVE-2026-XXXXX (GHSA-2g6j-vhr6-6wrj)
> CVE-2026-XXXXX (GHSA-7qm8-hj35-269r)
> CVE-2026-XXXXX (GHSA-hhg3-fxg7-3gxw)
> CVE-2026-XXXXX (GHSA-73j7-gvm9-x8q6)
> CVE-2026-XXXXX (GHSA-74mj-m37q-h3q9)
> CVE-2026-XXXXX (GHSA-rcqc-842v-m26h)
> CVE-2026-XXXXX (GHSA-pfcm-ffqg-84hx)
> CVE-2026-XXXXX (GHSA-gff5-3vgr-p8h2)
> (GHSA-r9cg-w542-g7hj)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a910caa88abae46d79cd4cd4f7ad5a1940364126
> 
>  package/libheif/libheif.hash | 4 ++--
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 44e9c54781..d9f3d41470 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
> -sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
> +# From https://github.com/strukturag/libheif/releases/tag/v1.23.7
> +sha256  f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475  libheif-1.23.7.tar.gz
>  # Locally computed:
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index 179c952566..f53cdca4a2 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.23.6
> +LIBHEIF_VERSION = 1.23.7
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
