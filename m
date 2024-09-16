Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059F8C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 05:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92466401A1;
	Mon, 16 Sep 2024 05:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaG0wMLnnHWZ; Mon, 16 Sep 2024 05:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5637940AB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5637940AB1;
	Mon, 16 Sep 2024 05:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E045F1BF489
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 05:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF8CB81755
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 05:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6YAT2v_bubu for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 05:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C71D81182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C71D81182
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C71D81182
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 05:44:56 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48G5im84060881
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Mon, 16 Sep 2024 13:44:48 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS34.andestech.com (10.0.1.134) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 13:44:49 +0800
Date: Mon, 16 Sep 2024 13:44:01 +0800
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZufFoUvbRiVHFCCq@APC323>
References: <20240817112203.3719873-1-peterlin@andestech.com>
 <15d03499-bfe8-4b53-bc24-af06ab9fb97a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15d03499-bfe8-4b53-bc24-af06ab9fb97a@mind.be>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)
X-Originating-IP: [10.0.12.98]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48G5im84060881
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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
Cc: tim609@andestech.com, alvinga@andestech.com,
 Etienne Carriere <etienne.carriere@foss.st.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 14, 2024 at 06:02:08PM +0200, Arnout Vandecappelle wrote:
> 
> On 17/08/2024 13:22, Yu Chien Peter Lin via buildroot wrote:
> > OP-TEE OS and TAs can run on RISC-V (64-bit) machines, so allow
> > optee-os to be compiled for the new architecture.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> 
>  Hi Peter,
> 
>  Applied to master, thanks. I made some changes, see below, please check if
> things are still OK!

Hi Arnout,

I've confirmed that the qemu_riscv64_virt_defconfig generates the RISC-V
OP-TEE binaries, thanks for handling this.

Best regards,
Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
