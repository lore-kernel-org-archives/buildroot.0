Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F5C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A62982277;
	Sat, 22 Jul 2023 21:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A62982277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eKVZyv3MzZs; Sat, 22 Jul 2023 21:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11A382285;
	Sat, 22 Jul 2023 21:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11A382285
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C85171BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0751605F6
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0751605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aN894NjT3NnS for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:30:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CDA860E7D
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDA860E7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38BD7E0004;
 Sat, 22 Jul 2023 21:30:20 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:30:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722233018.191728c5@windsurf>
In-Reply-To: <20230716141412.305840-1-bernd@kuhls.net>
References: <20230716141412.305840-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdPFLDBN0Zl0wIpQgcocd4/SnBkmmmUDSvy4l5yGSxc=;
 b=MSx1ZmfvHdoFy5RvlD805VdzjUAaFDMUWHZa5fCyCLtydIlrmtGgtBCRxxI9DuYLNZc4QZ
 igvcgOQ3PsR9u8qAHXJ7E3BYIRrhKH+ARCjQiOI9NHsWdRebzMfmP0kYECcNfU2EAThgy6
 fPcgwhkr/UZQ1xm9O5IQ6XXNEmwEjMpxADX3HgQny6Smd8g/TpANI4T5uEYy/t3XCkavay
 9KxXIR+rKoV/PgBNd0xxxwUWYIZIAyE/P1k4oOg4AHdXjK8rdNJaqP8BhuzfI7KW8ZvbVd
 L3U7aodALvH/o6BZqAbOaSCNAwDTqBdM/cmejlgBK1TCOVSxe8BN0aLdPRZgSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MSx1Zmfv
Subject: Re: [Buildroot] [PATCH 1/1] package/piglit: bump version
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 16 Jul 2023 16:14:12 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Disable Vulkan tests due to missing dependency libvulkan:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f
> 
> Fixes python related build error:
> AttributeError: module 'collections' has no attribute 'MutableMapping'
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed3/ed3c5806458efdb9db78732d3709e1d6ec441bcb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Same question as usual: since when is this issue happening? Without
this information in the commit log, we don't know if this version bump
needs to be backported in one of our stable branches.

Could you resend with an extended commit log, and generally in all your
patches try to take this suggestion into account?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
