Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273E606A329
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L8M+blkx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4037D80C5C;
	Mon,  2 Nov 2026 11:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYZe6pze_8Fr; Mon,  2 Nov 2026 11:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 69A5C80C2A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793619221;
	b=h+wPpJv1AIo1hX1DR3NZk62s9jQyrfmROXvUDT/mCvv91XiAYi26SZcHvOZBGJPLEiDu
	 HX4I+jrLhMhWmH8K7JZj70XvbpLD0vqaLNEKaJweyH9cAoUxUSZn8XhyAPfil6gaBT5jc
	 jDDL0h2HWmfqfzMTYnXvnoq+AZEN9HfdXdONUdOZfBYrUoqq1Dlu+07bW00Ayg0wSgA5y
	 HebJMkBl3UO4gbyNVdH+I2cxN5E1Iqmesb26SFre682+KSRcy3kDFKCxrEIeb6BdYcxEW
	 xNfLpdG8RcvllT68fz5Ma8XGK/zyPeoEogs+xsl3otLgdExThuj2eHhPtHiNDYIKMWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793619221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Y/JVF0nwtEYlByjFL1NvnwsF5/j6qGp2HEpy4mgBT9I=;
	b=gxFbQcp4Dir7TfSWsUecpgUcchE7C9Aspo19q6SkK6IIM2DHkyH84lrV3LoX7wE5aumh
	 rAkCClWX9FH7dnXpZpnoo43LutkIQtPb4npgZf+nxR52ED+ZUJGe4pNw3maD2WKIgCQa0
	 E7TOEvnMdUTrw3Imjc/MJtNth98i8jcg8vatXyLuTzldUYo/Vur7sH/coPq93s6Ysa/5X
	 fLkfYrZZIoYlUBPvcX4vb6yTa34taj63aFWkmMwKKbqh66LTLMUsHnYu7+XwqXI3Eg9Ib
	 /gmPKmq1P/Z7SNnqoqUyNz3MTTp5c6D8rgQyxvfY+uQBt3JIbYnr62k6JT/SyoP3Efg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793619221;
	bh=Y/JVF0nwtEYlByjFL1NvnwsF5/j6qGp2HEpy4mgBT9I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L8M+blkx3BpyEd/hNuvXQ4Hh0VIXApBQACUgvUnaocOjboH5Q5OCpU+fLJkhYqbMP
	 PCOLy99Ckdb9hVXwJttoz1Fjn2/tkLxHCrLSsuYcecxifMbwut80GOQinYtG9CAjMp
	 UMrBYncDmAMvqy9n9aED1CxvLmoDq1oh39elXpFknJ5teWwehyZgi5vpbNO5kfga+K
	 xOXZ3bRMYvkVjkJ/tDrCJ11GIWq2NaqLRgWd7O2icZ6gIBc8V932N0UtLqu4x70/tr
	 2NT74GtoOq5sE2SEhTVAWLojol4lJZBQ3L6sosFhPADvJKNiPFQ87XszhMUw+BnxhM
	 bNftIF1RGbyhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A5C80C2A;
	Mon,  2 Nov 2026 11:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id EFD9A362
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 11:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id E1E8840719
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 11:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id WGjntj8YvH5A for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 11:33:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7397B40715
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793619218;
 b=DS5lbBSiUvA/qy+nJSVvdxJTM0qt8/G1znHbldhlSC+5cbPY+KENOPytUQ04msOYkQWV
 qLg0mXxLvcc1luIgfDp4hXVYT98ayhC8y5K0aDOWDKS6xKEsjF24PwnHcr0s2oBvnBeH7
 RHxbz/vXuuopXJIKXb1dpu300pyoQqNHCiAFYe5ccb33ZgkjSytvFQCLDq0otYX+iEBUc
 /CZFkQTEUpHA1YIEax/R/Ksl3DRjql9udkoNCnfHFD5EZz60bzNyndNM56RDldduWyik4
 rpRRpH4ll9zk6ZbDq9s2F0naRm6C584Sg5288HTvFEw+5WN9bDVivFa9TNeg7fjPfbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793619218;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=R8AsfT37CdVZ4YWN20MYvaX5RmlhqgmBgvBp7AVpXfo=;
 b=mH29dchRpZZtnil1+neQfKWS/f3ApiR8tfwoWE67jJjsuOVnlNuk1/0IkBCRLH0VUDuu
 yYeIgKC6mfL7gJAcbqaXiAakQXYQxG3tOmztbj88d5X4ePCcAH4f0wtdRAwolckWyuHyQ
 h4mwFJi4IAUWOgC/MSR89GvhAtX3Q2V/JTPCpTvpBs5B6Yu7lKYIQ22tVO0s9brUNr6oO
 GMx/IyDyulTQUPoyiZyzJHlwt+HpIC0y/ZepSJxcsEEKv4tu0DiqHxyCVItMtnY71eKJL
 oQb+bZ6IjT1nK1i1LQxkVMbYM4nrwsz5+0LQQRoz8kW3zAnQjIAGwk4S3IBGAEocIjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=GvmXTL2+; 
 arc=none smtp.remote-ip=172.234.252.31
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 7397B40715
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 11:33:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 9F1DB434C4;
 Mon,  2 Nov 2026 11:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BB8B21F00A1D;
 Mon,  2 Nov 2026 11:33:35 +0000 (UTC)
Date: Mon, 2 Nov 2026 13:33:32 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be, raphael.melotte@mind.be
Message-ID: <auh1DNBuH1htvzLm@kernel.org>
References: <20261102101649.1855600-1-titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102101649.1855600-1-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/swtpm: security bump
 to v0.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:16:49AM +0100, Titouan Christophe wrote:
> This fixes the following vulnerability:
> 
> - CVE-2026-75900: An out-of-bounds read vulnerability was found in swtpm's
>                   SWTPM_NVRAM_CheckHeader() function
> 
> See the release notes:
> https://github.com/stefanberger/swtpm/releases/tag/v0.8.3
> 
> (alternative to commit b6a653e5fc31ab9e0e0b105583a693938b59711a)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/swtpm/swtpm.hash | 4 +++-
>  package/swtpm/swtpm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> index 934d3b6ee0..8d723886c4 100644
> --- a/package/swtpm/swtpm.hash
> +++ b/package/swtpm/swtpm.hash
> @@ -1,2 +1,4 @@
> -sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
> +# Locally computed after verifying signature from
> +# https://github.com/stefanberger/swtpm/releases/download/v0.8.3/v0.8.3.tar.gz.asc
> +sha256  5c416e3a241d4adb61c66ac04ea46699885476c6c3aaa86011386e14fa4a67ea  swtpm-0.8.3.tar.gz
>  sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index 598d56cf1d..636a385db8 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SWTPM_VERSION = 0.8.2
> +SWTPM_VERSION = 0.8.3
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
>  SWTPM_LICENSE = BSD-4-Clause
>  SWTPM_LICENSE_FILES = LICENSE
> -- 
> 2.55.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
