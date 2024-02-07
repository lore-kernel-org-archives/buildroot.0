Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D1DC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876A640A82;
	Wed,  7 Feb 2024 10:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pqVT-jfF5tu; Wed,  7 Feb 2024 10:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63AB7414BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63AB7414BE;
	Wed,  7 Feb 2024 10:16:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F38B1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7382240A82
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4pJufOReAwx for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9AA8402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9AA8402E6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9AA8402E6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:16:31 +0000 (UTC)
Received: from [10.0.0.63] (unknown [109.133.241.250])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3036D2C83776;
 Wed,  7 Feb 2024 11:16:29 +0100 (CET)
Message-ID: <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
Date: Wed, 7 Feb 2024 11:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
In-Reply-To: <20231126180840.2081945-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707300989; bh=/KDctZ/qm+sm0jY2Pd9/N2F1t8uRS+DDLfUymI/6BaE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HyasnLZVNqFtlLrnQaC6El8fIPykZSy+FBOwfbR55n39JnyXqHqlgyTLpuuyWST/s
 uO6cccqio0QikkcMXWPZ/23tAyMboVUJk1hZTsoJKMtDuj0uomR5tHQElhghHjCyQR
 TH/0pix2s4MAzi0vuCxO4l86X0BiHn6M3/0+RijDC3Tv3Yf46vt0TMgGHk9B0YKfO8
 4Hyah7LEi16hwBl+4McoePBlNQb4mYM+09T4FzHvwp7hnX6KFDnuHs00cYvbRUmv0Y
 aQDtbChBgTT38JCTlotzt1dCDkGSgGok24BmfBgC8VRWwM/gHsB6IvFpNs0kqbvPEw
 DOywialIl8SbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=HyasnLZV
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On 26.11.23 19:08, James Hilliard wrote:
> We need host-python-cython for python-msgpack to build correctly.
> This is a hard error when using a pep517 frontend.
> 
> Fixes:
> * Getting build dependencies for wheel...
> running egg_info
> writing msgpack.egg-info/PKG-INFO
> writing dependency_links to msgpack.egg-info/dependency_links.txt
> writing top-level names to msgpack.egg-info/top_level.txt
> reading manifest file 'msgpack.egg-info/SOURCES.txt'
> reading manifest template 'MANIFEST.in'
> warning: no files found matching '*.c' under directory 'msgpack'
> adding license file 'COPYING'
> writing manifest file 'msgpack.egg-info/SOURCES.txt'
> 
> ERROR Missing dependencies:
> 	Cython~=0.29.30
> 

Unfortunately msgpack 1.0.7 which buildroot has now requires cython ~3.0 
[1], which we don't have yet. cython 3.0 and cython 0.29.x (which uvloop 
still uses) also seem to be still developed in parallel. So maybe we 
need both as build host packages? Or do you see another solution?

Marcus

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-msgpack/python-msgpack.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
> index 061ff5a761..c915b23bf4 100644
> --- a/package/python-msgpack/python-msgpack.mk
> +++ b/package/python-msgpack/python-msgpack.mk
> @@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db157
>   PYTHON_MSGPACK_LICENSE = Apache-2.0
>   PYTHON_MSGPACK_LICENSE_FILES = COPYING
>   PYTHON_MSGPACK_SETUP_TYPE = setuptools
> +PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
