Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50ECC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 19:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 693194004A;
	Tue, 23 Jul 2024 19:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQZ5SIBjmKj5; Tue, 23 Jul 2024 19:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2497C40465
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2497C40465;
	Tue, 23 Jul 2024 19:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286F11BF289
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 19:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E5540465
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 19:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97YNrIPO8goS for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 19:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A02594004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A02594004A
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A02594004A
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 19:31:38 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46NJVTa7108206;
 Tue, 23 Jul 2024 14:31:29 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46NJVTnf015716
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jul 2024 14:31:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jul 2024 14:31:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jul 2024 14:31:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46NJVSaN128922;
 Tue, 23 Jul 2024 14:31:28 -0500
Date: Tue, 23 Jul 2024 14:31:28 -0500
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20240723193128.vvshilb54mtv3igc@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
 <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
 <26240fd5-3e84-4b2f-a82b-aedda6c7b9f2@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26240fd5-3e84-4b2f-a82b-aedda6c7b9f2@bubu1.eu>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721763089;
 bh=gyYmiVwBvWyPW1YUR/9SljS+wMver7NOr9sG/K2GMtk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=cTxi3Sx2/A/RyqiTDIeNbolsjmKvWcjM8scvlZtZyQsc2bDBRphXNI6d7jSePZGoj
 PSvBg0YFXJI/Bv693gQ3w+rgbdGPQcqQ2emc04XBBRD5p53Jayilw3/6gnxk5f5GLI
 QZsC9Gg58NaFkOr+cGAw7nM+xFFV93g/oRGazbP0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=cTxi3Sx2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On July 23, 2024 thus sayeth Marcus Hoffmann:
> Hi Bryan,
> 
> On 23.07.24 01:49, Bryan Brattlof via buildroot wrote:
> > Hello everyone!
> > 
> > On June 26, 2024 thus sayeth Brandon Maier via buildroot:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > 
> > > This .gitignore file ignores all files in an output directory and
> > > hence doesn't change the git status.
> > > 
> > > Remove "/output" entry from the main .gitignore file as it is already
> > > handled by this general approach.
> > > 
> > > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > > ---
> > > This is a resend of the v1 of this patch from Yegor Yefremov, as the
> > > original patch series seems to have stalled.
> > > 
> > > I'm not familiar with the process for resending someone else's patches,
> > > so let me know if I should redo anything.
> > > 
> > > I find having the output folders gitignore'd is useful as some newer
> > > tools like fd-find and ripgrep will automatically respect gitignore.
> > > Otherwise the output directories are huge and quick searches can
> > > suddenly take a long time if I have created a few.
> > > ---
> > 
> > For some odd reason this seems to have broken
> > python-jsonschema-specifications in a fairly weird way that I'm not
> > fully sure I understand.
> > 
> > Somehow when downloading the source with this patch applied the build
> > will succeed but it will never be installed in the host directory.
> > Reverting this patch and deleting the package in the dl/ directory fixes
> > everything. (at least for TI's reference boards)
> > 
> > I'll continue to look into this, just wanted to start the thread just in
> > the off chance someone else is doing the same :)
> 
> I just ran into the same problem now for pydantic-core, which pointed to
> https://github.com/PyO3/maturin/issues/1911
> 
> Is python-jsonschema-specifications also using the rust/maturin infra or is
> there a separate gitignore problem in another build tool?
> 

Ah nice find! It's using hatch which I think wraps maturin. I'll play 
around with this and see if I can come up with a patch. 

Thank you

> Marcus
> 
> > 
> > ~Bryan
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
