Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2DF606A32D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P9r9EuaR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D21819F5;
	Wed, 21 Oct 2026 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIk1QVvAjREU; Wed, 21 Oct 2026 20:36:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEA538188A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614997;
	b=SqUEzXjxKO5/sBmshzxroBrywMOoV1AaGZP9QghQQKycWqtzszAVLYFnegC+AGS+CVc3
	 K+pvoBHchKE4jVOKd2HJZA0YgRUj5n1IuGU7pKMeoA/B32EMhYICIrg6X1mJXXPqwpclY
	 9gvZp0JYxDdxMhPpduj4SyNsqAP7gUOUJTJ1nD8U7dMZs8wxT9IV1pgcJ1P4g5TPnE8Sv
	 W8fCajnlPMi6yf3/I1WjfTmT0tu+vqu7v6q+5jrVNsk9CSiPc30BvRLie2kwpNhF/3Vey
	 WjmsQHd+tHP6E6qnFBGX7B2VxVX13hSq5yeBBPEPhcthUoM1BnG0ejKFcn4taU+KF6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o+gNhAooAbGKynyrjLA/3wL4+pkIVGdwyoPnI9L2spk=;
	b=hl5AlJEe3FtgWIaKuWSQ4XpkrF7SSUrWHs6sn4OQM1vZCWRXNVPt/S3cSpSf/2tKEhvL
	 mrsRTZGjIeA+PhInQP3i0XIhMlhgas/Hmn8sN3kSMb00b47ez2TUeEZXVqZTa5zzW7Vvv
	 We2/OXzprllBSj5zcw0pG3alB4ejIgjOkwPy0wS1Jbv4xqd2QC4/lWk00HIlvcXPO3KmF
	 +nHxtafJ9RLWcP25ZDW5N8fs99vfudew3T/T+TL5PNSlNNIt90hkme8eqCF7KNx0K6M42
	 Yp9Y0sVlrnrhb6Psy6mGzjenqUnp2QoKlVfz6CphIFmtm2v+p40uSDH2Xq+2DRHTKGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614997;
	bh=o+gNhAooAbGKynyrjLA/3wL4+pkIVGdwyoPnI9L2spk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P9r9EuaR2bl1sdwAfDm4IxaB5xNwMmyM7mfCfKzZUTo8cudN5XgjWiluluLugnIPq
	 HF+Y3jRoqrbNeHaL1GpKH3cgzaTLmZfY+nlH0JkRuhKAWNXZlNXLYBkinC2mv5/MtZ
	 7VV+NGZeEjM+wXhdhI54/oCEese50s/ubGA4v+kW82eu7ujk2lzWJQE/xVLNOkX9/Q
	 cZYJW0cYj5cux9pMro+8zFCZxxD3ioYVVMoBJsQR13wJ5mI5PdZX5bbjuC9X+gNegU
	 aG+B+DaYh2bwNda8DPG6gZ9anky5Ew3GH2Sty4F68662SCBi6TyTlTKKNpBjVCzqN1
	 7NOXb9Aoq+BPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA538188A;
	Wed, 21 Oct 2026 20:36:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D123E769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B0740ABF
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxO-LIOa7glx for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:36:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 668BF40A02
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614993;
 b=R5UgH6vqmntGFKrC5GO1RkwPN49IJMHWRARQpLmIv0wChJoXcPefLjC8a/XDvyLWUJMP
 qWHi8fs40J2O8slPh02dOlIuhDtNlfcpIZh9E/8ib/iJy74lx466+HdyiCJI9/VGk1Z9f
 ORABo28Kwt6LyZJmaq4GveaSFPLQpKi2GhrzL2OcwGHdNuNoL+zNSmkE+yC/HCRG/+x1T
 AWc3JkpnY7BCbJfWDAYEtSN4dhn2t63mo/Fi82orSPYUss/SBo/SpbiNnk8SLspv++6Fq
 2Riz2v9Wg6PFoT64LqsWxGer+XQ4KpMe4ClQnTk5ggfHqAfiDyje4PcYPwzE7VubjVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614993;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=I9py0OeVrLXyEpJIWlQshEX7BqyaoJp3emzNP28/ytA=;
 b=qLU1NqZrV/cDZ6ZOI0Tay9F166ZKAIBzokyup8kR/afQjRoSySyvW9pC7RyyLLIQP+en
 EXphEfrI/yaZq/HwqnpXEucdq85paLe7opyQotLv4FYZDixGyDZJMJctrq8qNJcxGMmTo
 CiwmVA+ejiSoOiB2SKs0xvW+CHWs0viZwtvJRAr4oPMkxd36ulpHKhL1CCr1WmO/W0MKL
 ZrTXYZw8BWDxA/TEcLwIPXfPh3P64P+c7mQ1XEIEX8OKz4xA/oG1ogWQYI/Qs+h5k8AAi
 ug2p6lu6t3vw8uT/1GsUxwIBs+S0fN0fWK+yqW1gptxIzocD5VO9aVMN/wB5AZd9Nww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j8+Vqkuk; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 668BF40A02
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:36:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4CAFD1A12B2;
 Wed, 21 Oct 2026 20:36:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 119EF606E3;
 Wed, 21 Oct 2026 20:36:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB84A10328DD2; 
 Wed, 21 Oct 2026 22:36:24 +0200 (CEST)
Date: Wed, 21 Oct 2026 22:36:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atkh3QrH-OV8tcnA@windsurf>
References: <20261021193840.2613533-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021193840.2613533-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/xmrig: Add support for
 OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:38:40PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: updated patch after upstream discussion (Thomas)

I've applied, but see below.

> diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch
> new file mode 100644
> index 0000000000..f9b49a0070
> --- /dev/null
> +++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.patch
> @@ -0,0 +1,36 @@
> +From a768091a0001cf4e6fb24885daec68d8c48e1cde Mon Sep 17 00:00:00 2001
> +From: Reuben Roessler <reuben.roessler@canonical.com>

Technically, Reuben is not the author. He suggested the code, but he
didn't formally write the patch. You're now claiming he is the author,
but he isn't, which could be pretty bad if you somehow misunderstood
his suggestion.

In this sort of situation, I would recommend to make your self the
author, and add a:

Suggested-by: Reuben Roessler <reuben.roessler@canonical.com>

in the commit log.

That being said, since what you submitted here is what you proposed
upstream, I merged your patch as-is.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
