Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE76C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B4370121;
	Tue, 21 Feb 2023 02:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B4370121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJgxU4kcWp6e; Tue, 21 Feb 2023 02:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC27702AC;
	Tue, 21 Feb 2023 02:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC27702AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4791BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E656109D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29E656109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8J_c0JKqUZ1 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E35AB60E63
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E35AB60E63
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:57:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CF0AC0005;
 Mon, 20 Feb 2023 20:57:25 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:57:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220215724.538719dd@windsurf>
In-Reply-To: <20230219173536.615233-1-fontaine.fabrice@gmail.com>
References: <20230219173536.615233-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vp+Vm4x7me48Z2jQWx/gTEYaLOFE8JHZRkZQqgJe5/o=;
 b=jRZCk3hGIvLuoUHlaA0xlE3DH8w0eoHInjNamk0VS5Ihg+SF5Ou2gRR2iJGV1+JU7JoVls
 nbmWpZBWU93aWC+JFWd2qHQzk6CxmpfFtGzNIDES//y5hpZWwns0CGkSX1FAM8dB6BK7Rs
 cxNJCtGvGpi4uLgYspLKjxrjE+MC+6mA6A0UPuSqchUJR6ozzY/Bh2s5TJJ4Fh7Qt9D3R2
 PaqFZsnvXAnhaE0cVvOpikyX2rHyyt+7CabWUmqTmLx3Qu/GrwyHGdsblJG1OOTe/j/Frz
 7i2w9ecT52bnLGoonH7CfH36PxDC1mDdjtTobY5Vk6qLpMstqcyWjVNdh4Kv+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jRZCk3hG
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/nginx-naxsi: fix build with pcre2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 18:35:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of nginx to version
> 1.22.1 in commit 722b84eafa5e3d9540e0a80bae0c971a3a778358:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c: In function 'ngx_http_process_basic_rule_buffer':
> /home/buildroot/autobuild/run/instance-2/output-1/build/nginx-naxsi-1.3/naxsi_src/naxsi_runtime.c:205:61: error: invalid use of incomplete typedef 'ngx_regex_t' {aka 'struct pcre2_real_code_8'}
>   205 |       (tmp_idx < len && (match = pcre_exec(rl->br->rx->regex->code,
>       |                                                             ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7fff888bd36710e2d2f5bb39a38597e8c04305ce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix patch number

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
