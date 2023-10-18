Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F25ECDB483
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 11:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040A76146D;
	Wed, 18 Oct 2023 11:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040A76146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPUBxGG7pDZ3; Wed, 18 Oct 2023 11:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7F961356;
	Wed, 18 Oct 2023 11:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D7F961356
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2E411BF3B0
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBF9461356
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBF9461356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwbDYJzyL8BG for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 11:56:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBF1A60ECA
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 11:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBF1A60ECA
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABE63FF80A;
 Wed, 18 Oct 2023 11:56:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qt59q-00BhKE-JJ; Wed, 18 Oct 2023 13:56:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com>
 <87h6motghr.fsf@48ers.dk>
 <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
 <878r80tdrr.fsf@48ers.dk>
 <fa1501e0-b4ce-4d8d-9596-60b39c5f4fa1@amd.com>
 <874jiotbkk.fsf@48ers.dk>
 <9d57c3bb-7193-4ffb-962f-30aec4b53cf5@amd.com>
Date: Wed, 18 Oct 2023 13:56:14 +0200
In-Reply-To: <9d57c3bb-7193-4ffb-962f-30aec4b53cf5@amd.com> (Michal Simek's
 message of "Wed, 18 Oct 2023 13:34:42 +0200")
Message-ID: <87v8b4rvoh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Frager,
 Neal" <neal.frager@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@amd.com> writes:

Hi,

 > Ok. I am just aware that they were missing some power management tests
 > which have been finished couple of days ago.
 > I would love to be faster but it is what it is.

No problem, the rebase every 10 LTS releases is already a good step in
the right direction.


> Let's see when we can get 6.1.60 out of door.

Hold on, Greg is only at 6.1.58 ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
