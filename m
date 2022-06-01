Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BACDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 18:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B106127F;
	Wed,  1 Jun 2022 18:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 206yyhHUZKlH; Wed,  1 Jun 2022 18:33:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08A46128B;
	Wed,  1 Jun 2022 18:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055651BF379
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 18:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EA0405C5
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 18:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ikRQpKAx8hc for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 18:33:07 +0000 (UTC)
X-Greylist: delayed 19:59:57 by SQLgrey-1.8.0
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F7CD4058A
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 18:33:07 +0000 (UTC)
Received: from player786.ha.ovh.net (unknown [10.109.143.210])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 9B91A21FD8
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 18:13:23 +0000 (UTC)
Received: from blach.pl (112.52.classcom.pl [195.150.52.112])
 (Authenticated sender: grzegorz@blach.pl)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id A13EE2B0B883C;
 Wed,  1 Jun 2022 18:13:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S00211a7a3ea-2b87-487a-9d5e-e6cc7c92b7d2,
 F5E4EEF2BCA9FD187DF2166E9470C1B257887DCE) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 195.150.52.112
Message-ID: <0560258fa9948d2899d3bb8dd40928af0f8c6100.camel@blach.pl>
From: Grzegorz Blach <grzegorz@blach.pl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 Jun 2022 20:13:19 +0200
In-Reply-To: <20220601144455.2161328a@windsurf>
References: <20220531185444.226429-1-grzegorz@blach.pl>
 <20220601144455.2161328a@windsurf>
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12412483524727292247
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeeiteffledvfeegvedvtedtjeejheefvdelieelkeettdeghfefueduueduvdfhfeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdduleehrdduhedtrdehvddrudduvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheeitd
Subject: Re: [Buildroot] [PATCH 3/5] package/python-falcon: Bump to version
 3.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Sunday I sent 5 patches, but one of my patch hasn't been delivered
to the mailing list, so I've sent it again.

https://patchwork.ozlabs.org/project/buildroot/list/?series=302417

Grzegorz Blach


On Wed, 2022-06-01 at 14:44 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 May 2022 20:54:44 +0200
> Grzegorz Blach <grzegorz@blach.pl> wrote:
> 
> > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> 
> This patch is named PATCH 3/5, but we have not received 1/5, 2/5, 4/5
> and 5/5. Could you clarify?
> 
> Thanks!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
