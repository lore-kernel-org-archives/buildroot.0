Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2076FC624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90E640BDB;
	Fri,  4 Sep 2026 22:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZOmVqlsyRBh; Fri,  4 Sep 2026 22:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D648740B6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788560720;
	b=akBxdWBSFK51TIS9zBzPROCa1MUkVAq+3nZQI6jcJayJl3oFqULgLzDJgGJfnw1uMT1o
	 T8d3xMpQOQM3t3KeAuWX1FYmRILhoirr+HYSHZzKLtsEYduPeRLPpdizEim0Cn1xoJPjU
	 hU2yOrFF2puDNX8aziNNloweLRYGErYLKql5ecEA5O9w6vuXMapnKIM/IuyuGJo6abLWv
	 1hczzh/J8e+djomK7MF4SbRlExLlFcmq3YFFgHBh90slnvzI7DIoUC6iu2rV+d1tEzzLj
	 xLX79euitALjmDgLJNpZRRxaFkIFNQ6qPjTyjDDOnJo+h/7h/u0Dhd7Cdnila3EPpFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788560720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8pF6ybMEIbN1si90MnolVKxQbCPJNy03CWcAQx26CCQ=;
	b=ewRAEGyZ4msgn3zlU+XWSKJsnDIGwyGrwGdi9coCrzGE7H4MFbCMSRG2TBOoaGoZ/+x3
	 SfN74blDUsXw2ZVpo5IOmz7FX/r4lGm/5JJxGkx546snIw3SXV/EWDlpZ8w0bYNOWheft
	 oON2deBaB/XdG3o03cyr5zWDA1aA9EwpGYy/qxIDK5p+yWoW2mPd9r/l+XWrXEjab/X+E
	 mAQKTRhKxTbWyZjzH12tKEx+MIZb1wx6Aqpt1AZ3WBFV8TxnoVuiTLOP4LOdSXNYFdzHP
	 TmrrT60lI3iB/4fFg04s41+hf19rO/fktH523IkJqNTFsm/YcsXIj13pldY1wxdGWqw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788560719;
	bh=8pF6ybMEIbN1si90MnolVKxQbCPJNy03CWcAQx26CCQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XD3JHhI5gNJNJULbjkbFZ/VJ/pceVAEAnbo+Folj/jlOvXt+KU13y8DoxvmF8QPRs
	 1zeNWl4MdyL4sWEBOWNQm0DDviZzf5fZWDawaqewwMyIdLwCaD6eWeQZO1bYgKeHXK
	 fjhGZtRmPG564yoh2Xp/TGrwyHcPkWw8umVK/6NSsRLFIEVPStZnJfY/FceK7RwweW
	 MU7IoPG7U4HDu6jJZV5HpRUIWsQDLfUWbwlkesd/+yHG/0l1aGfZZ+pcOGtXqN1k3k
	 MJqoCE1+u9U/w2TTObupQ6viSp0ASrCyF7tJWVThplln4pIn3IvdepEkRcdxmaGWCB
	 R2UTDxZPp+4bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D648740B6E;
	Fri,  4 Sep 2026 22:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4FC029B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B51F4050C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPCDF6JHU_jr for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 22:25:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8F23740376
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788560717;
 b=b+4UgU9Kv4/nLENakLNCS3StIPnfvqR+7C8eL6M3hiSMg4R+BTkjiDwfsItvsoiXOhLu
 zx1XTx9pkNMkXTZ63xUsRYGikKQCOpqc+hFlr+TaQSdeZ8ZVemi8wlmUPhvJeBoFuc7iY
 IxHAw3ONtkz7uDoAgX+pTnjyxNJ58skFjhFh1SkCBqYSL9uOvFouITtMUDYglmxctl91F
 0+CFoCrxaO9vz1B7V1Qre5uGOK9jCU0pDpxFSxmMqvutbFcnQTPYZZYr3TDvxcl/qME9k
 tWPCGZgIqhBcLDSEv6yjfB/t1ZdRDi8If99JHXv6aNSctbfgBqRDzR2UB6RLV/Vx2Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788560717;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=70DG+hZeBIP3fMLW8j1D2Y4H0e4RaaAAS6GRy8ZyJ4U=;
 b=fTtQCJllYdBzf4A/jZnQGIwwW6ih71HjMG2lBEu/x5a4UpTCm4LOVCg+tBs5nsRiy478
 i5n9MpD+F8J96d+cpOtzPcsDXq0bh7aAPFja2ru2AicUItSWI0hoZgM/dLe2aqLCnJgLA
 JOqz/9jRnYKxmSn25in4yBoBtlQqIoV8sMnQ3E5qCPA9iNxBck3d7jK6J6MIyP1BFCq1/
 EiBeBKvndGHio80J6/4Mg5G3y5PQ7bUTk6sHEFNowU6Nvujfw8SzJ6NK9jwYaPpd4CxNl
 hccbsNGUBaIbQaIJ2ODBuOhbXd/CS+1E0S2BqKN5LysbFyqls83fkB1BesazI8zvxzA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eKxa8XQE; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F23740376
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:25:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1x8z4o0mcr-00F1G6; Sat, 05
 Sep 2026 00:25:11 +0200
Message-ID: <4a73096f-414e-4341-a2b4-e84f56ba3d11@gmx.de>
Date: Sat, 5 Sep 2026 00:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
References: <20260904163244.119883-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260904163244.119883-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:ILTf/eSVCaXkGIEhG53AAl9LdqOqrREMpygqffIUU5E8m8q1lu9
 4usmoCO5iXobBylx6WPHFmnoZnAO86tDy72CIs6CUw+4EIa2Gmb3ZVbtW4zU4bY0+zQqLS6
 NLFnC8ih0+iGOBS01r35zXRuXIS2YyO8f5L9pxvH/0sWxBtswwXmGbVS1wsCNeGpGk1QTeV
 VOrB5m093NC5c1rFe+GmA==
UI-OutboundReport: notjunk:1;M01:P0:odWB7Vc1ATM=;Qqgb7LgNi6izPtuMxyNGtbBFcqp
 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
 cssVPzuruJpS8MbuBtHeuPwn8A==
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.09.03
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.09.26 um 18:32 schrieb Bernd Kuhls:
> https://lists.infradead.org/pipermail/wireless-regdb/2026-September/001953.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   package/wireless-regdb/wireless-regdb.hash | 2 +-
>   package/wireless-regdb/wireless-regdb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index 4c6b3bec78..7e2bc57dfd 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
> +sha256  b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d  wireless-regdb-2026.09.03.tar.xz
>   # Locally computed
>   sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 9761afc243..469de2acc0 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WIRELESS_REGDB_VERSION = 2026.05.30
> +WIRELESS_REGDB_VERSION = 2026.09.03
>   WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>   WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>   WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
