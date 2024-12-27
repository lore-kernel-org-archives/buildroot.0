Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049F2E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C778C606C7;
	Fri, 27 Dec 2024 14:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duW2LAJKyf8C; Fri, 27 Dec 2024 14:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2B36083E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC2B36083E;
	Fri, 27 Dec 2024 14:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A7EE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1358240B37
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwWnC7xKfMDy for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D64E7400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64E7400AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D64E7400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:39:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9069819F74C;
 Fri, 27 Dec 2024 15:39:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58184])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:39:25 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:39:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20241223160331.1853338-1-james.hilliard1@gmail.com>
References: <20241223160331.1853338-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b1af92423e3befcbc7882cb27329113b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310367;
 bh=KtkulDYjPBe4+g5GpCe2xobOFmqQP3ttbjciZz/K7eY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RHmpjqWboUR7+VK3rsZ2t/fLpp0+AgR5xi4mdCjolm2yrsKto5ZKJ3EwfsF2zjBc6
 ul4BHXef8iBX9WpCoveB6pvnmSfSfsMKRANdBPSy73QAUm8gQexUycGY6W2DLZfnH1
 DFZHkqaFzdxg0xz2hAjgkY9zkkhku/3yKPK/WPpmjPTTHKDeeO6di17py6rvePT+h2
 xhhXBoq4LX7aKDevMA9nAcatCzhecAWwdm0fihZGflQXkRNtZ5Xii0N12wJE0f/o0v
 tUv5uBEUp0SaQOIiGxh1eOvqF/ZRpQgxr5xlmu3nZ2o2d3qeojpSKtn/Y7tbeZVPB/
 s7iH1jsazx2Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RHmpjqWb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-can: bump to version
 4.5.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2024 17:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-can/python-can.hash | 4 ++--
>  package/python-can/python-can.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-can/python-can.hash 
> b/package/python-can/python-can.hash
> index 479935b2f0..d343a4a6b9 100644
> --- a/package/python-can/python-can.hash
> +++ b/package/python-can/python-can.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-can/json
> -md5  20133a1b73b58c976bba6b0af8581f32  python_can-4.4.2.tar.gz
> -sha256  
> 1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5  
> python_can-4.4.2.tar.gz
> +md5  e22638e3e5d102e428614715dd04910f  python_can-4.5.0.tar.gz
> +sha256  
> d3684cebe5b028a148c1742b3a45cec4fcaf83a7f7c52d0680b2eaeaf52f8eb7  
> python_can-4.5.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  
> LICENSE.txt
> diff --git a/package/python-can/python-can.mk 
> b/package/python-can/python-can.mk
> index bc67be4f8c..1517777753 100644
> --- a/package/python-can/python-can.mk
> +++ b/package/python-can/python-can.mk
> @@ -4,12 +4,13 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CAN_VERSION = 4.4.2
> +PYTHON_CAN_VERSION = 4.5.0
>  PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
> -PYTHON_CAN_SITE = 
> https://files.pythonhosted.org/packages/a3/17/57c38abbf00993ac5ec306de0c00271685d1372ef3d907b107eb63ab13a8
> +PYTHON_CAN_SITE = 
> https://files.pythonhosted.org/packages/6a/4b/b6fd103c3f2eb0ae942e0704642d396ebbaf87f4d82d0102560cc738fdf1
>  PYTHON_CAN_SETUP_TYPE = setuptools
>  PYTHON_CAN_LICENSE = LGPL-3.0
>  PYTHON_CAN_LICENSE_FILES = LICENSE.txt
> +PYTHON_CAN_DEPENDENCIES = host-python-setuptools-scm
> 
>  ifneq ($(BR2_PACKAGE_PYTHON_CAN_VIEWER),y)
>  define PYTHON_CAN_REMOVE_VIEWER
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
