Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A1FC636B3
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 19:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A70183D9F;
	Sun, 22 Feb 2026 19:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztX1zvVpUzjV; Sun, 22 Feb 2026 19:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0657683D65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771787040;
	bh=LvV49mO6skuKdr9jP/mEPT/fx0y8qu0mms8IP07qiXo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k5ka7JEmU4k7pIarw4RA0jlUYFGCvRV6DT6Ah+t4AMFJoXHWJCMywkenkO/EORklf
	 MobH6JU4l3Vqv6SQYI1H76gE9jmNRvR5LG7e9UBCCBc7mb76ETWWDbbUM+QbEzK4uk
	 DkeiLrR2MlhlzRT0Q31G5RyTgO8GTT9dM+Qh3pfXRsy2HI/PTDZtJsUNABFN6rmn3l
	 IXaD7ML8uoO/aPRoScTqbWJWzDM0PgdVdpZT+gHjnSJ+HMorDcZVph5z3mK1t7dvfJ
	 /XOYvUZ5tchetQBMM852XQ6wc/5DiXIw4dOAvlsGmoQfdLeB8JUV/O5BkamhRzKmgd
	 3hOZHOncV1dvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0657683D65;
	Sun, 22 Feb 2026 19:04:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53990249
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44DCE40268
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnvyTkXsHn88 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 19:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46FD840169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46FD840169
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46FD840169
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 19:03:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BF4702003CA;
 Sun, 22 Feb 2026 20:03:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 20:03:49 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 20:03:49 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@xes-inc.com>, James
 Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260218220435.1849890-1-romain.naour@smile.fr>
References: <20260218220435.1849890-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <7e735ba5dca8d72f719b3c01b52835fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771787034;
 bh=fxGQGmKQNGA9KgSbP8qthU7voV8EJHMfihmJNKaycHM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dZQARBxWjPv1dRdA86LqR8Vqp7sdtscIGuSOdMBWSff53YuAGhQ/vU1lqzcwR05Yg
 nMrEpnKolfmn3MsIFzZLonYGQpd8+jZ2nn8yr1a2ev9slzW8OHUd6+RGssbLN6tWab
 VLpzM56H0cH45gIxFrUEd/5AsVmAjnbmijyCRQ8frsxTO+6KmaAgbQsXpsUgE8rf30
 FZwV2qIBUbiu4LXU/vntgRLhzR+5W6entkzlCZW2GZ/wQ1/2UT8/SX+7kAGtUrSXaT
 Pg49NnqkCWOGqTSd18KPseIdE/qGMuz8eoY/arWxFtLqOL/+fOTuP+RhIASgOEuwER
 6Z748iL6bO9VQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dZQARBxW
Subject: Re: [Buildroot] [PATCH] package/python-pybind: overwrite
 'pybind11/_version.py' with a hard-coded version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/02/2026 23:04, Romain Naour via buildroot wrote:
> Fixes build error with python-pillow since its version bump to 12.0.0
> which introduced a dependency to pybind with buildroot commit
> 5f446a8d6dd8715385d6e2df2714f064bf26243d:
> 
> FileNotFoundError: [Errno 2] No such file or directory:
>  
> '/home/bernd/buildroot/output/host/lib/python3.13/site-packages/include/pybind11/detail/common.h'
> 
> Implement the solution suggested by Vincent Fazio [1]:
> Generate `pybind11/_version.py` file with a hard-coded version to avoid
> copying pybind11 headers in HOST_DIR.
> 
> Fixes:
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/13138981946 
> (TestPythonPybind)
> 
> [1] 
> https://lists.busybox.net/pipermail/buildroot/2026-February/796082.html
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
