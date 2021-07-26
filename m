Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7CDC19F3E
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 07:17:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5786D60F45
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 07:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5786D60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181C060835;
	Mon, 26 Jul 2021 07:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9GFDDcVplEb; Mon, 26 Jul 2021 07:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6425760822;
	Mon, 26 Jul 2021 07:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAE921BF37E
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 07:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7B1C60822
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 07:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bF8i2P3TfDKs for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 07:17:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDB77607E5
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 07:17:52 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 16Q7HnGu021986
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 09:17:50 +0200
Date: Mon, 26 Jul 2021 09:16:37 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210726091637.1d319641@x230_1.trabucayre.com>
In-Reply-To: <20210725193549.06a0ef00@windsurf>
References: <1626872348-69423-1-git-send-email-gwenj@trabucayre.com>
 <20210725160833.4d86c502@windsurf>
 <20210725180533.46734897@x230_1.trabucayre.com>
 <20210725193549.06a0ef00@windsurf>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v3] board: Add support for terasic DE10 Nano
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 19:35:49 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 25 Jul 2021 18:05:33 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > > I don't understand why you have a boot.img, which apparently only
> > > contains the raw contacts of this xload.img file. Why not use this
> > > xload.img file directly...
> > >     
> > In fact unlike some others CPU, this is not a raw area but a real partition
> > with type 0xA2. This genimage is based on socrate board wich use the same way.  
> 
> Well, but still, why don't you directly use xload.img as the partition
> image ?
Done in v5
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks
Gwenhael
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
