Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA77C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8081840018;
	Sun, 24 Dec 2023 18:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8081840018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-9GXeJq5IC4; Sun, 24 Dec 2023 18:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D75140528;
	Sun, 24 Dec 2023 18:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D75140528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 825881BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C33D81CE3
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C33D81CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huD6k8YmeoZs for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:40:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7BB181CA5
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BB181CA5
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1F071BF203;
 Sun, 24 Dec 2023 18:40:33 +0000 (UTC)
Date: Sun, 24 Dec 2023 19:40:33 +0100
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20231224194033.2340621a@windsurf>
In-Reply-To: <20231211135321.1131298-1-christian@klarinett.li>
References: <20231211135321.1131298-1-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703443234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z17ROZEqOKaW6LJt0UEM8QsfCtrD9vxUADBq+G4KfBc=;
 b=iTLidUZ/pdtuk3JJwg+eSzwE/oXOopvHr/Se0Qv8pKMTnKgdSQHW+X6uxCENBZldXidmve
 MvOcHbBvoHF62D843fp24nu7NoU1KLB+U6s99775H2OoqdvpaT+4vHBNd6X7lx+J2lyJuE
 tW+HldPWo1kE7wvKTTbpOdKCNFTQoqwSBfltQKD7kddhzt4FVarbG4l9ei+/JYH+UyJkZm
 TC2fDdbJssUBacM12DkgVBAbia8EbFBc2zHvqcEBqR9TvODqaZG2+lBhlG7hyvxQ8oU/+Z
 00ztC9BpE+vldl3xRbWRcv6HZ9nr3P0NTtpqYJ6YKiE2f21hFSbiSu8QE95/Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iTLidUZ/
Subject: Re: [Buildroot] [PATCH] package/imagemagick: build host-imagemagick
 with xml support
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
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 11 Dec 2023 14:53:21 +0100
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Since upstream commit
> https://github.com/ImageMagick/ImageMagick/commit/25e3a4f3845f59536d19aba0ac0580aa6715147f
> (which first appeared in version 7.1.1-19), ImageMagick does not trust
> unvalidated XMP profiles in images anymore.
> 
> If such a XML profile is encountered inside e.g. a PNG image the
> processing is aborted. Validating the XMP profile requires that
> ImageMagick is compiled with XML support.
> As host-imagemagick supports PNG file also activate XML support.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Backport to: 2023.02.x, 2023.11.x
> ---
>  package/imagemagick/imagemagick.mk | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

I have applied, but made it conditional with a Config.in.host option, see:

  https://gitlab.com/buildroot.org/buildroot/-/commit/df89e73e92abcddfdfa5d61cd00757a7c80a699d

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
