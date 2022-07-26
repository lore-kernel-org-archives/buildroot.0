Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2983C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A76061B9F;
	Tue, 26 Jul 2022 15:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A76061B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3Ujo58HFu_x; Tue, 26 Jul 2022 15:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F30261B9C;
	Tue, 26 Jul 2022 15:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F30261B9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5DDC1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C338420B
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C338420B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ueMY1G8b9ZuC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:12:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 432A783FAE
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 432A783FAE
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:12:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA495200004;
 Tue, 26 Jul 2022 15:12:43 +0000 (UTC)
Date: Tue, 26 Jul 2022 17:12:42 +0200
To: Bert Schueszler <bert.schueszler@theobroma-systems.com>
Message-ID: <20220726171242.6df9593d@windsurf>
In-Reply-To: <20220511123423.1600023-1-bert.schueszler@theobroma-systems.com>
References: <20220511123423.1600023-1-bert.schueszler@theobroma-systems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658848364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO5JVIDsEAyJXzPR4DnxQVUM1V/ZgNCwt4+AzosTEUk=;
 b=ekGUWrhCBuOi0SKoPFRFaOU1Y4LxvIPp1PcZQd4oAChG0Wt57QxKwWuFHepJ0l54e7v6zd
 CGPch2JmalBKTg798z5+wfzchnJOWg9utSlbkdXWYTIig1YpZ4WNcdgb0ppWWTu/sgCypv
 KqhV2zURrMs3YaM7c+GhhmeNK+6lURhNowDRd13+TUsa0+SEVH5Nt2aG27G5hikPTx1Y/2
 fLCxzImQnfxx+H4/vXWv5j1H9UWn+IwCK95YChEJVfMVKlmfKLyw3vTNpJZhMNOLWXhkQg
 8SriL/a6uRew2d91nqcH9OnjqntKPQAxb1w+t7wrDWZ/fTZ5zuesXrz5PvjNuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ekGUWrhC
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: add config option
 to enable bypass-lan plugin
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bert,

On Wed, 11 May 2022 14:34:23 +0200
Bert Schueszler <bert.schueszler@theobroma-systems.com> wrote:

> In case the user wants to use the bypass-lan plugin for libcharon, add
> a configuration option.
> 
> Signed-off-by: Bert Schueszler <bert.schueszler@theobroma-systems.com>
> ---
>  package/strongswan/Config.in     | 3 +++
>  package/strongswan/strongswan.mk | 1 +
>  2 files changed, 4 insertions(+)

Sorry for the long delay it took to get such a simple patch applied.
I've now applied to master, thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
