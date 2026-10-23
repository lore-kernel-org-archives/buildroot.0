Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K+Wc98U7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5205E60668;
	Fri, 23 Oct 2026 13:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FM5njIUxwRle; Fri, 23 Oct 2026 13:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52AD860721
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761698;
	b=o6KlWdPSZ5XSz6kTZt6CATFGy7oUs68IWu5PPCvICLMNEnk+msaYEzLjN7GptwaSuPeT
	 QNS97wljgEL7B+E6y0IDCB/QFNwABClAZh90lNheDV3mMiSJLF3R1plfAxBwAzVbpRrs5
	 w1DdZMT6Q4QAdbMhHT/HgzRlKIfRk3C5rcXp7sFACieoZquS8VeFDCbTP+RbBRODuQgfB
	 cKgLOfRRi5s3l4nTu1MEqLbO+VkZEwM1GXVY/jjpjdhfyuIJmrtlZ3MyMGNj5e0aORrNC
	 FQbYsl73CRLeSGxYQTBqmQ/YzBqmeBcapEco2C0cx6SCcDl4KCllc+vlKFAEUrLG2mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ccDAD1tZfG7QHt0q3jdmYCwjD7lTDPMK7z/D2rLpv7E=;
	b=rFELNz/yuprhhrbLKoPTh0Uf7cou8fsFBoC++BVqLHpxm2Uv7adqIh7Nbnc/SUsBiN+5
	 fYl23ellJYXDcYjo62px88QCXq45ng80k5McXPoixDQ4Rc9gkP0JXSjt7N7mOWNmel8J+
	 QlK90WI63JzLo1hKDP58pgko9ujLN7oPyc0BpemR6pJpfJIRD8qYxR/NU2IsjWRhdG4Oe
	 oiananfea1N96X+f4Nxb/7W0zS/c2sf8c32Fo6jRSRCs/eCxctVPwm84XsUNf1U86AaUf
	 VxyPPzyGpcUsRYzdD2tcRc6hPMU4nLaJaSUTkEyoG/iltpzK8xpd3NnFUy8DcX+xq/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761698;
	bh=ccDAD1tZfG7QHt0q3jdmYCwjD7lTDPMK7z/D2rLpv7E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K+Wc98U7vN9NudZC8qtUxOoW4gkPRyyNLPWj9cVilvBtTl3KyxyCQChsLm3y9obPK
	 BUuzUaZZIc9DlMvDI/h4Urh24iZ2u6sdwDFueUQ+aTQngAuwqx1lIpX57eQiB9ad/W
	 /i2NpN2w2EsPvA5+UuRtAHAgbEgIZcicWBec1UoxtvZuKsKxVqQGmLh0jThzI5eC+S
	 WB/1rOM0mzsKXoXuWHjIyzUKHgbe9X+ereIUw13KYPPC9Xh4CejF+44ICcmWTcOZ0T
	 EGb5J6GSY+ZguRKwAWow5O1UbRwnR6wa0mfvEs8WnfFjYqTRwBrrXAX35d8Tqk3JXU
	 q93i1j2Fq7h1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52AD860721;
	Fri, 23 Oct 2026 13:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97843356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D56E6070E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihEAmMTyJ-BM for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B93860A5C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761694;
 b=IVW1w0vpFTXXPHx7+EwdMALCvRjZE0YSSARaGTr7/PNc5+APeU0APE9dL+h1MS91G4Lk
 1cZ1mpQvTHUl1lUM73rTWs8bHioonrloPJChFUtLrWO4f+JPV67ZL0uz1R8Y0s7c1LGSY
 jfa+Pjk+zpS5W6pYiYLuMzBeePRHADOlRIBCZrol/lJtOPv7IQStrIyb1+vd61iJgtmzr
 3hjqQOSvBag4pEAyJI9Qrsxr8si1ISlWtqkaWP2EWRxa0FbfX9BqGY/bzWxESuXL6zxEA
 LXKCLuGzk7Wo3vm4kOQHPZotui5kSfmC/3X/qwLJxNvLV+WYNYQxCb0IiOpeKCs+f7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761694;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=G5KBBt7NDB9bzb3IE6EW70ySGLieebXts6Mt86ltJ10=;
 b=qM47MXQQBxSlDVwwqujWm9TMdnkWH+Do/iS3yEbTc9gHkkgnCY5aybah3BHe26MWgzV9
 76kyI67ZGfHokpt9ctpRH7jCk1FUVRuxZ5DQYd1iZJIHvlCfgc7pTLYQzJyAhZU6MIVs9
 ZMIYAa31sFggeyvR4iDsV5y+OcWwSYYyuIuV7jIXnAZEzHBCjsU+mLXFaSVkuwGthw96Q
 t5U1tzArG28EnlTnse3M/CmJCFSc7OLIvaN5F/lu6C5Bdn+wnjKwMQqfzWvwbzXyoPFYV
 Hn2OMJchh/ZfNsyrengKBiROsv1B3DghoovLyiYPWfSSSbcKdy0tVjQniFEkYATrJIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ot8BZjFg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B93860A5C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso484434f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761692; x=1793366492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G5KBBt7NDB9bzb3IE6EW70ySGLieebXts6Mt86ltJ10=;
 b=OsunctWGzjJsQyFmo6eU2N3GE23pbKQy7840Au8KCpF0FsNaSvoD9n7xhExhrZUIAO
 cA+VkptXXUesQm50ntq9AatVW3GSBI+bgtCHJb6E8+4pJ/mZFb+mdHpaRDWeo5oQdtzD
 TpmSnJ3b8oE6lQTwnTlvg92VOp7f9zABjTwO6r7Xlj/QpJ410cjjfEf0S29gnx3Hrqfx
 kgOdJcYIo/B7KWfmcuoDkD5+qq6Wjfp+8L0W/27pRLXi9nuHxSEOtT2L8dvJpaXop1E7
 SYuC0KbTiRWr4bU7MVuSOR1syx2qTMq1Vo3JLEV1prOmktiyI8nsGSYM80qW1uG/SPB0
 zEdA==
