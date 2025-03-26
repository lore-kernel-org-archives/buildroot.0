Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4797C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF7061AB5;
	Wed, 26 Mar 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PO-OdLgEO-jE; Wed, 26 Mar 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53DBE6FA2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DBE6FA2B;
	Wed, 26 Mar 2025 20:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6040B1B8
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF3178418E
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhHveKe_9uMQ for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 20:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28EE884338
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EE884338
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28EE884338
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:32:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C21C2003DA;
 Wed, 26 Mar 2025 21:32:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Mar 2025 21:32:47 +0100
MIME-Version: 1.0
Date: Wed, 26 Mar 2025 21:32:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250323172806.558397-2-francois.dugast.foss@gmail.com>
References: <20250323172806.558397-1-francois.dugast.foss@gmail.com>
 <20250323172806.558397-2-francois.dugast.foss@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <6369e9cbe4e2db67e15bcdc76d66df4e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743021171;
 bh=1uecknvwkD/Xs1/ZosLRZ5hI/ik8TFHxMHZAf5uQFk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rHmb6XHCxiUxifdfDXBb0JmMntf916rIzxH+g4o+iHtbBnXPAzeHWHhy/epRzTzno
 gDOIm/1zWit8taX9MbrCFL/JeTS1zx7aht1+111BqQdu92gF9VsauWpb2zmYGygbef
 RF8zAf9d+Y5enGHugsuGBKm70fnBKA7pWIJ2P2arRqhsnB3j1BQyf0qKV7+QdhlCab
 5iCnH+IorHbCGPkG2a+LHA1mc37ct7BSaEF+PcQE3jkkYZurfasNO2dEhySCx36u+a
 yhUG6nA2PwBUiXwlzeAmrDik52YEjAmlgCuvcBcbpD9XzE5np6KC70qvItwk9ip3H/
 zifTw+Tt1jRpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rHmb6XHC
Subject: Re: [Buildroot] [PATCH 1/2] configs/hifive_unleashed: extract
 common configuration
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

Hi Francois,

Thank you for the patch!

On 23/03/2025 18:28, Francois Dugast wrote:
> Move the generic part of the configuration into a new "common"
> directory so that it is easier to add similar boards without
> duplicating the files.
> 
> Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>

[...]

> diff --git a/board/sifive/hifive-unleashed/post-build.sh 
> b/board/sifive/common/post-build.sh
> similarity index 100%
> rename from board/sifive/hifive-unleashed/post-build.sh
> rename to board/sifive/common/post-build.sh

Running the command "utils/docker-run make check-package" generates
an error here:

     .checkpackageignore:75: ignored file 
board/sifive/hifive-unleashed/post-build.sh is missing
     board/sifive/common/post-build.sh:0: run 'shellcheck' and fix the 
warnings

This is because you move the file here, but the entry in
".checkpackageignore" is not updated accordingly. Since this is a
trivial shellcheck warning, maybe you could resolve this shellcheck
warning (by quoting the variables) and remove the entry in
.checkpackageignore, in a separate patch, before this one.

If you do so, then this patch could remain the same.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
