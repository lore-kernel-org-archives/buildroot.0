Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA19CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 14:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3688360902;
	Wed, 29 Oct 2025 14:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klHVY07VRmiP; Wed, 29 Oct 2025 14:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 573F060A39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573F060A39;
	Wed, 29 Oct 2025 14:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E354707
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CE1860A39
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 14:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCGkUs-WANKJ for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 14:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28CC060902
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CC060902
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28CC060902
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 14:00:59 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 810546014B;
 Wed, 29 Oct 2025 15:00:54 +0100 (CET)
Date: Wed, 29 Oct 2025 15:00:53 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com
Message-ID: <aos7pxpaqtz3y7x2rxow2wxhzwiu45it4yiaw74zxv7736mi4o@wk6tdskjpemm>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-5-ycliang@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027033242.1797230-5-ycliang@andestech.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761746457;
 bh=io6dVtWKihhR8zq3qc8ymYBifP2Ejo8ph1UCiasmK1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYdMH8AVZkWFjxXwvcZpmthOnJiXgi08wCuvw5bDj7uQQ5kHCkoMMI5vUw/wmeOgi
 ro4WNBTVoxkqjZp0RX/JsA8lbk6U0mzOZUuO3KmmCdiQnVQ11Y0rtOcfo7/a8Snl2B
 MoAuJdJcN0BW1IH0l+8+nY4dLUd/yaTMSvMEPuGj1m2VTiWyVNDNbxH2h58Wrysp9c
 92NDR0dXHO6D44eF3GGUPSDpDphKA+6jNut+kumPUeqcbXUcVnUSZujxzEkpg2EgsX
 rdJ+OfkJT/3rQ6go61AvHXAO15Jg/iQGumXKVc0psd8b53Z+LjJH2DqCBCuKxf3QfB
 HIZK3mYw1QIJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WYdMH8AV
Subject: Re: [Buildroot] [PATCH 4/4] configs/andes_ae350_45_defconfig: bump
 to uboot v2024.10
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Leo,

On Mon, Oct 27, 2025 at 11:32:42AM +0100, Leo Yu-Chi Liang wrote:
> This bumps uboot to v2024.10, removes unnecessary patches,
> and add proper hash file.

Why 2024.10 but not:
  config BR2_TARGET_UBOOT_LATEST_VERSION
      bool "2025.01"
?

It is nice that patches can be removed ;)

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
