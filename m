Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CCC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1A160705;
	Wed, 16 Sep 2026 19:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76HSCU7mLzmU; Wed, 16 Sep 2026 19:04:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90CDE60625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585473;
	b=qafFHxKqVVrIS2W6qx5OMNiYN6G74/Wq6Qb/HuV3OXLw5QiTQLFnjA2+fvswdpAmLbk9
	 hJounaGjvHUIaFn0vtipQ6ToqSDXNH3vsV/8+88oihzQspUIV2SWDWtjPBJo4wz0iu6RH
	 HtS/tzwaGwW9kCmU5C2J0yh9csD192yzgtcZn1StFDDB+6htpcLFoKddBA248uc0VWMII
	 WFBo1lKx4y6n8WKBIvQ3SHuXSQcs1/gutyKwDmillCyFLUmXHrwf3Iqryzi5O3qWvJZoR
	 C/eKSFrxd+/q7zi7JIkIS1vDwCLD2Tl7SCQoACOvSp2fanhQRfKel820DPMdo0FWshg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585473;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=leluH48tmTvNZtPilGgUgfgHCWunLADrnXnG+q5Bv/I=;
	b=nvInT8uK9jT4SpxT5fF4Ha2map05H3KFhqgaiodWBaUaekuxwftRA7+QPZ+CMPed7PsZ
	 w0aNpSu2GEpy3h9IvBcLA0o5/u8rnjmv6oDpxxrudi8HrK5rNwTccaivtUbQYky5gAhb4
	 DanqaaSjtFeMEC/iYEhwC9VDGdq2sJyzWbIe/dv/vLiUD910h/HS7hIzPMiTq6+Djft7a
	 RahxScrMylWwwY0Gm2yOjfU4Z4u8UUDjn34Wv/LNGyMnxjzJeRQ5iMHBrYIOS47SSMCwK
	 65b35SIQYb+Cq2PVgOuDP0qoiS8l01SQOM0TuOmIRUH8VTe210hgHvOYePNeO7Y667w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585473;
	bh=leluH48tmTvNZtPilGgUgfgHCWunLADrnXnG+q5Bv/I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oqvY8iOdMQ2uvUV7OylB7ktbmrtULvOg+9ceMhvg8coyGHNfqZKa+tVqWw31mjbKI
	 jpKFPD0GPxxfaYFZSQxOmpL7NjclqzOFeQO7tqQwT2bx3aCaKNJh4qosKu1Zg2g2Ij
	 n3YLmIN6uq5nwDpVhe9WkK1XOGUFPbZppRWJOY0SgAqY4pNJhixuDO7/oBggSMDqd0
	 A1o6TVIQfz+CocNQIg6+n0WEe9og8DPf5gTzYjCxRigWvi8rRkm8X8HlQFEQAoBfMd
	 oL26J1n0vSMih/Wn34RPUXkHMTYRvyr/hJw2UqSXHA0BVBOwOB4ujdRM2kO4xCvRJn
	 MQybTuFc637rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CDE60625;
	Wed, 16 Sep 2026 19:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 998177AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B70D405A7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMkxfMb-NMrU for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3CA8840543
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585470;
 b=nznS/RFQa2/aqFQhih4hKtI+Vs7yrjv/mI6XYFv3qbKB3v7/A0NFq41DMSYCYkGWR1Ga
 DfDXnqw9X+U3He/svl7DqczRAhoVZCOPif/QrSafbrGA25BlHrk50AEYtE2yN743uX0bh
 1bh2Ro/7Embf+VrmtYyuxvlCD0W9RT6yOZaPArbp1HTY7BtlT+EHFBYBT8C8/vO4+QOyr
 y1jh2fd1MVBkbXh36wDBW4gpwpgMavaQr/OOZ2lSGyi+s4pLY4kTg1Y5bCV3I5LmycafA
 s5juWo91KdSfDAhBfwH1wWaHa9f237XglpsbZ2FS72A9VYGm0kTrbl7XNOzC7ucgLUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585470;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QLOaA78gQfeTw7+llFEAO3goztmXYn0pXzztkK5YkCE=;
 b=ayn5BAAovPqVmqu5WJoEyhsd/cVd8eKqle5AUNz0WnJ/F9wTnUs7LkKCdoXjVUR1uzXC
 aq58wSmhEFv7+BLgOUfCtz9jPeBUebfnk+oYgJUda6HdWUpGgdEHTN7Cl+kZUEKu6nh0O
 Goqsqr0HGJO1uSR1WOAGtaUM14pEe+msj787/KQvx8HZPkoaHHnw3K2O2z26WJTmA+5+E
 dL31aoBYp4YCM++uzpcPAWL4f/CZnWkU7NsjGgghA0+kK+Hp410/ZlTqxLRjaLIr+K4bX
 5QdlJc4ArfPYG86lKoqJHVRdG1/e8367H64BIul6HGVV/UQIsc2M22aQfq0s0Gfxflg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vr7k274e; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CA8840543
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:04:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 454C74E40747
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:04:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0AED360337;
 Wed, 16 Sep 2026 19:04:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FE1711C7B00D; 
 Wed, 16 Sep 2026 21:04:25 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:04:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aqrn_EHI3rkmavdp@windsurf>
References: <20260908213231.2542239-1-bernd@kuhls.net>
 <20260908213231.2542239-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908213231.2542239-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/4] package/snort3: fix build error with
 numa support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 08, 2026 at 11:32:29PM +0200, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, but which commit introduced the issue?

> diff --git a/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
> new file mode 100644
> index 0000000000..ca8f7774f1
> --- /dev/null
> +++ b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
> @@ -0,0 +1,79 @@
> +From 3bb2a8fc1244fcbdf24235e541fa2a06a655dcea Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Tue, 8 Sep 2026 21:20:04 +0200
> +Subject: [PATCH] Rename numa.h to numa_snort.h
> +
> +Fixes https://github.com/snort3/snort3/issues/368

This commit message is not really great. Why renaming the header file
solves the build issue?

I assume it's because numa.h from snort3 hides the real numa.h from
libnuma, but you're not explaining this anywhere.

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
