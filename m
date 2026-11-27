Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526EA606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ofUX9z7f
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC9F812E0;
	Fri, 27 Nov 2026 17:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6MXFTE4JX27; Fri, 27 Nov 2026 17:44:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A131681323
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795801441;
	b=O3Pyoxcnr1/noEw6EAPVv2aA8uscbklqi3Va4RwBLbRh9pQLm/MnNIqrtcil5YVYSVoX
	 fE/8wvGoJK5Ib8SM7bL28Ncr40d7nYXBJsyuRZOywrb/8A+jC+yeWFjiwdsP7qqvPF37S
	 i/y7EJjeTrKSbJl0NMhKQROJ6HzYx+bQZORZpuAbtVesnONthd4Cp6nFkArjRpnc8TF87
	 zVLP0a9CQpYngjkqZGNkCF5OROKxv0o90UExBGQZpw/ogfCfzJQ0XwjZB/jd6UfiWkxKA
	 YqP8/+ZXMp04kZu76UsO3T4B750QPhm0scP7IvCOuQIzMnREuUylWY8k9JpTYZlTvJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795801441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3TVSfCeniEADC7j/nvz5t7Tqn3kMbhu2FvWIzDsUG18=;
	b=OL4ydYIfHN/quyT40DUtshIja01EKc+vD2Cm69snOTHMBulZG6JCv4vg3uNJXV20nLct
	 5a6BWHJPtIAi3jBnyJIxAi2Bs3kVn+q0vlc027W99QJDhFQE/0tG5hvMMOyV5uNDPfvqn
	 Sl4+ocWVEddjLAmjs2KjoTEyfmo1L4tKXnTMAFlbnsxsEj3DKnytzhrgNn8jw87+UEMo7
	 CtGxpA8NFFcIRBkwed0zooWhLF6+kTOhB+joaNicyn2BkH3i/wbtaWp9rZHPcCkEMdr9G
	 0UUTs/+vaHavHeYeHrZMUNEY1F2YyVm99lgj+yd4b1oMrPLHCHNd6xKotBP2Cu2mUvw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795801441;
	bh=3TVSfCeniEADC7j/nvz5t7Tqn3kMbhu2FvWIzDsUG18=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ofUX9z7frlELLrdbCTOp0h/jOhNC4CGOTXk+pUQmyI0R7ZoF8568eVriDk0oNgZ0U
	 esydxgDc76PlmK4LfWeylHXBFYsJQAxOBVBHDLTaeaVqTenRIdUX78PRlIjLaIKDtH
	 4+bhnCfvyWj7h9+pcivB+Gi0yveynuTwQqN1QGoEdzn1YE8mXVDGa8pbo+6O49JhJv
	 D7NcFKT9wJVxQWOWhoBlPwO42s7/QZSjQ4ZiEudjKtX7Jvzq4p4kXJkHPgNkc933CG
	 dBR5zJJcYOb2AI/gZj6zO509KP5XB+pjxz38QHzISQdN6gVQdPLAv2L/I4O5QvIeaK
	 khUP4BDKcG4LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A131681323;
	Fri, 27 Nov 2026 17:44:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 519D6311
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3585660DA6
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiMSmrpwQm-c for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 17:43:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AEB9260D9C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEB9260D9C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 17:43:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 30C0D13F880;
 Fri, 27 Nov 2026 18:43:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 27 Nov 2026 18:43:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 18:43:54 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261127151133.2261076-1-chakrabortyshubham66@gmail.com>
References: <20261127151133.2261076-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <482065f3bdb025285f7f0a173c1c9828@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/lsof: bump to version 4.99.7
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/11/2026 16:11, Shubham Chakraborty wrote:
> For change log, see:
> https://github.com/lsof-org/lsof/blob/4.99.7/00DIST#L5652-L5683
> https://github.com/lsof-org/lsof/releases/tag/4.99.7
> 
> Tested using:
>  utils/test-pkg -c lsof.config -p lsof
>  (Result: 6 builds, 1 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
