Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB31C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F53383E62;
	Wed,  6 Jul 2022 21:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F53383E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 46gbdYHDwVcZ; Wed,  6 Jul 2022 21:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BCB81763;
	Wed,  6 Jul 2022 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94BCB81763
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C23E91BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D11F60E0A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D11F60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojtL0GMdwznC for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:46:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9263660D62
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9263660D62
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:46:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E16C1BF203;
 Wed,  6 Jul 2022 21:46:35 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:46:34 +0200
To: Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <20220706234634.506ae9e4@windsurf>
In-Reply-To: <20220706030236.3818-1-danomimanchego123@gmail.com>
References: <20220706030236.3818-1-danomimanchego123@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRKGotNUAsf2YcDLdwdw75Ak4zVMkyq+c22/GO/VaaU=;
 b=ScekrlJ2oSCbjzPPk8hyxXvsBggFgW4g+tsTE0AVlX10IMyZmYcqvgkbIjiiZxH4a5Gyxr
 G7eNfLqIKEl3lcss6u4Qup69kj+VotTU6BWIRjAWx5mRGT+UB+ujiBFNrJ8+pvzD3uSTQg
 OhYR/LxbyAtau6LwSQNeDnHUfUsLXdDDI1hjRLTnWt/HO+J1KHIWCglKDiARsUKznghdlt
 kuC7TN00Nymu46VJJ6V1NxQznTmuBbG5h5UoANjjhQDhddwE9OJCIcyxML/1HuU1ptBNcp
 jLadW5XOczfeYQNwmmHaNt6hitH39sdOmgnu2rCXSduFKhZvmSBsNlPi24XYqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ScekrlJ2
Subject: Re: [Buildroot] [PATCH 1/1] bind: keep suboptions below option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Jul 2022 23:02:36 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> Move kconfig comment to are "if BR2_PACKAGE_BIND" so that the two sub
> options are presented in menuconfig as subordinate to "bind" package
> selection rather than equal to it as if they were unrelated.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/bind/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
