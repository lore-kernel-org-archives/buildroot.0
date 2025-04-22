Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5745C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 18:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8459C60E86;
	Tue, 22 Apr 2025 18:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_SEnPcEKvTF; Tue, 22 Apr 2025 18:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B157E60F07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B157E60F07;
	Tue, 22 Apr 2025 18:46:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC6019F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69E1260F12
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EliVGs-8DloI for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 18:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C10560E86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C10560E86
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C10560E86
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:46:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BCFC919F5C2;
 Tue, 22 Apr 2025 20:45:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 20:45:56 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 20:45:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250422131054.1115455-1-festevam@gmail.com>
References: <20250422131054.1115455-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <eed6bd9db217808f2944a82dcec09515@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745347558;
 bh=lflYlCPPRXN4Uh74z/g2nprX5qsuDyPRLbQrCMYh+aw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pGh06JwTWSW8/4sjN8ptAqUELqxmpCLE3Sx7kupNlrWCi2rtaaqwIJtpfSc2jzAeh
 dS3S7IaWpxP460hYDv2e7bbW3TDZ1NUPXIYhMPliyGFuoC+XxlPoMuqHfXFogPNYmB
 PHSg3ghoVeQV3/UcnqdAu7s7jPKYj9ZbWiihDGpDpFjU0kERsQjV2sjuo6gVTaZ547
 QxdjB347FGlMMb/w50pEQqphk768dMncPYvsrF10gULaFAMfYNuYigL/7hyK3Gtr3i
 WgIOU04OyfQ29dtq7R6L1OkHVqy/UVDVl0iIKVowsX5XpgBI8GZU0d1ANQEy9WWtl6
 lm6Bq6L5FrakA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pGh06JwT
Subject: Re: [Buildroot] [PATCH 1/2] configs/warp7: Bump U-Boot and kernel
 versions
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

Hi Fabio,

On 22/04/2025 15:10, Fabio Estevam wrote:
> Bump U-Boot to 2025.04 and kernel to version 6.12.24.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Series applied to master, thanks.

For info, I added a missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
(build was failing in the docker image).

As followup maintenance patches, could you also add
custom hashes (i.e. add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
remove the .checkpackageignore entry). See for example commit [1].

Also, there was a decision last year to move defconfigs toward using
Bootlin external toolchains. See [2]. To make sure this compiler
change will not prevent the board to boot, a test with an actual
board is preferable. Doing so while updating defconfig kernel/uboot
is a good time to do so. See for example commit [3].

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/b71d7eae59f82683e547b60f06538c4a2af8c5d3
[2] 
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
[3] 
https://gitlab.com/buildroot.org/buildroot/-/commit/310ab7d53393288aba5c574c49a6cae1bf1e1a1d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
