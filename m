Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EF6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 02:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4204166D;
	Thu, 24 Feb 2022 02:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJTDst3A33EN; Thu, 24 Feb 2022 02:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A49C41669;
	Thu, 24 Feb 2022 02:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E684C1BF360
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 02:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D447440961
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 02:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjZT5fnGPtKc for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 02:42:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BFF8400AF
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 02:42:47 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21O2gYxu096776;
 Thu, 24 Feb 2022 10:42:34 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 24 Feb 2022 10:42:32 +0800
Date: Thu, 24 Feb 2022 10:41:37 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YhbwYcWi9WtPm4Mo@APC323>
References: <20220223071049.21153-1-peterlin@andestech.com>
 <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
 <YhYHxAZuz+wY4Nl+@APC323>
 <dcb73632-8dda-4314-838f-2db1c9f91102@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcb73632-8dda-4314-838f-2db1c9f91102@benettiengineering.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21O2gYxu096776
Subject: Re: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> > > > > > Changes v3 -> v4:
> > > > > >      - rename ae3xx folder to ae300
> > > > > >      - rename andes_ae3xx_defconfig to andes_ae300_defconfig
> > > > > >      - update readme.txt and item in DEVELOPERS
> > > > > 
> > > > > Some of these change ^^^ must have been moved to the single patch, like
> > > > > DEVELOPERS is updated in patch 3/3. I've also forgotten to point you to add
> > > > > a --cover-letter, so keep in mind both points for next time.
> > > > > 
> > > > > I've built tested both defconfig successfully, so:
> > > > > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > > > Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > > > > [Giulio: build tested only]
> > > > > 
> > > > > And the other patches of this series is all reviewed, so to me it's ready to
> > > > > be committed, but this will happen after Buildroot 2022.02 is released,
> > > > > since between rc1 to the release Maintainers only accept fixes. Another
> > > > > possibility is that they will commit these patches to next branch.
> > > > > 
> > > > > Please remember to tag V3.

Oh, I thought you were refering to format-patch with v3, sorry.
I will mark the patch on patchwork to rejected state except the latest 
patch version.

> > > > > Thank you for your effort!
> > > > > 
> > > > > Best regards
> > > > > -- 
> > > > > Giulio Benetti
> > > > > Benetti Engineering sas
> > > 
> > > Thanks for reviewing my patches and the guidance.
> > 
> > You're welcome.
> > 
> > > I will make a new patch for the Config.in,
> > 
> > Which one? I only see:
> > toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> > 
> > Do you mean you will add an entry in DEVELOPERS for it?

I found the modifications on these files in Git history, usually have 
its own patch. So in PATCH v5, I will split [PATCH 1/3] to [PATCH 1/4] 
and [PATCH 2/4] for
toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
other patches remain the same, and attach [PATCH 0/4] cover letter.

> > > The last question, is it tag V5 for the next submission?
> > 
> > It depends if you need to modify these patches. Or if you add a new patch
> > that depends on these patches, then yes, please send a V5 with all changes
> > moved to the different patches, including adding the patch if this is your
> > goal.
> > 
> > Best regards
> > -- 
> > Giulio Benetti
> > Benetti Engineering sas

Is there any the new comment?
Again, thanks for your help. :)

Best regards,
Yu Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
