Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2FCEE4990
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 10:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A2A6000A;
	Wed, 11 Sep 2024 10:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuZH7ED817sB; Wed, 11 Sep 2024 10:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ABB06002E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ABB06002E;
	Wed, 11 Sep 2024 10:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBBA1BF391
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 10:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A037404D0
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 10:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeuND4fj8KQp for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 10:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C09040305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C09040305
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C09040305
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 10:40:43 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 48B7jejW091671
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 15:45:40 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48B7jWGN091105
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 11 Sep 2024 15:45:32 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS34.andestech.com (10.0.1.134) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 15:45:32 +0800
Date: Wed, 11 Sep 2024 15:44:45 +0800
To: <buildroot@buildroot.org>, Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <ZuFKbaR_1S_dqB4x@APC323>
References: <20240817112203.3719873-1-peterlin@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817112203.3719873-1-peterlin@andestech.com>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)
X-Originating-IP: [10.0.12.98]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48B7jejW091671
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH] boot: optee-os: enable RISC-V (64-bit)
 architecture
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
From: Yu-Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu-Chien Peter Lin <peterlin@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 17, 2024 at 07:22:03PM +0800, Yu Chien Peter Lin wrote:
> OP-TEE OS and TAs can run on RISC-V (64-bit) machines, so allow
> optee-os to be compiled for the new architecture.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Gentle ping!
Hi Etienne, would you like to review the patch?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
