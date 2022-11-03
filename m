Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25271C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 12:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A38E140B61;
	Thu,  3 Nov 2022 12:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A38E140B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVFUWymaQj7C; Thu,  3 Nov 2022 12:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1F914025D;
	Thu,  3 Nov 2022 12:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1F914025D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7CDC1BF404
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 12:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 827A54090B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 12:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827A54090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGOpuo1dCeC6 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 12:13:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771D34026E
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 771D34026E
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 12:13:00 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id f63so1505088pgc.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 05:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wo/O6LrOBH8ms3J/95L0pIqVKMSJMKJeMCIGdnbeYtQ=;
 b=V0QIV2ePGocPa30diDVMBd2vY0DLLV2jO/ZDlu/5etaGsQI1Y3fTY6vTBGhn1Rz1bp
 9j2GtF3OK2RAYl8D3uvU+NnLx4/n6VSZKMN7yk9mSdM6t/oFtEtqQa7F+ZVDCr0OW8ip
 PRfRWjQ0H3VFp+49stP0ipKskQrV2tsOY4xUfbP+IvRagroXAJZ8NNRfrYUHC+cE2YWr
 4hhdLwfXVe+P6BJIWe1ufxmW2GfO/JEp0dx8J9Zblb4QD0TGqqBziZt2smz5RAy8IZMp
 VNi8P7rOWBhdZBYdEOY6gUGnN2k68LqPWuPelVEILB8GJHzawdrB1MOI1vxFJArogCe0
 kjjw==
X-Gm-Message-State: ACrzQf3h0pDfP5nLC1Db9/SMUzFQUSPwoAzvc1wnsscEaO/BJuDj38FG
 v0ezYgf9ZFPIB8yhDitW5s6/i7xbc/cYTDFt2aE=
X-Google-Smtp-Source: AMsMyM4+1hTr8y4ri04jiKTVg/K3o2UzwA3EetztNFtM8tr6YDfB19mLmxDVnx30sRoRevIpe8Y+qzb25MUpsKPjyq8=
X-Received: by 2002:a05:6a00:4c16:b0:56d:2634:c28e with SMTP id
 ea22-20020a056a004c1600b0056d2634c28emr27163244pfb.8.1667477579797; Thu, 03
 Nov 2022 05:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
 <20221103102102.924370-2-m.niestroj@grinn-global.com>
In-Reply-To: <20221103102102.924370-2-m.niestroj@grinn-global.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Nov 2022 08:12:47 -0400
Message-ID: <CADvTj4p+q-VWX8FD4mpb9E_zEnbcepK=Cv55f-OD-AoEXs-ROQ@mail.gmail.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wo/O6LrOBH8ms3J/95L0pIqVKMSJMKJeMCIGdnbeYtQ=;
 b=TWz/sTm5kaInneXxZdJUlYxebwq50hg0dQVqP7ImJZyiTQADfgUDZluIDuk4vHZZtI
 Y002P0Iz5Eo/PkIaagvpONCsClNEXVmBBXNbQpfTu+nWydLzPsHL1+MKQrJJIDEyBiGn
 K/pSIWAsvMglDS2VGJlPm3rOyHsDI5dRVimDWdX+Dd0ygxp/LRqG2hYaI64FiVvtuWjI
 SCIpx3VtACO/5sPU3mVNQBNOzYz7WNn8v760P3msLMoyNt0vdeRDYhFM+ma0m803+BRp
 gkupEQbQ9QPS7lFjkXFltpb1cvNyAFet155B93+I7X6c22x3EsSI4zgAwxxzYCm2te66
 tgiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TWz/sTm5
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bleak: bump version
 to 0.19.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 3, 2022 at 6:21 AM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> v1 -> v2: no changes
>
>  package/python-bleak/Config.in         | 3 ++-
>  package/python-bleak/python-bleak.hash | 4 ++--
>  package/python-bleak/python-bleak.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
> index 085c16fae8..691450f86b 100644
> --- a/package/python-bleak/Config.in
> +++ b/package/python-bleak/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_BLEAK
>         bool "python-bleak"
> -       select BR2_PACKAGE_PYTHON_DBUS_NEXT # runtime
> +       select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> +       select BR2_PACKAGE_PYTHON_DBUS_FAST # runtime
>         help
>           Bluetooth Low Energy platform Agnostic Klient.
>
> diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
> index 5acac877c9..9a8310b11c 100644
> --- a/package/python-bleak/python-bleak.hash
> +++ b/package/python-bleak/python-bleak.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/bleak/json
> -md5  0c26b270358a782767012220fc595aa5  bleak-0.12.1.tar.gz
> -sha256  4a80a24cc944e52e856054639f298229c39a2fc720e5f7adbeebb117d10849ed  bleak-0.12.1.tar.gz
> +md5  57564087d6e17ad1853109f530279b27  bleak-0.19.1.tar.gz
> +sha256  dff7c7f281dcb6629d0d722209c79ec3aa2a6c33867cb5c1ea3d44b72ca155c0  bleak-0.19.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index 3ae6d90311..00a4946ef6 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_BLEAK_VERSION = 0.12.1
> +PYTHON_BLEAK_VERSION = 0.19.1
>  PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
> -PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/67/4b/ba00c69a24a8d08c86f02caa45727a2ad2844c7bee9630ccb063be226f71
> +PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/30/b9/60e1f455365e2340fe076cf7683f4e6d03db0b759d4f93fa45e68dc371e5
>  PYTHON_BLEAK_SETUP_TYPE = setuptools
>  PYTHON_BLEAK_LICENSE = MIT
>  PYTHON_BLEAK_LICENSE_FILES = LICENSE
> --
> 2.38.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
