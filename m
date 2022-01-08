Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B27CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D41C1428C9;
	Sat,  8 Jan 2022 11:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtggiapwWWOL; Sat,  8 Jan 2022 11:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDF542890;
	Sat,  8 Jan 2022 11:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6F511BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B3181656
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTARUiuJydTD for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:20:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A73C28161D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:20:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B089E60002;
 Sat,  8 Jan 2022 11:20:54 +0000 (UTC)
Date: Sat, 8 Jan 2022 12:20:53 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Robert Hancock <hancock@sedsystems.ca>
Message-ID: <20220108122053.5ac56167@windsurf>
In-Reply-To: <20200714033927.1516172-1-hancock@sedsystems.ca>
References: <20200714033927.1516172-1-hancock@sedsystems.ca>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/scons: explicitly specify host
 Python 3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Jul 2020 21:39:27 -0600
Robert Hancock <hancock@sedsystems.ca> wrote:

> All packages using scons are now using Python 3 to run it, so
> explicitly set scons as using host-python3. This avoids a
> spurious host Python 2 dependency if BR2_PACKAGE_PYTHON3 is not
> set (for example, if no Python is packaged for the target).
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  package/scons/scons.mk | 2 ++
>  1 file changed, 2 insertions(+)

After so much time: patch applied! I also took the opportunity of your
patch to do two scons-related changes:

  https://git.buildroot.org/buildroot/commit/?id=726209fc7999986fa414d629ff60d1bc76c63a2c
  https://git.buildroot.org/buildroot/commit/?id=c240410d4b38c7946d2dd65c1c1eec6d172a0814

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
