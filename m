Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA22AE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A9F80ACB;
	Fri, 27 Dec 2024 14:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JM_HSlKj1IL; Fri, 27 Dec 2024 14:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD3680B0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD3680B0F;
	Fri, 27 Dec 2024 14:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06DA5E0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13DA80B6F
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qby-d51zN4_2 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B745580ACB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B745580ACB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B745580ACB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:40:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2284019F746;
 Fri, 27 Dec 2024 15:40:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 15:40:10 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 15:40:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223161425.1858075-1-james.hilliard1@gmail.com>
References: <20241223161425.1858075-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <52573adcff81df99e5b59d76033561ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735310411;
 bh=uTpovD57isB/+oh2nm3q70xhw2qM/UxNrqwEadppZyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C+PQP/BaMurNOBx/cJaqXEUC9n+GYgnevyCVloIRGTon+G9Pu3ynAKUBGnAueh8FT
 grxgQ8LTLIv7rLg8H//TTCoCkOZPQnfrrsOFowl9WbWBgc0viW9OSAuJw3fEOAevxd
 0DtwJanOwWLZSwxO73MFhOlAY90saXtVc8lSTdugOBkB6/34ZnmjnFrdLF48jzrqkP
 X8rAEQ8xpljOC0AfX8CK5VKf/9PQIYOQqJ6i8TtM47jtE/FuQSQQ0VXNHotxmTsxFk
 rehOWG8nxXHKw9lk+AEKpnskQwojQ/QgNP3NWM55/iH5byGHiyKMGdSv52RJiL4MxQ
 qBwTMHU/lVglQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C+PQP/Ba
Subject: Re: [Buildroot] [PATCH 1/1] package/python-channels: bump to
 version 4.2.0
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

On 23/12/2024 17:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/python-channels/python-channels.hash | 4 ++--
>  package/python-channels/python-channels.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-channels/python-channels.hash 
> b/package/python-channels/python-channels.hash
> index 8f0a529460..0d849f9a57 100644
> --- a/package/python-channels/python-channels.hash
> +++ b/package/python-channels/python-channels.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/channels/json
> -md5  bfbc466f2e0a06a8834a4be10856ce8c  channels-4.1.0.tar.gz
> -sha256  
> e0ed375719f5c1851861f05ed4ce78b0166f9245ca0ecd836cb77d4bb531489d  
> channels-4.1.0.tar.gz
> +md5  172a3c580efc46ff3cbfacd59084356a  channels-4.2.0.tar.gz
> +sha256  
> d9e707487431ba5dbce9af982970dab3b0efd786580fadb99e45dca5e39fdd59  
> channels-4.2.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  
> LICENSE
> diff --git a/package/python-channels/python-channels.mk 
> b/package/python-channels/python-channels.mk
> index 0e00e7ea4e..83584b469b 100644
> --- a/package/python-channels/python-channels.mk
> +++ b/package/python-channels/python-channels.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_CHANNELS_VERSION = 4.1.0
> +PYTHON_CHANNELS_VERSION = 4.2.0
>  PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
> -PYTHON_CHANNELS_SITE = 
> https://files.pythonhosted.org/packages/7d/73/da9e496657b242308d68cf79c937be125fcca4af61a620d98adfdde66fab
> +PYTHON_CHANNELS_SITE = 
> https://files.pythonhosted.org/packages/96/e2/10d949dca9eb8a85c5735efefe3309033419e7d4f4193a70f6ede58b2951
>  PYTHON_CHANNELS_SETUP_TYPE = setuptools
>  PYTHON_CHANNELS_LICENSE = BSD-3-Clause
>  PYTHON_CHANNELS_LICENSE_FILES = LICENSE
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
