Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F43FCE8343
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0479A4056B;
	Mon, 30 Sep 2024 13:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5qr96zamWxW; Mon, 30 Sep 2024 13:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A2A404D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07A2A404D3;
	Mon, 30 Sep 2024 13:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E271BF300
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 13:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C38B840238
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 13:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05Bqq-QESFmw for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 13:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44C19401B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C19401B5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44C19401B5
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 13:41:17 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 557542003DD;
 Mon, 30 Sep 2024 15:41:09 +0200 (CEST)
Date: Mon, 30 Sep 2024 15:41:08 +0200
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Message-ID: <zyxgvakx3mcqlcdppprjxxdftdvhu3ubpvroliizlg3qvlxnp2@abaibxzoqzei>
References: <o24zxu3iac7zacfdlxdzhpnjuixozkrf35tznhuodxxkbtv737@hxe2jgbd7d37>
 <20240924152430.61363-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240924152430.61363-1-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727703674;
 bh=xVzsvnBXUbiL6qzo6yz4KW+CmVnabYIFpKBKFJCpFnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p3tuWtVjmQGfg97+1F4sFXkavG9TTNpgIBvESyzNaIiCCdS9/a0mQuphualzZpFa8
 qIFHz36+U2e1cOOOt/Ry4lNuEYawwYgi+hbonY0a9/bO5WdJkbSfyUmkvl8/kAwyLx
 AyffJj5qFQPDgebF0Ee15FqSwGTsYXFsmY/Um881bcI4s4L/weNsINWKz4YUfnewRr
 kzLm6mdy/MUGkR9+q/2f7CisrNGB438n5ZIuHFglpWILBLHpxjazPQhIM9zJ+O+5vw
 C7X5xdBRELez/AhrRE/Kv3Kgq3cmvm/XYI6wj5eGnYYDcMXEnevpgadKNWifGrT6Vs
 Lkf1oJy8BWzBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=p3tuWtVj
Subject: Re: [Buildroot] [PATCH v8 0/1] add DPDK libraries
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
Cc: ju.o@free.fr, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please, any comments ?

On Tue, Sep 24, 2024 at 05:24:29PM UTC, Vincent Jardin wrote:
> v7 -> v8 changes:
>   - focus glibc
>   - drop any licenses which do not apply to the Buildroot's builds
> 
> v6 -> v7 changes:
>   - shorter commit log, include comments from Yann Morin
>   - update mk's LICENSE
> 
> v5 -> v6 changes:
>   - update comments on DPDK patch to compile aarch64 with Buildroot
> 
> v4 -> v5 changes:
>   - fix test-pkg dpdk
>   - fix make legal-info
>   - add builds for DPDK tests and examples
>   - support only aarch64/ARM64 and x86_64
>   - notes: logs of checks at https://github.com/vjardin/br_dpdk/actions/runs/10767364662/job/29854551507
>   - thans to Julien Olivain for many reviews and contributions
> 
> v3 -> v4 changes:
>   - proof readings (dpdk/DPDK, git.dpdk.org instead of github)
>   - gcc 4.9 needed
> 
> v2 -> v3 changes:
>   - include the comments from Julien Olivain
>   - refine the licenses
>   - support little endian targets only
>   - many build dependencies if the packages are selected
> 
> v1 -> v2 changes:
>   - include the comments from Thomas
>   - add a meson patch for the DPDK that I forgot to include
>     This patch has been aligned with Yocto so we can share the same
>     feedbacks. I'll upstream it on DPDK too.
> 
> Vincent Jardin (1):
>   package/dpdk: add 24.07
> 
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  ...-cpu_instruction_set-from-meson-opti.patch | 35 +++++++
>  package/dpdk/0010-Fix-aarch64-build.patch     | 43 +++++++++
>  package/dpdk/Config.in                        | 54 +++++++++++
>  package/dpdk/dpdk.hash                        |  6 ++
>  package/dpdk/dpdk.mk                          | 95 +++++++++++++++++++
>  7 files changed, 237 insertions(+)
>  create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
>  create mode 100644 package/dpdk/0010-Fix-aarch64-build.patch
>  create mode 100644 package/dpdk/Config.in
>  create mode 100644 package/dpdk/dpdk.hash
>  create mode 100644 package/dpdk/dpdk.mk
> 
> -- 
> 2.46.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
