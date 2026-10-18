Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BA8CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEC540937;
	Sun, 18 Oct 2026 09:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gM_1uN77tXlg; Sun, 18 Oct 2026 09:52:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ABB4F4094A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317138;
	b=ECLxw4rJk/FnFx3XxQ/f744Uu5ZeSAaIzVomMC5F4ST+8znAaCtdVGlZYsV7q6NW72La
	 yFjQgAC0q7q3u7MfnADXVtht+ToRBWZRT5HQgO5bdImDx9AheS2MoiNBOcOqRFZ2Re4ur
	 hbFgfeKsFADmBEBD4ehrVu5zd9nkbEzPBXfu1Wcyf1vo02/hh4HZcEM1VFtc/bnw5moyC
	 noMW+wZX+B3dD8L8O8MMBDo3dGNZvVqGp7pxalLCC0vLKxBG0iTA6DpbnIaQZ4oNeIcCO
	 m6gCndYFV8nfQ+7Z/oYHUnsmvyg8xjfYl6xQ8YjhxPgjNG+g68RHxL17oZ7qtJere0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vN4G7HmrCsjMfckkZng21yFvubYFyc56Z1L2OMSIiaw=;
	b=ZL+m9BXVECy3zWV1OnAmfQX/cKnYg/u7igsKn4k2KE9iyM9K3CVl0jNtP9K2PJyLtkgZ
	 HjxRjGuYz/6TAHWAdGQlwbtV+Ah4FV8nmiA/kdJyyWkzlAtVaWwr5OV8O5Qt7sORYl80L
	 PpoYEOfwYwJPWrv1crSQi4EGpOQZMnXIxUZg8mD21y+/creatk2hW6pIvoLU+BAj1rQUc
	 c6MrW8coS6rNHvFLgiFNzL/xxdWcxEjVWZZ+nN7yj9CA/pqwRDrCpW07aGdDm8NbZjMOg
	 WYJV3Kjk+NVj0LcytpmcBveqAVxrg3XwHJtL6OgTBlzQKOnGj5VYkyQuk5MOb90aCkQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317138;
	bh=vN4G7HmrCsjMfckkZng21yFvubYFyc56Z1L2OMSIiaw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lmAuA69py1J2jtWZZ2zXMd/LqUnsE+VLR/Iu7PCPDBOtd+GRvHuz0qNX52AbVLOv+
	 x1EPlH42+JAmFwPKflVmvJ+L//l6/xE6NgaR9g5Aw2tlcok3MkQTwrF7hIqxJPmNc5
	 cI3hAMe5TAjDVEsQML5aVuY608XbJmI7ujoZtEpm7qCocmSD4Fmd7V/CdSkvch9H/k
	 /n6jUcPIsZjhqaUaGeGiphJc0NGGMvfpWnmpi0Ee/levO19fn8m01Z4gFqTYXuEa6n
	 /lLa6jKzgVivKBqxA0lEcgFR/Y3oNrVGXChda+JG5LhlExRcZ9mCVMwjRs15uoehnk
	 rPs77mIyXlTyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABB4F4094A;
	Sun, 18 Oct 2026 09:52:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B5423F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C73984094A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVkKdVRgUXTJ for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:52:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70A9C40937
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317136;
 b=BaRTlTl/4mtBfNr6dnhnWcrYB1DUkJOTLR9DIwqxLTgy26hXlEV8DoeWXFQ1ENTlqFU3
 Rbs+0bQQMXr1vEVG+MYvhm+KZOcHjKUtxH/lokrtHEQ4DFGpxjs8as8le5vLAlF1NSwJF
 Z6Ufhk4HOGEJ40EX2vjYy/ik3Jroz2EyH4gP23kKzohc3/vhu7jWviaNMMIKJnHbAE8ls
 ucEIoDgFwGMWcWq8I16E3POlgMEL/fEFWTgO7OlV/tNpWIuZjrI8O1xglhXDdDFCBCPVy
 iHR+XkRzD6/xtPsCcXlU/eM08I8zAwvnJ9odtMFsmwukruwV9190HWLK7plpRe/n14w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317136;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=XJOmtBSM1Ii+Zx5e68akz8iLtnM+Adv/XKdd4KiN4YU=;
 b=nuaUtueIsStBVQ/yIXC2lRtGvO6/79QsSq8RqOl7D+xo1pddW9luaoabQQmMBbjGKFT+
 IwCuzygY5yR/tmS+XabxeMGY92Sr3TmZQRJCdKyUcGUJwa2cagQeSYioUW8WvbzpvxbJl
 8slXgLQbS7TyWpAj3Q5Qf60QUVrofbAtmBwpV2X/HhGhGKp5qBhP6fR0tKt0IBb2MPctn
 oCUxJMH/LwzCh+3jMZd4BiaZ/bfjwf+4Bmpt/uYr5KjkvGbu2MW6S5hgQvABYMoG0ZzqQ
 2yHqZBuc/Gq/Z8ZkPohiknzI8A0nBzb3bKmCZM8AcEpXlkrQ8Y7AsWrB2KQb4KH01Rg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="vOjGB/Va"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70A9C40937
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:52:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4BC355FFBA;
 Sun, 18 Oct 2026 11:52:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 11:52:09 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 11:52:09 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261016152811.2817446-1-fiona.klute@gmx.de>
References: <20261016152811.2817446-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <9146d25fb8eb43a6ce662baee5dd2014@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/4] package/uboot-tools: do not require
 OpenSSL PKCS#11 provider
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

On 16/10/2026 17:28, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Patch 0003-Add-support-for-OpenSSL-Provider-API.patch makes
> package/uboot-tools build without the OpenSSL engine API, but it fails
> at runtime if pkcs11-provider [1] is not available. That provider is
> not packaged in Buildroot, and should not be required when not
> actually using PKCS#11 keys.
> 
> The problem has been discussed on the U-Boot mailing list [2], and
> part of the reason this patch has not been merged into U-Boot yet. It
> causes tests.package.test_uboot_tools.TestHostUbootTools to fail with:
> 
> === STDOUT/STDERR ===
> At main.c:259:
> - SSL error:12800067:DSO support routines::could not load the shared 
> library: crypto/dso/dso_dlfcn.c:115
> - SSL error:12800067:DSO support routines::could not load the shared 
> library: crypto/dso/dso_lib.c:147
> - SSL error:07880025:common libcrypto routines::reason(37): 
> crypto/provider_core.c:1026
> mkimage: OSSL_PROVIDER_try_load(pkcs11)
> 
> This commit adjust the patch as suggested in [2] to continue if the
> PKCS#11 provider fails to load, making the test work. However,
> actually using PKCS#11 keys will not work until pkcs11-provider [1] is
> packaged.
> 
> [1] https://github.com/openssl-projects/pkcs11-provider
> [2] 
> https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629348.html
> 
> Fixes: f87cf2d6239d676147dec1fef088d81ee873277a ("package/uboot-tools: 
> Fix build with OpenSSL 4.0.0")
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
