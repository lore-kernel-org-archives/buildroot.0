Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68495C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031DD41E41;
	Mon, 13 Nov 2023 21:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 031DD41E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wP0GE60TZNi4; Mon, 13 Nov 2023 21:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493F541DB9;
	Mon, 13 Nov 2023 21:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493F541DB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85DA31BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 665324018F
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 665324018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPNj6E_Rk187 for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:42:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C30A40129
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C30A40129
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FAE0240006;
 Mon, 13 Nov 2023 21:42:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2ehU-00BY1h-2C;
 Mon, 13 Nov 2023 22:42:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
 <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231031133415.1d89db5a@windsurf>
 <8a0d97bb-2fe5-4e09-8e95-b928a431ce1e@amd.com>
 <CH2PR12MB5004A3E0B5725A32D422E945F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <87bkce21br.fsf@48ers.dk> <20231113181023.34bf6492@booty>
Date: Mon, 13 Nov 2023 22:42:32 +0100
In-Reply-To: <20231113181023.34bf6492@booty> (Luca Ceresoli's message of "Mon, 
 13 Nov 2023 18:10:23 +0100")
Message-ID: <87wmule3ef.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Frager,
 Neal" <neal.frager@amd.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Luca" == Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

 > Hi,
 > On Tue, 31 Oct 2023 17:39:36 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:  
 >> 
 >> Hi,
 >> 
 >> > The remaining question is just a matter of how many zynq, zynqmp and
 >> > versal defconfigs is the right amount for buildroot?  I would like to
 >> > be able to support the following 11 boards, if it would be ok for the
 >> > buildroot community.  5 of these 11 are already included in
 >> > buildroot.  
 >> 
 >> > zynq_zc702
 >> > zynq_zc706
 >> > zynqmp_zcu102
 >> > zynqmp_zcu104
 >> > zynqmp_zcu106
 >> > zynqmp_kria_kd240
 >> > zynqmp_kria_kr260
 >> > zynqmp_kria_kv260
 >> > versal_vck190
 >> > versal_vek280 (coming next year)
 >> > versal_vmk180  
 >> 
 >> > In exchange, I would be ok with dropping the zynq_qmtech board and
 >> > possibly one of the zynq_zed
 >> > boards.  
 >> 
 >> I think the main issue with a lot of defconfigs is maintaining them (but
 >> you already do that) and the CI overhead from building all of them.
 >> 
 >> I guess we could come up with some logic to skip some of the zynq*
 >> defconfigs from the Gitlab CI setup. Romain, any good ideas?

 > After the discussion it seems quite clear that the patch is useful, and
 > the CI aspects can perhaps be sorted out, so:

 > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
