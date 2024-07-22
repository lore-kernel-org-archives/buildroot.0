Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0814C3DA70
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 23:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71CA54023D;
	Mon, 22 Jul 2024 23:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ncdmWcrYsGy; Mon, 22 Jul 2024 23:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E017740235
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E017740235;
	Mon, 22 Jul 2024 23:49:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E942D1BF215
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 23:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6837400E5
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 23:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXb3QFMIsx8F for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 23:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C6B9400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C6B9400BB
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C6B9400BB
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 23:49:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MNnBqf072525;
 Mon, 22 Jul 2024 18:49:11 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MNnBWc018545
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 18:49:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 18:49:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 18:49:11 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MNnBNO094562;
 Mon, 22 Jul 2024 18:49:11 -0500
Date: Mon, 22 Jul 2024 18:49:11 -0500
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721692151;
 bh=2jcum1C3EEtavEH9WhXzIgFg36qrDBvjEAbB9/5rTAo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FDDN2dEhkdrWtqY4PvPL4gndjcT11NArqcEnfwTNnj2HFvkvFNwQIps22Sx56wc6Y
 fFVyZK7Q/yCvi/wPVlmeSrPXg6fUNUeVCDKJUy9Ii0b0hJ+fPs2gRpIo3EMw0rrTFc
 PvdzSVy7d34nvBVcZZFap16U8dH55jDYdgShR4sk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FDDN2dEh
Subject: Re: [Buildroot] [PATCH v4] Create a .gitignore file in the
 CANONICAL_O directory
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Romain Naour <romain.naour@gmail.com>, "Yann
 E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone!

On June 26, 2024 thus sayeth Brandon Maier via buildroot:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This .gitignore file ignores all files in an output directory and
> hence doesn't change the git status.
> 
> Remove "/output" entry from the main .gitignore file as it is already
> handled by this general approach.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> This is a resend of the v1 of this patch from Yegor Yefremov, as the
> original patch series seems to have stalled.
> 
> I'm not familiar with the process for resending someone else's patches,
> so let me know if I should redo anything.
> 
> I find having the output folders gitignore'd is useful as some newer
> tools like fd-find and ripgrep will automatically respect gitignore.
> Otherwise the output directories are huge and quick searches can
> suddenly take a long time if I have created a few.
> ---

For some odd reason this seems to have broken 
python-jsonschema-specifications in a fairly weird way that I'm not 
fully sure I understand. 

Somehow when downloading the source with this patch applied the build 
will succeed but it will never be installed in the host directory. 
Reverting this patch and deleting the package in the dl/ directory fixes 
everything. (at least for TI's reference boards)

I'll continue to look into this, just wanted to start the thread just in 
the off chance someone else is doing the same :)

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
