Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C11BC282EC
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 00:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B27C611EB;
	Sat, 15 Mar 2025 00:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzv4J4x1X1gn; Sat, 15 Mar 2025 00:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3756124E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3756124E;
	Sat, 15 Mar 2025 00:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 238AAC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 129B1402BC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmW1iFv8IAUx for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 00:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9C4B41A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C4B41A74
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9C4B41A74
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:20:29 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:adce:9a58:bcbc:dc56])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0073F780333;
 Sat, 15 Mar 2025 01:20:19 +0100 (CET)
Date: Sat, 15 Mar 2025 01:20:19 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, 
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <tgtoembl4onqetkydvcxsklh7qkggiyecl42vtpjurvkstmrsd@z4wxhbx5v3em>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-8-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302215219.1276480-8-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741998026;
 bh=w47YTgYJUubxvGaRwU7EcKA0tBUbpxxU2TPSrP1inu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJc93Gnxil4Rdg/v2p9jUKXza7FSPqCCFpEcrkQoGoWbBZ70FDKxc4/uP3sDmZ9WE
 e6UxDXMcJ/dG0yoMPVy7THJDCV2A1GgqobTz2Ibuiu83NJ+bygqV1wMRaZcetxU8yw
 +0MqsVxBrDjiS4qH7Rn0WWY+1SgBRH2b1l/99mcU+OcmA5EyDTKNpin/ItYKigNeQv
 xyNMd1HhfXjJvpafbTH0ULPiHH6FgtOnB72Rs/5FU75v/TT3uIakzp9jqM3ZWoPH24
 phnz9ybZCqvu4vkCyDp9bBtW9Y91DDG0n0ZmL5W8I/Tt+MB+PCSMf7cYfkrLPYYEmg
 p3WDU3RJz3Sgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SJc93Gnx
Subject: Re: [Buildroot] [PATCH 07/15] package/qoriq-restool: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 02, 2025 at 11:52:11PM +0100, Vladimir Oltean wrote:
> Introduce a package for the restool program, which permits the user to
> modify the network configuration of the DPAA2 subsystem and create one
> that is adequate to their use case.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>

> ---
> Change log:
> - Reindent help text.
> - Fix license.
> 
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/qoriq-restool/Config.in          | 22 ++++++++++++++++++++++
>  package/qoriq-restool/qoriq-restool.hash |  3 +++
>  package/qoriq-restool/qoriq-restool.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/qoriq-restool/Config.in
>  create mode 100644 package/qoriq-restool/qoriq-restool.hash
>  create mode 100644 package/qoriq-restool/qoriq-restool.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
