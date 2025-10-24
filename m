Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74751CCF9E0
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4381A8428B;
	Fri, 24 Oct 2025 21:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRmn7J2HA8FD; Fri, 24 Oct 2025 21:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C30684291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C30684291;
	Fri, 24 Oct 2025 21:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BA819D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B1E408D6
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W9krLcvshS_s for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32C4B40825
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C4B40825
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32C4B40825
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:05:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8B01F19F57B;
 Fri, 24 Oct 2025 23:05:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Oct 2025 23:05:30 +0200
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 23:05:30 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20251024100443.108427-1-titouan.christophe@mind.be>
References: <20251024100443.108427-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <59ef852a88c1acca6e004e6ff47e018a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761339932;
 bh=hK1Eqqd4Qv8bAPwg0SrkoBRD/ZI02SJ/aZoppghJvLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mm06Nvdh/YaTxYmUh9kx1FU14RiqMNhTlBpWZjerUkGb6NzTPLQcaoHSA6qxYcwhH
 BcKW6E97r1cBp+WVoxGc9lsObFikn437hZgvHkK5/jPvq9g8v17VKFV6aqfcAveLNn
 6KqMkHKcLF3jSkOJKljZwl09jIZCggdAZgYfmD+wN+y9c4eEnANGocE/UN2CKrCRxf
 G/H3hMDZLg62KDEbyc/cRipsIfYYgEkNvKOod6WfCSgg5FGF4yCEXLr47MwjW8k9A3
 wV2zikLZpTl8vKlg4kh0cMjiHixDc46969Y+NRUhCvGCNg6hEp4BQNgzt6PvIQbrxp
 UIqG2hnaaHHwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Mm06Nvdh
Subject: Re: [Buildroot] [PATCH] package/netdata: security bump to v1.37.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/10/2025 12:04, Titouan Christophe via buildroot wrote:
> Do not bump to a more recent version, as the build system has
> fundamentally changed.
> 
> See the release notes:
> - https://github.com/netdata/netdata/releases/tag/1.34.0
> - https://github.com/netdata/netdata/releases/tag/v1.34.1
> - https://github.com/netdata/netdata/releases/tag/v1.35.0
> - https://github.com/netdata/netdata/releases/tag/v1.35.1
> - https://github.com/netdata/netdata/releases/tag/v1.36.0
> - https://github.com/netdata/netdata/releases/tag/v1.36.1
> - https://github.com/netdata/netdata/releases/tag/v1.37.0
> - https://github.com/netdata/netdata/releases/tag/v1.37.1
> 
> In addition, add upstream patch to fix cross-compilation.
> 
> This fixes the following vulnerabilities:
> - CVE-2023-22496:
>     Netdata is an open source option for real-time infrastructure
>     monitoring and troubleshooting. An attacker with the ability to
>     establish a streaming connection can execute arbitrary commands on 
> the
>     targeted Netdata agent. When an alert is triggered, the function
>     `health_alarm_execute` is called. This function performs different
>     checks and then enqueues a command by calling `spawn_enq_cmd`. This
>     command is populated with several arguments that are not sanitized.
>     One of them is the `registry_hostname` of the node for which the 
> alert
>     is raised. By providing a specially crafted `registry_hostname` as
>     part of the health data that is streamed to a Netdata (parent) 
> agent,
>     an attacker can execute arbitrary commands at the remote host as a
>     side-effect of the raised alert. Note that the commands are 
> executed
>     as the user running the Netdata Agent. This user is usually named
>     `netdata`. The ability to run arbitrary commands may allow an 
> attacker
>     to escalate privileges by escalating other vulnerabilities in the
>     system, as that user. The problem has been fixed in: Netdata agent
>     v1.37 (stable) and Netdata agent v1.36.0-409 (nightly). As a
>     workaround, streaming is not enabled by default. If you have
>     previously enabled this, it can be disabled. Limiting access to the
>     port on the recipient Agent to trusted child connections may 
> mitigate
>     the impact of this vulnerability.
>     https://www.cve.org/CVERecord?id=CVE-2023-22496
> 
> - CVE-2023-22497:
>     Netdata is an open source option for real-time infrastructure
>     monitoring and troubleshooting. Each Netdata Agent has an
>     automatically generated MACHINE GUID. It is generated when the 
> agent
>     first starts and it is saved to disk, so that it will persist 
> across
>     restarts and reboots. Anyone who has access to a Netdata Agent has
>     access to its MACHINE_GUID. Streaming is a feature that allows a
>     Netdata Agent to act as parent for other Netdata Agents (children),
>     offloading children from various functions (increased data 
> retention,
>     ML, health monitoring, etc) that can now be handled by the parent
>     Agent. Configuration is done via `stream.conf`. On the parent side,
>     users configure in `stream.conf` an API key (any random UUID can 
> do)
>     to provide common configuration for all children using this API key
>     and per MACHINE GUID configuration to customize the configuration 
> for
>     each child. The way this was implemented, allowed an attacker to 
> use a
>     valid MACHINE_GUID as an API key. This affects all users who expose
>     their Netdata Agents (children) to non-trusted users and they also
>     expose to the same users Netdata Agent parents that aggregate data
>     from all these children. The problem has been fixed in: Netdata 
> agent
>     v1.37 (stable) and Netdata agent v1.36.0-409 (nightly). As a
>     workaround, do not enable streaming by default. If you have 
> previously
>     enabled this, it can be disabled. Limiting access to the port on 
> the
>     recipient Agent to trusted child connections may mitigate the 
> impact
>     of this vulnerability.
>     https://www.cve.org/CVERecord?id=CVE-2023-22497
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
