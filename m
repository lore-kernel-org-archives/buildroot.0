Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2719606A31E
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UB7ooRwM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A8180F7E;
	Sun, 15 Nov 2026 13:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e3JPwAgDlNE; Sun, 15 Nov 2026 13:41:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B4D8680F78
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794750072;
	b=gH1auGrDPG97OcODy3USyPvs4o934sP4I/DBruCeABAHR0MadEe1hP6BvTcuMeDi5/Mx
	 1vxnuq6TzYFhrDf4rAE8n+xJ8ovBEDhnmtcmbQP+cHbVWYiit4RlzWYJZ7EZEST2+oKQ4
	 ws1lP9UE0RazLWGPi+3opDf/ktSEQLCLLDjEGN3e0b3mOLALcv+kfIkE/FvC/mFgealyG
	 A6aRCfOzgT9y+M/OmWMlyn01MQaM81qQzuMG1VDi+NpkLJgPqC7LEjkUpk+Ph4aDswSzZ
	 PXZPL2W923uqJhH+urm6G6VGQLk9UqZeWPsFe6mZ/m0fwdvQ0+/kGtXAPaTE1RTRHlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794750072;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=pUNhPIByvJPzsExfI/LYynBQlESB/CEc58lAoBPST4k=;
	b=msvUWmnS3B1LIsJ6+vIRI2QvTmgZbvy4rEmzsJJj/tMLmLW6jJOheyETpmUw+zeNYIxH
	 GZkNLnjn5zq1n1ictOoiDSOs6OsxJm41XZHE2H9bRDpcViH+I4XTs8vM6ODGYS+sHxGrt
	 vV7Bi7nqzT1plS9yopUOR+yy71m4Qp+7tA5AV21yGx+mUBW4WVuidylSlivgdW5o2yXmh
	 2cd2lY+0tUVw2tHqComzoslpDEzndkQVZ06jhq3nx87izBO169PPAtcL/YJxt0Ql9e7q8
	 cUk0ttJDeaT834LDMA5amdACunUMkAInkRsdKVSDS2+/oBlR+J61QOcgUhEqVvoyRAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794750072;
	bh=pUNhPIByvJPzsExfI/LYynBQlESB/CEc58lAoBPST4k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UB7ooRwMpUCbp6jU9WRuQPxFg5wr2smfl/VaYou5Q20gOhtsyWIMRgbpiHAAv1vTT
	 fosqEY7auMfhgvfGhxkQFc6pPFmzfSDslMjHPjws/p+JybaXE9Bb+hmyEA0bR/+ExA
	 T0QleoFckp6zjDEpysHZrmDaHIbrOwHf11TTWASR/nrA3pCSgIusRfuYTmT1MqnToD
	 uDOh0ULr7B5r1jjTo7Z5B0oyrovjT9noEOI+83ZkyjNVbC9BVB96foAat6DLE0hLJU
	 g1EBMoX7z5gLkwPXwYrdiL9oCLNRz0MPilN9xbehIZ/MdmFv+cAhLsHs2AT9V3Ts0Z
	 j2EUB4BKyqpoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D8680F78;
	Sun, 15 Nov 2026 13:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09FF070B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 13:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E80E340068
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 13:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjWF4s9O4-8C for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 13:41:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 203E640061
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203E640061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 13:41:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 07A9013F880;
 Sun, 15 Nov 2026 14:41:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 15 Nov 2026 14:41:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 14:41:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20261003070128.1295458-94-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-94-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <0579557fa48667eee727db9e429fd8ff@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 094/114] package/python-treq: bump version
 to 26.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernd,

On 03/10/2026 09:01, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-treq/python-treq.hash | 4 ++--
>  package/python-treq/python-treq.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-treq/python-treq.hash 
> b/package/python-treq/python-treq.hash
> index 0c2582b4ba..18aa98884f 100644
> --- a/package/python-treq/python-treq.hash
> +++ b/package/python-treq/python-treq.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/treq/json
> -md5  b0a3c2e315375388e820019afc59919d  treq-25.5.0.tar.gz
> -sha256  
> 25dde3a55ae85ec2f2c56332c99aef255ab14f997d0d00552ebff13538a9804a  
> treq-25.5.0.tar.gz
> +md5  eb16ad46a399062514b09300635f3b0b  treq-26.7.0.tar.gz
> +sha256  
> 43e728e12aca2d897c626cf07dc7b4392749b73de050a7d66e086cb3a6e15da9  
> treq-26.7.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  
> LICENSE
> diff --git a/package/python-treq/python-treq.mk 
> b/package/python-treq/python-treq.mk
> index a8e451731f..7ef7fd38c2 100644
> --- a/package/python-treq/python-treq.mk
> +++ b/package/python-treq/python-treq.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_TREQ_VERSION = 25.5.0
> +PYTHON_TREQ_VERSION = 26.7.0

This new version, merged in:
https://gitlab.com/buildroot.org/buildroot/-/commit/7c95a6d9fcd9399298de9ad4b9f4c345d0a0f3f7

broke the test_python_treq runtime test:
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158649

This is due to upstream commit:
https://github.com/twisted/treq/commit/ebe411925e804a9a15bfb1dd70df997216112634

Could you send a fix please?

>  PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
> -PYTHON_TREQ_SITE = 
> https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
> +PYTHON_TREQ_SITE = 
> https://files.pythonhosted.org/packages/92/13/96aceb81d076eea518bf174048db701ac8b139c7aed1082913318a55a7d2
>  PYTHON_TREQ_LICENSE = MIT
>  PYTHON_TREQ_LICENSE_FILES = LICENSE
>  PYTHON_TREQ_SETUP_TYPE = hatch
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
