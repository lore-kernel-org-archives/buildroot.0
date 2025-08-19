Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2ABCA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE5C409D4;
	Tue, 19 Aug 2025 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNlRWuNWYnBw; Tue, 19 Aug 2025 10:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F2D4035C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F2D4035C;
	Tue, 19 Aug 2025 10:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A85E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE9A340530
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HS-2CCFLd-nt for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A4E4052C
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92A4E4052C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:17:16 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 57JAH6Bk029843
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 19 Aug 2025 18:17:06 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 18:17:06 +0800
Date: Tue, 19 Aug 2025 18:17:03 +0800
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: <buildroot@buildroot.org>
Message-ID: <aKRPH3Kz3vG_GDYc@swlinux02>
References: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
 <aKRGPS7VOFk7VNCs@swlinux02> <20250819115459.34b62b9b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819115459.34b62b9b@windsurf>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 57JAH6Bk029843
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH] configs/andes_ae350_45: remove defconfig,
 broken
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Aug 19, 2025 at 11:54:59AM +0200, Thomas Petazzoni wrote:
> [EXTERNAL MAIL]
> 
> Hello Leo,
> 
> On Tue, 19 Aug 2025 17:39:09 +0800
> Leo Liang <ycliang@andestech.com> wrote:
> 
> > My apologies for not catching the CI failure earlier;
> > my email filter was misconfigured.
> 
> OK.
> 
> > I've fixed the Linux tarball link and confirmed that the defconfig builds.
> 
> When you say you "fixed the Linux tarball", you mean you re-added the
> missing branch to your Github repo?

Yes, I have re-added the missing branch.

> 
> Note that the defconfig is apparently using a branch, which is not
> correct. It should either use a tag or a commit hash. Indeed, branches
> can change over time, while our defconfigs should be reproducible.

Got it!

> 
> > Would it be possible to drop this patch?
> 
> I'll drop the patch, but aside from the branch vs. tag issue above,
> there are other issues to fix in your defconfig:
>
> Patches lack an "Upstream" tag:
> 
> board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
> board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream
> 
> The post-build shell script doesn't pass Shellcheck:
> 
> board/andes/ae350/post-build.sh Shellcheck
> 
> Hashes are missing for the defconfig:
> 
> configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
> 
> Could you please address all those issues to keep the defconfig in a
> properly maintained state?

Roger that!
I will prepare a patchset ASAP to address these issues.
Thank you for all the reminders!

> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Thanks again,
Leo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
