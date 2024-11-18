Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23815D60CF8
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 23:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B687C605F4;
	Mon, 18 Nov 2024 23:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXxjrqfl3Fwz; Mon, 18 Nov 2024 23:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB48D60874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB48D60874;
	Mon, 18 Nov 2024 23:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB1BDB2
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE59840186
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HV6w172UnoX for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 23:41:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67C1840170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C1840170
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67C1840170
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 23:41:40 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:c4ca:84b0:902:f281])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0DDF85FFAA;
 Tue, 19 Nov 2024 00:41:35 +0100 (CET)
Date: Tue, 19 Nov 2024 00:41:34 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Olivier Matz <zer0@droids-corp.org>, 
 robin@jarry.cc
Message-ID: <egtut4qkub4u4bruoraffjyszw57jwso2m64h57hf2tlaf6znz@vogkglwpkttn>
References: <31efd2663d1b8e193e49c0cc76113384@free.fr>
 <20241117201744.31404-1-vjardin@free.fr>
 <f878eb52507a883446a6a4284656b9ef@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f878eb52507a883446a6a4284656b9ef@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731973298;
 bh=T9lkTsaaFykyMMT0xdlIrib+fgmri5cJhYHmwEN5OqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aICzjTVSVVK09y8fHd6kQETNC75Wf4hCpgnaYgurhrONin93/m7ruFsKfNQEqCwAq
 yXVWQhgKkFCcQ+1709c1eJK1UVTVeV/vEMFyfuCxsS1jHQr6Pvg5ba2P+qp6j/yH0R
 Yticz7warllJ+ckUVp0wLUNj3e/0RKynDBvydxDlSaaH+ipdjugKL7LarMhwo4tTsK
 JvGmoihdRq/9oy866cn+DWDr6s2mCXEZgYaFsrsoQTUQZaEddYShSjUJdXh4izLLYG
 DdSZ10LYcleLg2hiLypwKXZUzCl8pjZZJ5eTGkYL/QFaip9mjndH4pjvoFUGptidPK
 hPwkR4gB+Onuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aICzjTVS
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: new package
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

Hi Julien,

On Mon, Nov 18, 2024 at 11:40:20PM UTC, Julien Olivain wrote:
> I applied this patch to next.

Thank you

> 
> After doing some testing, I had to rework it a bit. See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/ba65c4dd4b0745eecd5692bbeba82907cb0df5eb

Which tests lead to those udpates of Config.in ? How could I have
detected it ?

> Now, I'm expecting to see a patch proposal for dpdk/grout ;)

I need to wait for the next DPDK release, grout has some dependencies on
rte_ip6.h which is not available into the release supported by Buildroot
yet. I could not find a proper workaround yet, so it'll be easier to
wait for the next release.

If you want, I can submit a RFC/Request For Comment patch but you should
wait before merging it.

Meanwhile, I'd like to submit some few updates on libecoli, maybe DPDK and
there are some few dependencies on mstflint that are pending
  https://patchwork.ozlabs.org/project/buildroot/list/?submitter=89131

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
