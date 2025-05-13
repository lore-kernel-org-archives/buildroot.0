Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E741C3ABD9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD86960FE5;
	Tue, 13 May 2025 21:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJPzNxQwGH5n; Tue, 13 May 2025 21:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0798E60FF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0798E60FF6;
	Tue, 13 May 2025 21:42:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC73150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3188460FE5
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCjqBT-zcifG for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 733A161019
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733A161019
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 733A161019
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1DD9820039E;
 Tue, 13 May 2025 23:42:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 23:42:44 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 23:42:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512211344.721883-1-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <acb8a6301741fe5d989f9350cb9bc3da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747172566;
 bh=7g0gt+qnlJf+QrINahc5Vrhz3q6jOhu9mGfzLUDQomY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WFbYFU/Rbo4j3f9Nn2MPqGEvOq8NzulKO4+HDodwJAv4RiXpCkHbLa01uuxcGEv/r
 Tyf5sbVy6pMzSasHfscz9Emp1QSRJmgnc+U/xqIlUCBgnr15GPlop0epXWfMUcVbtE
 4g7JHW2Z2TJIrxrDuIen7baybQwoVNwwlnNHmYZlkxkpbBYS2p6/KH7Y206CwzLWz/
 e35xRWqcdCNzFJFU34n95WuM/eSkG7hRtI20JN7JqyfEMHt5mbolkBvXH8oEODbS2c
 F5C8/M3ZnIftFsGIQIL579m4GAR45WUEsIHS1PE4mnzUs2nk0treYATgougNRgJ5ke
 zWXZZll7LDbJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WFbYFU/R
Subject: Re: [Buildroot] [PATCH 1/7] package/python-fastapi: bump to 0.115.8
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

Hi Marcus,

Thanks for the patch.

There is a typo in the commit title, which says "0.115.8" but should
be "0.115.12".

On 12/05/2025 23:13, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
[...]
> diff --git a/package/python-fastapi/python-fastapi.mk 
> b/package/python-fastapi/python-fastapi.mk
> index 2662f3ddaf..95961972fe 100644
> --- a/package/python-fastapi/python-fastapi.mk
> +++ b/package/python-fastapi/python-fastapi.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_FASTAPI_VERSION = 0.115.8
> +PYTHON_FASTAPI_VERSION = 0.115.12

The runtime test is failing on this series, when executed
with command:

     utils/docker-run support/testing/run-tests \
         -d dl -o output_folder tests.package.test_python_fastapi

There is apparently a missing python module "typing_inspection".

Could you have a look to fix those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
