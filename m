Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404B606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q2/pt6PS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=czFNiOAo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED689403BD;
	Tue, 24 Nov 2026 09:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiDhIKqvRlT1; Tue, 24 Nov 2026 09:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B6AD40445
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795511402;
	b=Ju6JbVZQKFwjTi8icG1OGK6b4AueEuU8np7Hpk5VFfEAnV4WNwoPGiPmx6VaNOlofGXv
	 NCE7XniZ3K6nzmbwB/DPGNhiY+/4RXQA//0Ygeh7Cqu/Wzm1AcHbAMO9eP8oL4XY0Rmb4
	 luhil0lgfgWeJKrJfFb7cWCN0uNlZAeSnaPTb+uDxLJWsjFLoxAt9fj9+/mWgRMHiKRz2
	 toRK2e3QTKh3maIFs71JUBXcC1O0Ah7usSOXWpjWAjhgl+3i642M/WR6KCCFbVd5Qp6Xk
	 gfEk1vDBVJv0QLOKFt/lCvWOZG8mgwVqjogWuuacnC03wOZWfeK2P2c1Lo6ymtUez9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795511402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=jnDqJmBeHWh3WqBnAiyzK0blqn5USpHbWJNh7Krlm8Y=;
	b=V4Ev3pXqwkGff/ykjoDPFleo3MXxxy9qcKRi+O215VhuxbEQRMlln1vJwUKwVOc3QJUO
	 WpkQsuKBVJzWz+n3v4xhMeBD83fQBQGqB3YwIfBTPd2wLr0eKoPZkk9NDr0oq5AJbecoQ
	 r4O+EiMRx3sQovC/y4qiZPbDFftRD75wIGBhxoEP7wnoFPw8ZJuw7VIE5jxQEOpQ/naSa
	 7rldeXtWKtzvKVfuHGL8eZnpnovWDC1EqqhUz1sx+6/M8A9PQ2hBNQ4RzLvsmVbqUjDOB
	 5W7EiPtpvx6SsB7MVD225FQvUYIddGBulCOdv4g4qPU5Hi/ggVBaJ/H4wWN/LASRSGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795511402;
	bh=jnDqJmBeHWh3WqBnAiyzK0blqn5USpHbWJNh7Krlm8Y=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2/pt6PSIlWqICGqj3+yRwpqcGZqYnuUaRx/4qMcrsHzXDMt/wmXWTmgr5cyArA1c
	 puJC5GBUqKSFfqN2GHiR7Z2raZM79b4+84pI1HCLKxT+eV6y8dMbkLs2xd6HxMDWoj
	 Mof2wby/Q5OYkxorGV27xff6B4udcpcWa+4FuQ63gH5bVMn6B+HCBftv9HuWK1TKpT
	 a+FIhOvKoXSMjaaSYg2Mjc4aspPS8bgqBbiTWCqE6fJ4OeJVJ6FSzwkFYWiLcALu99
	 fX5DTnj+LyCh8ZmQrh5lEh/OcWnGuN3vMdTDSw8tKMYuh4XBkKzIweo/Zq6UVR9XZy
	 hB7UtuKui4r+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B6AD40445;
	Tue, 24 Nov 2026 09:10:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E3DFBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95BF0400AE
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vG-4UAa6U0kk for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 09:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 34BAC40068
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.218
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=czFNiOAo
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34BAC40068
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:09:58 +0000 (UTC)
Received: from [192.168.25.67] ([79.7.167.199]) by Aruba SMTP with ESMTPSA
 id VmXDx06XpGZvgVmXDxnSp1; Tue, 24 Nov 2026 10:09:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795511395; bh=Iub6wi3nSl5nbzlklUyHCb729Osj3o/4vf5k9JlXaKI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=czFNiOAojHMlq6ss5JB9/mdSmHrSMLoI8apQJ0QqLDEfErREUBjLcMUHb+UrmZUOf
 B986ybSw5SyTgBNurmfnAi46VYrxzNSqpplvj1v9C+lUtAUhGEhvVcMTWOB+BlCAJb
 METhvxUnWUVGmdKOFXiwQoSlZ6rXys/gRCfEI8qe08vQTCpphPo5J4g4A91iL50pRt
 qRkpcF9CU5Bo42p3Ahp5BplGCn+vsA2ieTR6Krwa8XWebkHmtnbAqG8Lk8WMuW3NiT
 hOlndkiPjChDUKhf2P0+oPNJ3q7403T0SsSogECiCxpoCk97KhCnSfRaoyI8Q3kNd/
 qnEUZZG4JWWsQ==
Message-ID: <d727ccd0-ad20-497e-a20e-5e5699173dcd@benettiengineering.com>
Date: Tue, 24 Nov 2026 10:09:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261124090801.316109-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261124090801.316109-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfPUZjdvffO7PycIFfQoQ+gSCb2op7GW/tX99kBFXuFf/1wpsmtvfyAfxtz1uBqcDj+zhAXJ2s/oFEpXg7kjHBt8cUlcXD7EuRjA6aMeAsaB1Ihetcvnc
 C9Ulp7BL0ZqWfsfgvvfrca0y/yVJtJFH9w6PknDUe/rR5rniK8yYjcUPjzqwruzoye9V6MiE0kAma6B/lNq7rL8vBivbDmIVyYgMkuW7JYgsXmPabkP7eYTJ
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pardon, this is a security bump. Is it possible to reword it while 
committing?

Best regards
Giulio

On 11/24/26 10:08 AM, Giulio Benetti wrote:
> This is a stable security bug-fix release that hardens on-disk metadata
> validation (LUKS1/LUKS2, OPAL, BITLK, verity) and fixes keyring handling.
> 
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.9/docs/v2.8.9-ReleaseNotes
> 
> Assisted-By: Claude Opus 5.5
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/cryptsetup/cryptsetup.hash | 2 +-
>   package/cryptsetup/cryptsetup.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index a0ef7aea9b..3e5e4ae572 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35  cryptsetup-2.8.8.tar.xz
> +sha256  8667085a4f59174928948b501b4a2a68f7f1cce1cfe46170b8f40fa6534742b3  cryptsetup-2.8.9.tar.xz
>   sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>   sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 643a2b3f59..11657bf557 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).9
>   CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>   CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>   CRYPTSETUP_DEPENDENCIES = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
