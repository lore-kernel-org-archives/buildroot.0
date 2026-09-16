Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D04C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC23404F8;
	Wed, 16 Sep 2026 18:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL_wOhco0Pgf; Wed, 16 Sep 2026 18:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 819034053F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584679;
	b=KfofeE2D2OVJd55YVR5POQcjE3NsJ6lF+ogcqorFcyPRnshaZDxK9aQQWvvJ3mJfsmj0
	 Tvnh4WdhjuMZtuIW0JrZPhLC4LyXhtjU6mH6ynq2e6likYaxWY89Bo9qskZFfKh8ZcLP5
	 6Vdj+BRxO2SrVXMtD4jeGhQUFfZVnuQJ7C7Dg+ZAFAU4NtoYHp8gM2LUSLqFG99tinvuC
	 Od+qQCqxcVHvaYWIdWzkphNbtm26PhwtPanNj/DtDsIgkyD19hf8IbbsyLN7EtaoFJlP8
	 f2EgbadKa1SeW648T6PQ8qjZZisVxn6SynxhhDbSf7Bgvo65f/7/ZWjnr06paefGeYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4bEKHGCCIxVE0U7Sl3nu7u0+YhtVgQJAnxIR7DD2fh0=;
	b=tJwQckavhnsYcHA6EZXDbKqZd57b41F0BM7teK1uHW23sZvMVPZH1lqhZTs/Jwap59rH
	 K7/3YXS/vYupZpK+yWSo4WyNmFP5f2gDtqaPsQsd7Gkcs7jw8vlU2n9Eesp9Ed/9ZnkI6
	 n4kG7ILjRtB3ucH8JpkSuyhjDn7hkTW0m0ux3SwYwNSXqDFv9i+dIzbF7jIUoqJh818Vx
	 bwg2Txcb/7JEUU36552F1lxDOYafT54LtSlblsDzYNC78ehZAOHELlDX3dCMy9oXSRnjB
	 0TmMuPGicktKk2DD++NV5wRhP/fyTkVwHSHk3iUoUgXD8tHT73Dczf0tF1aim+VYNCQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584679;
	bh=4bEKHGCCIxVE0U7Sl3nu7u0+YhtVgQJAnxIR7DD2fh0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HBi7t1KqxIon3d4m7bQpHQiebBYffQKCwwgCxMIaSAffxwowQNl0VVQpXYPM4jkNe
	 wVl/kpcP6dyFJ1rPvaZPZUkGClMj7LWBrKUa9KFf8vfMOIkPbV0UbydGq7y5MSWu0S
	 27vuwyoYGhPDRj4adTk9ZaHKQ+6r0l9dU30o5122TBDiTdrIoCwBcw6sR7CF8g/Ymv
	 a2DDY5FZNX7R5We+69/XjJLgb05R5r7pQA8dlktjO0qaK7LdoVOXE8CtU994mj7pYp
	 iRbcs7+dMvmgGQYPQevT7tQRi04WCADk9JQGmpYrAdl6S0nrp1a3JSL113NHZBJYzy
	 hArzVudYZK3aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819034053F;
	Wed, 16 Sep 2026 18:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52A16388
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 445A480CBA
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wgl-6GY8z6Ox for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:51:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1AB7880DA1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584677;
 b=eSfQOHvQ+5DKFMnOuf7PXgG1u4K6RfsmkT3gwBGVItjhDoQ8zQuBrHcfGasGxfGfQuIx
 1dizQZp+ZxDmjlz8k3MVToMXKDKBTLB/uOxquGgFkXpim6T+kr7OtWGSQ9czS9+/yxOOb
 eCCi1G38RREmXkP+cna5FFLAmjJns3zNlS6X8fd9f6BAySzeWBgzKXS7EqFwcLg0Kp50x
 tEz7iEVJZ8DCQ7pX3ruiroDxPDgqB8IcKCCDuI66dccE8KJ+BMW8njZucbY6rSN7ibFS4
 3oK4O/uNK6/31y5Hwt45AeOgzPU9/T09Iddaw7bTv27HTzyvBXzppT+pDa0VR6yWLbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584677;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kmW3JwEjDDT3pBbCrX23AwE0dvsT2Sr8O/Cnt4LSVn8=;
 b=PTLvtqkqWDkeHve6fgOXoHpm6IUKJwfaE6VzKUsW4dHfNHgKI4BMLPXitNgl3gZaT4/c
 GEjWONmSCP/yrYVJFd3YZ61R0dj2gq5os7cEKaD8JQBbTdop9EE3iKkfC2bMIkjKUAoj0
 GT4WhT9oC2lJs2SLmziV1aMJ60MeEuLsOyaBSh0J2QxnOEF0RptZNqSW9xtNnQXgHIPMF
 9H9Li972VefQ81rDRQpY5q6OzWmi25bcLEM6m/7qdN+ck6temmmUuEucg1qq486gQGbjI
 LAcdccIavALA1Eyxkt9Zra1nOMcyZpbuu7WEThCJsuyEXGDj5/s5eK/rcdAGvQ/gljw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oTHFwIdX; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AB7880DA1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5CC0C5CD5B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:51:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8C3160337;
 Wed, 16 Sep 2026 18:51:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3167811C7B048; 
 Wed, 16 Sep 2026 20:51:09 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:51:09 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aqrlF5OeZuPpkbWq@windsurf>
References: <20260914084038.727312-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914084038.727312-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libuci: bump version to 74f6277
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

On Mon, Sep 14, 2026 at 10:40:38AM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Changelog:
> 
>  - 74f6277 cli: in batch mode, print empty line if get fails
>  - ccc1719 libuci: fix extra new lines added to errorstr
>  - 66127cd formal: fix workflow permissions
>  - 5bea135 github: ci: add MIPS64, PowerPC64 and RISCV64
>  - ebb3a01 build: install uci
>  - 238963f github: ci: add powerpc arch
>  - dec51f4 github: ci: add cmake build and source directories
>  - 8022b2e uci: add a simple build script
>  - e1ab90c github: ci: add tests
>  - b65c091 github: ci: disable json-c tests
>  - c1e2eee github: fix CI apt dependencies
>  - 2e46a74 github: improve CI
>  - 57c1e8c github: add CI build
>  - 5e69eda CMakeLists: fix CMake warning for INCLUDE macro
>  - 272fc13 lua: CMakeLists: drop redundant cmake_minimum_required
>  - a072095 lua: CMakeLists: update cmake minimum required version to 3.10
>  - 9033e8c blob: use blobmsg_parse_attr in __uci_blob_check_equal
> 
> This bump fixes the configure failure with cmake 4.x when the Lua
> bindings are enabled: upstream commits a072095 and 272fc13 drop the
> "cmake_minimum_required(VERSION 2.6)" statement from lua/CMakeLists.txt,
> so the Lua subdirectory now inherits the top-level 3.13 minimum instead
> of being rejected with "Compatibility with CMake < 3.5 has been removed
> from CMake".
> 
> The license file hashes are updated as well, cli.c and libuci.c changed
> but their license headers are untouched.
> 
> Fixes:
> https://autobuild.buildroot.org/results/43ce08497863ff54c8acf3b0bbe7cfbdbc640d14/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