X-Gm-Message-State: AFq9FYLPE4xYsHtSHHLCqPuR27y7Gk0mTDoBiN9zBdB1+B/aRTysfEyQ
 RKLzI5v5gIuupOd0BHi6QuaT2rc0zz3DlMUu94FF7j+UmkLUdSUio8stkTPtz2FQf/PFx08FmO0
 9yN/kAKQ=
X-Gm-Gg: AYBFou05reAV2Vw8LYfhagesi5RiwbY8AwNHmO3ILJ8OdapmJxVewEmSmBRLZpGiFns
 Pq7Vn/ebqqGrNZDR47kke5RozIpkEPwpsq8GSZ6ijN3nsdZ09dPP6GTlnyXz+pt8XhvS4wcReIQ
 b4WEUPXdm0VUmIfFwERSa2VdLxJul2Bjrb8EK3ETfGCGXll4/U8OUDo6y4n4FvmKpxMcGKSiNLp
 759VnbcBN8DkQVNls+HewbR92p+xUW+mgPovHC/3SbCqt7jU+qH8sWlmTQOnnJ3sfhmdQIgx44m
 FxjY4PdLa2W0eA5oEBwxeq5d2GJdGQ7gnvISvh4SNoJvxQmaKWcQdkzowIogxC/DuZGm/518tOh
 QYTK9lfld5LF7YjIe1dH9Cky2Wha49USilLquZw1GryqUe+sP+04iLhTLRowlc9NtH1H39/2cA9
 E0bJHVbzVZ4RGJOd2CGDmrsSgm6XalpOcyOcEHj0GzXldiuedfjmrbXXisrVYnDB+7S7GLr+LpQ
 B86gv8/F3s72YEbNicV2JInDocvXQ1tk3mWHedj1LQ5FTgx5wJiTVVuZKzMkHke5gaXMd9/RRcP
 S9E=
X-Received: by 2002:a05:6000:3102:b0:48d:fa9c:7838 with SMTP id
 ffacd0b85a97d-48e3854a12bmr3216259f8f.2.1792761692296; 
 Fri, 23 Oct 2026 06:21:32 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38048ad9sm5186164f8f.35.2026.10.23.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:29 +0200
Message-ID: <20261023132130.1608011-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021143606.428870-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/php: security bump to
 v8.3.36
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
> This release include fixes for critical remote code execution
> vulnerabilities:
> 
> - https://www.php.net/archive/2026.php#2026-10-21-5
> 
> See the release notes: https://www.php.net/ChangeLog-8.php#8.3.36
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
> - CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 99ce84673e..604e52a54f 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
> +sha256  dd54693aa334c5c4d72e9aee96b082c2473750a18a6c1d105789c93a3b1692fd  php-8.3.36.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 497ccc49e4..fd01d75e7f 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.3.35
> +PHP_VERSION = 8.3.36
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
